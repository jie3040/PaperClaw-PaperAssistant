# Artist 工作流

## Mode A（从零开始）
三项工作不变：
1. 扩充概念图 Prompt → 保存 → 用户手动 Gemini 生成
2. 生成 LaTeX 表格（基于 tables_spec.md 规格数据）
3. 生成 matplotlib 数据图（基于 data_plots_spec.md 规格数据）

## Mode B（结果先行）— ★ 与 Mode A 差异巨大

### 核心原则
Mode B 下用户已提供数据图和表格，Artist **不需要自己生成数据图和表格**。
Artist 的职责变为**提取、整理、转换**用户提供的材料。

### 工作 1：扩充概念图 Prompt（与 Mode A 相同）
- 读取 Architect 的简略 prompt + Writer 文本 + 风格范例
- 扩充为详细版
- 保存到 `SHARED/figures/detailed_concept_prompts.md`
- 回报 Leader，通知用户手动 Gemini 生成

### 工作 2：提取并整理用户数据图（★ Mode B 专属）

**输入**：`SHARED/user_materials/results/` 下的图片文件和文件夹

**执行步骤**：
1. 遍历 results/ 下所有图片文件（.png, .jpg, .jpeg, .pdf）
2. 遍历所有子文件夹（如 figure1/, figure2/...），每个文件夹可能包含多张子图
3. **复制所有图片到 `SHARED/figures/`**：
   - 单张图片：直接复制，命名为 `data_fig_N.png`
   - 子图文件夹：**保留各子图独立文件**，命名为 `data_fig_N_a.png`, `data_fig_N_b.png`...
   - 同时复制合并版（如果阶段 0.5B 已生成 `combined_figN.png`）
4. **生成 `SHARED/figures/data_figures_manifest.md`**：

```markdown
# 数据图清单

## Fig.4 - Experimental results
- 类型：子图合集
- 子图数量：3
- 文件：
  - data_fig_4_a.png — (a) Training loss curve
  - data_fig_4_b.png — (b) Validation accuracy
  - data_fig_4_c.png — (c) Confusion matrix
- 建议 LaTeX：使用 subfigure 环境，3列排列
- 建议 caption：Experimental results of the proposed method

## Fig.5 - Comparison with baselines
- 类型：单张图片
- 文件：data_fig_5.png
- 建议 caption：Comparison of accuracy with baseline methods
```

### 工作 3：提取并转换用户表格为 LaTeX（★ Mode B 专属）

**输入**：`SHARED/user_materials/results/` 下的表格文件

**支持的格式**：
- **CSV/TSV**：直接读取数据，转为 LaTeX tabular
- **Word (.docx)**：用 python-docx 读取表格内容，转为 LaTeX
- **Excel (.xlsx)**：用 openpyxl 读取，转为 LaTeX
- **图片中的表格**：尝试 OCR 识别，无法识别则标注 `% TODO: 用户需手动补充此表格数据`
- **文本描述**：按描述构建 LaTeX 表格

**执行步骤**：
1. 识别 results/ 下所有表格文件
2. 逐个读取并转换为 LaTeX 代码
3. 格式要求：
   - booktabs（`\toprule`, `\midrule`, `\bottomrule`）
   - `\begin{table}[t]` + `\centering`
   - 包含 `\caption{}` 和 `\label{tab:xxx}`
   - 最佳结果加粗 `\textbf{}`
4. 每张表保存为 `SHARED/figures/table_N.tex`

**Word 表格读取示例**：
```python
from docx import Document
doc = Document("SHARED/user_materials/results/tables.docx")
for i, table in enumerate(doc.tables):
    rows = []
    for row in table.rows:
        cells = [cell.text.strip() for cell in row.cells]
        rows.append(cells)
    # 转为 LaTeX tabular...
```

**CSV 表格转换示例**：
```python
import csv
with open("SHARED/user_materials/results/results.csv") as f:
    reader = csv.reader(f)
    header = next(reader)
    rows = list(reader)
# 生成 LaTeX tabular 代码...
```

### 如何判断是 Mode B
Leader 的任务 message 中会包含 "Mode B" 关键词。
- 看到 "Mode B" → 工作 2 和 3 按上述流程执行（提取+转换）
- 没有 "Mode B" → 工作 2 和 3 按 Mode A 执行（自己生成）
