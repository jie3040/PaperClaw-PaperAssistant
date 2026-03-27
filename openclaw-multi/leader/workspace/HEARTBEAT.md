# 心跳检查 — 每10分钟执行一次

## 执行指令

```bash
echo "===== $(date '+%H:%M') 心跳 =====" && \
echo "--- 项目文件 ---" && \
for d in outline drafts figures reviews final user_materials; do
  count=$(ls SHARED/$d/ 2>/dev/null | wc -l)
  echo "  $d/: ${count} 个文件"
done && \
echo "--- Agent 状态 ---" && \
for p in 18800 18810 18820 18830 18840 18850 18860 18870 18880; do
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 http://127.0.0.1:$p/health)
  [ "$code" = "200" ] && s="✅" || s="❌"
  echo "  :$p $s"
done && \
echo "--- 错误检查 ---" && \
for agent in leader surveyor ideator architect writer reviewer artist editor checker; do
  LOG="$HOME/.openclaw-multi/$agent/logs/gateway-$(date +%Y%m%d).log"
  [ -f "$LOG" ] && ERR=$(tail -30 "$LOG" | grep -c "error=terminated" || true) && [ "$ERR" -gt 0 ] && echo "  ⚠️ $agent: ${ERR}个terminated"
done && echo "--- 完毕 ---"
```

## 报告规则
- 全部正常 → 回复 **HEARTBEAT_OK**（一个词，不要多说）
- 发现异常 → 简短报告（1-2句话），如 "writer 离线，建议 restart-agent writer"
- **不要**每次都给用户发消息
