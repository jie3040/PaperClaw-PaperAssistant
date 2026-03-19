# 🦞 PaperClaw — 多智能体学术论文辅助写作系统

> **基于 OpenClaw 的 9-Agent 协作论文写作流水线**
>
> ⚠️ **重要声明：本项目是论文写作「辅助」工具，不是论文生成器！**

---

## ⚠️ 免责声明

**PaperClaw 生成的论文内容仅作为写作参考和灵感来源：**

- 🔴 **Method 部分**：AI 生成的方法描述可能存在技术错误，**用户必须自行验证修正**
- 🔴 **Experiments 部分**：实验数据均为 AI 模拟，**不是真实结果**，需要用户理解方法后自行复现实验
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

### 🔮 路线图

- **v1.0**（当前）：多 Agent 论文辅助写作流水线
- **v2.0**（规划中）：结合项目代码仓库的子 Agent 协作版本

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
          ✍️ 撰写+引用      🎨 图表生成      🔬 质量审查
              │                 │                 │
              ▼                 ▼                 ▼
        Editor (18870)                    Checker (18880)
          📝 LaTeX整合                      🔧 格式修复

通信方式: HTTP Webhook (curl POST /hooks/agent)
共享目录: ~/.openclaw-multi/shared/paper-project/
版本管理: outline/v1/ v2/ ... | drafts/v1/ v2/ ... | final/v1/ v2/ ...
```

| Agent | 端口 | 职责 |
|-------|------|------|
| **Leader** 👑 | 18800 | 总指挥：任务分发、审查、协调、编译 |
| **Surveyor** 🔍 | 18810 | 文献检索和综述 |
| **Ideator** 💡 | 18820 | 研究 Idea 生成 |
| **Architect** 🏗️ | 18830 | 论文框架和图表规划 |
| **Writer** ✍️ | 18840 | 逐节撰写 + 生成 references.bib |
| **Reviewer** 🔬 | 18850 | 框架对齐 / 内容对齐 / 全文审查 |
| **Artist** 🎨 | 18860 | 概念图 Prompt、表格、数据图 |
| **Editor** 📝 | 18870 | LaTeX 整合 |
| **Checker** 🔧 | 18880 | LaTeX 编译检查和修复 |

---

## 📋 完整 Pipeline（v8）

```
阶段 0    用户提供：主题 + 期刊 + LaTeX模板 + 2篇范例论文
阶段 0.5  Leader 提取"黄金标准" → golden_standard.json
阶段 1    Surveyor 文献检索
阶段 1.5  Leader 精简调研报告
阶段 2    Ideator 生成 idea → 用户选定
阶段 3    Architect 设计框架 → outline/v1/
阶段 3.5  ★ Reviewer 框架对齐审查 → 不通过打回 → outline/v2/
阶段 4    Writer 逐节撰写 → drafts/v1/ → 生成 references.bib
阶段 4.5a ★ Reviewer 内容对齐审查 → 不通过打回 → drafts/v2/
阶段 4.5b Artist 概念图Prompt + 表格 + 数据图 → figures/
阶段 6    Editor 整合 LaTeX → final/v1/
阶段 7    ★ Checker LaTeX审查修复 → final/v2/
阶段 8    Reviewer 最终对齐审查
阶段 9    Leader 编译 PDF
阶段 10   用户/专家审查 → Leader 生成修改清单
阶段 11   分发修改 → 新版本 → 回到阶段6（直到Accept）
```

关键特性：**版本管理**（不覆盖旧版本）| **黄金标准对齐** | **段落级字数控制** | **文献真实性验证**

---

## 🚀 快速部署

### 前提条件

- [OpenClaw](https://docs.openclaw.ai/start/getting-started) 已安装（WSL Ubuntu 推荐）
- Node.js 22+
- Python 3.10+
- 至少一个 LLM API Key（Anthropic / OpenRouter / 中转站）

### 第 1 步：克隆项目

```bash
git clone https://github.com/你的用户名/PaperClaw.git
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
nano ~/.openclaw-multi/leader/openclaw.json
nano ~/.openclaw-multi/surveyor/openclaw.json
nano ~/.openclaw-multi/ideator/openclaw.json
nano ~/.openclaw-multi/architect/openclaw.json
nano ~/.openclaw-multi/writer/openclaw.json
nano ~/.openclaw-multi/reviewer/openclaw.json
nano ~/.openclaw-multi/artist/openclaw.json
nano ~/.openclaw-multi/editor/openclaw.json
nano ~/.openclaw-multi/checker/openclaw.json
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
paper-tui       # 连接 Leader，开始工作
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

| 指令 | 作用 |
|------|------|
| `restart-agent leader` | 只重启 Leader |
| `restart-agent writer` | 只重启 Writer |
| `restart-agent checker` | 只重启 Checker |

### 连接各 Agent 终端

| 指令 | 作用 |
|------|------|
| `tui-leader` | Leader 交互 |
| `tui-writer` | Writer 交互 |
| `tui-surveyor` | Surveyor 交互 |
| `tui-reviewer` ~ `tui-checker` | 其他 Agent 交互 |

### API 线路切换

| 指令 | 作用 |
|------|------|
| `api-leader-or` | Leader → OpenRouter |
| `api-writer-fu` | Writer → Fucheers |
| `api-all-or` | 全部 → OpenRouter |
| `api-all-fu` | 全部 → Fucheers |
| `switch-api <agent> <provider>` | 通用切换 |

切换后需要重启：`paper-stop && paper-start`

### 清空会话历史

| 指令 | 作用 |
|------|------|
| `clear-agent writer` | 清空 Writer 所有会话 |
| `clear-all-agents` | 清空所有 Agent 会话 |

清空后需要重启对应 Agent。

### 可选 Skills

```bash
# 监控面板
~/.agents/skills/multi-agent-monitor/start-monitor.sh 600   # 启动
~/.agents/skills/multi-agent-monitor/stop-monitor.sh         # 停止
python3 ~/.agents/skills/multi-agent-monitor/scripts/healthcheck.py  # 快速检查

# Capability Evolver
cd ~/.openclaw-multi/surveyor/workspace && ./run-evolver.sh
```

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

---

## 📜 许可证

MIT License

## 🙏 致谢

- [OpenClaw](https://github.com/openclaw/openclaw)
- [MinerU](https://github.com/opendatalab/MinerU)

---

> 🦞 PaperClaw — 让 AI 处理论文的繁琐工作，你专注于科研创新。
>
> ⚠️ **最终提醒：论文仅供参考。Method 自己修正，Experiments 自己复现。学术诚信第一。**
