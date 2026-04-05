# 文献调研精简摘要（阶段1.5）

## 主题：多模态大模型智能故障诊断

### a) MLLM/LLM/VLM 用于故障诊断（核心方向）
- MMFault(Zhang,2024): VLM+振动谱图零样本故障诊断95%准确率
- LLM4FD(Li,2024,TII): GPT-4适配工业序列数据跨机器故障定位
- VLM-IFD(Zhao,2025,TIM): 视觉语言预训练跨模态推理，低数据提升15%
- MM-IFD(Xu,2025): 振动谱图+文本知识库对齐
- FaultGPT(Liu,2024): 生成式MLLM合成故障解释

### b) 零样本/少样本
- ViT+原型网络(Hoang,2023): 零样本轴承故障
- MAML元学习(Wen,2022): 5样本快速适配
- LLM零样本推理(Kim,2025): 文本描述驱动

### c) 跨域故障诊断
- 对抗训练域适应(Wen,2020,MSSP)
- MMD域适应(Li,2021,TII)
- GZSL语义迁移(Chen,2023)

### d) 传统深度学习基线
- CNN多尺度(Verstraete,2020)、Transformer(Li,2022,TIM)
- GAN数据增强(Zhang,2020)、混合CNN-Transformer(Chen,2024)

**关键研究空白**：现有方法要么用单模态信号，要么用MLLM但未充分利用振动+语义双模态对齐；跨域泛化能力不足。
