# Self-Improvement Learnings - Leader (Alex)

## [LRN-20260310-001] best_practice

**Logged**: 2026-03-10T21:18:00+08:00
**Priority**: critical
**Status**: resolved

### Summary
论文写作流程缺少范例论文参考，导致所有 agent 产出质量低于期刊标准

### Details
第一篇论文（CD-LDM for IEEE TIM）全流程跑通，但用户反馈 PDF "问题很多"。根本原因：
- Writer 无范例参考，写作风格不符合 IEEE TIM 标准
- Artist 无详细 prompt，图片质量随机
- Editor 无排版范例，LaTeX 格式不达标
- Reviewer 无质量基准，审查标准模糊

### Suggested Action
已实施 v2 工作流：阶段0收集2篇范例PDF → MinerU解析 → 全agent参考

### Resolution
- **Resolved**: 2026-03-10T21:00:00+08:00
- **Notes**: 更新了全部8个配置文件（WORKFLOW.md + 7个agent SOUL.md）

### Metadata
- Source: user_feedback
- Tags: workflow, quality, examples
- Status: promoted

---

## [LRN-20260310-002] best_practice

**Logged**: 2026-03-10T21:18:00+08:00
**Priority**: high
**Status**: resolved

### Summary
Architect 应负责生成 Artist 的详细 prompt（含像素尺寸），而非让 Artist 自行发挥

### Details
第一篇论文中，Artist (Gemini) 收到的指令过于笼统，生成的图片质量不可控。
改进：Architect 输出 artist_prompts.md，包含每张图的详细 prompt、像素尺寸、配色方案。
Leader 负责将 prompt 逐张喂给 Artist。

### Suggested Action
已在 Architect SOUL.md 添加 artist_prompts.md 输出要求

### Resolution
- **Resolved**: 2026-03-10T21:00:00+08:00

### Metadata
- Source: user_feedback
- Tags: architect, artist, prompt, figures

---

## [LRN-20260310-003] best_practice

**Logged**: 2026-03-10T21:18:00+08:00
**Priority**: high
**Status**: resolved

### Summary
表格(LaTeX)和数据图(matplotlib)应由 Leader 生成，不是 Artist 的职责

### Details
Artist 使用 Gemini 模型，不适合生成精确的数据图和表格。
分工明确：Artist 只负责概念图/架构图/流程图（按 prompt），Leader 负责表格和数据图。
Architect 输出 tables_spec.md 和 data_plots_spec.md 供 Leader 使用。

### Suggested Action
已更新 SOUL.md 和 WORKFLOW.md

### Resolution
- **Resolved**: 2026-03-10T21:00:00+08:00

### Metadata
- Source: user_feedback
- Tags: division_of_labor, tables, data_plots

---

## [LRN-20260310-004] correction

**Logged**: 2026-03-10T21:18:00+08:00
**Priority**: high
**Status**: resolved

### Summary
MinerU 在 WSL2 无 GPU 环境需要使用 `-b pipeline` 后端

### Details
默认 hybrid 后端需要 GPU（vLLM + CUDA），在 WSL2 环境中 CUDA 驱动加载失败。
需要指定 `-b pipeline` 使用纯 CPU 模式。
命令：`~/MinerU/.venv/bin/mineru -p <pdf> -o <dir> -b pipeline`

### Resolution
- **Resolved**: 2026-03-10T20:16:00+08:00

### Metadata
- Source: error
- Tags: mineru, gpu, wsl2, pipeline

---

## [LRN-20260310-005] best_practice

**Logged**: 2026-03-10T21:18:00+08:00
**Priority**: medium
**Status**: pending

### Summary
Leader 心跳监控延迟导致漏检 Architect 完成状态（延迟1h41m）

### Details
Architect 在 12:13 完成，但 Leader 直到 13:54 才发现。
原因：当时心跳未启用，Leader 在处理其他任务时未主动检查。
已启用5分钟心跳间隔。

### Suggested Action
保持心跳间隔不超过5分钟，且在发出任务后主动轮询

### Metadata
- Source: conversation
- Tags: monitoring, heartbeat, latency

---
