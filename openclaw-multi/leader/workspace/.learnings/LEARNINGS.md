# Learnings

## [LRN-20260323-001] 版本管理不可覆盖（critical）

**Logged**: 2026-03-23T15:42:00+08:00
**Priority**: critical
**Status**: promoted
**Area**: config

### Summary
阶段 10 修改 paper.tex 时直接覆盖了 final/v1，违反版本管理铁律

### Details
Leader 在修复用户审稿意见（abstract分段、intro过长、fig1-4双栏）时，直接修改了 final/v1/paper.tex 而非创建 final/v2/ 目录。用户严厉批评。事后补救：创建 v2 目录并复制文件，但 v1 原始版本已丢失（无 git）。

### Suggested Action
1. 每次修改前先 `mkdir -p final/v{N+1}` 再 `cp` 到新目录
2. 永远不要直接编辑当前版本的 paper.tex
3. 初始化项目时 `git init` 防止意外丢失

### Metadata
- Source: user_feedback
- Related Files: SOUL.md, MEMORY.md
- Tags: version-control, critical-error
- Promoted: MEMORY.md, SOUL.md

---

## [LRN-20260323-002] Agent hooks 真实路径

**Logged**: 2026-03-23T14:27:00+08:00
**Priority**: high
**Status**: promoted
**Area**: config

### Summary
Agent hooks 的 openclaw.json 中 path:"/hooks" 只是前缀，真实路径是 /hooks/agent

### Details
Editor 用 /hooks 返回 404，用 /hooks/agent 返回 200。测试确认所有 Agent（Checker 等）都是 /hooks/agent。openclaw.json 中的 hooks.path 是前缀，OpenClaw 会追加 /agent。

### Suggested Action
AGENTS.md 中的发任务模板用 /hooks/agent，无需再测试其他路径

### Metadata
- Source: error
- Tags: agent-hooks, openclaw-config
- Promoted: MEMORY.md, AGENTS.md

---

## [LRN-20260323-004] 新项目启动流程顺序（critical）

**Logged**: 2026-03-23T17:25:00+08:00
**Priority**: critical
**Status**: promoted
**Area**: config

### Summary
新项目启动后的正确顺序：初始化目录 → 确认模式(Mode A/B) → 根据模式列出材料清单 → 用户提供建材

### Details
Project 6 启动时，Leader 初始化目录后直接问用户要材料，跳过了模式确认步骤。用户纠正两次才回到正确流程。因为 Mode A 和 Mode B 需要的材料不同，必须先确认模式才能给出正确的材料清单。

### Suggested Action
新项目启动固定流程：1) mkdir + version_tracker.json 2) 问 Mode A or B 3) 根据模式问材料

### Metadata
- Source: user_feedback
- Tags: workflow, project-init, critical
- Promoted: MEMORY.md, SOUL.md

---

## [LRN-20260323-003] IEEE 论文排版规范

**Logged**: 2026-03-23T15:04:00+08:00
**Priority**: medium
**Status**: promoted
**Area**: docs

### Summary
IEEE 期刊论文 abstract 必须单段、intro 控制在 ~1000 词、概念图用双栏

### Details
用户审稿意见：1) abstract 不能分段 2) introduction 文字太多（1752→需~1000词）3) fig1-4 概念图全部需要双栏显示（figure* 环境）

### Suggested Action
以后 Writer 任务中明确这些排版要求

### Metadata
- Source: user_feedback
- Tags: ieee-formatting, paper-structure
- Promoted: MEMORY.md
