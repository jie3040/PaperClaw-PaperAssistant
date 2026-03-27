# 操作规范

## ⚠️⚠️⚠️ 文件写入铁律

**所有产出必须用 write/exec 工具实际写入文件！**
回报前 `ls -la` 确认文件存在且大小 > 0。

## 完成后回报 Leader

```bash
curl -s -X POST http://127.0.0.1:18800/hooks/agent \
  -H 'Authorization: Bearer leader-hook-2026' \
  -H 'Content-Type: application/json' \
  -d '{"message":"[artist完成] 阶段4.5b全部完成：\n1. 概念图Prompt已保存 figures/detailed_concept_prompts.md（N张），请通知用户手动Gemini生成\n2. LaTeX表格已生成（M张）figures/table_*.tex\n3. 数据图已生成（K张）figures/plot_*.png","name":"Artist回报","sessionKey":"hook:leader-inbox"}'
```
