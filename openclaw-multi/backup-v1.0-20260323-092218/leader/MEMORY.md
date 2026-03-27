# MEMORY.md - Alex 的长期记忆

## 身份
- 我是 Alex，论文项目总指挥 📋
- 管理 8 个 AI Agent 协同写论文

## 用户
- 用中文沟通
- 对论文质量要求高，会仔细审查 PDF
- 不喜欢浪费 token（禁用 health check、dashboard）
- 希望流程自动化但保留关键决策权（如选择 idea）

---

## 项目历史

### Project 1（2026-03-10）— CD-LDM, IEEE TIM
- **结果**：PDF 生成但质量不达标
- **核心问题**：无范例参考 → 风格/排版/篇幅不统一
- **教训**：没有标杆就没有质量

### Project 2（2026-03-13）— PC-Diffusion, IEEE TIM
- **结果**：12 页，45 条引用，通过三轮专家审稿 ✅
- **关键成功因素**：范例参考 + 上下文精简 + 多轮审稿 + Leader 应急接管

### Project 3（2026-03-15~16）— CDDM, IEEE TIM
- **结果**：15 页，46 条引用，PDF 编译成功
- **新问题**：Editor 串台（用了 P2 标题）、Writer 扩写反而缩短、概念图 Prompt 过度详细

### Project 4（2026-03-18）— CESM-Diff, IEEE TIM ✅
- **主题**：CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis
- **结果**：17 页，47 条引用（31条在 Intro），8 张图，3 个表格，用户 ACCEPT ✅
- **关键成功因素**：
  - v8 版本管理（drafts v1→v7, final v1→v5）
  - 黄金标准对齐审查（阶段 3.5 + 4.5a + 7）
  - 逐 subsection 派发 Writer（Method 3.1-3.8, Experiments 4.1-4.4）
  - Leader 手动精简 Experiments（Writer 无法缩减）
  - Leader 手动添加图表到 paper.tex（section 文件无 figure/table 环境）
  - 两轮用户审查（Major → Minor → Accept）
- **新问题与解决**：
  - Reviewer 56 个历史 session 导致 744KB sessions.json → API 503 → 清理 sessions.json
  - 概念图工作流修正：Artist 生成 prompt → 用户手动用 Gemini 生图 → 不可跳过
  - 引用分布不均：Introduction 引用需占总引用 50%+ → 新增规则写入 SOUL
  - Writer 无法精确控制字数（扩充/缩减偏差大）→ Leader 直接处理关键字数调整

---

## 工作流演进（v1 → v8）

### v1-v7（见 Project 1-3 教训）
（略，详见 .learnings/ 目录）

### v8（Project 4，当前最新版）— 完整版本管理 + 用户审查循环
- **+ 严格版本管理**：outline/v1-v4, drafts/v1-v7, final/v1-v5，version_tracker.json 追踪
- **+ 阶段 3.5**：Reviewer 框架对齐审查（黄金标准 vs outline）
- **+ 阶段 4.5a**：Reviewer 内容对齐审查（字数/引用/完整性）
- **+ 阶段 4.5b 工作流完整化**：Artist 生 prompt → 用户手动 Gemini 生图 → Artist 生数据图/表 → Leader 检查完整性
- **+ 逐 subsection 派发 Writer**：长章节（Method/Experiments）按子节拆分，每个一个任务，附前序子节确保衔接
- **+ 阶段 9-10**：用户/专家审查 → Leader 生成 todo_list → 分发修改 → 新版本 → 重进 5→6→7→8 循环
- **+ Introduction 引用规则**：Introduction 引用数 ≥ 总 references 的 50%
- **+ Leader 手动字数调整**：Writer 无法精确缩减/扩充时，Leader 直接处理
- **+ Leader 手动图表整合**：section 文件无 figure/table 环境时，Leader 在 paper.tex 中手动添加

---

## 最终工作流全流程（v8）

```
阶段 0    用户提供主题 + 期刊 + 模板 + 2篇范例 PDF → MinerU 解析
阶段 0.5  Leader 提取黄金标准 → golden_standard.json + 初始化 version_tracker.json
阶段 1    Surveyor 文献检索
阶段 1.5  Leader 精简调研报告（<5KB）
阶段 2    Ideator 生成 idea → 用户选定
阶段 3    Architect 设计框架 → outline/v1/
阶段 3.5  ★ Reviewer 框架对齐审查 → 不通过 → Architect 修改 → 再审（最多3轮）
阶段 4    Writer 逐节撰写 → drafts/v1/（长章节按子节拆分）→ 生成 references.bib
阶段 4.5a ★ Reviewer 内容对齐审查 → 不通过 → Writer 修改 → 再审（最多3轮）
阶段 4.5b Artist 生概念图 prompt → 用户手动 Gemini 生图 → Artist 生数据图/表
阶段 5    Editor 整合 LaTeX → final/v{N}/（不可靠时 Leader 接管）
阶段 6    Checker LaTeX 审查修复
阶段 7    Reviewer 最终对齐审查
阶段 8    Leader 编译 PDF → 通知用户
阶段 9    用户/专家审查 → Leader 整合意见生成 todo_list
阶段 10   Leader 分发修改任务 → 新版本 → 回到阶段 5（最多3轮）
```

---

## 四条铁律（血泪总结）

1. **上下文精简是生存法则** — 大文件（>10KB）必须精简后再发给 Agent
2. **任务只发一次** — 重复发送 = 积压 = 全部 terminated = 恶性循环
3. **Leader 是最后的安全网** — Agent 全部故障时，Leader（Claude Opus）直接接管
4. **Introduction 引用 ≥ 总引用 50%** — 用户明确要求，写入 Writer/Leader SOUL

---

## 关键教训汇总

| 问题 | 首次出现 | 解决方案 |
|------|----------|----------|
| 无范例参考 → 质量差 | P1 | 阶段 0 收集范例 + MinerU 解析 |
| 上下文爆炸 → API 超时 | P2 | Leader 精简为 <5KB 摘要 |
| 任务重复发送 → 全部 terminated | P2 | 任务只发一次，发前检查积压 |
| Gateway 重启不清积压 | P2 | 5步清理流程 |
| 概念图质量低 | P2 | Leader 扩充 Prompt（参考标准范例） |
| Gemini 画尺寸标注 | P2 | Prompt 中重复禁止写 px/pt |
| Writer 引用超时 | P2 | Leader 接管引用生成 |
| Agent API 故障 | P2 | Leader 应急接管 |
| Ideator 越权选 idea | P2 | SOUL.md 加禁止规则 |
| 多项目串台 | P3 | 项目上下文管理铁律 |
| Prompt 过度详细（15KB） | P3 | 简化规则，参考 nana banana 范例 |
| Writer 扩写反而缩短 | P3 | Leader 用 Python 做段落级增删 |
| Editor 整合 LaTeX 失败 | P3 | Leader 手动创建 paper.tex |
| Writer 无法读文件路径 | P3 | 任务 message 中内联全文 |
| 字数/引用不对齐 | P3 | 阶段 8.5 Reviewer 最终对齐审查 |
| Reviewer session 积压 → 503 | P4 | 清理 sessions.json + 切换 API |
| 概念图工作流跳过用户 | P4 | SOUL.md 添加 4.5b 工作流完整性规则 |
| section 文件无图表环境 | P4 | Leader 手动在 paper.tex 添加 figure/table |
| Writer 字数控制不精确 | P4 | Leader 直接手动精简/扩充 |
| Intro 引用占比太低 | P4 | 新增规则：Intro 引用 ≥ 总引用 50% |
| Abstract 太短 / Conclusion 太长 | P4 | Leader 手动调整，参考范例论文均值 |

---

## 工具备忘
- MinerU：`~/MinerU/.venv/bin/mineru -p <pdf> -o <dir> -b pipeline`（CPU模式）
- pdflatex：已安装（texlive-latex-base, extra, fonts-recommended, science）
- API rate limit：遇到限流等 10 分钟重试
- Agent 重启需设置环境变量：OPENCLAW_CONFIG_PATH + OPENCLAW_STATE_DIR
- 标准概念图 Prompt 范例：`/home/liaowenjie/.openclaw-multi/shared/STANDARD_CONCEPT_PROMPT_EXAMPLE.md`
- Reviewer API：`claude-proxy/claude-opus-4-6` via `https://www.fucheers.top/v1`
