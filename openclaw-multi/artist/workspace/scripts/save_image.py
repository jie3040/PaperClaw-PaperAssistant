#!/usr/bin/env python3
"""
Artist图片保存工具
从Gemini响应中提取base64图片并保存到共享目录
"""
import base64
import json
import os
import re
import sys
from datetime import datetime

OUTPUT_DIR = "/home/liaowenjie/.openclaw-multi/shared/paper-project/figures"
MANIFEST_PATH = os.path.join(OUTPUT_DIR, "figures_manifest.json")

def extract_base64_from_markdown(text):
    """从markdown格式中提取base64图片数据"""
    # 匹配 ![image](data:image/png;base64,...)
    pattern = r'!\[.*?\]\(data:image/(?:png|jpeg|jpg);base64,([A-Za-z0-9+/=]+)\)'
    match = re.search(pattern, text)
    if match:
        return match.group(1)
    
    # 直接匹配base64字符串（如果没有markdown包装）
    if text.startswith('iVBOR') or text.startswith('/9j/'):
        return text
    
    return None

def save_image(base64_data, fig_id, description, fig_type="concept"):
    """保存图片并更新清单"""
    # 确保目录存在
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    # 解码base64
    try:
        image_data = base64.b64decode(base64_data)
    except Exception as e:
        print(f"❌ Base64解码失败: {e}")
        return False
    
    # 保存图片
    filename = f"{fig_id}_{description}.png"
    output_path = os.path.join(OUTPUT_DIR, filename)
    
    try:
        with open(output_path, "wb") as f:
            f.write(image_data)
        print(f"✅ 图片已保存: {output_path}")
    except Exception as e:
        print(f"❌ 保存失败: {e}")
        return False
    
    # 验证文件
    if not os.path.exists(output_path):
        print(f"❌ 验证失败: 文件不存在")
        return False
    
    file_size = os.path.getsize(output_path)
    if file_size == 0:
        print(f"❌ 验证失败: 文件大小为0")
        return False
    
    print(f"✅ 验证成功: {file_size} bytes")
    
    # 更新清单
    update_manifest(fig_id, filename, description, fig_type)
    
    return True

def update_manifest(fig_id, filename, description, fig_type):
    """更新figures_manifest.json"""
    # 读取现有清单
    if os.path.exists(MANIFEST_PATH):
        with open(MANIFEST_PATH) as f:
            manifest = json.load(f)
    else:
        manifest = {"figures": []}
    
    # 检查是否已存在（更新而非新增）
    existing = None
    for i, fig in enumerate(manifest["figures"]):
        if fig["id"] == fig_id:
            existing = i
            break
    
    # 创建新条目
    entry = {
        "id": fig_id,
        "filename": filename,
        "description": description,
        "type": fig_type,
        "created_at": datetime.now().isoformat(),
        "path": os.path.join(OUTPUT_DIR, filename)
    }
    
    if existing is not None:
        manifest["figures"][existing] = entry
        print(f"✅ 清单已更新: {fig_id} (覆盖)")
    else:
        manifest["figures"].append(entry)
        print(f"✅ 清单已更新: {fig_id} (新增)")
    
    # 保存清单
    with open(MANIFEST_PATH, "w") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)

def main():
    """主函数"""
    if len(sys.argv) < 4:
        print("用法: python3 save_image.py <base64_data_or_file> <fig_id> <description> [type]")
        print("示例: python3 save_image.py 'iVBORw0KG...' fig1 architecture concept")
        print("或:   python3 save_image.py response.txt fig1 architecture concept")
        sys.exit(1)
    
    input_data = sys.argv[1]
    fig_id = sys.argv[2]
    description = sys.argv[3]
    fig_type = sys.argv[4] if len(sys.argv) > 4 else "concept"
    
    # 判断是文件还是直接的base64数据
    if os.path.isfile(input_data):
        with open(input_data) as f:
            content = f.read()
        base64_data = extract_base64_from_markdown(content)
    else:
        base64_data = extract_base64_from_markdown(input_data)
    
    if not base64_data:
        print("❌ 无法提取base64数据")
        sys.exit(1)
    
    print(f"📊 准备保存图片: {fig_id}_{description}.png")
    success = save_image(base64_data, fig_id, description, fig_type)
    
    if success:
        print(f"\n🎉 完成！图片已保存到: {OUTPUT_DIR}/{fig_id}_{description}.png")
        sys.exit(0)
    else:
        print(f"\n❌ 保存失败")
        sys.exit(1)

if __name__ == "__main__":
    main()
