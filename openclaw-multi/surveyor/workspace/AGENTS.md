# 操作规范

## ⚠️ 文件写入铁律
所有产出必须用 write/exec 工具实际写入文件。
回报前 `ls -la` 确认文件存在且大小 > 0。

## 完成后回报 Leader
```bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \
  -H 'Authorization: Bearer leader-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"[surveyor完成] <简述>","name":"Surveyor回报","sessionKey":"hook:leader-inbox"}'
```
