# 内容对齐审查报告（R3 — 修复后复审）

## 审查结论：REVISE

## 逐项对标结果

| 维度 | 黄金标准 | 当前草稿 | 判定 | 说明 |
|------|---------|---------|------|------|
| Section 完整性 | 6个section（Abstract~Conclusion） | 6个section全部对应 | ✅ | abstract.tex, introduction.tex, background.tex, method.tex, experiments.tex, conclusion.tex 均存在 |
| Abstract 字数 | 170-210 | 198 | ✅ | |
| Introduction 字数 | 1200-1500 | 1314 | ✅ | |
| Background 字数 | 1000-1300 | 1158 | ✅ | |
| Method 字数 | 1400-1900 | 1842 | ✅ | |
| Experiments 字数 | 2300-3000 | 2166 | ❌ | 偏差 18.3%，低于 2300 下限，差 134 词 |
| Conclusion 字数 | 150-250 | 175 | ✅ | |
| Total Body 字数 | 6500-8000 | 6655 | ✅ | |
| References 数量 | 30-45 | 38 | ✅ | R3 已修复：52→38 |
| Intro 引用占比 | ≥50% 总引用 | 25/38 = 65.8% | ✅ | |
| 公式数量 | 8-15 | 9（bg:3, method:6） | ✅ | |
| 图表引用完整性 | outline 列出的 Fig/Tab 均应在正文被引用 | 所有 12 个 ref 调用无对应 label 定义 | ❌ | 详见下方 |
| 实验完整性 | 数据集、基线、指标、主实验、消融 | 2数据集✅ 5基线✅ 指标✅ 主实验✅ 消融✅ 可视化✅ | ✅ | |
| IEEEkeywords | abstract.tex 中包含 | 7个术语，已修复 | ✅ | R3 已修复 |
| bib 清理 | 仅保留正文引用 | 38条 bib = 38 条引用 | ✅ | R3 已修复 |

## ❌ 不通过项的具体修改要求

### 1. Experiments 字数不足（2166 / 目标 ≥2300）
- **偏差**：134 词（-18.3%）
- **修改要求**：扩充 experiments.tex 至少 2300 词（+134 词）。建议在以下位置扩充：
  - **4.3 Zero-Shot Recognition Performance**：为 Table 中每个基线方法增加 1-2 句具体的失败原因分析（当前仅对部分方法有分析）
  - **4.5 Parameter Sensitivity**：当前仅约 200 词，可补充不同 batch size 或 learning rate 的消融讨论（+80 词）
  - **4.6 Visual Analysis**：可增加对 confusion matrix 中具体误分类模式的讨论（+60 词）

### 2. 所有 Figure/Table 缺少 \label 定义，导致 \ref 全部悬空
- **当前状态**：正文中有 12 处 `\ref{fig:*}` 和 `\ref{tab:*}` 调用，但所有 draft 文件中均无对应的 `\label` 定义。
- **涉及引用**：fig:concept, fig:transformer, fig:framework, tab:llm_semantics, tab:comparison, tab:ablation, fig:accuracy_bar, fig:sensitivity, fig:snr_curve, fig:tsne, fig:attn_map
- **修改要求**：在 experiments.tex（和其他文件）中对应的 figure/table 环境内添加正确的 `\label{}`。预计这些 figure/table 环境（或 float placeholder）需要在最终 .tex 汇编时定义。**但如果当前 drafts 阶段确实缺少 figure/table 的 float 环境（仅有文字引用而无 `\begin{figure}` / `\begin{table}`），则需补全。**
- **量化**：11 处 label 缺失，必须全部补齐。

## ✅ 上轮修复确认
1. **bib 清理**：38 条 bib 条目 = 38 条唯一引用 ✅
2. **Eq.8/Eq.9 问题**：background 3 个 + method 6 个 = 共 9 个公式，experiments.tex 引用 "Eq.9"（零样本分类函数），编号连续 ✅
3. **IEEEkeywords**：abstract.tex 中 `\begin{IEEEkeywords}` 包含 7 个术语 ✅
