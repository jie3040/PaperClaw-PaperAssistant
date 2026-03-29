# 文献调研精简版 — Zero-Shot Fault Diagnosis + Transformer

**主题**：Zero-shot fault diagnosis based on transformer-based methods  
**期刊**：IEEE TIM | **文献数**：45篇（2019-2026）

---

## 1. Zero-Shot Learning for FD（12篇）
- 主流方法：属性嵌入、语义空间映射、CycleGAN仿真数据生成、数字孪生
- 代表作：Zhang2019(属性嵌入ZSL)、Zhao2020(属性迁移+mVAE)、Chen2022(1D-CNN+ZSL)、Zhang2023(复合故障语义)、Li2025(仿真驱动广义ZSL)
- 局限：语义属性依赖人工定义、复合故障覆盖不足、跨设备泛化弱

## 2. Transformer-Based FD（12篇）
- 主流方法：TST时序Transformer、ViT视觉Transformer、频率通道注意力、域协作多模态Transformer
- 代表作：Chen2021(首个Transformer+FD)、Tang2022(TST)、Wang2022(集成ViT)、Ding2023(注意力不确定性)、Li2023(Transformer+MAML)
- 局限：计算复杂度高、依赖时频图预处理、边缘部署困难

## 3. Domain Adaptation / Transfer Learning（10篇）
- 主流方法：MMD对齐、域对抗训练、域泛化、图卷积域适应
- 代表作：Lu2019(深度域适应)、Guo2019(卷积迁移)、Zhao2022(判别式迁移)、Zhang2024(元学习+GCN)
- 局限：极端域偏移适应差、类别不平衡未考虑

## 4. Data-Driven FD General（9篇）
- 经典综述：Lei2020(ML路线图,3000+引用)、Li2022(DL综述)、Jia2016(开创性DNN+FD)
- 趋势：从CNN/RNN→Transformer/GNN→LLM演进

## 5. Foundation Models / LLM for FD（5篇）
- 代表作：FD-LLM(Llama3故障诊断)、FaultGPT(VLM问答)、LLM可解释诊断
- 潜力：零样本推理、知识增强、可解释性
- 局限：推理延迟高、幻觉问题、工业验证不足

---

## 关键研究空白（创新机会）

1. **Transformer + ZSL 深度融合**：现有ZSL多用CNN骨干，Transformer自注意力+语义嵌入的结合几乎空白
2. **跨设备零样本诊断**：现有方法限于同类设备，跨机械系统ZSL未解决
3. **LLM增强ZSL**：利用LLM通用知识作为语义引擎，实现无故障样本诊断
4. **鲁棒性与可信诊断**：噪声/缺失/退化等真实场景验证不足
5. **轻量化边缘部署**：Transformer计算开销大，需知识蒸馏/压缩
6. **多模态融合**：振动+声学+温度+电流的多源Transformer ZSL框架空白
