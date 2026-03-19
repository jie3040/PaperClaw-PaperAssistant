# Self-Improvement Learnings - Writer

## [LRN-20260310-001] best_practice

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: critical
**Status**: pending

### Summary
撰写前必须阅读范例论文，参考其写作风格、段落结构、引用密度

### Details
第一篇论文中，Writer 未参考任何范例，写作风格与 IEEE TIM 标准存在差距。
用户反馈 PDF 问题很多，部分原因是写作质量不符合期刊规范。
v2工作流要求：Leader 发任务时附上范例论文 Markdown 路径，Writer 必须阅读并模仿。

### Suggested Action
已在 SOUL.md 中添加"必须参考范例论文"要求

### Metadata
- Source: user_feedback
- Tags: writing_style, examples, quality

---

## [ERR-20260310-001] api_error

**Logged**: 2026-03-10T21:20:00+08:00
**Priority**: medium
**Status**: resolved

### Summary
Section III (Method) 因 API rate limit 失败多次，耗时33分钟

### Details
14:16首次发任务，14:38重试，14:46再次重试，14:49才完成。
策略：遇到 rate limit 等待10分钟后重试。

### Resolution
- **Resolved**: 2026-03-10T14:49:00+08:00
- **Notes**: 记录了rate limit等待策略

### Metadata
- Source: error
- Tags: rate_limit, api, retry

---
