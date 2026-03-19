#!/bin/bash
# ============================================================
# OpenClaw 多实例论文写作系统 — WSL Ubuntu v3
# 每个 Agent 独立 API Key
# ============================================================

# ============ 每个 Agent 独立的 API Key ============
PROXY_KEYS=(
  "sk-nj6fiq4Zpuv10tCvzz44XhciQNsT2W0vj3RD1in3XjwVQoc6"   # leader
  "sk-0INmTGkt8KR6ETHgdrbttDZNmLXrhg6xySEg7xmulV0sxwAt"   # surveyor
  "sk-k1ZJYixY8LSroo0ZeQ2x2Ux1WIq8DGrSoyFDMpg1G5T0vEkr"   # ideator
  "sk-HCrBhNr31TZUvXPkPIRaZz9VAPnZCvv20fUswKZVcOKO5xYa"   # architect
  "sk-KQ1Jz7m4LJPXQdMdhcIBY1SudK0zbXiw0TgZeUElK6leEAHT"   # writer
  "sk-LncGtcuLSyF0pTk05WuJoAt81pSGrBlY7BtPBJL5ZnClQBtJ"   # reviewer
  "sk-sBnb52tJqZL1mvTJK27jj8BfF68rMlWeIsOQD7i5Nph1nW3e"   # artist
  "sk-XNimeWlKndnfcrWwhM1OsuNhnLuxvsdoJoFrmospegUf6x5z"   # editor
)
PROXY_BASE="https://www.fucheers.top"
BRAVE_KEY="BSAKQ7B0uXZkkA5IRv7MJ_D7vC47NBU"
# ===================================================

OLD_DIR="$HOME/.openclaw"
MULTI_BASE="$HOME/.openclaw-multi"
SHARED_DIR="$MULTI_BASE/shared/paper-project"
OPENCLAW_BIN="$HOME/.npm-global/lib/node_modules/openclaw/dist/index.js"
NODE_BIN="/usr/bin/node"

AGENTS=(leader surveyor ideator architect writer reviewer artist editor checker)

PORTS=(18800 18810 18820 18830 18840 18850 18860 18870 18880)

MODELS=(
  "claude-opus-4-6"     # leader
  "claude-sonnet-4-6"   # surveyor
  "claude-opus-4-6"     # ideator
  "claude-sonnet-4-6"   # architect
  "claude-sonnet-4-6"   # writer
  "claude-opus-4-6"     # reviewer
  "gemini-3.1-pro-high"   # artist
  "claude-sonnet-4-6"   # editor
)
EMOJIS=("👑" "🔍" "💡" "🏗" "✍" "🔬" "🎨" "📝")

# ============================================================
do_clean() {
  echo ""
  echo "🧹 清理旧残留"
  echo "============================================="
  [ ! -d "$OLD_DIR" ] && echo "❌ $OLD_DIR 不存在" && return

  BACKUP="$HOME/openclaw-backup-$(date +%Y%m%d-%H%M%S)"
  echo "📦 备份到 $BACKUP ..."
  mkdir -p "$BACKUP"
  for item in openclaw.json workspace workspace-Alex memory agents; do
    [ -e "$OLD_DIR/$item" ] && cp -r "$OLD_DIR/$item" "$BACKUP/" && echo "   ✓ $item"
  done

  echo "🗑️  删除旧角色..."
  for ws in workspace-architect workspace-architector workspace-artist \
            workspace-editor workspace-ideator workspace-reviewer \
            workspace-surveyor workspace-writer; do
    [ -d "$OLD_DIR/$ws" ] && rm -rf "$OLD_DIR/$ws" && echo "   ✓ $ws/"
  done
  for d in subagents workflows shared; do
    [ -d "$OLD_DIR/$d" ] && rm -rf "$OLD_DIR/$d" && echo "   ✓ $d/"
  done
  rm -f "$OLD_DIR"/openclaw.json.bak* 2>/dev/null
  for aid in architect architector artist editor ideator reviewer surveyor writer leader; do
    [ -d "$OLD_DIR/agents/$aid" ] && rm -rf "$OLD_DIR/agents/$aid" && echo "   ✓ agents/$aid/"
  done

  if [ -f "$OLD_DIR/openclaw.json" ] && command -v python3 &>/dev/null; then
    echo "📝 精简 openclaw.json..."
    python3 -c "
import json
p='$OLD_DIR/openclaw.json'
with open(p) as f: c=json.load(f)
if 'list' in c.get('agents',{}):
  o=c['agents']['list']
  n=[a for a in o if a.get('id') in ('main','Alex','alex')]
  r=[a.get('id') for a in o if a not in n]
  c['agents']['list']=n
  for a in n: a.pop('subagents',None)
  if r: print(f'   移除: {r}')
with open(p,'w') as f: json.dump(c,f,indent=2,ensure_ascii=False)
print('   ✓ openclaw.json 已更新')
"
  fi
  echo "✅ 清理完成！备份: $BACKUP"
}

# ============================================================
do_setup() {
  echo ""
  echo "🦞 部署多实例（每个Agent独立API Key）"
  echo "============================================="

  for d in references ideas outline drafts figures reviews final; do
    mkdir -p "$SHARED_DIR/$d"
  done
  echo "✓ 共享目录: $SHARED_DIR"
  echo ""

  for i in "${!AGENTS[@]}"; do
    agent=${AGENTS[$i]}; port=${PORTS[$i]}; model=${MODELS[$i]}
    emoji=${EMOJIS[$i]}; apikey=${PROXY_KEYS[$i]}
    dir="$MULTI_BASE/$agent"

    mkdir -p "$dir"/{workspace/skills,agents,logs,cron,memory,completions,identity,canvas,devices}

    cat > "$dir/openclaw.json" << EOF
{
  "models": {
    "providers": {
      "claude-proxy": {
        "baseUrl": "$PROXY_BASE",
        "apiKey": "$apikey",
        "api": "anthropic-messages",
        "models": [
          {
            "id": "claude-opus-4-6", "name": "Claude Opus 4.6",
            "reasoning": true, "input": ["text","image"],
            "cost": {"input":0,"output":0,"cacheRead":0,"cacheWrite":0},
            "contextWindow": 200000, "maxTokens": 16000
          },
          {
            "id": "claude-sonnet-4-6", "name": "Claude Sonnet 4.6",
            "reasoning": true, "input": ["text","image"],
            "cost": {"input":0,"output":0,"cacheRead":0,"cacheWrite":0},
            "contextWindow": 200000, "maxTokens": 16000
          }
        ]
      }
    }
  },
  "agents": {
    "list": [
      {
        "id": "main",
        "default": true,
        "identity": { "name": "${agent^}", "emoji": "$emoji" },
        "model": { "primary": "claude-proxy/$model" },
        "workspace": "$dir/workspace"
      }
    ],
    "defaults": {
      "model": { "primary": "claude-proxy/$model" },
      "workspace": "$dir/workspace",
      "compaction": { "mode": "safeguard" }
    }
  },
  "tools": {
    "profile": "full",
    "web": {
      "search": { "enabled": true, "apiKey": "$BRAVE_KEY" },
      "fetch": { "enabled": true }
    }
  },
  "hooks": {
    "enabled": true, "token": "${agent}-hook-2026",
    "path": "/hooks",
    "allowRequestSessionKey": true,
    "allowedSessionKeyPrefixes": ["hook:"]
  },
  "commands": { "native": "auto", "nativeSkills": "auto" },
  "gateway": {
    "port": $port, "mode": "local", "bind": "loopback",
    "auth": { "mode": "token", "token": "${agent}-gw-2026" },
    "tailscale": { "mode": "off", "resetOnExit": false }
  },
  "skills": { "install": { "nodeManager": "npm" } },
  "plugins": { "entries": {}, "installs": {} }
}
EOF
    # 显示 key 的前8位和后4位，中间隐藏
    key_show="${apikey:0:8}...${apikey: -4}"
    echo "   ✓ $agent → :$port | $model | key: $key_show"
  done

  echo ""
  echo "📜 生成 SOUL.md..."
  _gen_leader_soul
  _gen_worker_soul surveyor "学术文献检索专家" \
    "用web-search系统性检索学术文献。>=20篇核心文献，覆盖3+子方向，含近2年进展。" \
    "references" "reference_list.json, survey_report.md, key_findings.md"
  _gen_worker_soul ideator "研究创意生成专家" \
    "阅读references/survey_report.md，识别Research Gap，生成3-5个候选idea。" \
    "ideas" "candidates.md, comparison_matrix.md"
  _gen_worker_soul architect "论文框架设计师" \
    "阅读ideas/selected_idea.md，设计论文section结构、内容要点、图表位置。" \
    "outline" "paper_outline.md, figure_plan.md, writing_assignments.json"
  _gen_worker_soul writer "学术论文撰写专家" \
    "按任务指定section撰写学术英语内容。每个claim有文献引用，LaTeX公式。" \
    "drafts" "section_xxx.md"
  _gen_worker_soul reviewer "学术论文审查专家" \
    "以顶级AI会议审稿人标准审查drafts/。评估技术正确性、新颖性、清晰度。" \
    "reviews" "review_xxx.md + overall_review.md"
  _gen_worker_soul artist "学术可视化专家" \
    "根据outline/figure_plan.md生成图表。概念图用nano-banana-pro，数据图用matplotlib。" \
    "figures" "fig<N>_xxx.png + figures_manifest.json"
  _gen_worker_soul editor "论文润色与整合专家" \
    "整合drafts/和figures/，统一术语、引用编号、格式，修复语法。" \
    "final" "paper_final.md, references.bib, changelog.md"

  echo ""
  echo "✅ 部署完成！下一步: bash $0 start"
}

_gen_leader_soul() {
  cat > "$MULTI_BASE/leader/workspace/SOUL.md" << EOF
# 角色：论文项目总指挥

你管理7个独立AI Agent。用exec执行curl向它们的webhook发任务。

## 团队通讯录

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

## 发任务格式
\`\`\`bash
curl -s -X POST http://127.0.0.1:<PORT>/hooks/agent \\
  -H 'Authorization: Bearer <TOKEN>' \\
  -H 'Content-Type: application/json' \\
  -d '{"message":"<任务>","name":"<名称>","sessionKey":"hook:<id>"}'
\`\`\`

## 共享目录（绝对路径！）
$SHARED_DIR/
  references/ ideas/ outline/ drafts/ figures/ reviews/ final/

## 流程
1. curl :18801 → Surveyor检索文献 → 审查 → ACCEPT/REVISE
2. curl :18802 → Ideator生成idea → 选定 → selected_idea.md
3. curl :18803 → Architect设计框架 → 审查 → ACCEPT/REVISE
4. curl :18804 → Writer写各section + curl :18806 → Artist作图
5. curl :18805 → Reviewer全文审查 → ACCEPT/REVISE
6. curl :18807 → Editor最终整合 → 通知用户

返工：每阶段最多3轮。重新curl附修改意见。超3轮通知用户。
EOF
  echo "   ✓ leader"
}

_gen_worker_soul() {
  local agent=$1 role=$2 duties=$3 odir=$4 ofiles=$5
  cat > "$MULTI_BASE/$agent/workspace/SOUL.md" << EOF
# 角色：$role

## 职责
$duties

## 输出
写入 $SHARED_DIR/$odir/：$ofiles

## 完成后回报Leader
\`\`\`bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \\
  -H 'Authorization: Bearer leader-hook-2026' \\
  -H 'Content-Type: application/json' \\
  -d '{"message":"[$agent完成] <简述>","name":"${agent^}回报","sessionKey":"hook:leader-inbox"}'
\`\`\`

## 重要
- 所有文件用绝对路径: $SHARED_DIR/...
- 完成后务必curl回报Leader
- 收到返工指令按意见修改后重新回报
EOF
  echo "   ✓ $agent"
}

# ============================================================
do_start() {
  echo ""
  echo "🚀 启动所有实例"
  echo "============================================="

  [ ! -f "$OPENCLAW_BIN" ] && echo "❌ 找不到 $OPENCLAW_BIN" && exit 1

  echo "   停止 systemd 默认服务..."
  systemctl --user stop openclaw-gateway.service 2>/dev/null || true
  sleep 2

  for i in "${!AGENTS[@]}"; do
    agent=${AGENTS[$i]}; port=${PORTS[$i]}; dir="$MULTI_BASE/$agent"
    logfile="$dir/logs/gateway-$(date +%Y%m%d).log"

    if ss -tlnp 2>/dev/null | grep -q ":$port "; then
      echo "   ⚠️  $agent :$port 已占用，跳过"
      continue
    fi

    echo -n "   $agent :$port ..."
    OPENCLAW_STATE_DIR="$dir" \
    OPENCLAW_CONFIG_PATH="$dir/openclaw.json" \
      nohup "$NODE_BIN" "$OPENCLAW_BIN" gateway run \
      --port "$port" \
      --bind loopback \
      --token "${agent}-gw-2026" \
      >> "$logfile" 2>&1 &
    echo " PID $!"
    sleep 4
  done

  echo ""
  echo "⏳ 等待就绪..."
  sleep 5
  do_status
}

# ============================================================
do_stop() {
  echo ""
  echo "⏹  停止所有实例..."

  for i in "${!AGENTS[@]}"; do
    agent=${AGENTS[$i]}; port=${PORTS[$i]}
    pid=$(lsof -ti ":$port" 2>/dev/null || ss -tlnp 2>/dev/null | grep ":$port " | grep -oP 'pid=\K[0-9]+' || true)
    if [ -n "$pid" ]; then
      kill $pid 2>/dev/null
      echo "   ⏹  $agent :$port (PID $pid)"
    else
      echo "   -  $agent :$port 未运行"
    fi
  done

  pkill -f "openclaw-multi.*gateway" 2>/dev/null || true
  sleep 2
  echo "   ✅ 完成"
}

# ============================================================
do_status() {
  echo ""
  echo "===== 论文写作系统状态 ====="
  echo ""
  printf "  %-4s %-12s %-8s %-8s %-22s %s\n" "" "AGENT" "PORT" "STATUS" "MODEL" "KEY"
  printf "  %-4s %-12s %-8s %-8s %-22s %s\n" "" "-----" "----" "------" "-----" "---"

  for i in "${!AGENTS[@]}"; do
    agent=${AGENTS[$i]}; port=${PORTS[$i]}; model=${MODELS[$i]}
    key_show="${PROXY_KEYS[$i]:0:8}...${PROXY_KEYS[$i]: -4}"
    code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 \
      http://127.0.0.1:$port/health 2>/dev/null || echo "000")
    if [ "$code" = "200" ]; then
      printf "  ✅ %-12s %-8s %-8s %-22s %s\n" "$agent" ":$port" "在线" "$model" "$key_show"
    else
      printf "  ❌ %-12s %-8s %-8s %-22s %s\n" "$agent" ":$port" "离线" "$model" "$key_show"
    fi
  done
  echo ""
}

do_tui() {
  echo "🖥️  连接 Leader (port 18800)..."
  OPENCLAW_STATE_DIR="$MULTI_BASE/leader" \
  OPENCLAW_CONFIG_PATH="$MULTI_BASE/leader/openclaw.json" \
    openclaw tui
}

do_logs() {
  local agent="${1:-leader}"
  [ ! -d "$MULTI_BASE/$agent" ] && echo "❌ 无此Agent: ${AGENTS[*]}" && exit 1
  echo "📋 $agent 日志 (Ctrl+C 退出)..."
  tail -f "$MULTI_BASE/$agent/logs/"*.log
}

do_test() {
  echo ""
  echo "🧪 测试通信"
  echo "============================================="
  echo "1. Leader→Surveyor ..."
  r=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 \
    -X POST http://127.0.0.1:18810/hooks/agent \
    -H "Authorization: Bearer surveyor-hook-2026" \
    -H "Content-Type: application/json" \
    -d '{"message":"通信测试","name":"test","sessionKey":"hook:test-1"}' 2>/dev/null)
  [ "$r" = "200" ] && echo "   ✅ HTTP $r" || echo "   ❌ HTTP $r"

  echo "2. Surveyor→Leader ..."
  r=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 \
    -X POST http://127.0.0.1:18800/hooks/agent \
    -H "Authorization: Bearer leader-hook-2026" \
    -H "Content-Type: application/json" \
    -d '{"message":"[surveyor]回报测试","name":"report","sessionKey":"hook:leader-inbox"}' 2>/dev/null)
  [ "$r" = "200" ] && echo "   ✅ HTTP $r" || echo "   ❌ HTTP $r"

  echo "3. 共享目录 ..."
  tf="$SHARED_DIR/references/.test-$$"
  echo "t" > "$tf" 2>/dev/null
  [ -f "$tf" ] && rm -f "$tf" && echo "   ✅ 可读写" || echo "   ❌ 失败"
  echo ""
}

# ============================================================
case "${1:-help}" in
  clean)  do_clean ;;
  setup)  do_setup ;;
  start)  do_start ;;
  stop)   do_stop ;;
  status) do_status ;;
  tui)    do_tui ;;
  logs)   do_logs "$2" ;;
  test)   do_test ;;
  *)
    echo ""
    echo "用法: bash $0 <command>"
    echo ""
    echo "  clean    清理旧残留"
    echo "  setup    部署8个实例（独立API Key）"
    echo "  start    启动"
    echo "  stop     停止"
    echo "  status   状态（含Key指纹）"
    echo "  tui      连接Leader"
    echo "  logs <agent>  日志"
    echo "  test     测试通信"
    echo ""
    echo "流程: clean → setup → start → status → test → tui"
    ;;
esac
