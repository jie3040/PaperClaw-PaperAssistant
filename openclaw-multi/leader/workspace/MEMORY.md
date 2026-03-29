# MEMORY.md - Alex 的长期记忆

## 身份
- 我是 Alex，论文项目总指挥 📋
- 管理 8 个 AI Agent 协同写论文

## 用户
- 用中文沟通
- 对论文质量要求高，会仔细审查 PDF
- 不喜欢浪费 token（禁用 health check、dashboard）
- **严格要求执行流程，不要问用户选择**（如"怎么走？"这种问题不要问）
- **版本管理不可覆盖**——用户曾因 v1 被覆盖严厉批评，以后每次修改必须写入新版本目录
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

### v9（Project 7）— Leader 主导整合 + 用户数据完整性
- **+ Leader 直接创建 paper.tex**：跳过 Editor（历史证明不可靠），Leader 直接整合更快更准
- **+ Writer 返工后 diff 检查**：Writer 返工时可能误改其他 section，必须对比确认
- **+ 用户原始数据完整展示**：Mode B 用户提供的表格/图片数据必须 100% 展示，不可简化

### v10（Project 8）— 严格流程执行 + 并行防护 + Mode A 数据一致性
- **+ ★ 严格流程执行**：绝对禁止跳过任何阶段，必须按 WORKFLOW.md 顺序逐步执行
- **+ 并行 session 防护**：派任务前清理所有 hook session，确保单线程推进
- **+ Mode A 数据一致性**：阶段 5 前 Leader 以正文为基准统一所有表格数据
- **+ Editor 截短防护**：整合后对比 draft 词数，截短 >10% 则替换
- **+ 7.5 逻辑检查 + 7.6 缩写检查**：不可跳过的审查门
- **+ Intro 词数上限**：~900 词，不超过 1000
- **+ 引用 key 映射检查**：编译前检查所有 \cite key 与 bib key 是否匹配
- **+ CRC 类拼写全局检查**：每次版本变更后 grep 检查方法名拼写一致性
- **+ docx 表格提取**：unzip + XML 解析替代 python-docx（环境兼容性更好）

---

## 新项目启动流程（铁律）
1. `mkdir -p` 所有子目录 + 初始化 `version_tracker.json`
2. **第一步：确认模式（Mode A / Mode B）**
3. 根据模式列出对应的材料清单
4. 用户提供建材
5. MinerU 解析范例论文
6. 提取黄金标准

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
5. **★ 严格按 WORKFLOW.md 阶段顺序执行，不得跳过任何阶段** — P8 血泪教训：跳过 4.6/4.7/4.8/7.5/7.6 导致返工浪费大量 token 和时间

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
| Editor hooks 路径错误（404） | P5 | 真实路径是 /hooks/agent，不是 openclaw.json 中的 /hooks |
| 修改覆盖旧版本 | P5 | **绝对禁止**：每次修改必须写入新版本目录 v{N+1} |
| 论文 abstract 分段 | P5 | IEEE 期刊 abstract 必须是单段 |
| 论文 intro 过长 | P5 | 控制在 ~1000 词，删除冗余段落 |
| 概念图单栏显示 | P5 | fig1-4 用 figure* 双栏显示 |
| Writer 返工误改其他 section | P7 | 返工后对比 diff，从原版恢复未修改文件 |
| curl message 过长（400） | P7 | 精简 message，让 Agent 自行读取文件 |
| Experiments 子节膨胀（14+→6） | P7 | Leader Python 脚本按 \subsection 切分重组 |
| CRC 拼写反复出现 | P7 | 每次版本变更后 grep -rn "CRC" 全局检查 |
| 用户表格数据未完整展示 | P7 | 用 unzip+XML 提取 docx，替换为用户原始数据 |
| 引用 key 不匹配 | P7 | 手动建立 cite key → bib key 映射表 |
| python-docx 安装失败 | P7 | unzip -p docx word/document.xml + Python XML 解析 |
| Leader 直接整合比 Editor 更可靠 | P7 | 阶段 5 优先 Leader 创建 paper.tex |
| ★ 跳过流程阶段 | P8 | **绝对禁止**：必须严格按 WORKFLOW.md 每个阶段顺序执行，不得自行判断跳过 |
| 并行 session 竞争覆盖 | P8 | 清理所有 Agent+Leader hook session → 重启 → 单线程推进 |
| Mode A 正文与表格数据不一致 | P8 | Writer/Artist 各自编假数据 → Leader 阶段 5 前以正文为基准统一表格 |
| Editor 截短 section 内容 | P8 | Editor 整合后对比 draft 词数，截短 >10% 则用完整 draft 替换 |
| 缩写首次使用未展开 | P8 | 7.6 缩写检查门不可跳过 |
| 逻辑检查发现数据矛盾 | P8 | 7.5 逻辑检查门不可跳过，Mode A 尤其重要 |
| 用户嫌 Intro 太长 | P8 | Intro 控制在 ~900 词，不超过 1000 |

---

## 工具备忘
- MinerU：`~/MinerU/.venv/bin/mineru -p <pdf> -o <dir> -b pipeline`（CPU模式）
- pdflatex：已安装（texlive-latex-base, extra, fonts-recommended, science）
- API rate limit：遇到限流等 10 分钟重试
- Agent 重启需设置环境变量：OPENCLAW_CONFIG_PATH + OPENCLAW_STATE_DIR
- 标准概念图 Prompt 范例：`/home/liaowenjie/.openclaw-multi/shared/STANDARD_CONCEPT_PROMPT_EXAMPLE.md`
- Reviewer API：`claude-proxy/claude-opus-4-6` via `https://www.fucheers.top/v1`
- Agent hooks 真实路径：`/hooks/agent`（不是 openclaw.json 中配置的 `/hooks`，后者只是 prefix）
- bibtex 系统无 IEEEtran.bst，用 `plain.bst` 替代
- 论文排版：abstract 不能分段、intro ~1000 词、概念图用 figure* 双栏

---

## Project 5（2026-03-23）— Diff-LM-GZSL, IEEE TIM ✅

- **主题**：Language-Driven Latent Diffusion for Continuous Semantic Alignment in Zero-Shot Fault Diagnosis
- **结果**：17 页，42 引用，15 公式，11 图，11 表，用户 ACCEPT ✅
- **耗时**：~6 小时（09:42 ~ 16:02）
- **关键成功因素**：v8 完整流程、Leader 接管 Editor+Artist、Reviewer 最终审查 2 轮
- **新教训**：
  - Editor gateway hooks 路径是 `/hooks/agent`（不是 `/hooks`）
  - Artist 数据图超时 → Leader Python matplotlib 直接生成
  - 论文排版：abstract 不分段、intro~1000词、fig1-4 用 figure* 双栏
  - **⚠️ 版本管理错误**：阶段 10 覆盖了 v1 而非写入 v2 → 用户严厉批评 → 事后补救
- **最终版本**：final/v2/（v1 被污染丢失，无 git）

## Project 6（2026-03-23~25）— Mode B, IEEE TIM ✅

- **结果**：用户 ACCEPT ✅
- **最终版本**：final/v3/paper.pdf

## Project 7（2026-03-25~26）— CAC-CycleGAN-WGP, IEEE TIM ✅

- **主题**：CAC-CycleGAN-WGP: A High-Fidelity Signal Augmentation Framework for Imbalanced Bearing Fault Diagnosis
- **模式**：Mode B（用户提供 method_description + 实验结果图表）
- **结果**：15 页，40 引用，11 图，11 表，用户 ACCEPT ✅
- **耗时**：~28 小时（含中断和串台排查）
- **版本迭代**：outline v2, drafts v4, final v2
- **关键成功因素**：
  - Leader 直接整合 paper.tex（跳过 Editor，更可靠）
  - Leader 手动重构 experiments.tex（Writer 扩充时误截断其他 section）
  - Reviewer 多轮审查（4.5a R1→R3, 7 R1→R2, v2 审查）
  - 用户原始表格数据完整替换（TABLE I-VII）
- **新问题与解决**：
  - Writer 返工时误改其他 section（experiments 5306→2023 词）→ 从 v1 恢复 + 创建新版本
  - Writer 扩充 method 时 curl message 过长（400）→ 精简 message 重试成功
  - Experiments 14+ 子节膨胀 → Leader Python 脚本重构为 6 个主 section
  - CRC 拼写错误反复出现 → 每次版本变更后全局 grep 检查
  - 用户表格数据未完整展示 → 用 unzip+XML 提取 docx 原始数据，替换简化表格
  - 引用 key 不匹配（cite{smote} vs bib 中 chawla2002smote）→ 手动映射修复
  - Reviewer API 超时/aborted → 精简 message 重试
  - 串台干扰（"电视艺术"）→ 确认项目文件未被污染，忽略
  - python-docx 安装失败 → 用 unzip + XML 解析替代
- **最终版本**：final/v2/paper.pdf

## Project 8（2026-03-29）— CMSA-Trans, IEEE TIM ✅

- **主题**：Cross-Modality Semantic Alignment Transformer: Leveraging LLM-Generated Fault Semantics for Zero-Shot Fault Diagnosis of Rotating Machinery
- **模式**：Mode A（从零开始）
- **结果**：13 页，38 引用，9 公式，10 图，7 表，用户 ACCEPT ✅
- **耗时**：~4 小时（13:00 ~ 17:11）
- **版本迭代**：outline v1, drafts v2, final v14（v1→v14 含大量并行 session 干扰修复）
- **关键成功因素**：
  - 完整执行 4.6（润色）→ 4.7（去AI）→ 4.8（Artist）→ 7.5（逻辑检查）→ 7.6（缩写检查）
  - Leader 手动修复正文与表格数据不一致（10+ 处）
  - Leader 手动精简 Introduction（1246→863 词）
  - 用户手动 Gemini 生成 4 张概念图
- **新问题与解决**：
  - **★ 并行 session 竞争（最严重）**：Leader 的 cron 回调触发新 session，各自推进流程互相覆盖 → 必须清理所有 Agent + Leader 的 hook session 后重启
  - **★ 正文与表格数据不一致**：Mode A 下 Writer 和 Artist 各自编造不同假数据 → Leader 必须以正文为基准统一所有表格
  - **★ Editor 截短 section 内容**：Background 1126→743 词 → Leader 直接用完整 draft 替换 paper.tex 中被截短的 section
  - **★ 并行 session 覆盖已修复的表格**：修好的 table_*.tex 被并行 session 覆盖回旧版 → 每次修复必须创建新版本目录
  - Editor API 报 system busy → 重启 Editor 重发任务
  - bibtex 报 couldn't open paper.aux → 需要先 pdflatex 再 bibtex
  - 缩写首次使用未展开（GPT/WDCNN/Bi-LSTM-ZSL/1D-ResNet）→ 手动展开全称
  - 逻辑检查发现组合损失公式缺失 → 补充 L_total = λ_cls * L_cls + λ_align * L_align
- **最终版本**：final/v14/paper.pdf
