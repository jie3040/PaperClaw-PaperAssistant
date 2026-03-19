#!/bin/bash
# Leader工具：从Artist的session中提取并保存图片
# 用法: bash extract_and_save.sh <session_id_or_latest> <fig_id> <description> [type]

ARTIST_SESSIONS="/home/liaowenjie/.openclaw-multi/artist/agents/main/sessions"
OUTPUT_DIR="/home/liaowenjie/.openclaw-multi/shared/paper-project/figures"

if [ "$1" = "latest" ] || [ -z "$1" ]; then
    # 使用最新的session
    SESSION_FILE=$(ls -t "$ARTIST_SESSIONS"/*.jsonl 2>/dev/null | grep -v ".lock" | head -1)
else
    # 使用指定的session
    SESSION_FILE="$ARTIST_SESSIONS/$1.jsonl"
fi

if [ ! -f "$SESSION_FILE" ]; then
    echo "❌ Session文件不存在: $SESSION_FILE"
    exit 1
fi

FIG_ID="${2:-fig_unknown}"
DESCRIPTION="${3:-image}"
TYPE="${4:-concept}"

echo "📊 从Artist session提取图片..."
echo "   Session: $(basename $SESSION_FILE)"
echo "   Target: ${FIG_ID}_${DESCRIPTION}.png"
echo ""

# 使用Python提取base64并保存
python3 << PYEOF
import json
import base64
import re
import os
from datetime import datetime

session_file = "$SESSION_FILE"
output_dir = "$OUTPUT_DIR"
fig_id = "$FIG_ID"
description = "$DESCRIPTION"
fig_type = "$TYPE"

# 读取session，查找base64图片数据
base64_data = None

with open(session_file) as f:
    for line in f:
        try:
            d = json.loads(line.strip())
            msg = d.get('message', {})
            
            if msg.get('role') == 'assistant':
                content = msg.get('content', '')
                
                # 处理列表格式的content
                if isinstance(content, list):
                    for item in content:
                        if isinstance(item, dict) and item.get('type') == 'text':
                            text = item.get('text', '')
                            # 查找markdown图片格式
                            match = re.search(r'!\[.*?\]\(data:image/(?:png|jpeg|jpg);base64,([A-Za-z0-9+/=]+)\)', text)
                            if match:
                                base64_data = match.group(1)
                                break
                
                # 处理字符串格式的content
                elif isinstance(content, str):
                    match = re.search(r'!\[.*?\]\(data:image/(?:png|jpeg|jpg);base64,([A-Za-z0-9+/=]+)\)', content)
                    if match:
                        base64_data = match.group(1)
                        break
                
                if base64_data:
                    break
        except:
            continue

if not base64_data:
    print("❌ 未找到base64图片数据")
    exit(1)

print(f"✅ 找到base64数据 ({len(base64_data)} 字符)")

# 解码
try:
    image_data = base64.b64decode(base64_data)
    print(f"✅ 解码成功 ({len(image_data)} bytes)")
except Exception as e:
    print(f"❌ 解码失败: {e}")
    exit(1)

# 保存
os.makedirs(output_dir, exist_ok=True)
filename = f"{fig_id}_{description}.png"
output_path = os.path.join(output_dir, filename)

try:
    with open(output_path, "wb") as f:
        f.write(image_data)
    print(f"✅ 图片已保存: {output_path}")
except Exception as e:
    print(f"❌ 保存失败: {e}")
    exit(1)

# 验证
if not os.path.exists(output_path):
    print("❌ 验证失败: 文件不存在")
    exit(1)

size = os.path.getsize(output_path)
if size == 0:
    print("❌ 验证失败: 文件大小为0")
    exit(1)

print(f"✅ 验证成功: {size} bytes")

# 更新manifest
manifest_path = os.path.join(output_dir, "figures_manifest.json")
if os.path.exists(manifest_path):
    with open(manifest_path) as f:
        manifest = json.load(f)
else:
    manifest = {"figures": []}

# 检查是否已存在
existing_idx = None
for i, fig in enumerate(manifest["figures"]):
    if fig["id"] == fig_id:
        existing_idx = i
        break

entry = {
    "id": fig_id,
    "filename": filename,
    "description": description,
    "type": fig_type,
    "created_at": datetime.now().isoformat(),
    "path": output_path,
    "size_bytes": size
}

if existing_idx is not None:
    manifest["figures"][existing_idx] = entry
    print(f"✅ Manifest已更新 (覆盖)")
else:
    manifest["figures"].append(entry)
    print(f"✅ Manifest已更新 (新增)")

with open(manifest_path, "w") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"\n🎉 完成！")
print(f"   文件: {output_path}")
print(f"   大小: {size} bytes")
PYEOF
