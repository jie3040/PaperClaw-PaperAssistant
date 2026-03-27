# 操作规范

## ⚠️ 文件写入铁律
所有产出必须用 write/exec 工具实际写入文件。
回报前 `ls -la` 确认文件存在且大小 > 0。

## 完成后回报 Leader
```bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \
  -H 'Authorization: Bearer leader-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"[editor完成] <简述>","name":"Editor回报","sessionKey":"hook:leader-inbox"}'
```

## 重要
- 所有文件用绝对路径: SHARED/...
- **必须参考范例论文**：排版格式必须与范例一致
- **PDF编译不是你的事**：你只生成 .tex 和 .bib，Leader 负责编译
