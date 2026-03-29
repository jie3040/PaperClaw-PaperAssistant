# PaperClaw 工作流

## 模式选择（阶段 0 第一步）

启动时询问用户：

```
欢迎使用 PaperClaw！请选择工作模式：

📝 Mode A — 从零开始
   适用于：有研究方向，需要系统辅助完成全流程
   需要提供：研究主题 + 期刊 + LaTeX模板 + 2篇范例论文

🔬 Mode B — 结果先行
   适用于：已完成实验，有method和结果，需要整理成论文
   需要提供：上述全部 + method描述 + 代码(可选) + 实验结果(必须)

请选择 A 或 B。
```

在 version_tracker.json 中记录 `"mode": "A"` 或 `"mode": "B"`。

---

## 流程总览

### Mode A 流程
```
阶段 0    用户提供主题 + 期刊 + 模板 + 2篇范例 PDF → MinerU 解析
阶段 0.5  Leader 提取黄金标准 → golden_standard.json + 初始化 version_tracker.json
阶段 1    Surveyor 文献检索
阶段 1.5  Leader 精简调研报告（<5KB）
阶段 2    Ideator 生成 idea → 用户选定
阶段 3    Architect 设计框架 → outline/v1/
阶段 3.5  ★ Reviewer 框架对齐审查 → 不通过则循环
阶段 4    Writer 逐节撰写 → drafts/v1/ → 最后生成 references.bib
阶段 4.5 ★ Reviewer 内容对齐审查 → 不通过则循环
阶段 4.6  ★ Writer 润色（逐 section/subsection）
阶段 4.7  ★ Writer 去除AI痕迹（逐 section/subsection）
阶段 4.8 Artist 生图/表/数据图 → figures/
阶段 5    Editor 整合 LaTeX → final/v1/
阶段 6    ★ Checker LaTeX审查修复
阶段 7    Reviewer 最终对齐审查
阶段 7.5  ★ Reviewer 逻辑检查（整篇，不通过打回）
阶段 7.6  ★ Reviewer 缩写检查（整篇，不通过打回）
阶段 8    Leader 编译 PDF → 通知用户
阶段 9    用户/专家审查 → Leader 整合意见
阶段 10   分发修改任务 → 回到阶段 5 循环
```

### Mode B 流程
```
阶段 0B   用户提供全部材料 → MinerU 解析 → Leader 分析用户材料
阶段 0.5B Leader 提取黄金标准 + 生成 materials_summary.md
阶段 1B   Surveyor 聚焦 related work 检索
阶段 1.5B Leader 精简调研报告
阶段 2B   ★ 跳过 Ideator ★ Leader 将用户 method 整理为 selected_idea.md
阶段 3B~10B  与 Mode A 相同（但 Writer/Artist 额外读取 user_materials/）
```

---

## Mode A 详细流程

### 阶段 0：启动前准备

0.1 询问用户 Research Topic + 目标期刊
0.2 要求提供 LaTeX 模板 → `template/`，2 篇范例 PDF → `examples/`
0.3 MinerU 解析范例论文：
```bash
~/MinerU/.venv/bin/mineru -p SHARED/examples/example_1.pdf -o SHARED/examples/example_1_parsed -b pipeline
~/MinerU/.venv/bin/mineru -p SHARED/examples/example_2.pdf -o SHARED/examples/example_2_parsed -b pipeline
```
0.4 写入 project_config.md
0.5 给所有 Agent 任务附上范例路径

### 阶段 0.5：提取黄金标准

从两篇范例论文中提取 `SHARED/golden_standard.json`：
```json
{
  "structure": {
    "total_sections": 6,
    "total_subsections": 15,
    "sections": [
      {"name": "Introduction", "approx_words": 1200},
      {"name": "Related Work", "approx_words": 1500}
    ]
  },
  "figures": { "total_count": 5, "types": [] },
  "tables": { "total_count": 3, "types": [] },
  "references": { "approx_range": [40, 50] },
  "total_pages": 10
}
```

初始化版本追踪器：
```bash
cat > SHARED/version_tracker.json << 'EOF'
{ "mode": "A", "outline_version": 0, "drafts_version": 0, "final_version": 0, "history": [] }
EOF
```

### 阶段 1：Surveyor 文献检索

```bash
curl -s -X POST http://127.0.0.1:18810/hooks/agent \
  -H 'Authorization: Bearer surveyor-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"文献检索任务。主题：<TOPIC>。范例论文：SHARED/examples/。输出到 SHARED/references/","name":"文献检索","sessionKey":"hook:survey-1"}'
```

### 阶段 1.5：Leader 精简调研报告

Surveyor 产出完整报告后，Leader 精简为 `references/survey_summary.md`（< 5KB），包含：技术路线分类、研究空白、数据集、评价指标、范例论文方法摘要。

### 阶段 2：Ideator 生成 idea

```bash
curl -s -X POST http://127.0.0.1:18820/hooks/agent \
  -H 'Authorization: Bearer ideator-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"生成研究 idea。调研摘要：SHARED/references/survey_summary.md。范例论文：SHARED/examples/。输出到 SHARED/ideas/","name":"Idea生成","sessionKey":"hook:idea-1"}'
```
→ 用户选定 → `SHARED/ideas/selected_idea.md`

### 阶段 3：Architect 设计框架（写入 outline/v1/）

```bash
mkdir -p SHARED/outline/v1
```
更新 version_tracker.json：`outline_version: 1`

```bash
curl -s -X POST http://127.0.0.1:18830/hooks/agent \
  -H 'Authorization: Bearer architect-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"设计论文框架。\n\n输入：\n- selected_idea: SHARED/ideas/selected_idea.md\n- 调研摘要: SHARED/references/survey_summary.md\n- 范例论文: SHARED/examples/\n- 黄金标准: SHARED/golden_standard.json\n\n★ 所有输出写入 SHARED/outline/v1/：\n- paper_outline.md（含精确段落级字数分配）\n- artist_prompts.md\n- tables_spec.md\n- data_plots_spec.md\n- figures_plan.md","name":"框架设计 v1","sessionKey":"hook:architect-v1"}'
```

### 阶段 3.5：框架对齐审查（最多3轮）

**第 1 步：派 Reviewer**
```bash
curl -s -X POST http://127.0.0.1:18850/hooks/agent \
  -H 'Authorization: Bearer reviewer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"请执行【框架对齐审查】。\n\n黄金标准：SHARED/golden_standard.json\n待审框架：SHARED/outline/v1/paper_outline.md\n图表规划：SHARED/outline/v1/\n范例论文：SHARED/examples/\n\n输出到 SHARED/reviews/review_outline_alignment_v1.md","name":"框架对齐审查 v1","sessionKey":"hook:review-outline-v1"}'
```

**第 2 步：ACCEPT → 阶段 4 ｜ REVISE → 第 3 步**

**第 3 步：打回 Architect**
```bash
mkdir -p SHARED/outline/v2
```
```bash
curl -s -X POST http://127.0.0.1:18830/hooks/agent \
  -H 'Authorization: Bearer architect-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"框架对齐审查未通过。\n\n审查意见：SHARED/reviews/review_outline_alignment_v1.md\n上一版：SHARED/outline/v1/（参考，不要修改）\n黄金标准：SHARED/golden_standard.json\n\n★ 修改后写入 SHARED/outline/v2/","name":"框架修正 v2","sessionKey":"hook:outline-v2"}'
```

### 阶段 4：Writer 逐节撰写（写入 drafts/v1/）

```bash
mkdir -p SHARED/drafts/v1
```

#### 短章节：一个 section 一个任务
```bash
curl -s -X POST http://127.0.0.1:18840/hooks/agent \
  -H 'Authorization: Bearer writer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"撰写 Introduction section。\n\n★ 字数要求：1200词\n★ 写入：SHARED/drafts/v1/section_introduction.tex\n\nOutline：SHARED/outline/v{N}/paper_outline.md\n调研报告：SHARED/references/survey_report.md\n范例论文：SHARED/examples/\n\n严格按 outline 中的段落字数分配撰写。","name":"Write Introduction","sessionKey":"hook:write-intro"}'
```

#### 长章节（Method, Experiments）：按子节拆分

先发 3.1，等完成后发 3.2（附上 3.1 路径确保衔接），以此类推。

```bash
curl ... -d '{"message":"撰写 Method 子节 3.1 Overall Framework。\n\n★ 字数：400词\n★ 写入：SHARED/drafts/v1/section_method_3.1.tex\n★ outline：SHARED/outline/v{N}/paper_outline.md\n★ 无前序子节（第一个）","name":"Write Method 3.1","sessionKey":"hook:write-method-3.1"}'
```

```bash
curl ... -d '{"message":"撰写 Method 子节 3.2。\n\n★ 字数：350词\n★ 写入：SHARED/drafts/v1/section_method_3.2.tex\n★ 已完成前序：SHARED/drafts/v1/section_method_3.1.tex（必须先读）\n\n开头自然承接 3.1。","name":"Write Method 3.2","sessionKey":"hook:write-method-3.2"}'
```

#### 全部写完后：生成 references.bib
```bash
curl -s -X POST http://127.0.0.1:18840/hooks/agent \
  -H 'Authorization: Bearer writer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"请【生成文献引用】。\n\n扫描 SHARED/drafts/v1/*.tex 中的 \\cite{}。\n为每个 key 用 web_search 查找真实文献。\n生成 SHARED/drafts/v1/references.bib。\n\n要求：每条必须 web_search 验证、禁止编造、去重、数量对标 golden_standard.json。","name":"Generate References","sessionKey":"hook:write-references"}'
```

### 阶段 4.5：内容对齐审查

```bash
curl -s -X POST http://127.0.0.1:18850/hooks/agent \
  -H 'Authorization: Bearer reviewer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"请执行【内容对齐审查】。\n\n黄金标准：SHARED/golden_standard.json\n草稿：SHARED/drafts/v1/\n框架：SHARED/outline/v{N}/paper_outline.md\n范例论文：SHARED/examples/\n\n输出到 SHARED/reviews/review_content_alignment_v1.md","name":"内容对齐审查 v1","sessionKey":"hook:review-content-v1"}'
```

REVISE → Writer 修改到 drafts/v2/，再审。最多 3 轮。

### 阶段 4.6：Writer 润色（逐 section/subsection）🆕 v1.6

内容对齐审查通过后，在 Artist 生图前，先对所有 draft 进行学术润色。

**Leader 先判断论文语言**：
- 英文论文 → 使用 `shared/skills/polish_en.md`
- 中文论文 → 使用 `shared/skills/polish_zh.md`

**任务派发方式**：与阶段 4 的写作完全一致——短章节整节发，长章节（Method/Experiments）按子节拆分发，每个任务附上前序子节路径保证连贯。

**短章节示例（Introduction）**：
```bash
curl -s -X POST http://127.0.0.1:18840/hooks/agent \
  -H 'Authorization: Bearer writer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n\n请执行【润色】任务。\n\n★ 润色 skill 路径：<SHARED>/../shared/skills/polish_en.md\n★ 请先读取该 skill 文件，按其要求对以下 section 进行润色\n★ 期刊要求：<期刊名称和格式要求>\n★ 待润色文件：SHARED/drafts/v{N}/section_introduction.tex\n★ 润色后覆盖写入同一文件（在同版本目录内修改）\n\n润色完成后回报，注明修改了哪些方面。","name":"润色 Introduction","sessionKey":"hook:polish-intro"}'
```

**长章节子节示例（Method 3.2）**：
```bash
curl ... -d '{"message":"当前项目：<SHARED绝对路径>\n\n请执行【润色】任务。\n\n★ 润色 skill：<skills>/polish_en.md\n★ 待润色：SHARED/drafts/v{N}/section_method_3.2.tex\n★ 前序子节（参考衔接）：SHARED/drafts/v{N}/section_method_3.1.tex\n★ 润色后覆盖写入同一文件\n\n确保润色后与前序子节的术语、符号、行文风格保持一致。","name":"润色 Method 3.2","sessionKey":"hook:polish-method-3.2"}'
```

**派发顺序**：Introduction → Related Work → Method 3.1 → 3.2 → ... → Experiments 4.1 → ... → Conclusion
**每个任务等完成后再发下一个**（与阶段 4 相同的逐个派发原则）。

---

### 阶段 4.7：Writer 去除AI痕迹（逐 section/subsection）🆕 v1.6

润色完成后，再做一轮去除 AI 生成痕迹的改写。

**Leader 判断语言**：
- 英文 → `shared/skills/deai_en.md`
- 中文 → `shared/skills/deai_zh.md`

**任务派发方式**：与阶段 4.6 完全一致——逐 section/subsection 发送。

**示例**：
```bash
curl -s -X POST http://127.0.0.1:18840/hooks/agent \
  -H 'Authorization: Bearer writer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n\n请执行【去除AI痕迹】任务。\n\n★ 去AI skill 路径：<skills>/deai_en.md\n★ 请先读取该 skill 文件，按其要求改写以下 section\n★ 待改写文件：SHARED/drafts/v{N}/section_introduction.tex\n★ 改写后覆盖写入同一文件\n\n改写完成后回报，注明主要替换了哪些 AI 典型用词。","name":"去AI Introduction","sessionKey":"hook:deai-intro"}'
```

**派发顺序**：与阶段 4.6 相同。

**⚠️ 注意**：阶段 4.6 和 4.7 的修改都在 drafts/v{N}/ 同一版本目录内覆盖写入（润色和去AI是在已有内容上优化，不是产出新版本）。如果阶段 4.5a 有过返工，则在最新版的 drafts/v{M}/ 上操作。


### 阶段 4.8：Artist 生图/表/数据图

```bash
curl -s -X POST http://127.0.0.1:18860/hooks/agent \
  -H 'Authorization: Bearer artist-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"请执行阶段4.5b全部工作：\n\n【工作1】扩充概念图Prompt\n- 简略版：SHARED/outline/v{N}/artist_prompts.md\n- Writer文本：SHARED/drafts/v{N}/\n- 风格范例：SHARED/../STANDARD_CONCEPT_PROMPT_EXAMPLE.md\n- 保存到：SHARED/figures/detailed_concept_prompts.md\n\n【工作2】生成LaTeX表格\n- 规格：SHARED/outline/v{N}/tables_spec.md\n- 保存到：SHARED/figures/table_*.tex\n\n【工作3】生成matplotlib数据图\n- 规格：SHARED/outline/v{N}/data_plots_spec.md\n- 保存到：SHARED/figures/plot_*.png","name":"阶段4.5b","sessionKey":"hook:artist-4.5b"}'
```

**Artist 回报后，Leader 的动作：**
1. 确认 `figures/detailed_concept_prompts.md` 已生成
2. **通知用户**：概念图 Prompt 已准备好，请手动用 Gemini 生成图片并放到 `figures/`
3. **等待用户通知**完成
4. 确认所有图片齐全后进入阶段 5

### 阶段 5：Editor 整合 LaTeX（写入 final/v1/）

```bash
mkdir -p SHARED/final/v1
```

```bash
curl -s -X POST http://127.0.0.1:18870/hooks/agent \
  -H 'Authorization: Bearer editor-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"整合 LaTeX 论文。\n\n来源：SHARED/drafts/v{N}/\n图表：SHARED/figures/\n模板：SHARED/template/\n范例论文：SHARED/examples/\n\n★ 输出到 SHARED/final/v1/paper.tex 和 references.bib","name":"整合 LaTeX v1","sessionKey":"hook:editor-v1"}'
```

### 阶段 6：Checker LaTeX 审查修复

```bash
curl -s -X POST http://127.0.0.1:18880/hooks/agent \
  -H 'Authorization: Bearer checker-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"请执行【LaTeX审查】。\n\n审查：SHARED/final/v1/paper.tex\n参考文献：SHARED/final/v1/references.bib\n图片：SHARED/figures/\n黄金标准：SHARED/golden_standard.json\n\n★ 修复后写入 SHARED/final/v2/（先 cp v1/* → v2/，再修改）\n输出报告：SHARED/reviews/latex_check_report_v1.md","name":"LaTeX审查 v1","sessionKey":"hook:latex-check-v1"}'
```

PASS → 阶段 7 ｜ FAIL → 循环修复，最多 3 轮

### 阶段 7：Reviewer 最终对齐审查

审查 final/ 最新版，对标 golden_standard.json。
不通过 → 协调修改 → 新版本

### 阶段 7.5：Reviewer 逻辑检查（整篇论文）🆕 v1.6

最终对齐审查通过后，对整篇论文做逻辑严谨性检查。

```bash
curl -s -X POST http://127.0.0.1:18850/hooks/agent \
  -H 'Authorization: Bearer reviewer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n\n请执行【逻辑检查】。\n\n★ 逻辑检查 skill：<skills>/logic_check.md\n★ 请先读取该 skill 文件\n★ 评审标准：对标目标期刊 <期刊名称> 的学术水平\n★ 待审论文：SHARED/final/v{N}/paper.tex\n\n输出到 SHARED/reviews/logic_check_v{N}.md\n\n结论格式：ACCEPT（无严重逻辑问题）/ REVISE（列出具体问题和修改要求）","name":"逻辑检查","sessionKey":"hook:logic-check-v{N}"}'
```

**判定**：
- **ACCEPT** → 进入阶段 7.6
- **REVISE** → Leader 读取报告，将具体修改要求派发给 Writer（修改 drafts/v{M+1}/）→ 重新走 Editor(5) → Checker(6) → Reviewer(7) → 再做逻辑检查
- 最多 2 轮

---

### 阶段 7.6：Reviewer 缩写检查（整篇论文）🆕 v1.6

逻辑检查通过后，检查全文缩写使用规范性。

```bash
curl -s -X POST http://127.0.0.1:18850/hooks/agent \
  -H 'Authorization: Bearer reviewer-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n\n请执行【缩写检查】。\n\n★ 缩写检查 skill：<skills>/abbrev_check.md\n★ 请先读取该 skill 文件\n★ 待审论文：SHARED/final/v{N}/paper.tex\n\n输出到 SHARED/reviews/abbrev_check_v{N}.md\n\n结论格式：ACCEPT / REVISE","name":"缩写检查","sessionKey":"hook:abbrev-check-v{N}"}'
```

**判定**：
- **ACCEPT** → 进入阶段 8（编译 PDF）
- **REVISE** → Leader 将缩写修复任务派给 Writer 或 Leader 自行修复（缩写修复通常很小）→ 重新编译验证
- 最多 2 轮


### 阶段 8：Leader 编译 PDF → 通知用户

### 阶段 9：用户/专家审查

```
📋 论文 PDF 已生成：SHARED/final/v{N}/paper.pdf

请审查或邀请专家审查。完成后请提供：
1. 总体评价（Accept / Minor Revision / Major Revision）
2. 逐条修改意见
```

用户提供意见后：
1. 保存到 `SHARED/reviews/user_feedback_round_{R}.md`
2. 整合生成 `SHARED/reviews/todo_list_round_{R}.md`
3. 通知用户确认 todo_list

### 阶段 10：分发修改任务

按 todo_list 中的优先级分发给对应 Agent，高优先级先发。
全部完成后 → 回到阶段 5 重新整合。最多 3 轮 Round。

---

## Mode B 差异流程（v1.5.1 — 基于 Project 6 实战优化）

### 阶段 0B：项目初始化与材料收集

**0B.0 询问模式（铁律！）**
每个新项目**必须**先询问用户选择 Mode A 还是 Mode B。

**0B.1 创建项目目录**
```bash
PROJECT_NUM=<下一个编号>
SHARED="/home/liaowenjie/.openclaw-multi/shared/paper-project-${PROJECT_NUM}"
mkdir -p "$SHARED"/{template,examples,references,ideas,outline,drafts,figures,reviews,final,user_materials/{code,results}}
```
将 SHARED 路径记录到 `SHARED/project_config.md`。
**后续所有 curl 任务的路径必须使用此绝对路径。**

**0B.2 要求用户提供**：
- 研究主题 + 期刊名称
- LaTeX 模板 → `SHARED/template/`
- 2 篇范例 PDF → `SHARED/examples/`
- method 描述（必须）→ `SHARED/user_materials/method_description.md`
- 代码（可选）→ `SHARED/user_materials/code/`
- 实验结果（必须）→ `SHARED/user_materials/results/`
  可接受格式：图片文件/文件夹、CSV、Word 表格、文本描述
- 简要 plan（可选）

**0B.3 MinerU 解析范例论文**

**0B.4 Leader 分析材料**：
- 读取用户全部材料
- 生成 `SHARED/user_materials/materials_summary.md`（< 5KB）

**0B.5 整理 selected_idea.md**：
将用户 method 描述转化为标准 idea 格式，写入 `SHARED/ideas/selected_idea.md`

### 阶段 0.5B：提取黄金标准 + 图片预处理

**与 Mode A 相同**：提取 `golden_standard.json` + 初始化 `version_tracker.json`（mode: "B"）

**★ 新增：图片预处理**

检查 `SHARED/user_materials/results/` 下的图片结构：
- 如果存在子图文件夹（如 `figure1/` 下包含 `fig1_1.png, fig1_2.png`）
- 用 Python PIL 脚本将每个文件夹的子图拼接为单张图片
- 保存到 `SHARED/figures/combined_figN.png`
- 同时记录子图映射关系到 `SHARED/figures/subfigure_manifest.json`：
  ```json
  {
    "figure4": {
      "combined": "figures/combined_fig4.png",
      "subfigures": ["fig4_1.png", "fig4_2.png", "fig4_3.png"],
      "captions": ["(a) Training loss", "(b) Validation accuracy", "(c) Confusion matrix"],
      "layout": "1x3"
    }
  }
  ```

**拼接脚本模板**：
```python
from PIL import Image
import os, json

results_dir = "SHARED/user_materials/results/"
figures_dir = "SHARED/figures/"
manifest = {}

for folder in sorted(os.listdir(results_dir)):
    folder_path = os.path.join(results_dir, folder)
    if not os.path.isdir(folder_path):
        continue
    imgs = sorted([f for f in os.listdir(folder_path) if f.endswith(('.png','.jpg','.jpeg'))])
    if not imgs:
        continue
    images = [Image.open(os.path.join(folder_path, f)) for f in imgs]
    # 横向拼接
    total_w = sum(im.width for im in images)
    max_h = max(im.height for im in images)
    combined = Image.new('RGB', (total_w, max_h), (255,255,255))
    x = 0
    for im in images:
        combined.paste(im, (x, 0))
        x += im.width
    out_path = os.path.join(figures_dir, f"combined_{folder}.png")
    combined.save(out_path, dpi=(300,300))
    manifest[folder] = {
        "combined": out_path,
        "subfigures": imgs,
        "layout": f"1x{len(imgs)}"
    }

with open(os.path.join(figures_dir, "subfigure_manifest.json"), "w") as f:
    json.dump(manifest, f, indent=2)
```

### 阶段 1B：Surveyor 聚焦调研

```bash
curl -s -X POST http://127.0.0.1:18810/hooks/agent \
  -H 'Authorization: Bearer surveyor-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n以下 SHARED = 上述路径\n\n文献检索（Mode B：聚焦 related work）。\n\n主题：<TOPIC>\n用户方法摘要：SHARED/user_materials/materials_summary.md\n范例论文：SHARED/examples/\n\n重点检索：\n1. 与用户方法最相关的已有工作\n2. 用户方法所基于/改进的基础方法\n3. 同领域的竞争方法（baseline）\n4. 用户数据集/指标的原始论文\n\n输出到 SHARED/references/","name":"文献检索-ModeB","sessionKey":"hook:survey-b1"}'
```

### 阶段 1.5B：精简调研报告（与 Mode A 相同）

### 阶段 2B：跳过 Ideator

Leader 直接将用户 method 描述整理为 `SHARED/ideas/selected_idea.md`（已在 0B.5 完成）。

### 阶段 3B：Architect 设计框架

与 Mode A 相同，但 curl message 中**额外附上**：
- `SHARED/user_materials/materials_summary.md`
- `SHARED/user_materials/code/`（如有）
- `SHARED/user_materials/results/`
- `SHARED/figures/subfigure_manifest.json`（如有）

Architect 需要：
- Method 子节结构基于用户真实方法
- Experiments 子节基于用户真实结果
- figures_plan.md 中**引用用户已有的数据图和表格**（不需要生成新的）
- artist_prompts.md 只规划**概念图**（数据图已由用户提供）

### 阶段 3.5B：框架对齐审查

**★ 必须派 Reviewer 审查，不得由 Leader 自审！**

与 Mode A 完全相同：Reviewer 对标 golden_standard.json，不通过则打回 Architect。

### 阶段 4B：Writer 逐节撰写

**Method Section**（核心差异）：
- Leader 在 curl 中附上 `user_materials/method_description.md` + `code/` 路径
- Writer 必须基于用户描述和代码，不得自行发挥
- 可补充数学公式、算法伪代码

**Experiments Section**（核心差异）：
- Leader 在 curl 中附上 `user_materials/results/` 路径
- Writer 基于真实数据撰写分析，绝不编造
- 引用图表时使用 Architect 在 figures_plan.md 中规划的编号

**其他 Section**：与 Mode A 相同

**最后一步：references.bib**：
- 与 Mode A 相同（Writer 扫描 \cite → web_search 验证 → 生成 .bib）
- ★ 引用数量目标设为**黄金标准中位数**（不是下限）

### 阶段 4.5B：内容对齐审查, 

**★ 必须派 Reviewer 审查，不得由 Leader 自审！**

与 Mode A 完全相同。

### 阶段 4.6B：Writer 润色（逐 section/subsection）

与 Mode A 完全相同。

### 阶段 4.7B  ★ Writer 去除AI痕迹（逐 section/subsection）

与 Mode A 完全相同。

### 阶段 4.8B：Artist 处理图表（★ 与 Mode A 完全不同！）

**Mode B 下 Artist 的三项工作：**

```bash
curl -s -X POST http://127.0.0.1:18860/hooks/agent \
  -H 'Authorization: Bearer artist-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"当前项目：<SHARED绝对路径>\n以下 SHARED = 上述路径\n\n阶段4.5b（Mode B）：\n\n【工作1】扩充概念图 Prompt（与 Mode A 相同）\n- 简略版：SHARED/outline/v{N}/artist_prompts.md\n- Writer文本：SHARED/drafts/v{N}/\n- 风格范例：<STANDARD_CONCEPT_PROMPT路径>\n- 保存到：SHARED/figures/detailed_concept_prompts.md\n\n【工作2】提取并整理用户数据图（★ Mode B 专属）\n- 用户图片来源：SHARED/user_materials/results/\n- 子图映射：SHARED/figures/subfigure_manifest.json（如有）\n- 任务：\n  a. 遍历 results/ 下所有图片文件和子图文件夹\n  b. 将所有图片复制到 SHARED/figures/（保留有意义的文件名）\n  c. 对于子图文件夹：保留各子图独立文件（fig4_a.png, fig4_b.png...）\n  d. 生成 SHARED/figures/data_figures_manifest.md，记录每张图的：编号、文件名、是否含子图、子图数量、建议 caption\n\n【工作3】提取并转换用户表格为 LaTeX（★ Mode B 专属）\n- 用户表格来源：SHARED/user_materials/results/（可能是 CSV/Word/图片/文本）\n- 任务：\n  a. 识别所有表格文件（.csv, .docx, .xlsx, .png 中的表格）\n  b. 将每张表格转换为 LaTeX 代码（booktabs 格式）\n  c. 保存到 SHARED/figures/table_N.tex\n  d. 对于 Word/Excel 表格：读取内容，转为 LaTeX tabular\n  e. 对于图片表格：OCR 识别后转为 LaTeX（如无法识别则标注需用户补充）\n  f. 每张表必须包含 \\caption{} + \\label{tab:xxx}\n\n全部完成后回报。","name":"Artist-ModeB-4.5b","sessionKey":"hook:artist-b-4.5b"}'
```

**Artist 回报后，Leader 动作：**
1. 确认 `figures/detailed_concept_prompts.md` 已生成
2. 确认 `figures/data_figures_manifest.md` 已生成
3. 确认 `figures/table_*.tex` 已生成
4. **通知用户**：概念图 Prompt 已准备好，请手动用 Gemini 生成
5. 等待用户通知概念图完成
6. 确认所有图表齐全后进入阶段 5

### 阶段 5B：Editor 整合 LaTeX

**★ 必须派 Editor 执行，不得由 Leader 代理！**

curl message 中**额外附上**：
- `SHARED/figures/data_figures_manifest.md`（数据图清单）
- `SHARED/figures/subfigure_manifest.json`（子图映射）

**Editor 特殊要求（Mode B）**：
- 数据图插入时，如果有子图，必须使用 `subfigure` 或 `subcaption` 环境：
  ```latex
  \begin{figure*}[t]
    \centering
    \begin{subfigure}[b]{0.32\textwidth}
      \includegraphics[width=\textwidth]{figures/fig4_a.png}
      \caption{Training loss}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.32\textwidth}
      \includegraphics[width=\textwidth]{figures/fig4_b.png}
      \caption{Validation accuracy}
    \end{subfigure}
    \caption{Experimental results of ...}
    \label{fig:exp_results}
  \end{figure*}
  ```
- **每个图必须有 figure/figure* 环境 + \label + \caption**（三件套）
- **每个 \label 必须在正文中有对应的 \ref**
- 表格直接 \input{figures/table_N.tex}

如果 Editor 故障：清理 → 重试 → 3 次失败 → **通知用户**（不得 Leader 代理）

### 阶段 6B~10B：与 Mode A 完全相同

**关键提醒**：
- 阶段 6 Checker **必须执行**，不是可选
- 阶段 7 Reviewer **必须执行**，不得跳过
- 任何 Agent 故障 → 清理重试 → 3 次失败 → 通知用户
- Leader 编译 PDF 后，**自行做一轮快速验证**再发给用户：
  - 检查 PDF 页数是否合理
  - 检查图片是否都显示（不是空白框）
  - 检查引用格式是否正确（[1] 数字格式）
  - 检查表格是否渲染正确

