#!/bin/bash
# ============================================================
# PaperClaw v1.5 项目打包脚本
# 复制 ~/.openclaw-multi 并抹除所有敏感信息：
#   1. API Key (sk-*)
#   2. Gateway PID（随机化）
#   3. 飞书 appId / appSecret
#   4. GitHub Token (ghp_*)
# ============================================================

SRC="$HOME/.openclaw-multi"
DEST="$HOME/PaperClaw/openclaw-multi"

echo "🦞 PaperClaw v1.5 打包脚本"
echo "============================================="
echo "源目录: $SRC"
echo "目标: $DEST"
echo ""

# 检查源目录
if [ ! -d "$SRC" ]; then
  echo "❌ 源目录不存在: $SRC"
  exit 1
fi

# 创建目标
mkdir -p "$HOME/PaperClaw"

# 复制（排除大文件和临时文件）
echo "📦 复制文件..."
rsync -av --progress "$SRC/" "$DEST/" \
  --exclude='*.jsonl' \
  --exclude='*.log' \
  --exclude='completions/' \
  --exclude='canvas/' \
  --exclude='devices/' \
  --exclude='node_modules/' \
  --exclude='package-lock.json' \
  --exclude='shared/paper-project-*/examples/*.pdf' \
  --exclude='shared/paper-project-*/examples/*_parsed/' \
  --exclude='shared/paper-project-*/final/*.pdf' \
  --exclude='shared/paper-project-*/figures/*.png' \
  --exclude='shared/paper-project-*/figures/*.jpg' \
  --exclude='shared/paper-project-*/drafts/*/section_*.tex' \
  --exclude='shared/paper-project-*/drafts/*/references.bib' \
  --exclude='shared/paper-project-*/outline/*/paper_outline.md' \
  --exclude='shared/paper-project-*/user_materials/' \
  --exclude='__pycache__/' \
  --exclude='.DS_Store'

echo ""

# ============================================================
# 1. 抹除所有 API Key (sk-*)
# ============================================================
echo "🔒 [1/4] 抹除所有 API Key..."

find "$DEST" -name "openclaw.json" -exec python3 -c "
import json, sys

path = sys.argv[1]
with open(path) as f:
    data = json.load(f)

changed = False

def sanitize(obj):
    global changed
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k == 'apiKey' and isinstance(v, str) and v != 'YOUR_API_KEY_HERE':
                obj[k] = 'YOUR_API_KEY_HERE'
                changed = True
            else:
                sanitize(v)
    elif isinstance(obj, list):
        for item in obj:
            sanitize(item)

sanitize(data)

with open(path, 'w') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

if changed:
    print(f'  ✓ 清除 apiKey: {path}')
" {} \;

# 也处理 memory 和 sessions 中的残留
find "$DEST" -type f \( -name "*.md" -o -name "*.json" -o -name "*.txt" \) \
  -exec sed -i 's/sk-[a-zA-Z0-9_\-]\{20,\}/YOUR_API_KEY_HERE/g' {} \;

echo ""

# ============================================================
# 2. 随机化 Gateway PID
# ============================================================
echo "🔒 [2/4] 随机化 Gateway PID..."

find "$DEST" -type f \( -name "*.md" -o -name "*.json" -o -name "*.txt" \) \
  -exec python3 -c "
import re, sys, random

path = sys.argv[1]
try:
    with open(path, 'r') as f:
        content = f.read()
except:
    sys.exit(0)

original = content

# 替换 PID 数字模式：'PID 12345' → 'PID <随机>'
def replace_pid(m):
    return 'PID ' + str(random.randint(10000, 99999))
content = re.sub(r'PID \d{4,6}', replace_pid, content)

# 替换 '(PID 12345)' 模式
def replace_pid_paren(m):
    return '(PID ' + str(random.randint(10000, 99999)) + ')'
content = re.sub(r'\(PID \d{4,6}\)', replace_pid_paren, content)

if content != original:
    with open(path, 'w') as f:
        f.write(content)
    print(f'  ✓ 随机化 PID: {path}')
" {} \;

echo ""

# ============================================================
# 3. 抹除飞书 appId / appSecret
# ============================================================
echo "🔒 [3/4] 抹除飞书凭证..."

find "$DEST" -name "openclaw.json" -exec python3 -c "
import json, sys

path = sys.argv[1]
with open(path) as f:
    data = json.load(f)

changed = False

def sanitize_feishu(obj):
    global changed
    if isinstance(obj, dict):
        if 'feishu' in obj and isinstance(obj['feishu'], dict):
            fs = obj['feishu']
            if 'appId' in fs and fs['appId'] != 'YOUR_FEISHU_APP_ID':
                fs['appId'] = 'YOUR_FEISHU_APP_ID'
                changed = True
            if 'appSecret' in fs and fs['appSecret'] != 'YOUR_FEISHU_APP_SECRET':
                fs['appSecret'] = 'YOUR_FEISHU_APP_SECRET'
                changed = True
        for v in obj.values():
            sanitize_feishu(v)
    elif isinstance(obj, list):
        for item in obj:
            sanitize_feishu(item)

sanitize_feishu(data)

with open(path, 'w') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

if changed:
    print(f'  ✓ 清除飞书凭证: {path}')
" {} \;

echo ""

# ============================================================
# 4. 抹除 GitHub Token
# ============================================================
echo "🔒 [4/4] 抹除 GitHub Token..."

find "$DEST" -type f \( -name "*.json" -o -name "*.md" -o -name "*.sh" -o -name "*.txt" \) \
  -exec sed -i 's/ghp_[a-zA-Z0-9]\{20,\}/YOUR_GITHUB_TOKEN/g' {} \;

# 清理残留 jsonl
find "$DEST" -name "*.jsonl" -delete 2>/dev/null

echo ""

# ============================================================
# 验证
# ============================================================
echo "🔍 验证：检查残留敏感信息..."

CLEAN=true

# 检查 sk- 残留
LEAKS=$(grep -rn "sk-[a-zA-Z0-9_\-]\{20,\}" "$DEST" --include="*.json" --include="*.md" 2>/dev/null | grep -v "YOUR_API_KEY_HERE" | head -5)
if [ -n "$LEAKS" ]; then
  echo "⚠️  发现 API Key 残留："
  echo "$LEAKS"
  CLEAN=false
fi

# 检查 ghp_ 残留
GHLEAKS=$(grep -rn "ghp_[a-zA-Z0-9]\{20,\}" "$DEST" 2>/dev/null | grep -v "YOUR_GITHUB_TOKEN" | head -5)
if [ -n "$GHLEAKS" ]; then
  echo "⚠️  发现 GitHub Token 残留："
  echo "$GHLEAKS"
  CLEAN=false
fi

# 检查飞书残留
FSLEAKS=$(grep -rn "cli_a9[a-zA-Z0-9]\{10,\}" "$DEST" 2>/dev/null | head -5)
if [ -n "$FSLEAKS" ]; then
  echo "⚠️  发现飞书 appId 残留："
  echo "$FSLEAKS"
  CLEAN=false
fi

FSLEAKS2=$(grep -rn "tNAJi6\|appSecret.*[a-zA-Z0-9]\{20,\}" "$DEST" --include="*.json" 2>/dev/null | grep -v "YOUR_FEISHU" | head -5)
if [ -n "$FSLEAKS2" ]; then
  echo "⚠️  发现飞书 appSecret 残留："
  echo "$FSLEAKS2"
  CLEAN=false
fi

if $CLEAN; then
  echo "✅ 未发现残留敏感信息"
fi

echo ""
echo "============================================="
echo "✅ 打包完成！"
echo ""
echo "目录: $HOME/PaperClaw/openclaw-multi/"
echo ""
echo "接下来："
echo "  cd ~/PaperClaw"
echo "  git add -A"
echo "  git commit -m '🦞 PaperClaw v1.5'"
echo "  git push"
