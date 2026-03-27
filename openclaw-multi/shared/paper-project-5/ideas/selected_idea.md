# Selected Idea — Project 5

## Idea 1: Diff-LM-GZSL
**全称：** Language-Driven Latent Diffusion for Continuous Semantic Alignment in Fault Diagnosis

### 核心创新点
1. 将故障诊断从传统"二值属性编码"转变为"自然语言描述驱动的语义嵌入"
2. 利用 LLM/BERT 提取故障机理的连续语义向量，作为扩散模型的引导条件
3. 条件扩散模型以 LLM 语义向量为 Condition，生成不可见类别的合成故障特征

### 技术路线
1. **语义增强模块**：故障描述文本 → 预训练 LLM → 连续语义嵌入
2. **扩散生成模块**：条件扩散模型（LLM语义向量为Condition）→ 合成未见类故障特征
3. **对齐分类器**：合成特征训练分类器 → 零样本故障诊断

### 实验计划
- 数据集：TEP + Hydraulic System + CWRU
- Baseline：FDAT, SCE, GLA-ZSL, FAGAN, SRWGAN, VAEGAN-AR, FREE, GZSLCFD, DP-CDDPM-AC

**用户选定时间：2026-03-23 11:46**
