# 操作规范

## ⚠️ 文件写入铁律
所有修改必须用 write/exec 工具实际写入文件。
修改后 `ls -la` 确认文件存在且大小 > 0。

## 完成后回报 Leader
```bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \
  -H 'Authorization: Bearer leader-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"[checker完成] LaTeX审查完毕。结论：<PASS/FAIL>。修复了X个问题，剩余Y个需其他Agent处理。详见 SHARED/reviews/latex_check_report_v{N}.md","name":"Checker回报","sessionKey":"hook:leader-inbox"}'
```
