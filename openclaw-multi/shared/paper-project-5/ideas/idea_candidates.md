# 候选研究 Idea 列表 — Project 5
## 研究主题：基于扩散模型与语言模型的零样本故障诊断 (ZSFD)

本项目旨在结合生成式扩散模型（Diffusion Model）的强大分布建模能力与语言模型（Language Model/CLIP/LLM）的宽泛语义表征能力，解决零样本场景下的域偏移与属性表达不足问题。以下为 3 个针对 IEEE TIM 期刊定位生成的创新 Idea：

---

### Idea 1: Diff-LM-GZSL (Diffusion-Language Model Guided Zero-Shot Learning)
**全称：** Language-Driven Latent Diffusion for Continuous Semantic Alignment in Fault Diagnosis
1. **核心创新点**：
   - 将故障诊断从传统的“二值属性编码”转变为“自然语言描述驱动的语义嵌入”。
   - 利用 LLM（如 GPT-4 或 BERT）提取故障机理的连续特征向量，作为扩散模型的引导条件。
2. **技术路线**：
   - **语义增强模块**：输入故障描述文本（如 "bearing outer race wear with high-frequency vibration"），通过预训练 LLM 提取语义嵌入。
   - **扩散生成模块**：构建条件扩散模型，以 LLM 语义向量为 Condition，生成不可见类别的合成故障特征。
   - **对齐分类器**：利用合成特征训练最终分类器，实现从信号空间到语义空间的零样本映射。
3. **与现有方法的差异**：
   - 相较于 **DP-CDDPM-AC**（使用预定义的属性向量），本方法引入了非结构化文本知识，语义信息更丰富，解决了专家定义属性的盲区。
4. **预期优势**：利用 LLM 的通用知识弥补了工业数据中不可见类别的语义缺失，生成的特征能更好地覆盖测试集的分布。
5. **可行性评估**：高（LLM 预训练模型成熟，扩散模型生成特征已有先例）。
6. **与 IEEE TIM 匹配度**：高（强调测量系统中的智能化诊断与先进建模）。

---

### Idea 2: CLIP-Diff-Align (CLIP-Diffusion Semantic Alignment Network)
**全称：** Cross-Modal Contrastive Diffusion for Zero-Shot Bearing Fault Diagnosis
1. **核心创新点**：
   - 引入 CLIP (Contrastive Language-Image Pre-training) 的对齐思想，构建“振动信号-文本语义”的双模态对比学习框架。
   - 扩散模型不仅用于生成特征，还用于在生成过程中纠正跨域偏移。
2. **技术路线**：
   - **视觉-文本对齐**：将振动信号转化为格拉姆角场（GAF）图像，利用 CLIP 的图像/文本编码器进行预对齐。
   - **精细化扩散生成**：在 CLIP 约束的潜在空间内，利用扩散模型细化不可见类别的特征分布。
   - **域自适应模块**：通过对比损失函数减少已知类和未知类之间的分布间隙。
3. **与现有方法的差异**：
   - 相较于 **CycleGAN-SD**（简单的循环一致性），本方法利用了大规模预训练模型的跨模态先验知识，解决了 GAN 训练不稳定的问题。
4. **预期优势**：CLIP 的多模态先验能够显着提升零样本场景下的分类边界清晰度，对复合故障识别效果更好。
5. **可行性评估**：中（需要针对工业信号微调 CLIP 编码器，对计算资源有一定要求）。
6. **与 IEEE TIM 匹配度**：高（符合 TIM 对多源信息融合与精密检测的需求）。

---

### Idea 3: TDCD-Net (Text-Driven Conditional Diffusion Network)
**全称：** Text-Conditioned Variational Diffusion for Fine-Grained Zero-Shot Fault Diagnosis
1. **核心创新点**：
   - 提出一种“文本引导的变分扩散”架构，将故障生成的确定性部分（机理描述）与随机部分（噪声/环境干扰）解耦。
   - 设计了一种针对工业现场噪声的鲁棒性扩散策略。
2. **技术路线**：
   - **条件解耦模块**：通过 LLM 获取故障文本特征。
   - **扩散演化流程**：通过扩散模型模拟从噪声到特定故障信号特征的逆过程，其中文本特征控制生成方向。
   - **不确定性估计**：在生成过程中引入变分推理，量化不可见类别预测的置信度。
3. **与现有方法的差异**：
   - 与 **DP-CDDPM-AC** 相比，TDCD-Net 采用了更先进的条件注入机制（Cross-Attention），显著提升了信号特征生成的真实度。
4. **预期优势**：能生成物理含义更明确的合成样本，即使在信噪比极低的 TEP 数据集或液压系统数据集上也能保持较高的鲁棒性。
5. **可行性评估**：高（技术架构清晰，易于在现有平台上实现）。
6. **与 IEEE TIM 匹配度**：中（更侧重于算法创新与鲁棒性分析）。

---
**建议实验计划：**
- 数据集：TEP (Tennessee Eastman Process) + Hydraulic System + CWRU
- 对比 Baseline：DP-CDDPM-AC, CycleGAN-SD, FAGAN, FREE 等。
- 核心指标：Zero-Shot Top-1 Accuracy, Macro-F1, GZSL Accuracy.
