# Self-Improvement Learnings — Project 8 (2026-03-29)

## [CRITICAL] 跳过流程阶段
- **Category**: correction
- **Date**: 2026-03-29
- **Context**: Project 8 开始时，Leader 跳过了 4.6（润色）、4.7（去AI）、4.8（Artist 图表）、7.5（逻辑检查）、7.6（缩写检查），直接从 4.5 跳到了 5→6→7→8
- **User Feedback**: 用户发现后严厉批评，要求从 4.5 重新开始
- **Root Cause**: Leader 没有严格按照 WORKFLOW.md 的阶段顺序执行，自作主张跳过了"看起来不重要"的阶段
- **Fix**: **必须严格按照 WORKFLOW.md 的每一个阶段顺序执行，不得跳过任何阶段，不得自行判断哪些阶段"不重要"**
- **Priority**: P0 — 这是最严重的流程违规

## [CRITICAL] 并行 session 竞争覆盖
- **Category**: best_practice
- **Date**: 2026-03-29
- **Context**: Leader 的 cron 回调（Agent 回报时触发）会创建新的 Leader session，每个 session 独立推进流程，互相覆盖文件
- **Impact**: 修好的 table_*.tex 被并行 session 覆盖回旧版，导致反复修复同一问题（v8→v13 共 6 个版本）
- **Fix**: 派任务前清理所有 Agent + Leader 的 hook session 并重启，确保单线程推进
- **Priority**: P0

## [HIGH] Mode A 正文与表格数据不一致
- **Category**: best_practice
- **Date**: 2026-03-29
- **Context**: Mode A 下 Writer 写正文时编造一组假数据，Artist 生成表格时编造另一组假数据，两者完全不一致
- **Impact**: 逻辑检查发现 10+ 处矛盾（样本数差 3 倍、超参数差 10 倍、消融实验数值完全不同）
- **Fix**: Leader 在阶段 5（Editor 整合）前，必须以正文为基准统一所有 table_*.tex 的数据
- **Priority**: P1

## [HIGH] Editor 截短 section 内容
- **Category**: best_practice
- **Date**: 2026-03-29
- **Context**: Editor 整合 paper.tex 时把 Background 从 1126 词截短到 743 词（-34%）
- **Fix**: Editor 整合后 Leader 对比每个 section 的词数（draft vs paper.tex），截短 >10% 则用完整 draft 替换

## [MEDIUM] 缩写首次使用未展开
- **Category**: knowledge_gap
- **Date**: 2026-03-29
- **Context**: GPT、WDCNN、Bi-LSTM-ZSL、1D-ResNet 首次出现时未给出全称
- **Fix**: 7.6 缩写检查门不可跳过

## [MEDIUM] Intro 词数控制
- **Category**: correction
- **Date**: 2026-03-29
- **Context**: Introduction 1246 词，用户审查时认为太长
- **Fix**: Intro 控制在 ~900 词，不超过 1000
