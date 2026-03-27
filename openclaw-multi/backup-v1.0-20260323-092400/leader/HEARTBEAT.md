# 心跳检查 — 每10分钟执行一次

## 执行指令
```bash
echo "===== $(date '+%H:%M') 心跳 =====" && \
echo "--- 项目文件 ---" && \
for d in outline drafts figures reviews final; do
  count=$(ls SHARED/$d/ 2>/dev/null | wc -l)
  echo "  $d/: ${count} 个文件"
done && \
echo "--- Agent 状态 ---" && \
for p in 18800 18810 18820 18830 18840 18850 18860 18870; do
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 http://127.0.0.1:$p/health)
  [ "$code" = "200" ] && s="✅" || s="❌"
  echo "  :$p $s"
done && \
echo "--- 错误检查 ---" && \
for agent in leader surveyor ideator architect writer reviewer artist editor; do
  LOG="$HOME/.openclaw-multi/$agent/logs/gateway-$(date +%Y%m%d).log"
  [ -f "$LOG" ] && ERR=$(tail -30 "$LOG" | grep -c "error=terminated" || true) && [ "$ERR" -gt 0 ] && echo "  ⚠️ $agent: ${ERR}个terminated"
done && echo "--- 完毕 ---"
```

## 报告规则
- 全部正常 → 回复 **当前状态一切正常**（一个词，不要多说）
- 发现异常 → 简短报告（1-2句话），如"writer 离线，建议 restart-agent writer"
- 发现有新的产出或者agents 回复 → 报告给 user,并且给出下一步建议
- **每次都给用户发消息**