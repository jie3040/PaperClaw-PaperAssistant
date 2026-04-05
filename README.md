# 🦞 PaperClaw — 多智能体学术论文辅助写作系统

> **基于 OpenClaw 的 9-Agent 协作论文写作流水线**
>
> ⚠️ **重要声明：本项目是论文写作「辅助」工具，不是论文生成器！**

---

## ⚠️ 免责声明

**PaperClaw 生成的论文内容仅作为写作参考和灵感来源：**

- 🔴 **Method 部分**：AI 生成的方法描述可能存在技术错误，**用户必须自行验证修正**
- 🔴 **Experiments 部分**：实验数据均为 AI 模拟（Mode A）或基于用户提供的数据整理（Mode B），**不是最终结果**，需要用户理解方法后自行复现实验
- 🔴 **References 部分**：虽经 web search 验证，仍可能有不准确之处，**用户必须逐条核实**
- 🟢 **可直接参考**：论文结构框架、文献调研方向、写作思路、LaTeX 排版格式

**本项目的核心价值：帮你快速搭建论文骨架、完成调研和排版，让你专注于科研创新。**

**⚠️ 再次强调：生成的论文仅供参考！Method 需要你修正，Experiments 需要你复现！请遵守学术诚信规范。**

---

## 📖 项目简介

PaperClaw 通过 9 个独立 AI Agent 分工协作，自动化学术论文写作的各个环节：

- 📚 自动文献调研和综述生成
- 💡 基于文献的研究 Idea 生成
- 🏗️ 论文框架设计（精确到段落级字数分配）
- ✍️ 逐节撰写学术英语内容
- 🎨 概念图 Prompt 生成、LaTeX 表格、matplotlib 数据图
- 🔬 多轮审查（框架对齐 / 内容对齐 / 全文学术审查）
- 📝 LaTeX 整合与格式修复
- 📄 PDF 编译
- 🔄 用户反馈 → 自动分发修改 → 迭代优化

---

## 🆕 v1.7 更新（2026-04）

### 新增 Writer 扩写/缩写 Skill

当 Reviewer 内容对齐审查指出字数偏差时，Leader 派发修改任务给 Writer 并附上对应 skill：

**扩写模式**（`expand_en.md`）：通过深挖隐含结论、增强逻辑连接、升级学术表达来微幅扩充（每次约 5-15 词），严禁恶意注水。

**缩写模式**（`shrink_en.md`）：通过句法压缩、剔除冗余填充词来微幅缩减（每次约 5-15 词），保留所有核心信息和实验参数。

### 新增铁律：Leader 禁止直接修改论文内容

Reviewer 返回审查意见后，Leader **必须**将修改任务分发给对应 Agent（尤其是 Writer），不得自己直接修改 .tex 文件。Leader 可自行处理的仅限文件路径修复、版本追踪更新等非内容性操作。

### 新增 2 个 Skill 文件

| 文件 | 用途 | 使用者 |
|------|------|--------|
| `expand_en.md` | 英文学术微幅扩写 | Writer |
| `shrink_en.md` | 英文学术微幅缩减 | Writer |

---

## 🆕 v1.6 更新（2026-03）

### 新增 Skill 系统 — Writer 润色 & 去AI痕迹

引入 `shared/skills/` 目录，存放可复用的专业 prompt。Writer 新增两种工作模式：

**润色模式（阶段 4.6）**：内容对齐审查通过后，对每个 section/subsection 逐个进行学术润色。支持中英文两套 skill（`polish_en.md` / `polish_zh.md`），Leader 根据论文语言自动选择。修正语法、优化句式、统一术语、强化逻辑衔接。

**去AI痕迹模式（阶段 4.7）**：润色后再做一轮改写，消除 AI 生成的机械痕迹。替换 AI 典型用词（leverage → use, delve into → investigate）、移除生硬过渡词、通过逻辑递进自然衔接。同样支持中英文两套 skill（`deai_en.md` / `deai_zh.md`）。

### 新增 Reviewer 逻辑检查 & 缩写检查

Reviewer 新增两种审查模式：

**逻辑检查（阶段 7.5）**：最终对齐审查通过后，对整篇论文做逻辑严谨性检查——排查因果断裂、偷换概念、循环论证、结论超出论据范围等问题。不通过打回修改。

**缩写检查（阶段 7.6）**：检查全文缩写使用规范性——首次出现是否给出全称、同一术语是否一致、是否过度使用缩写。不通过打回修改。

### 新增 6 个 Skill 文件

| 文件 | 用途 | 使用者 |
|------|------|--------|
| `polish_en.md` | 英文学术润色 | Writer |
| `polish_zh.md` | 中文学术润色 | Writer |
| `deai_en.md` | 英文去AI痕迹 | Writer |
| `deai_zh.md` | 中文去AI痕迹 | Writer |
| `logic_check.md` | 逻辑严谨性检查 | Reviewer |
| `abbrev_check.md` | 缩写规范性检查 | Reviewer |

---

## 🆕 v1.5 更新（2026-03）

### 新增 Mode B — 结果先行模式

用户已完成实验、有 method 和结果时，可选择 Mode B，系统围绕已有材料撰写论文：

- 跳过 Ideator 阶段，Leader 直接将用户 method 整理为 idea
- Writer 基于用户真实 method 描述和代码撰写（不自行发挥）
- Writer 基于用户真实实验结果撰写分析（不编造数据）
- Artist 提取、整理、转换用户提供的数据图和表格（不自己生成）
- Surveyor 聚焦 related work 和 baseline 检索

### 架构重构 — SOUL 瘦身

利用 OpenClaw 原生支持的多文件机制，将原来臃肿的单一 SOUL.md（Leader 23KB）拆分为多个职责清晰的文件：

| 文件 | 用途 |
|------|------|
| **SOUL.md** | 核心角色定义、行为准则（~2-4KB） |
| **AGENTS.md** | 通信协议、文件写入铁律、版本管理（~2-5KB） |
| **WORKFLOW.md** | Mode A + Mode B 完整工作流（仅涉及工作流的 Agent） |
| **HEARTBEAT.md** | 心跳/定期检查指令（仅 Leader） |
| **IDENTITY.md** | 名称、emoji |
| **USER.md** | 用户画像（仅 Leader） |

### 其他改进

- **铁律：Leader 禁止私自代理**：Agent 故障时先清理重试，3 次失败后通知用户，不得私自接管
- **铁律：新项目必须询问模式**：每次开始新项目必须先询问 Mode A / Mode B
- **项目路径动态管理**：每个项目独立目录，所有 Agent 使用绝对路径
- **图片预处理**：Mode B 自动检测子图文件夹，PIL 拼接为合并图
- **Editor subfigure 支持**：子图使用 subcaption 环境，图表三件套铁律
- **引用数量目标**：设为黄金标准中位数，不是下限

---

## 🆕 v1.7 更新（2026-04）

### 新增 Writer 扩写/缩写 Skill

当 Reviewer 内容对齐审查指出字数偏差时，Leader 派发修改任务给 Writer 并附上对应 skill：

**扩写模式**（`expand_en.md`）：通过深挖隐含结论、增强逻辑连接、升级学术表达来微幅扩充（每次约 5-15 词），严禁恶意注水。

**缩写模式**（`shrink_en.md`）：通过句法压缩、剔除冗余填充词来微幅缩减（每次约 5-15 词），保留所有核心信息和实验参数。

### 新增铁律：Leader 禁止直接修改论文内容

Reviewer 返回审查意见后，Leader **必须**将修改任务分发给对应 Agent（尤其是 Writer），不得自己直接修改 .tex 文件。Leader 可自行处理的仅限文件路径修复、版本追踪更新等非内容性操作。

### 新增 2 个 Skill 文件

| 文件 | 用途 | 使用者 |
|------|------|--------|
| `expand_en.md` | 英文学术微幅扩写 | Writer |
| `shrink_en.md` | 英文学术微幅缩减 | Writer |

---

## 🔮 路线图

- **v1.0**：多 Agent 论文辅助写作流水线（Mode A）
- **v1.5**：新增 Mode B（结果先行）+ SOUL 架构重构
- **v1.6**：Skill 系统 + 润色/去AI/逻辑检查/缩写检查
- **v1.7**（当前）：扩写/缩写 Skill + Leader 禁止直接修改铁律
- **v2.0**（规划中）：结合项目代码仓库的子 Agent 协作，实现 Agent 编码并运行实验

---

## 🏗️ 系统架构

```
用户 ───── TUI / 飞书 ────→ Leader (18800) 👑
                                │ curl webhook
              ┌─────────────────┼─────────────────┐
              ▼                 ▼                 ▼
        Surveyor (18810)  Ideator (18820)  Architect (18830)
          🔍 文献检索       💡 创意生成       🏗️ 框架设计
              │                 │                 │
              ▼                 ▼                 ▼
        Writer (18840)    Artist (18860)   Reviewer (18850)
          ✍️ 撰写+引用      🎨 图表处理      🔬 质量审查
              │                 │                 │
              ▼                 ▼                 ▼
        Editor (18870)                    Checker (18880)
          📝 LaTeX整合                      🔧 格式修复

通信方式: HTTP Webhook (curl POST /hooks/agent)
共享目录: ~/.openclaw-multi/shared/paper-project-N/
版本管理: outline/v1/ v2/ ... | drafts/v1/ v2/ ... | final/v1/ v2/ ...
```

| Agent | 端口 | 职责 | workspace 文件 |
|-------|------|------|---------------|
| **Leader** 👑 | 18800 | 总指挥：任务分发、审查、协调、编译 | SOUL + AGENTS + WORKFLOW + HEARTBEAT + IDENTITY + USER |
| **Surveyor** 🔍 | 18810 | 文献检索和综述 | SOUL + AGENTS + WORKFLOW + IDENTITY |
| **Ideator** 💡 | 18820 | 研究 Idea 生成（Mode B 跳过） | SOUL + AGENTS + IDENTITY |
| **Architect** 🏗️ | 18830 | 论文框架和图表规划 | SOUL + AGENTS + WORKFLOW + IDENTITY |
| **Writer** ✍️ | 18840 | 逐节撰写 + 引用 + 润色 + 去AI + 扩写/缩写 | SOUL + AGENTS + WORKFLOW + IDENTITY |
| **Reviewer** 🔬 | 18850 | 框架对齐 / 内容对齐 / 全文审查 / 逻辑检查 / 缩写检查 | SOUL + AGENTS + IDENTITY |
| **Artist** 🎨 | 18860 | 概念图 Prompt、表格、数据图（Mode B：提取转换） | SOUL + AGENTS + WORKFLOW + IDENTITY |
| **Editor** 📝 | 18870 | LaTeX 整合（含 subfigure 支持） | SOUL + AGENTS + IDENTITY |
| **Checker** 🔧 | 18880 | LaTeX 编译检查和修复 | SOUL + AGENTS + IDENTITY |

---

## 📋 两种工作模式

### Mode A — 从零开始

适用于有研究方向，需要系统从调研到写作全流程辅助的场景。

```
阶段 0    用户提供：主题 + 期刊 + LaTeX模板 + 2篇范例论文
阶段 0.5  Leader 提取"黄金标准" → golden_standard.json
阶段 1    Surveyor 文献检索
阶段 1.5  Leader 精简调研报告
阶段 2    Ideator 生成 idea → 用户选定
阶段 3    Architect 设计框架 → outline/v1/
阶段 3.5  ★ Reviewer 框架对齐审查
阶段 4    Writer 逐节撰写 → drafts/v1/ → 生成 references.bib
阶段 4.5a ★ Reviewer 内容对齐审查
阶段 4.6  ★ Writer 润色（逐 section/subsection）          🆕 v1.6
阶段 4.7  ★ Writer 去除AI痕迹（逐 section/subsection）    🆕 v1.6
阶段 4.5b Artist 概念图Prompt + 表格 + 数据图 → figures/
阶段 5    Editor 整合 LaTeX → final/v1/
阶段 6    ★ Checker LaTeX审查修复
阶段 7    Reviewer 最终对齐审查
阶段 7.5  ★ Reviewer 逻辑检查（整篇，不通过打回）          🆕 v1.6
阶段 7.6  ★ Reviewer 缩写检查（整篇，不通过打回）          🆕 v1.6
阶段 8    Leader 编译 PDF
阶段 9    用户/专家审查 → 修改清单
阶段 10   分发修改 → 新版本 → 循环至 Accept
```

### Mode B — 结果先行 🆕

适用于已完成实验，有 method 和结果，需要整理成论文的场景。

```
阶段 0B   用户提供：上述全部 + method描述 + 代码(可选) + 实验结果(必须)
阶段 0.5B golden_standard + 图片预处理（子图拼接）
阶段 1B   Surveyor 聚焦 related work 检索
阶段 1.5B Leader 精简调研报告
阶段 2B   ★ 跳过 Ideator — Leader 将用户 method 整理为 selected_idea
阶段 3B   Architect 基于用户材料设计框架
阶段 3.5B ★ Reviewer 框架对齐审查
阶段 4B   Writer 基于用户 method/results 逐节撰写 + references.bib
阶段 4.5a ★ Reviewer 内容对齐审查
阶段 4.6  ★ Writer 润色（逐 section/subsection）          🆕 v1.6
阶段 4.7  ★ Writer 去除AI痕迹（逐 section/subsection）    🆕 v1.6
阶段 4.5b Artist 扩充概念图Prompt + 提取用户数据图 + 转换用户表格为LaTeX
阶段 5~8  Editor整合 → Checker审查 → Reviewer对齐+逻辑+缩写 → 编译PDF
阶段 9~10 用户审查 → 修改循环
```

关键差异：Writer 基于真实 method/results 撰写 | Artist 提取转换（非生成） | Ideator 跳过

---

## 🚀 快速部署

### 前提条件

- [OpenClaw](https://docs.openclaw.ai/start/getting-started) 已安装（WSL Ubuntu 推荐）
- Node.js 22+
- Python 3.10+
- 至少一个 LLM API Key（Anthropic / OpenRouter / 中转站）

### 第 1 步：克隆项目

```bash
git clone https://github.com/jie3040/PaperClaw-Paper-Assistant.git
cd PaperClaw
```

### 第 2 步：复制配置

```bash
cp -r openclaw-multi ~/.openclaw-multi
```

### 第 3 步：配置 API Key

每个 Agent 需要填入 API Key：

```bash
# 逐个编辑（找到 "apiKey": "YOUR_API_KEY_HERE" 替换为你的 Key）
for agent in leader surveyor ideator architect writer reviewer artist editor checker; do
  echo "编辑 $agent ..."
  nano ~/.openclaw-multi/$agent/openclaw.json
done
```

支持的 Provider 格式：

| Provider | api 字段 | baseUrl |
|----------|---------|---------|
| Anthropic 官方 | `anthropic-messages` | `https://api.anthropic.com` |
| OpenRouter | `openai-completions` | `https://openrouter.ai/api/v1` |
| 中转站 | 按实际 | 按实际 |

### 第 4 步：加载快捷指令

```bash
cat bashrc_aliases.sh >> ~/.bashrc
source ~/.bashrc
```

### 第 5 步：启动

```bash
paper-start && sleep 10 && wake-agents
paper-status    # 确认全部 ✅
paper-tui       # 连接 Leader，选择 Mode A 或 Mode B，开始工作
```

---

## 📖 快捷指令大全

### 项目开启 / 关闭

| 指令 | 作用 |
|------|------|
| `paper-start` | 启动所有 9 个 Agent |
| `paper-stop` | 停止所有 Agent |
| `paper-status` | 查看运行状态 |
| `paper-test` | 测试 Agent 间通信 |
| `paper-tui` | 连接 Leader 终端 |
| `paper-watch` | 实时监控所有日志 |
| `wake-agents` | 激活所有 Worker Agent（启动后执行一次） |

### 重启单个 Agent

```bash
restart-agent leader      # 只重启 Leader
restart-agent writer      # 只重启 Writer
```

### 连接各 Agent 终端

```bash
tui-leader    tui-writer    tui-surveyor
tui-reviewer  tui-artist    tui-editor
tui-architect tui-ideator   tui-checker
```

### API 线路切换

```bash
api-leader-or         # Leader → OpenRouter
api-writer-fu         # Writer → Fucheers
api-all-or            # 全部 → OpenRouter
api-all-fu            # 全部 → Fucheers
switch-api <agent> <provider>  # 通用切换
# 切换后需要重启：paper-stop && paper-start
```

### 清空会话历史

```bash
clear-agent writer     # 清空 Writer 所有会话
clear-all-agents       # 清空所有 Agent 会话
# 清空后需要重启对应 Agent
```

---

## 📁 Workspace 文件说明（v1.7 架构）

每个 Agent 的 `workspace/` 目录下包含以下标准文件（OpenClaw 自动加载到 system prompt）：

| 文件 | 用途 | 哪些 Agent 有 |
|------|------|-------------|
| `SOUL.md` | 核心角色定义、行为准则 | 全部 9 个 |
| `AGENTS.md` | 通信协议、文件写入铁律 | 全部 9 个 |
| `WORKFLOW.md` | Mode A / Mode B 工作流差异 | Leader, Architect, Writer, Artist, Surveyor |
| `HEARTBEAT.md` | 心跳检查指令 | 仅 Leader |
| `IDENTITY.md` | 名称、emoji | 全部 9 个 |
| `USER.md` | 用户画像 | 仅 Leader |

共享 Skill 文件（`shared/skills/`）：

| 文件 | 用途 | 使用者 |
|------|------|--------|
| `polish_en.md` / `polish_zh.md` | 学术润色（英/中） | Writer |
| `deai_en.md` / `deai_zh.md` | 去除AI痕迹（英/中） | Writer |
| `logic_check.md` | 逻辑检查 | Reviewer |
| `abbrev_check.md` | 缩写检查 | Reviewer |
| `expand_en.md` | 英文微幅扩写 | Writer |
| `shrink_en.md` | 英文微幅缩减 | Writer |

---

## ❓ 常见问题

**Q: Agent 启动后显示离线？**
PaperClaw 使用 `gateway run`（非 systemd 服务），确保用 `paper-start` 启动。

**Q: Leader 发任务返回 404？**
检查目标 Agent 的 `openclaw.json` 中 `hooks.enabled` 是否为 `true`。

**Q: Agent 收到任务但 terminated？**
API 故障导致。清理后重发：`clear-agent <名> && restart-agent <名>`

**Q: 端口被占用？**
`paper-stop && pkill -9 -f "gateway run" && sleep 3 && paper-start`

**Q: Mode B 需要提供什么材料？**
method 描述文档（必须）、代码（可选）、实验结果（必须，可以是图片/CSV/Word表格）。

---

## 📜 许可证

MIT License

## 🙏 致谢

- [OpenClaw](https://github.com/openclaw/openclaw)
- [MinerU](https://github.com/opendatalab/MinerU)

---

> 🦞 PaperClaw v1.7 — 让 AI 处理论文的繁琐工作，你专注于科研创新。
>
> ⚠️ **最终提醒：论文仅供参考。Method 自己修正，Experiments 自己复现。学术诚信第一。**
