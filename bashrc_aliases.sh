# ============================================================
# PaperClaw 快捷指令
# 用法：cat bashrc_aliases.sh >> ~/.bashrc && source ~/.bashrc
# ============================================================

# ---- 核心管理 ----
alias paper-start="bash ~/paper-agents.sh start"
alias paper-stop="bash ~/paper-agents.sh stop"
alias paper-status="bash ~/paper-agents.sh status"
alias paper-test="bash ~/paper-agents.sh test"
alias paper-tui="OPENCLAW_STATE_DIR=~/.openclaw-multi/leader OPENCLAW_CONFIG_PATH=~/.openclaw-multi/leader/openclaw.json openclaw tui"
alias paper-watch="tail -f ~/.openclaw-multi/*/logs/*.log"

# ---- 各 Agent TUI ----
alias tui-leader="OPENCLAW_STATE_DIR=~/.openclaw-multi/leader OPENCLAW_CONFIG_PATH=~/.openclaw-multi/leader/openclaw.json openclaw tui"
alias tui-surveyor="OPENCLAW_STATE_DIR=~/.openclaw-multi/surveyor OPENCLAW_CONFIG_PATH=~/.openclaw-multi/surveyor/openclaw.json openclaw tui"
alias tui-ideator="OPENCLAW_STATE_DIR=~/.openclaw-multi/ideator OPENCLAW_CONFIG_PATH=~/.openclaw-multi/ideator/openclaw.json openclaw tui"
alias tui-architect="OPENCLAW_STATE_DIR=~/.openclaw-multi/architect OPENCLAW_CONFIG_PATH=~/.openclaw-multi/architect/openclaw.json openclaw tui"
alias tui-writer="OPENCLAW_STATE_DIR=~/.openclaw-multi/writer OPENCLAW_CONFIG_PATH=~/.openclaw-multi/writer/openclaw.json openclaw tui"
alias tui-reviewer="OPENCLAW_STATE_DIR=~/.openclaw-multi/reviewer OPENCLAW_CONFIG_PATH=~/.openclaw-multi/reviewer/openclaw.json openclaw tui"
alias tui-artist="OPENCLAW_STATE_DIR=~/.openclaw-multi/artist OPENCLAW_CONFIG_PATH=~/.openclaw-multi/artist/openclaw.json openclaw tui"
alias tui-editor="OPENCLAW_STATE_DIR=~/.openclaw-multi/editor OPENCLAW_CONFIG_PATH=~/.openclaw-multi/editor/openclaw.json openclaw tui"
alias tui-checker="OPENCLAW_STATE_DIR=~/.openclaw-multi/checker OPENCLAW_CONFIG_PATH=~/.openclaw-multi/checker/openclaw.json openclaw tui"

# ---- 重启单个 Agent ----
restart-agent() {
  local agent=$1
  local -A AGENT_PORTS=([leader]=18800 [surveyor]=18810 [ideator]=18820 [architect]=18830 [writer]=18840 [reviewer]=18850 [artist]=18860 [editor]=18870 [checker]=18880)
  local port=${AGENT_PORTS[$agent]}
  local dir="$HOME/.openclaw-multi/$agent"

  if [ -z "$port" ]; then
    echo "❌ 无此Agent。可选: ${!AGENT_PORTS[*]}"
    return 1
  fi

  echo -n "⏹  停止 $agent :$port ..."
  pid=$(lsof -ti :$port 2>/dev/null)
  [ -n "$pid" ] && kill -9 $pid && sleep 2
  echo " done"

  echo -n "🚀 启动 $agent :$port ..."
  OPENCLAW_STATE_DIR="$dir" \
  OPENCLAW_CONFIG_PATH="$dir/openclaw.json" \
    nohup /usr/bin/node $HOME/.npm-global/lib/node_modules/openclaw/dist/index.js gateway run \
    --port "$port" --bind loopback --token "${agent}-gw-2026" \
    >> "$dir/logs/gateway-$(date +%Y%m%d).log" 2>&1 &
  echo " PID $!"

  sleep 5
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 http://127.0.0.1:$port/health)
  [ "$code" = "200" ] && echo "✅ $agent :$port 在线" || echo "❌ $agent :$port 离线 (HTTP $code)"
}

# ---- API 线路切换 ----
switch-api() {
  local agent=$1 provider=$2
  local src="$HOME/.openclaw-multi/openclaw_config/$agent/$provider/openclaw.json"
  local dst="$HOME/.openclaw-multi/$agent/openclaw.json"
  if [ ! -f "$src" ]; then
    echo "❌ 找不到: $src"
    echo "   可用: $(ls $HOME/.openclaw-multi/openclaw_config/$agent/ 2>/dev/null || echo '无')"
    return 1
  fi
  cp "$src" "$dst"
  echo "✅ $agent → $provider"
}

alias api-leader-fu="switch-api leader fucheers"
alias api-leader-or="switch-api leader openrouter"
alias api-surveyor-fu="switch-api surveyor fucheers"
alias api-surveyor-or="switch-api surveyor openrouter"
alias api-ideator-fu="switch-api ideator fucheers"
alias api-ideator-or="switch-api ideator openrouter"
alias api-architect-fu="switch-api architect fucheers"
alias api-architect-or="switch-api architect openrouter"
alias api-writer-fu="switch-api writer fucheers"
alias api-writer-or="switch-api writer openrouter"
alias api-reviewer-fu="switch-api reviewer fucheers"
alias api-reviewer-or="switch-api reviewer openrouter"
alias api-artist-fu="switch-api artist fucheers"
alias api-artist-or="switch-api artist openrouter"
alias api-editor-fu="switch-api editor fucheers"
alias api-editor-or="switch-api editor openrouter"
alias api-checker-fu="switch-api checker fucheers"
alias api-checker-or="switch-api checker openrouter"

alias api-all-fu="for a in leader surveyor ideator architect writer reviewer artist editor checker; do switch-api \$a fucheers; done"
alias api-all-or="for a in leader surveyor ideator architect writer reviewer artist editor checker; do switch-api \$a openrouter; done"

# ---- 激活 Worker Agents ----
wake-agents() {
  echo "🔔 激活所有 Agent..."
  local -A PORTS=([surveyor]=18810 [ideator]=18820 [architect]=18830 [writer]=18840 [reviewer]=18850 [artist]=18860 [editor]=18870 [checker]=18880)
  local -A TOKENS=([surveyor]=surveyor-hook-2026 [ideator]=ideator-hook-2026 [architect]=architect-hook-2026 [writer]=writer-hook-2026 [reviewer]=reviewer-hook-2026 [artist]=artist-hook-2026 [editor]=editor-hook-2026 [checker]=checker-hook-2026)

  for agent in surveyor ideator architect writer reviewer artist editor checker; do
    port=${PORTS[$agent]}
    token=${TOKENS[$agent]}
    echo -n "  $agent :$port ..."
    code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 15 \
      -X POST http://127.0.0.1:$port/hooks/agent \
      -H "Authorization: Bearer $token" \
      -H "Content-Type: application/json" \
      -d "{\"message\":\"请随时接收leader的任务请求并执行\",\"name\":\"激活\",\"sessionKey\":\"hook:activate\"}")
    [ "$code" = "200" ] && echo " ✅" || echo " ❌ HTTP $code"
    sleep 2
  done
  echo "🔔 全部激活完成"
}

# ---- 清空会话 ----
clear-agent() {
  local agent=$1
  local dir="$HOME/.openclaw-multi/$agent"
  if [ ! -d "$dir" ]; then
    echo "❌ 无此Agent"
    return 1
  fi
  echo -n "🗑️  清空 $agent 会话..."
  rm -f "$dir"/agents/main/sessions/*.jsonl 2>/dev/null
  if [ -f "$dir/agents/main/sessions/sessions.json" ]; then
    python3 -c "
import json
p='$dir/agents/main/sessions/sessions.json'
with open(p) as f: d=json.load(f)
before=len(d)
d={k:v for k,v in d.items() if not k.startswith('hook:')}
with open(p,'w') as f: json.dump(d,f,indent=2)
print(f' 删除{before-len(d)}个hook条目')
" 2>/dev/null || echo ""
  fi
  echo " done. 请 restart-agent $agent"
}

clear-all-agents() {
  for agent in leader surveyor ideator architect writer reviewer artist editor checker; do
    [ -d "$HOME/.openclaw-multi/$agent" ] && clear-agent $agent
  done
  echo "✅ 全部清空。请 paper-stop && paper-start 重启"
}
