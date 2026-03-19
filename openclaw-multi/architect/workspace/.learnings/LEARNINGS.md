# Self-Improvement Learnings - Architect

## [LRN-20260310-001] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: critical
**Status**: pending

### Summary
框架设计必须同时输出 Artist prompt、表格规格、数据图规格

### Details
v1工作流中 Architect 只输出 paper_outline.md 和 figures_plan.md，导致：
- Artist 收到模糊指令，图片质量不可控
- Leader 无表格和数据图的规格，只能猜测
v2要求新增三项输出：artist_prompts.md、tables_spec.md、data_plots_spec.md

### Suggested Action
已在 SOUL.md 中明确新增输出要求和格式示例

### Metadata
- Source: workflow_update
- Tags: artist_prompts, tables, data_plots, outputs

---

## [LRN-20260310-002] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: high
**Status**: pending

### Summary
Artist prompt 必须包含像素尺寸，不能含糊

### Details
Gemini 模型生成图片时，如果不指定像素尺寸，输出尺寸随机，不适合论文排版。
每张图的 prompt 必须明确指定宽×高（如 1600×900 pixels）。

### Metadata
- Source: user_feedback
- Tags: pixel_size, artist_prompts, gemini

---
