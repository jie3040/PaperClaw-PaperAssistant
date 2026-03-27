# 文献调研精简摘要 — CycleGAN 不平衡故障诊断

> 原始文献：40篇，覆盖4个方向。完整文献见 survey_report.md。

---

## 一、核心文献（必引）

### CycleGAN 故障诊断（15篇，重点6篇）

1. **Wang et al. (2024) [CAC-CycleGAN-WGP]**：条件辅助分类器CycleGAN + Wasserstein距离梯度惩罚，从多数类生成少数类故障信号。两种基准数据集验证，提出堆叠自编码器评估生成质量。**→ 本项目直接基础工作**
2. **Li et al. (2024) [FP-CycleGAN]**：无监督特征保持CycleGAN，红外热成像不平衡轴承故障检测，引入特征保持损失
3. **Yu et al. (2025)**：CycleGAN变体+物理建模，仿真→真实信号转换，零真实故障样本诊断
4. **Li et al. (2025)**：CycleGAN不平衡轴承故障诊断，旋转机械振动验证
5. **Xiao et al. (2025)**：1D-CycleGAN + 数字孪生，PU数据集验证
6. **Guo et al. (2025) [SDCGAN]**：CycleGAN单域泛化故障诊断

**应用模式**：跨工况迁移 / 少数类增强 / 仿真→真实 / 多模态增强

### GAN 变体数据增强（13篇，重点5篇）

- **WGAN-GP**：Gao(2019)首次用于工业故障诊断；Tian(2024)残差WGAN-GP
- **ACGAN**：Shao(2019)首次引入；Fu(2024)Transformer增强ACGAN
- **融合趋势**：CWGAN-GP、ACWGAN-GP、BCTGAN、AVAEGAN
- **关键发现**：WGAN-GP稳定训练+梯度传播；ACGAN条件生成；CycleGAN无配对优势

### 不平衡诊断综述（7篇，重点3篇）

- **Pu et al. (2024)**：GAN不平衡故障诊断技术综述（系统梳理）
- **Li et al. (2023)**：智能故障诊断不平衡学习方法系统综述
- **Zhang et al. (2025)**：小样本不平衡问题综述

### 基础理论（5篇）
- CycleGAN原始论文 + 条件GAN + Wasserstein GAN + GAN训练理论

---

## 二、研究趋势

1. **多方法融合**：CycleGAN + WGAN-GP + ACGAN（如CAC-CycleGAN-WGP）
2. **物理模型结合**：动力学模型 + CycleGAN 仿真→真实
3. **Transformer增强**：注意力机制提高生成质量
4. **轻量化**：边缘部署模型
5. **跨域泛化**：单域不平衡→跨域泛化

## 三、现存挑战

1. 生成样本质量评估缺乏统一标准
2. 极端不平衡（1:100+）性能下降
3. 多故障耦合场景
4. 在线诊断实时性
5. 训练-实际工况域偏移

## 四、与本项目关系

本项目主题"CAC-CycleGAN-WGP不平衡故障诊断"直接基于Wang et al.(2024)的工作。调研显示：
- CycleGAN在不平衡故障诊断中已有较多应用，但CAC-CycleGAN-WGP的融合策略（条件分类器+Wasserstein+梯度惩罚）是最新代表
- 物理模型结合、Transformer增强、跨域泛化是可探索的创新方向
- 生成质量评估方法仍是开放问题，可作为论文贡献点
