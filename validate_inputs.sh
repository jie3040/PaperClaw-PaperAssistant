#!/bin/bash
# =============================================================
# PaperClaw v1.8 — 输入验证脚本
# 用法：bash validate_inputs.sh <SHARED路径> <模式A|B>
# 示例：bash validate_inputs.sh ~/.openclaw-multi/shared/paper-project-5 B
# =============================================================

set -euo pipefail

SHARED="${1:-}"
MODE="${2:-A}"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass=0
fail=0
warn=0

check_exists() {
  local path="$SHARED/$1"
  local label="$2"
  local required="${3:-yes}"
  if [ -e "$path" ]; then
    local size
    if [ -f "$path" ]; then
      size=$(wc -c < "$path" 2>/dev/null || echo 0)
      if [ "$size" -lt 10 ]; then
        echo -e "  ${YELLOW}⚠️  WARN${NC}  $label（文件存在但内容为空）"
        ((warn++))
        return
      fi
    elif [ -d "$path" ]; then
      local count
      count=$(find "$path" -maxdepth 1 -type f 2>/dev/null | wc -l)
      if [ "$count" -eq 0 ]; then
        echo -e "  ${YELLOW}⚠️  WARN${NC}  $label（目录存在但为空）"
        ((warn++))
        return
      fi
    fi
    echo -e "  ${GREEN}✅ OK${NC}   $label"
    ((pass++))
  else
    if [ "$required" = "yes" ]; then
      echo -e "  ${RED}❌ MISS${NC}  $label  ← 必须提供"
      ((fail++))
    else
      echo -e "  ${YELLOW}⚠️  OPT${NC}   $label（可选，未提供）"
      ((warn++))
    fi
  fi
}

echo ""
echo "=============================================="
echo " PaperClaw 输入验证 — Mode ${MODE}"
echo " 项目路径: ${SHARED}"
echo "=============================================="

if [ -z "$SHARED" ]; then
  echo -e "${RED}错误：未提供 SHARED 路径${NC}"
  echo "用法: bash validate_inputs.sh <SHARED路径> <A|B>"
  exit 1
fi

if [ ! -d "$SHARED" ]; then
  echo -e "${RED}错误：项目目录不存在: $SHARED${NC}"
  exit 1
fi

echo ""
echo "【通用必需文件 — Mode A & B】"
check_exists "template"                            "LaTeX 模板目录 (template/)"
check_exists "examples"                            "范例论文目录 (examples/)"
check_exists "golden_standard.json"                "黄金标准 (golden_standard.json)"         "no"

echo ""
echo "【Mode ${MODE} 专项检查】"
if [ "$MODE" = "A" ]; then
  check_exists "ideas"                             "创意目录 (ideas/)"                       "no"
  check_exists "references"                        "文献目录 (references/)"                  "no"
elif [ "$MODE" = "B" ]; then
  check_exists "user_materials/method_description.md"  "用户方法描述 (method_description.md)"
  check_exists "user_materials/results"                "实验结果目录 (results/)"
  check_exists "user_materials/code"                   "代码目录 (code/)"                    "no"
fi

echo ""
echo "【运行时目录结构】"
for dir in outline drafts figures reviews final; do
  if [ -d "$SHARED/$dir" ]; then
    echo -e "  ${GREEN}✅ OK${NC}   $dir/"
  else
    echo -e "  ${YELLOW}⚠️  缺少${NC}  $dir/（将在运行时自动创建）"
  fi
done

echo ""
echo "=============================================="
echo " 结果汇总: ✅ $pass 通过  ❌ $fail 缺失  ⚠️  $warn 警告"
echo "=============================================="

if [ "$fail" -gt 0 ]; then
  echo -e "${RED}验证未通过：有 $fail 个必需文件缺失，请补充后再启动 pipeline。${NC}"
  echo ""
  exit 1
elif [ "$warn" -gt 0 ]; then
  echo -e "${YELLOW}验证通过（含 $warn 个警告），建议补充可选文件以获得更好效果。${NC}"
  echo ""
  exit 0
else
  echo -e "${GREEN}验证完全通过！可以启动 pipeline。${NC}"
  echo ""
  exit 0
fi
