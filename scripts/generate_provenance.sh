#!/bin/bash
# =============================================================
# PaperClaw v1.8 — 生成 Provenance 审计文件
# 用法：bash generate_provenance.sh <SHARED路径>
# 输出：SHARED/provenance.json
# =============================================================

set -euo pipefail

SHARED="${1:-}"

if [ -z "$SHARED" ] || [ ! -d "$SHARED" ]; then
  echo "错误：请提供有效的 SHARED 路径"
  echo "用法: bash generate_provenance.sh <SHARED路径>"
  exit 1
fi

PROVENANCE_FILE="$SHARED/provenance.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "🔍 生成 Provenance 审计文件..."

# ---- 读取 version_tracker.json ----
TRACKER="$SHARED/version_tracker.json"
if [ -f "$TRACKER" ]; then
  MODE=$(python3 -c "import json; d=json.load(open('$TRACKER')); print(d.get('mode','unknown'))" 2>/dev/null || echo "unknown")
  OUTLINE_V=$(python3 -c "import json; d=json.load(open('$TRACKER')); print(d.get('outline_version',0))" 2>/dev/null || echo "0")
  DRAFTS_V=$(python3 -c "import json; d=json.load(open('$TRACKER')); print(d.get('drafts_version',0))" 2>/dev/null || echo "0")
  FINAL_V=$(python3 -c "import json; d=json.load(open('$TRACKER')); print(d.get('final_version',0))" 2>/dev/null || echo "0")
else
  MODE="unknown"; OUTLINE_V=0; DRAFTS_V=0; FINAL_V=0
fi

# ---- SHA256 哈希函数 ----
sha256_file() {
  local f="$1"
  if [ -f "$f" ]; then
    sha256sum "$f" | awk '{print $1}'
  else
    echo "file_not_found"
  fi
}

# ---- 扫描关键文件 ----
FINAL_PDF="$SHARED/final/v${FINAL_V}/paper.pdf"
FINAL_TEX="$SHARED/final/v${FINAL_V}/paper.tex"
OUTLINE_FILE="$SHARED/outline/v${OUTLINE_V}/paper_outline.md"
GOLDEN_STD="$SHARED/golden_standard.json"

PDF_HASH=$(sha256_file "$FINAL_PDF")
TEX_HASH=$(sha256_file "$FINAL_TEX")
OUTLINE_HASH=$(sha256_file "$OUTLINE_FILE")
GOLDEN_HASH=$(sha256_file "$GOLDEN_STD")

# ---- PDF 页数（需要 pdfinfo，可选）----
PDF_PAGES="unknown"
if command -v pdfinfo &>/dev/null && [ -f "$FINAL_PDF" ]; then
  PDF_PAGES=$(pdfinfo "$FINAL_PDF" 2>/dev/null | grep "^Pages:" | awk '{print $2}' || echo "unknown")
fi

# ---- 参考文献数量 ----
REFS_COUNT=0
REFS_BIB="$SHARED/final/v${FINAL_V}/references.bib"
if [ -f "$REFS_BIB" ]; then
  REFS_COUNT=$(grep -c "^@" "$REFS_BIB" 2>/dev/null || echo 0)
fi

# ---- 图表数量 ----
FIGURES_COUNT=0
if [ -d "$SHARED/figures" ]; then
  FIGURES_COUNT=$(find "$SHARED/figures" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.pdf" \) 2>/dev/null | wc -l)
fi

# ---- 评分历史（从 reviews/ 目录扫描 score JSON）----
SCORES_JSON="[]"
if [ -d "$SHARED/reviews" ]; then
  SCORE_FILES=$(find "$SHARED/reviews" -name "*score*.json" -o -name "*review_score*.json" 2>/dev/null | sort)
  if [ -n "$SCORE_FILES" ]; then
    SCORES_JSON=$(python3 - <<PYEOF
import json, os, glob

review_dir = "$SHARED/reviews"
score_files = sorted(glob.glob(os.path.join(review_dir, "*score*.json")) +
                     glob.glob(os.path.join(review_dir, "*review_score*.json")))
scores = []
for f in score_files:
    try:
        with open(f) as fp:
            d = json.load(fp)
        scores.append({
            "file": os.path.basename(f),
            "overall": d.get("overall"),
            "verdict": d.get("verdict")
        })
    except Exception:
        pass
print(json.dumps(scores))
PYEOF
    )
  fi
fi

# ---- 草稿文件列表 ----
DRAFT_FILES="[]"
if [ -d "$SHARED/drafts/v${DRAFTS_V}" ]; then
  DRAFT_FILES=$(python3 -c "
import os, json
d = '$SHARED/drafts/v${DRAFTS_V}'
files = [f for f in sorted(os.listdir(d)) if f.endswith('.tex')]
print(json.dumps(files))
" 2>/dev/null || echo "[]")
fi

# ---- 写入 provenance.json ----
python3 - <<PYEOF
import json

provenance = {
    "generated_at": "$TIMESTAMP",
    "project_path": "$SHARED",
    "mode": "$MODE",
    "versions": {
        "outline": "v$OUTLINE_V",
        "drafts": "v$DRAFTS_V",
        "final": "v$FINAL_V"
    },
    "outputs": {
        "pdf": {
            "path": "final/v${FINAL_V}/paper.pdf",
            "sha256": "$PDF_HASH",
            "pages": "$PDF_PAGES"
        },
        "tex": {
            "path": "final/v${FINAL_V}/paper.tex",
            "sha256": "$TEX_HASH"
        }
    },
    "inputs": {
        "golden_standard": {
            "path": "golden_standard.json",
            "sha256": "$GOLDEN_HASH"
        },
        "outline": {
            "path": "outline/v${OUTLINE_V}/paper_outline.md",
            "sha256": "$OUTLINE_HASH"
        }
    },
    "stats": {
        "references_count": int("$REFS_COUNT") if "$REFS_COUNT".isdigit() else 0,
        "figures_count": int("$FIGURES_COUNT") if "$FIGURES_COUNT".isdigit() else 0,
        "draft_sections": $DRAFT_FILES
    },
    "review_scores": $SCORES_JSON
}

with open("$PROVENANCE_FILE", "w") as f:
    json.dump(provenance, f, indent=2, ensure_ascii=False)

print(f"✅ Provenance 已写入: $PROVENANCE_FILE")
PYEOF

echo ""
echo "📋 关键信息摘要："
echo "   模式: Mode ${MODE}"
echo "   最终版本: final/v${FINAL_V}/"
echo "   参考文献: ${REFS_COUNT} 条"
echo "   图表数量: ${FIGURES_COUNT} 张"
echo "   PDF 页数: ${PDF_PAGES}"
echo "   PDF SHA256: ${PDF_HASH:0:16}..."
echo ""
