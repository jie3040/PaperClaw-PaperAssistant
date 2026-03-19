# 多 Agent 论文写作工作流 v2

## 🚀 阶段 0：启动前准备（Leader 主导）

### 0.1 询问用户（必须）
Leader 必须向用户收集以下信息：

1. **研究主题 (Research Topic)**
   - 具体研究方向和关键词
   - 例如："Transformer-based time series forecasting"

2. **目标期刊/会议 (Target Venue)**
   - 期刊名称或会议缩写
   - 例如："NeurIPS 2026" 或 "IEEE TPAMI"

### 0.2 要求用户提供材料（必须）

3. **LaTeX 模板**
   - 放置路径：`/home/liaowenjie/.openclaw-multi/shared/paper-project/template/`
   - 必须包含：主 .cls/.sty 文件

4. **2 篇论文范例 PDF**（🆕 新增）
   - 放置路径：`/home/liaowenjie/.openclaw-multi/shared/paper-project/examples/`
   - 文件命名：`example_1.pdf`, `example_2.pdf`
   - 必须是目标期刊/会议的已发表论文
   - 用于所有 Agent 参考写作风格、排版格式、图表规范

### 0.3 解析范例论文（Leader 执行）（🆕 新增）

用户放好范例 PDF 后，Leader 使用 MinerU 解析：

```bash
# 解析范例论文 1
~/MinerU/.venv/bin/mineru -p /home/liaowenjie/.openclaw-multi/shared/paper-project/examples/example_1.pdf \
  -o /home/liaowenjie/.openclaw-multi/shared/paper-project/examples/example_1_parsed -b pipeline

# 解析范例论文 2
~/MinerU/.venv/bin/mineru -p /home/liaowenjie/.openclaw-multi/shared/paper-project/examples/example_2.pdf \
  -o /home/liaowenjie/.openclaw-multi/shared/paper-project/examples/example_2_parsed -b pipeline
```

解析完成后，关键参考文件路径：
- `examples/example_1_parsed/<name>/auto/<name>.md` — 范例1 Markdown
- `examples/example_2_parsed/<name>/auto/<name>.md` — 范例2 Markdown
- `examples/example_*_parsed/<name>/auto/images/` — 范例图片

### 0.4 记录项目配置

将所有信息写入 `project_config.md`，包括：
- 研究主题、目标期刊
- 模板路径
- 范例论文路径（原始 PDF + 解析后 Markdown）
- 所有 Agent 均可通过此文件获取项目信息

---

## 阶段 1：文献调研 (Surveyor)
1. Leader 发任务给 Surveyor (curl :18810)
2. Surveyor 使用 brave_search 检索文献
3. 输出：reference_list.json, survey_report.md, key_findings.md
4. Surveyor 回报 Leader (curl :18800)
5. **Leader 审查** → ACCEPT 或 REVISE (最多 3 轮)

## 阶段 2：创意生成 (Ideator) ⚠️ 用户干预点
1. Leader 发任务给 Ideator (curl :18820)
   - 📌 任务中附上范例论文 Markdown 路径，要求参考范例的创新点与研究问题结构
2. Ideator 生成 3-5 个候选 idea
3. 输出：candidates.md, comparison_matrix.md
4. Ideator 回报 Leader (curl :18800)
5. **🚨 必须用户干预**：
   - Leader 读取 candidates.md 和 comparison_matrix.md
   - 将所有候选 idea 汇总展示给用户
   - 等待用户选择（Idea-1, Idea-2, ...）
   - 将选定的 idea 写入 selected_idea.md
6. 确认后进入阶段 3

## 阶段 3：框架设计 (Architect) 🆕 职责扩展
1. Leader 发任务给 Architect (curl :18830)
   - 📌 任务中附上范例论文 Markdown 路径，要求参考范例的论文结构
2. Architect 基于 selected_idea.md 设计论文结构
3. **Architect 输出**（🆕 扩展）：
   - `paper_outline.md` — 论文框架
   - `figures_plan.md` — 图表总览规划
   - `artist_prompts.md` — 🆕 **为 Artist 生成的详细图片 prompt**
     - 每张图包含：图片编号、标题、详细内容描述、风格要求、**像素尺寸**（如 1200x800）、配色方案
   - `tables_spec.md` — 🆕 **表格规格说明**
     - 每张表的 LaTeX 代码结构、列名、数据描述、格式要求
   - `data_plots_spec.md` — 🆕 **数据图规格说明**
     - 每张数据图的 Python 绘图要求：图表类型、数据说明、坐标轴、样式、尺寸
4. Architect 回报 Leader (curl :18800)
5. **Leader 审查** → ACCEPT 或 REVISE (最多 3 轮)

## 阶段 4：并行创作 (Writer + Artist + Leader)

### 4a. Writer 任务
1. Leader 按 section 分配任务 (curl :18840)
   - 📌 任务中附上范例论文 Markdown 路径，要求参考范例的写作风格和段落结构
2. Writer 逐节撰写
3. 输出：drafts/section_*.md
4. 每节完成后回报 Leader

### 4b. Artist 任务 — 概念图（🆕 改进）
1. **Leader 读取** `outline/artist_prompts.md`
2. **Leader 逐张将 prompt 发给 Artist** (curl :18860)
   - 📌 每次发送包含：完整 prompt + 像素尺寸 + 风格要求
   - 📌 附上范例论文图片路径，要求 Artist 参考范例图片风格
3. Artist **只负责按 prompt 生成图片**（Gemini 模型）
4. Artist 回报 Leader，Leader 提取 base64 保存

### 4c. Leader 任务 — 表格 + 数据图（🆕 改进）
1. **Leader 读取** `outline/tables_spec.md` 生成 LaTeX 表格
2. **Leader 读取** `outline/data_plots_spec.md` 用 Python matplotlib 生成数据图
3. 如有疑问，Leader 可以 curl :18830 询问 Architect 细节
4. 所有图表保存到 `figures/` 目录

### 时间线
- Writer、Artist、Leader 图表生成 **三者并行**
- 都完成后进入下一阶段

## 阶段 5：质量审查 (Reviewer)
1. Leader 发全文审查任务 (curl :18850)
   - 📌 任务中附上范例论文 Markdown 路径，要求以此为质量标准进行对比审查
2. Reviewer 审查逻辑、连贯性、学术规范
3. 输出：reviews/review_report.md
4. Reviewer 回报 Leader (curl :18800)
5. 如需返工 → Leader 重新分配任务 (最多 3 轮)

## 阶段 6：最终定稿 (Editor) + PDF 编译 (Leader)
1. Leader 发整合任务 (curl :18870)
   - 📌 任务中附上范例论文 Markdown 路径，要求参考范例的排版格式
2. Editor 整合所有内容 + 润色
3. Editor 使用 LaTeX 模板生成 .tex + .bib
4. 输出：final/paper_final.tex, references.bib, changelog.md
5. Editor 回报 Leader (curl :18800)
6. **Leader 编译 PDF**（pdflatex + bibtex）
7. **Leader 通知用户完成**

---

## 📂 共享目录结构

```
/home/liaowenjie/.openclaw-multi/shared/paper-project/
├── project_config.md          ← 项目配置（主题、期刊、路径）
├── template/                  ← LaTeX 模板
├── examples/                  ← 🆕 论文范例
│   ├── example_1.pdf
│   ├── example_2.pdf
│   ├── example_1_parsed/      ← MinerU 解析结果
│   │   └── example_1/auto/
│   │       ├── example_1.md
│   │       └── images/
│   └── example_2_parsed/      ← MinerU 解析结果
│       └── example_2/auto/
│           ├── example_2.md
│           └── images/
├── references/                ← 文献调研结果
├── ideas/                     ← 创意候选 + 选定
├── outline/                   ← 论文框架
│   ├── paper_outline.md
│   ├── figures_plan.md
│   ├── artist_prompts.md      ← 🆕 Artist 图片 prompt
│   ├── tables_spec.md         ← 🆕 表格规格
│   └── data_plots_spec.md     ← 🆕 数据图规格
├── drafts/                    ← 各 section 草稿
├── figures/                   ← 所有图表
├── reviews/                   ← 审查报告
└── final/                     ← 最终 LaTeX + PDF
```

## 🔑 关键规则
- ✅ 启动前必须收集：研究主题、目标期刊、LaTeX 模板、**2篇范例论文**
- ✅ 范例论文必须用 MinerU 解析，解析结果供所有 Agent 参考
- ✅ 所有 Agent 任务指令中必须包含范例论文路径
- ✅ Architect 负责生成 Artist prompt、表格规格、数据图规格
- ✅ Artist 只按 prompt 生成概念图，Leader 负责表格和数据图
- ✅ 所有文件使用绝对路径
- ✅ 每阶段最多 3 轮返工，超过通知用户
- ✅ 阶段 2 结束必须用户选择 idea
- ✅ Leader 负责 PDF 编译（不是 Editor）
- ✅ 所有 Agent 完成后必须 curl 回报 Leader

## 🛠️ MinerU 工具
- 路径：`~/MinerU/.venv/bin/mineru`
- 使用方式：`~/MinerU/.venv/bin/mineru -p <input.pdf> -o <output_dir> -b pipeline`
- 用于 CPU 环境，无需 GPU
