# 团队通讯录

| 角色 | 端口 | Token |
|------|------|-------|
| Surveyor 文献检索 | 18810 | surveyor-hook-2026 |
| Ideator 创意生成 | 18820 | ideator-hook-2026 |
| Architect 框架设计 | 18830 | architect-hook-2026 |
| Writer 论文撰写 | 18840 | writer-hook-2026 |
| Reviewer 质量审查 | 18850 | reviewer-hook-2026 |
| Artist 作图 | 18860 | artist-hook-2026 |
| Editor 润色定稿 | 18870 | editor-hook-2026 |
| Checker LaTeX审查 | 18880 | checker-hook-2026 |

---

# 发任务格式（含健康检查 + 重试）

## ⚠️ 发任务前必须先检查目标 Agent 是否存活

```bash
curl -s -o /dev/null -w "%{http_code}" --max-time 5 http://127.0.0.1:<PORT>/health
```
- 返回 200 → 可以发任务
- 返回非 200 或超时 → **不要发！** 通知用户 "Agent X 离线，请 restart-agent <name> 后再继续"

## 发任务模板（带重试）
```bash
# 第 1 次发送
RESPONSE=$(curl -s -w "\n%{http_code}" --max-time 30 \
  -X POST http://127.0.0.1:<PORT>/hooks/agent \
  -H 'Authorization: Bearer <TOKEN>' \
  -H 'Content-Type: application/json' \
  -d '{"message":"<任务>","name":"<名称>","sessionKey":"hook:<id>"}')
HTTP_CODE=$(echo "$RESPONSE" | tail -1)

# 如果失败，等 30 秒重试
if [ "$HTTP_CODE" != "200" ]; then
  echo "⚠️ 第1次发送失败 (HTTP $HTTP_CODE)，等待30秒重试..."
  sleep 30
  RESPONSE=$(curl -s -w "\n%{http_code}" --max-time 30 \
    -X POST http://127.0.0.1:<PORT>/hooks/agent \
    -H 'Authorization: Bearer <TOKEN>' \
    -H 'Content-Type: application/json' \
    -d '{"message":"<任务>","name":"<名称>","sessionKey":"hook:<id>-retry1"}')
  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
fi

# 如果仍失败，再等 60 秒最后重试
if [ "$HTTP_CODE" != "200" ]; then
  echo "⚠️ 第2次发送失败，等待60秒最后重试..."
  sleep 60
  curl -s -X POST http://127.0.0.1:<PORT>/hooks/agent \
    -H 'Authorization: Bearer <TOKEN>' \
    -H 'Content-Type: application/json' \
    -d '{"message":"<任务>","name":"<名称>","sessionKey":"hook:<id>-retry2"}'
fi
```

## 任务持久化（防丢失）
每次发任务前，**先把任务内容保存到文件**：
```bash
cat > SHARED/reviews/pending_task_<agent>_<stage>.json << 'EOF'
{
  "target": "<agent>",
  "port": <PORT>,
  "token": "<TOKEN>",
  "message": "<完整任务内容>",
  "sessionKey": "hook:<id>",
  "created_at": "<timestamp>",
  "status": "pending"
}
EOF
```

## 发任务纪律
1. **先健康检查** → 确认目标 Agent 在线
2. **保存任务到文件** → 防丢失
3. **发送 curl** → 带重试（最多 3 次，间隔 30s/60s）
4. **确认 HTTP 200** → 才算发送成功
5. **等待回报** → 超过 15 分钟无回报，检查 Agent 日志
6. **超时处理** → Agent 无响应则通知用户

## 上下文控制（最重要！）
- **绝对不要**把原始大文件（30KB+ 调研报告、整篇范例论文）直接塞给 Agent 的 message
- **Leader 负责预处理**：先精简/摘要，再发精简版路径给 Agent
- 如果 Agent 需要特定细节，可以让它自行读取原始文件的局部内容

## 积压清理流程
1. kill Agent gateway
2. 删除 .jsonl 会话文件
3. 从 sessions.json 中移除 hook: 条目
4. 重启 Agent gateway
5. 确认干净再发新任务

---

# 共享目录（绝对路径！）

```
SHARED/
  template/          ← LaTeX 模板
  examples/          ← 范例论文 PDF + MinerU 解析结果
  references/        ← 文献调研
  ideas/             ← 创意候选 / selected_idea.md
  outline/           ← 框架（含版本子目录 v1/, v2/, ...）
  drafts/            ← 各 section 草稿（含版本子目录）
  figures/           ← 所有图表
  reviews/           ← 审查报告
  final/             ← 最终 LaTeX + PDF（含版本子目录）
  user_materials/    ← Mode B 专用：用户提供的 method/code/results
```

---

# ★★★ 版本管理规则

## 核心原则
**每次审查返工后的产出写入新版本目录，绝不覆盖旧版本。**

## 目录结构示例
```
outline/v1/ → v2/ → v3/
drafts/v1/ → v2/ → v3/
final/v1/ → v2/ → v3/
```

## Leader 的版本管理职责

1. **创建版本目录**：每次派 Agent 产出前先创建
   ```bash
   mkdir -p SHARED/outline/v1
   mkdir -p SHARED/drafts/v1
   mkdir -p SHARED/final/v1
   ```

2. **追踪版本号**：在 `SHARED/version_tracker.json` 中记录
   ```json
   {
     "mode": "A",
     "outline_version": 1,
     "drafts_version": 1,
     "final_version": 1,
     "history": []
   }
   ```

3. **告诉 Agent 写入哪个版本**：curl message 中必须明确
   - ✅ `"写入 SHARED/outline/v2/paper_outline.md"`
   - ❌ `"写入 SHARED/outline/paper_outline.md"`

4. **告诉 Agent 读取哪个版本**
   - ✅ `"审查 SHARED/drafts/v2/ 下所有文件"`
   - ❌ `"审查 SHARED/drafts/ 下所有文件"`

5. **版本递增规则**
   - 初次产出 → v1
   - 审查不通过返工 → version + 1
   - 阶段10用户反馈修改 → version + 1
   - 每次递增前更新 version_tracker.json

---

# ★★★ 项目路径动态管理（铁律）

## 新项目初始化流程

每次开始新项目时，Leader 必须：

1. **询问用户选择模式**（Mode A / Mode B）
2. **确定项目编号**：读取 `~/.openclaw-multi/shared/` 下已有的 paper-project-N 目录，新项目编号 = max(N) + 1
3. **创建项目目录**：
```bash
   PROJECT_NUM=<下一个编号>
   SHARED="$HOME/.openclaw-multi/shared/paper-project-${PROJECT_NUM}"
   mkdir -p "$SHARED"/{template,examples,references,ideas,outline,drafts,figures,reviews,final,user_materials/{code,results}}
```
4. **记录项目路径**：写入 `SHARED/project_config.md`
5. **所有后续 curl 任务中必须使用完整绝对路径**：
   - ✅ `/home/liaowenjie/.openclaw-multi/shared/paper-project-7/drafts/v1/`
   - ❌ `SHARED/drafts/v1/`（Agent 不知道 SHARED 指向哪里）

## ⚠️ 路径铁律
- **每条 curl 任务 message 中的所有路径必须是绝对路径**
- **第一条任务 message 的开头必须声明当前项目路径**，格式：
```
  当前项目：/home/liaowenjie/.openclaw-multi/shared/paper-project-7
  以下 SHARED = 上述路径
```
- **禁止让 Agent 自己猜测项目路径**
- **禁止在不同项目间混用路径**
