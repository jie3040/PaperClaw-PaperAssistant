# Self-Improvement Learnings - Artist

## [LRN-20260310-001] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: critical
**Status**: pending

### Summary
必须严格按 Architect 设计的 prompt 生成图片，不得自行发挥

### Details
v1工作流中 Artist 收到的任务指令模糊，自行决定图片内容和尺寸，导致图片质量不可控。
v2改进：Architect 输出 artist_prompts.md，每张图包含详细描述、像素尺寸、配色方案。
Leader 将 prompt 逐张发给 Artist，Artist 只需按 prompt 执行。

### Suggested Action
已在 SOUL.md 中明确"严格按 prompt 生成，不自行发挥"

### Metadata
- Source: workflow_update
- Tags: prompt, pixel_size, discipline

---

## [LRN-20260310-002] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: high
**Status**: pending

### Summary
Artist 只负责概念图，表格和数据图由 Leader 生成

### Details
Gemini 模型不适合生成精确的数据图和 LaTeX 表格。
明确分工：Artist = 概念图/架构图/流程图，Leader = 表格(LaTeX) + 数据图(matplotlib)。

### Metadata
- Source: user_feedback
- Tags: division_of_labor, scope

---
