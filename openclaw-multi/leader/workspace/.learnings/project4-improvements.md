# Project 4 改进总结 — CESM-Diff (2026-03-18)

## 项目概况
- **主题**：CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis
- **期刊**：IEEE TIM
- **结果**：17页, 47条引用, 8图3表, 用户 ACCEPT ✅
- **版本迭代**：drafts v1→v7, final v1→v5, outline v1→v4

---

## v8 工作流新增流程

### 1. 严格版本管理制度
- **新增**：version_tracker.json 追踪所有版本变更
- **规则**：每次审查返工写入新版本目录（v{N+1}），绝不覆盖旧版本
- **效果**：可追溯、可回滚，避免 P3 的覆盖混乱问题

### 2. 黄金标准对齐审查（阶段 3.5 + 4.5a）
- **新增**：Reviewer 在框架设计后和内容撰写后分别进行对齐审查
- **依据**：golden_standard.json（从范例论文提取的量化指标）
- **效果**：提前发现字数/结构/引用偏差，避免最终审查时大量返工

### 3. 逐 Subsection 派发 Writer
- **新增**：长章节（Method/Experiments）按子节拆分，每个子节一个任务
- **关键**：每个任务附上已完成的前序子节路径，确保衔接
- **效果**：避免 Writer 一次性处理太多内容导致质量下降或超时

### 4. 4.5b 工作流完整化
- **新增**：Artist 生成概念图 prompt → 通知用户 → 用户用 Gemini 手动生图 → Artist 生数据图/表 → Leader 检查完整性
- **触发原因**：P4 早期跳过了用户手动生图环节，导致整个 4.5b 重做
- **规则写入**：Leader SOUL.md 和 Artist SOUL.md

### 5. 用户审查循环（阶段 9-10）
- **新增**：完整的 用户审查 → todo_list → 分发修改 → 新版本 → 重进编译循环
- **P4 实践**：经历 2 轮用户审查（Major → Minor → Accept）
- **限制**：每轮最多 3 轮修改

### 6. Introduction 引用规则
- **新增规则**：Introduction 的引用数 ≥ 总 references 的 50%
- **P4 实践**：从 10 个引用扩充到 31 个（占 47 条总引用的 66%）
- **用户明确要求**，需写入 Writer 和 Leader SOUL

---

## 遇到的问题与修正

### 问题 1：Reviewer 反复 terminated（503 错误）
- **原因**：56 个历史 session 导致 sessions.json 膨胀到 744KB → API token pool 耗尽
- **修正**：清理 sessions.json 中所有 hook: 条目 + 切换 API 平台
- **预防**：定期检查 sessions.json 大小，超过 100KB 就清理

### 问题 2：概念图工作流被跳过
- **原因**：Leader 直接让 Artist 生成所有图片，跳过了用户手动用 Gemini 生成概念图的环节
- **修正**：回滚到 4.5a 重做，在 Leader 和 Artist SOUL.md 中添加工作流完整性规则
- **预防**：SOUL.md 中明确标注"禁止跳过"和"禁止在用户未通知完成的情况下进入下一阶段"

### 问题 3：Writer 字数控制不精确
- **现象**：要求缩减 Experiments 2000 词，Writer 多次修改后仍然没变化
- **修正**：Leader 手动精简（直接重写精简版 section_experiments.tex）
- **教训**：Writer（Gemini Flash）对"缩减"指令执行力弱，涉及大幅度字数调整时 Leader 直接处理更高效

### 问题 4：section 文件中无图表环境
- **现象**：所有 section_*.tex 文件中没有 \begin{figure} 或 \begin{table}，导致 PDF 中图表缺失
- **修正**：Leader 手动在 paper.tex 中添加所有 figure/table 环境，引用正确的 .png 文件和表格数据
- **教训**：Editor/Writer 生成的 section 文件通常不包含图表环境，需要 Leader 在整合阶段手动添加

### 问题 5：Abstract 太短 & Conclusion 太长
- **现象**：Abstract 129 词（范例均值 ~220 词），Conclusion 470 词（范例 ~200 词）
- **修正**：Leader 手动扩充 Abstract（→258词）和缩减 Conclusion（→166词）
- **教训**：用户审查会关注 Abstract/Conclusion 与范例的对齐度，后续流程中应在黄金标准中加入这两个维度

### 问题 6：Introduction 引用占比太低
- **现象**：47 条总引用中 Introduction 仅 10 条（21%）
- **修正**：派 Writer 为 Introduction 大量补充引用（→31 条，66%）
- **新规则**：Introduction 引用 ≥ 总引用 50%

---

## 关键经验

1. **Leader 应急接管能力是核心竞争力** — P4 中 Leader 手动处理了字数精简、图表整合、Abstract/Conclusion 调整，这些都是 Agent 无法精确完成的任务
2. **版本管理是质量保证的基础** — v1→v7 的完整追踪让每次修改可验证、可回滚
3. **逐 subsection 派发效果显著** — 质量远高于一次性派发整个章节
4. **用户审查循环是必要的** — 自动审查（Reviewer）无法完全替代人类判断，用户反馈指出的问题（引用分布、Abstract 长度）是 Reviewer 没有检测到的
5. **黄金标准需要持续完善** — P4 暴露了 golden_standard.json 中缺少 Abstract/Conclusion 字数维度的问题
