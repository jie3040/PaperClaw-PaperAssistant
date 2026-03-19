#!/bin/bash
# ============================================================
# PaperClaw 项目打包脚本
# 复制 ~/.openclaw-multi 并抹除所有 API Key
# ============================================================

SRC="$HOME/.openclaw-multi"
DEST="$HOME/PaperClaw/openclaw-multi"

echo "🦞 PaperClaw 打包脚本"
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
  --exclude='shared/paper-project-*/outline/*/paper_outline.md' \
  --exclude='__pycache__/' \
  --exclude='.DS_Store'

echo ""
echo "🔒 抹除所有 API Key..."

# 抹除所有 openclaw.json 中的 apiKey
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
            elif k == 'token' and isinstance(v, str) and len(v) > 30:
                # gateway token 保留（短token是功能性的）
                pass
            else:
                sanitize(v)
    elif isinstance(obj, list):
        for item in obj:
            sanitize(item)

sanitize(data)

with open(path, 'w') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

if changed:
    print(f'  ✓ {path}')
" {} \;

# 抹除 memory 中可能包含的 key
find "$DEST" -path "*/memory/*" -name "*.md" -exec sed -i \
  's/sk-[a-zA-Z0-9_\-]\{20,\}/YOUR_API_KEY_HERE/g' {} \;

# 抹除 sessions.json 中可能包含的 key
find "$DEST" -name "sessions.json" -exec sed -i \
  's/sk-[a-zA-Z0-9_\-]\{20,\}/YOUR_API_KEY_HERE/g' {} \;

# 清理 agents/main/sessions/ 中的 jsonl（如果 rsync 没排除干净）
find "$DEST" -name "*.jsonl" -delete 2>/dev/null

echo ""
echo "🔍 验证：检查是否还有残留 Key..."
LEAKS=$(grep -rn "sk-[a-zA-Z0-9_\-]\{20,\}" "$DEST" --include="*.json" --include="*.md" --include="*.txt" 2>/dev/null | grep -v "YOUR_API_KEY_HERE" | head -10)
if [ -n "$LEAKS" ]; then
  echo "⚠️  发现残留 Key，请手动检查："
  echo "$LEAKS"
else
  echo "✅ 未发现残留 Key"
fi

# 也检查 github token
GHLEAKS=$(grep -rn "ghp_[a-zA-Z0-9]\{20,\}" "$DEST" 2>/dev/null | head -5)
if [ -n "$GHLEAKS" ]; then
  echo "⚠️  发现 GitHub Token 残留："
  echo "$GHLEAKS"
  # 自动抹除
  find "$DEST" -type f \( -name "*.json" -o -name "*.md" -o -name "*.sh" -o -name "*.txt" \) \
    -exec sed -i 's/ghp_[a-zA-Z0-9]\{20,\}/YOUR_GITHUB_TOKEN/g' {} \;
  echo "   已自动抹除"
fi

echo ""
echo "============================================="
echo "✅ 打包完成！"
echo ""
echo "目录: $HOME/PaperClaw/openclaw-multi/"
echo ""
echo "接下来："
echo "  1. 复制 paper-agents.sh 和 bashrc_aliases.sh 到 $HOME/PaperClaw/"
echo "  2. cd $HOME/PaperClaw && git init && git add . && git commit -m 'Initial commit'"
echo "  3. 创建 GitHub repo 后: git remote add origin <url> && git push -u origin main"
