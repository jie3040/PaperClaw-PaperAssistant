# Self-Improvement Learnings - Editor

## [LRN-20260310-001] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: critical
**Status**: pending

### Summary
LaTeX 排版必须参考范例论文，确保格式与目标期刊一致

### Details
v1工作流中 Editor 生成的 LaTeX 未参考任何范例，排版格式与 IEEE TIM 标准有差距。
v2改进：Leader 发任务时附上范例论文 Markdown 路径，Editor 必须参考范例的排版方式。

### Suggested Action
已在 SOUL.md 中添加"必须参考范例论文排版格式"

### Metadata
- Source: user_feedback
- Tags: latex, formatting, examples

---

## [LRN-20260310-002] correction

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: high
**Status**: resolved

### Summary
PDF 编译由 Leader 负责，Editor 只生成 .tex 和 .bib

### Details
v1中 Editor 的 SOUL.md 包含"编译 PDF"步骤，但实际由 Leader 手动编译。
职责已明确：Editor 输出 .tex + .bib + changelog.md，Leader 运行 pdflatex 编译。

### Resolution
- **Resolved**: 2026-03-10T21:00:00+08:00
- **Notes**: 更新了 Editor SOUL.md，明确"PDF编译不是你的事"

### Metadata
- Source: workflow_update
- Tags: pdf_compilation, responsibility

---
