# Selected Idea: VibSemAlign

**选定时间**：2026-04-03 16:43

## 核心创新
双模态对齐模块，通过对比学习将振动频谱图与语义文本显式对齐，支持零样本跨域故障推理。

## 技术路线
1. 振动信号 → 时频谱图 + 语义 Prompt
2. VLM（LLaVA/GPT-4V）微调 + 振动-语义对比损失
3. 跨注意力解码器融合推理
4. 元学习（MAML）快速跨域适应
5. 在 CWRU、Paderborn 数据集评估

## 预期贡献
- 跨域精度比 MMFault/VLM-IFD 提升 15-20%
- 传统 CNN/Transformer 少样本场景下的显著超越
- 首个针对工业诊断的 MLLM 适配协议

## 目标期刊
IEEE Transactions on Instrumentation and Measurement
