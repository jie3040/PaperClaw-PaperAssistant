#!/bin/bash
# 快速保存图片脚本 - 从stdin读取base64数据
# 用法: echo "base64数据" | bash quick_save.sh fig1 description

if [ $# -lt 2 ]; then
    echo "用法: echo 'base64数据' | bash quick_save.sh <fig_id> <description> [type]"
    echo "示例: echo 'iVBORw0KG...' | bash quick_save.sh fig1 architecture concept"
    exit 1
fi

FIG_ID="$1"
DESCRIPTION="$2"
TYPE="${3:-concept}"
OUTPUT_DIR="/home/liaowenjie/.openclaw-multi/shared/paper-project/figures"
FILENAME="${FIG_ID}_${DESCRIPTION}.png"
OUTPUT_PATH="$OUTPUT_DIR/$FILENAME"
MANIFEST="$OUTPUT_DIR/figures_manifest.json"

# 创建目录
mkdir -p "$OUTPUT_DIR"

# 从stdin读取base64并解码保存
python3 << PYEOF
import base64
import json
import sys
import os
from datetime import datetime

# 读取base64数据
base64_data = sys.stdin.read().strip()

# 解码
try:
    image_data = base64.b64decode(base64_data)
except Exception as e:
    print(f"❌ Base64解码失败: {e}")
    sys.exit(1)

# 保存图片
output_path = "$OUTPUT_PATH"
try:
    with open(output_path, "wb") as f:
        f.write(image_data)
    print(f"✅ 图片已保存: {output_path}")
except Exception as e:
    print(f"❌ 保存失败: {e}")
    sys.exit(1)

# 验证
if not os.path.exists(output_path):
    print(f"❌ 验证失败: 文件不存在")
    sys.exit(1)

size = os.path.getsize(output_path)
if size == 0:
    print(f"❌ 验证失败: 文件大小为0")
    sys.exit(1)

print(f"✅ 验证成功: {size} bytes")

# 更新manifest
manifest_path = "$MANIFEST"
if os.path.exists(manifest_path):
    with open(manifest_path) as f:
        manifest = json.load(f)
else:
    manifest = {"figures": []}

# 检查是否已存在
existing_idx = None
for i, fig in enumerate(manifest["figures"]):
    if fig["id"] == "$FIG_ID":
        existing_idx = i
        break

entry = {
    "id": "$FIG_ID",
    "filename": "$FILENAME",
    "description": "$DESCRIPTION",
    "type": "$TYPE",
    "created_at": datetime.now().isoformat(),
    "path": output_path
}

if existing_idx is not None:
    manifest["figures"][existing_idx] = entry
    print(f"✅ 清单已更新 (覆盖)")
else:
    manifest["figures"].append(entry)
    print(f"✅ 清单已更新 (新增)")

with open(manifest_path, "w") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"✅ 完成！")
PYEOF
