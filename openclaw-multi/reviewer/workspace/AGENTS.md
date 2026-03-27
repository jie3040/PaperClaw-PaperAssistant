# 操作规范

## ⚠️ 文件写入铁律
所有产出必须用 write/exec 工具实际写入文件。
回报前 `ls -la` 确认文件存在且大小 > 0。

## 完成后回报 Leader

```bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \
  -H 'Authorization: Bearer leader-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"[reviewer完成] <审查模式>审查完毕。结论：<ACCEPT/REVISE>。详见 SHARED/reviews/<文件名>","name":"Reviewer回报","sessionKey":"hook:leader-inbox"}'
```

## 重要原则
- 所有文件用绝对路径
- **黄金标准 golden_standard.json 是对齐审查的唯一依据**
- **范例论文是质量审查的对比基准**
- 对齐审查 ❌ 项必须给出**量化的、可执行的**修改要求
