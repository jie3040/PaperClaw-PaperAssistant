#!/bin/bash
# PDF编译脚本 - 将LaTeX论文编译为PDF
# 用法: bash compile_pdf.sh [paper_name] [paper_dir]

PAPER_NAME="${1:-paper}"
PAPER_DIR="${2:-/home/liaowenjie/.openclaw-multi/shared/paper-project/final}"
LOG_FILE="/tmp/latex_compile_$(date +%Y%m%d_%H%M%S).log"

echo "📄 LaTeX → PDF 编译器"
echo "   论文: $PAPER_NAME.tex"
echo "   目录: $PAPER_DIR"
echo "   日志: $LOG_FILE"
echo ""

# 检查目录和文件
if [ ! -d "$PAPER_DIR" ]; then
    echo "❌ 目录不存在: $PAPER_DIR"
    exit 1
fi

cd "$PAPER_DIR" || exit 1

if [ ! -f "$PAPER_NAME.tex" ]; then
    echo "❌ LaTeX文件不存在: $PAPER_NAME.tex"
    exit 1
fi

# 检查pdflatex是否安装
if ! command -v pdflatex &> /dev/null; then
    echo "❌ pdflatex未安装"
    echo "   安装方法: sudo apt-get install texlive-latex-base texlive-latex-extra"
    exit 1
fi

echo "🔧 开始编译..."
echo ""

# 第一次编译
echo "[1/3] 第一次编译..."
pdflatex -interaction=nonstopmode -halt-on-error "$PAPER_NAME.tex" > "$LOG_FILE" 2>&1
RESULT=$?

if [ $RESULT -ne 0 ]; then
    echo "❌ 第一次编译失败 (退出码: $RESULT)"
    echo ""
    echo "=== 错误日志 (最后50行) ==="
    tail -50 "$LOG_FILE"
    echo ""
    echo "完整日志: $LOG_FILE"
    exit 1
fi

echo "   ✅ 第一次编译成功"

# 处理参考文献
if [ -f "$PAPER_NAME.bib" ]; then
    echo "[2/3] 处理参考文献..."
    bibtex "$PAPER_NAME" >> "$LOG_FILE" 2>&1
    if [ $? -eq 0 ]; then
        echo "   ✅ 参考文献处理成功"
    else
        echo "   ⚠️  参考文献处理有警告（可能正常）"
    fi
    
    # 第二次编译（更新引用）
    echo "[2/3] 第二次编译（更新引用）..."
    pdflatex -interaction=nonstopmode -halt-on-error "$PAPER_NAME.tex" >> "$LOG_FILE" 2>&1
    echo "   ✅ 第二次编译成功"
fi

# 最终编译
echo "[3/3] 最终编译..."
pdflatex -interaction=nonstopmode -halt-on-error "$PAPER_NAME.tex" >> "$LOG_FILE" 2>&1
RESULT=$?

if [ $RESULT -ne 0 ]; then
    echo "❌ 最终编译失败 (退出码: $RESULT)"
    echo ""
    echo "=== 错误日志 (最后50行) ==="
    tail -50 "$LOG_FILE"
    echo ""
    echo "完整日志: $LOG_FILE"
    exit 1
fi

echo "   ✅ 最终编译成功"
echo ""

# 验证PDF
if [ ! -f "$PAPER_NAME.pdf" ]; then
    echo "❌ PDF文件未生成"
    exit 1
fi

PDF_SIZE=$(stat -c%s "$PAPER_NAME.pdf" 2>/dev/null || stat -f%z "$PAPER_NAME.pdf" 2>/dev/null)
if [ "$PDF_SIZE" -lt 1000 ]; then
    echo "❌ PDF文件太小 ($PDF_SIZE bytes)，可能生成失败"
    exit 1
fi

echo "✅ PDF生成成功！"
echo ""
echo "=== PDF信息 ==="
ls -lh "$PAPER_NAME.pdf"
file "$PAPER_NAME.pdf"

# 如果安装了pdfinfo，显示更多信息
if command -v pdfinfo &> /dev/null; then
    echo ""
    echo "=== PDF详情 ==="
    pdfinfo "$PAPER_NAME.pdf" | grep -E "Pages|Page size|PDF version"
fi

# 清理辅助文件
echo ""
echo "🧹 清理辅助文件..."
rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz
echo "   ✅ 清理完成"

echo ""
echo "🎉 编译完成！"
echo "   PDF路径: $PAPER_DIR/$PAPER_NAME.pdf"
echo "   编译日志: $LOG_FILE"
