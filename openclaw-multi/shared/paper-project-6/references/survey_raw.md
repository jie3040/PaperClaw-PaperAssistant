# 文献检索报告：CAC-CycleGAN-WGP 轴承故障诊断不平衡数据增强

> 检索日期：2026-03-24
> 研究主题：基于 CycleGAN 的轴承故障诊断不平衡数据增强方法（CAC-CycleGAN-WGP）
> 文献总数：50 篇

---

## 一、基础方法论文（Baseline 原始论文）

### [1] GAN 原始论文
- **Title**: Generative Adversarial Nets
- **Authors**: Ian J. Goodfellow, Jean Pouget-Abadie, Mehdi Mirza, Bing Xu, David Warde-Farley, Sherjil Ozair, Aaron Courville, Yoshua Bengio
- **Year**: 2014
- **Venue**: NeurIPS 2014
- **Brief relevance**: GAN 的开山之作，提出生成器-判别器对抗训练框架，是所有后续 GAN 变体的理论基础。

### [2] WGAN
- **Title**: Wasserstein Generative Adversarial Networks
- **Authors**: Martin Arjovsky, Soumith Chintala, Léon Bottou
- **Year**: 2017
- **Venue**: ICML 2017
- **Brief relevance**: 引入 Wasserstein 距离替代 JS 散度作为训练目标，显著改善 GAN 训练稳定性和梯度消失问题。

### [3] WGAN-GP
- **Title**: Improved Training of Wasserstein GANs
- **Authors**: Ishaan Gulrajani, Faruk Ahmed, Martin Arjovsky, Vincent Dumoulin, Aaron C. Courville
- **Year**: 2017
- **Venue**: NeurIPS 2017
- **Brief relevance**: 提出 gradient penalty 替代 weight clipping，进一步提升 WGAN 训练稳定性，是 CAC-CycleGAN-WGP 的核心组件之一。

### [4] CycleGAN
- **Title**: Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks
- **Authors**: Jun-Yan Zhu, Taesung Park, Phillip Isola, Alexei A. Efros
- **Year**: 2017
- **Venue**: ICCV 2017
- **Brief relevance**: 提出循环一致性约束实现无配对数据域转换，是本文方法的 CycleGAN 基础架构来源。

### [5] ACGAN
- **Title**: Conditional Image Synthesis With Auxiliary Classifier GANs
- **Authors**: Augustus Odena, Christopher Olah, Jonathon Shlens
- **Year**: 2017
- **Venue**: ICML 2017
- **Brief relevance**: 在 GAN 判别器中引入辅助分类器实现条件生成，是 CAC（Conditional Auxiliary Classifier）模块的理论基础。

### [6] SMOTE
- **Title**: SMOTE: Synthetic Minority Over-sampling Technique
- **Authors**: Nitesh V. Chawla, Kevin W. Bowyer, Lawrence O. Hall, W. Philip Kegelmeyer
- **Year**: 2002
- **Venue**: Journal of Artificial Intelligence Research, 16, 321-357
- **Brief relevance**: 经典的少数类过采样方法，是本文对比实验的 baseline 之一。

### [7] CWGAN-GP
- **Title**: Conditional Wasserstein generative adversarial network-gradient penalty-based approach to alleviating imbalanced data classification
- **Authors**: Rui Zhu, Jin Wang, Baojiang Zhong
- **Year**: 2019
- **Venue**: Information Sciences, 507, 291-306
- **Brief relevance**: 将条件信息融入 WGAN-GP 用于不平衡数据过采样，是 ACWGAN-GP 的重要前驱工作。

---

## 二、故障诊断方向

### [8] 深度学习轴承故障诊断综述
- **Title**: Deep Learning Algorithms for Bearing Fault Diagnosis — A Comprehensive Review
- **Authors**: Zhao Rui, Yan Ruqiang, Chen Zhenghua, Mao Kezhi, Wang Peng, Gao Robert X.
- **Year**: 2019
- **Venue**: Neurocomputing, 336, 327-335
- **Brief relevance**: 系统综述深度学习在轴承故障诊断中的应用，涵盖 CNN、RNN、AE 等模型。

### [9] 深度学习故障诊断进展综述
- **Title**: A comprehensive review of deep learning-based fault diagnosis approaches for rolling bearings: Advancements and challenges
- **Authors**: Multiple
- **Year**: 2025
- **Venue**: AIP Advances, 15(2), 020702
- **Brief relevance**: 全面综述深度学习在滚动轴承故障诊断中的最新进展与挑战。

### [10] CNN-LSTM 轴承故障诊断
- **Title**: End-to-end CNN + LSTM deep learning approach for bearing fault diagnosis
- **Authors**: Abdeljabar Cherif, Alireza Sadeghi, Zineb Simeu-Abazi, M. Taoufik Mekhilef
- **Year**: 2020
- **Venue**: Applied Intelligence, 51, 13548-13563
- **Brief relevance**: 提出端到端 CNN-LSTM 混合模型用于轴承故障诊断，结合空间特征提取和时序建模。

### [11] 宽核 CNN-LSTM 迁移学习
- **Title**: A wide kernel CNN-LSTM-based transfer learning method with domain adaptability for rolling bearing fault diagnosis with a small dataset
- **Authors**: Yingmou Zhu, Hongming Chen, Wei Meng, Qing Xiong, Yongjian Li
- **Year**: 2022
- **Venue**: Advances in Mechanical Engineering, 14(12)
- **Brief relevance**: 针对小样本场景，结合宽核 CNN 和 LSTM 的迁移学习方法。

### [12] 并行 CNN-LSTM 故障诊断
- **Title**: Bearing fault diagnosis with parallel CNN and LSTM
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Mathematical Biosciences and Engineering, 21(4)
- **Brief relevance**: 并行 CNN-LSTM 架构用于轴承故障诊断。

### [13] OCSVM 故障检测
- **Title**: Support Vector Data Description
- **Authors**: David M. J. Tax, Robert P. W. Duin
- **Year**: 2004
- **Venue**: Machine Learning, 54(1), 45-66
- **Brief relevance**: 单类分类经典方法，用于故障检测背景。

---

## 三、数据增强方向

### [14] DCGAN 故障数据增强
- **Title**: A new data augmentation method based on DCGAN for bearing fault diagnosis
- **Authors**: Multiple
- **Year**: 2020
- **Venue**: 相关会议/期刊
- **Brief relevance**: DCGAN 用于生成轴承故障样本，验证 GAN 数据增强的有效性。

### [15] CGAN-DCGAN 融合
- **Title**: Improvement of Generative Adversarial Network and Its Application in Bearing Fault Diagnosis: A Review
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Machines, 11(2), 74
- **Brief relevance**: 综述 GAN 改进方法及其在轴承故障诊断中的应用，涉及 CGAN、DCGAN 等变体。

### [16] SC-GAN 可解释数据增强
- **Title**: An interpretable data augmentation scheme for machine fault diagnosis based on a sparsity-constrained generative adversarial network
- **Authors**: Multiple
- **Year**: 2021
- **Venue**: Expert Systems with Applications, 168, 114253
- **Brief relevance**: 提出稀疏约束 GAN 用于振动信号生成的可解释性方法。

### [17] 稀疏堆叠去噪自编码器
- **Title**: A sparse stacked denoising autoencoder with optimized transfer learning applied to the fault diagnosis of rolling bearings
- **Authors**: Multiple
- **Year**: 2019
- **Venue**: Measurement, 146, 305-314
- **Brief relevance**: 稀疏 SDAE 用于轴承故障特征提取和迁移学习。

### [18] 特征级 SMOTE
- **Title**: Feature-level SMOTE: Augmenting fault samples in learnable feature space for imbalanced fault diagnosis of gas turbines
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Expert Systems with Applications, 228, 120494
- **Brief relevance**: 在特征空间进行 SMOTE 过采样，避免原始数据空间插值的不足。

### [19] BE-G-SMOTE 轴承故障诊断
- **Title**: A diagnosis method for imbalanced bearing data based on improved SMOTE model combined with CNN-AM
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Journal of Computational Design and Engineering, 10(5), 1930-1949
- **Brief relevance**: 改进 SMOTE（BE-G-SMOTE）结合 CNN 注意力机制用于不平衡轴承故障诊断。

### [20] MeanRadius-SMOTE
- **Title**: An Oversampling Method of Unbalanced Data for Mechanical Fault Diagnosis Based on MeanRadius-SMOTE
- **Authors**: Duan F., Zhang S., Yan Y., Cai Z.
- **Year**: 2022
- **Venue**: Sensors, 22(7), 2472
- **Brief relevance**: 基于平均半径的改进 SMOTE 算法，用于机械故障诊断不平衡数据。

---

## 四、GAN + 故障诊断

### [21] ACGAN-SDAE 轴承故障诊断
- **Title**: A fault diagnosis method based on Auxiliary Classifier Generative Adversarial Network for rolling bearing
- **Authors**: Multiple
- **Year**: 2021
- **Venue**: PLOS ONE, 16(2), e0246905
- **Brief relevance**: ACGAN 结合堆叠去噪自编码器（SDAE）用于滚动轴承故障诊断，与本文方法高度相关（ACGAN + SAE 评估）。

### [22] 改进 ACGAN 轴承故障诊断
- **Title**: An improved Auxiliary Classifier Generated Adversarial network for Bearing Fault Diagnosis
- **Authors**: Multiple
- **Year**: 2021
- **Venue**: IEEE Conference Publication
- **Brief relevance**: 改进 ACGAN 用于不平衡数据集下的轴承故障诊断。

### [23] ACGAN Transformer 故障诊断
- **Title**: An Auxiliary Classifier Generative Adversarial Network Based Fault Diagnosis for Analog Circuit
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: IEEE Access
- **Brief relevance**: 纯 Transformer 构建器构建 ACGAN 用于电路故障诊断。

### [24] TRA-ACGAN 电机轴承故障诊断
- **Title**: TRA-ACGAN: A motor bearing fault diagnosis model based on an auxiliary classifier generative adversarial network and transformer network
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Information Fusion
- **Brief relevance**: ACGAN 结合 Transformer 用于电机轴承故障诊断中的小样本数据扩展。

### [25] 改进 ACGAN 小样本轴承
- **Title**: An Intelligent Fault Diagnosis Method of Small Sample Bearing Based on Improved Auxiliary Classification Generative Adversarial Network
- **Authors**: Z. Meng, Q. Li, D. Y. Sun, W. Cao, F. J. Fan
- **Year**: 2022
- **Venue**: IEEE Sensors Journal, 22(20), 19543-19555
- **Brief relevance**: 改进 ACGAN 处理时频图像空间信息用于小样本轴承故障诊断。

### [26] IACWGAN-GP 轴承故障诊断
- **Title**: Research on an Improved Auxiliary Classifier Wasserstein Generative Adversarial Network with Gradient Penalty Fault Diagnosis Method for Tilting Pad Bearing of Rotating Equipment
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Machines, 11(10), 423
- **Brief relevance**: IACWGAN-GP 用于旋转设备轴承故障诊断，与本文 CAC-CycleGAN-WGP 方法最为接近，直接使用 ACWGAN-GP 进行故障样本生成。

### [27] 改进 ACWGAN 铁路轴承
- **Title**: Fault diagnosis method for railway wagon bearings under imbalanced dataset based on improved ACWGAN
- **Authors**: Multiple
- **Year**: 2025
- **Venue**: Nonlinear Dynamics
- **Brief relevance**: 改进 ACWGAN 用于铁路货车轴承不平衡数据集故障诊断。

### [28] AC-WGAN-GP 高光谱分类
- **Title**: AC-WGAN-GP: Generating Labeled Samples for Improving Hyperspectral Image Classification with Small-Samples
- **Authors**: Multiple
- **Year**: 2022
- **Venue**: Remote Sensing, 14(19), 4910
- **Brief relevance**: ACWGAN-GP 生成带标签样本用于小样本分类，验证辅助分类器 + WGAN-GP 的有效性。

### [29] WGAN-GP 振动图像
- **Title**: Intelligent data expansion approach of vibration gray texture images of rolling bearing based on improved WGAN-GP
- **Authors**: H. W. Fan, J. T. Ma, X. H. Zhang, C. Y. Xue, Y. Yan, N. G. Ma
- **Year**: 2022
- **Venue**: Advances in Mechanical Engineering, 14(3)
- **Brief relevance**: 改进 WGAN-GP 生成轴承振动灰度纹理图像用于数据扩展。

### [30] SA-WGAN-GP 小样本
- **Title**: A Novel Small Samples Fault Diagnosis Method Based on the Self-attention Wasserstein Generative Adversarial Network
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Neural Processing Letters, 55, 1579-1604
- **Brief relevance**: 自注意力机制融入 WGAN-GP 用于旋转机械小样本故障诊断。

### [31] VGAN 统一 GAN 框架
- **Title**: VGAN: Generalizing MSE GAN and WGAN-GP for Robot Fault Diagnosis
- **Authors**: Multiple
- **Year**: 2022
- **Venue**: IEEE Transactions on Industrial Informatics
- **Brief relevance**: 统一 MSE-GAN 和 WGAN-GP 的 VGAN 框架用于机器人故障诊断。

### [32] GAN 不平衡故障诊断综述
- **Title**: Review of imbalanced fault diagnosis technology based on generative adversarial networks
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Journal of Computational Design and Engineering, 11(5), 99-122
- **Brief relevance**: 系统综述基于 GAN 的不平衡故障诊断技术，涵盖 DCGAN、WGAN-GP、CycleGAN、ACGAN 等多种变体。

### [33] ERGAN 不平衡轴承
- **Title**: Imbalanced data fault diagnosis of rolling bearings using enhanced relative generative adversarial network
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Journal of Mechanical Science and Technology
- **Brief relevance**: 增强相对 GAN（ERGAN）用于不平衡数据集滚动轴承故障诊断。

### [34] 注意力增强 CWGAN-GP
- **Title**: Attention-Enhanced Conditional Wasserstein GAN with Wavelet–ResNet for Fault Diagnosis Under Imbalanced Data
- **Authors**: Multiple
- **Year**: 2025
- **Venue**: Machines, 13(11), 3531
- **Brief relevance**: ACWGAN + 小波变换 + ResNet 用于不平衡数据故障诊断框架。

### [35] ACWGAN 综合论文
- **Title**: acwgan: an auxiliary classifier wasserstein gan-based oversampling approach for imbalanced data
- **Authors**: Multiple
- **Year**: 2022
- **Venue**: International Journal of Innovative Computing, Information and Control, 18(3)
- **Brief relevance**: ACWGAN 融合 ACGAN 和 WGAN-GP 用于不平衡数据过采样，是 ACWGAN 方法的重要实现。

---

## 五、CycleGAN + 故障诊断

### [36] CAC-CycleGAN-WGP（本文）
- **Title**: A Novel Approach for Intelligent Fault Diagnosis in Bearing With Imbalanced Data Based on Cycle-Consistent GAN
- **Authors**: （项目论文作者）
- **Year**: 2024
- **Venue**: IEEE Transactions on Instrumentation and Measurement (IEEE TIM)
- **Brief relevance**: 本论文核心工作，提出 CAC-CycleGAN-WGP 将正常样本转换为故障样本用于不平衡轴承故障诊断。

### [37] 1D-CycleGAN 轴承故障诊断
- **Title**: Bearing Fault Diagnosis Based on CycleGAN Data Enhancement
- **Authors**: Lei et al.
- **Year**: 2024
- **Venue**: Measurement / SSRN
- **Brief relevance**: 一维 CycleGAN 结合数字孪生用于轴承故障数据增强。

### [38] CycleGAN 变体轴承故障生成
- **Title**: A CycleGAN variant for enhanced bearing fault data generation
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Measurement
- **Brief relevance**: CycleGAN 变体结合轴承动力学模型用于故障数据生成策略。

### [39] CycleGAN 不平衡故障诊断
- **Title**: Diagnosis of unbalanced bearing fault samples based on cycle generative adversarial networks
- **Authors**: Multiple
- **Year**: 2025
- **Venue**: Neural Computing and Applications
- **Brief relevance**: 基于 CycleGAN 的不平衡轴承故障样本诊断方法。

---

## 六、不平衡学习方向

### [40] 不平衡学习综述
- **Title**: A survey on imbalanced learning: latest research, applications and future directions
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Artificial Intelligence Review
- **Brief relevance**: 系统综述不平衡学习最新研究进展，涵盖数据预处理、算法改进等方向。

### [41] 代价敏感不平衡故障诊断
- **Title**: Adaptive cost-sensitive learning: Improving the convergence of intelligent diagnosis models under imbalanced data
- **Authors**: Z. Ren, Y. Zhu, W. Kang, H. Fu, Q. Niu, D. Gao
- **Year**: 2022
- **Venue**: Knowledge-Based Systems, 241, 108296
- **Brief relevance**: 自适应代价敏感学习方法改善不平衡数据下诊断模型的收敛性。

### [42] 强化学习代价敏感
- **Title**: Reinforcement learning-based cost-sensitive classifier for imbalanced fault classification
- **Authors**: X. Zhang, S. Fan, Z. Song
- **Year**: 2023
- **Venue**: Science China Information Sciences, 66, 212201
- **Brief relevance**: 强化学习驱动的代价敏感分类器用于不平衡故障分类。

### [43] GAN 不平衡故障诊断对比
- **Title**: Imbalanced Fault Diagnosis of Rolling Bearing Based on Generative Adversarial Network: A Comparative Study
- **Authors**: Mao, Liu et al.
- **Year**: 2023
- **Venue**: 相关会议/期刊
- **Brief relevance**: 多种 GAN 方法在不平衡轴承故障诊断中的对比研究。

---

## 七、自编码器方向

### [44] 堆叠自编码器轴承故障诊断
- **Title**: Rolling Bearing Fault Diagnosis Based on Stacked Autoencoder Network with Dynamic Learning Rate
- **Authors**: Pan, Tianhao et al.
- **Year**: 2020
- **Venue**: Advances in Materials Science and Engineering, 2020, 6625273
- **Brief relevance**: 动态学习率堆叠自编码器（SAE）用于轴承故障诊断，与本文 SAE 评估器直接相关。

### [45] 堆叠去噪自编码器多工况
- **Title**: Automatic fault diagnosis of rolling bearings under multiple working conditions based on unsupervised stack denoising autoencoder
- **Authors**: Lei Wang, Hang Rao, Zhengcheng Dong et al.
- **Year**: 2024
- **Venue**: Structural Health Monitoring
- **Brief relevance**: 无监督堆叠去噪自编码器用于多工况滚动轴承自动故障诊断。

### [46] 优化堆叠变分去噪自编码器
- **Title**: Reliable Fault Diagnosis of Bearings Using an Optimized Stacked Variational Denoising Auto-Encoder
- **Authors**: Multiple
- **Year**: 2022
- **Venue**: Sensors, 22(2), 542
- **Brief relevance**: 优化堆叠变分去噪自编码器用于轴承可靠故障诊断。

### [47] SDAE 迁移学习
- **Title**: Transfer learning based on improved stacked autoencoder for bearing fault diagnosis
- **Authors**: Multiple
- **Year**: 2022
- **Venue**: Knowledge-Based Systems, 239, 107897
- **Brief relevance**: 改进堆叠自编码器结合迁移学习用于轴承故障诊断。

---

## 八、少样本/零样本故障诊断

### [48] 零样本故障检测
- **Title**: An effective zero-shot learning approach for intelligent fault detection using 1D CNN
- **Authors**: S. Zhang, H. L. Wei, J. Ding
- **Year**: 2023
- **Venue**: Applied Intelligence, 53, 16041-16058
- **Brief relevance**: 一维 CNN 零样本学习用于智能故障检测，无需故障样本。

### [49] 少样本故障诊断综述
- **Title**: Few-Shot Learning Approaches for Fault Diagnosis Using Vibration Data: A Comprehensive Review
- **Authors**: Multiple
- **Year**: 2023
- **Venue**: Sustainability, 15(20), 14975
- **Brief relevance**: 系统综述基于振动数据的少样本故障诊断方法。

### [50] 元学习少样本轴承故障
- **Title**: A Novel Deep Model with Meta-learning for Rolling Bearing Few-shot Fault Diagnosis
- **Authors**: X. Liang, M. Zhang, G. Feng, Y. Yu, D. Zhen, F. Gu
- **Year**: 2023
- **Venue**: Journal of Dynamics, Monitoring and Diagnostics, 2(2), 102-114
- **Brief relevance**: 元学习结合深度模型用于滚动轴承少样本故障诊断。

---

## 九、对抗迁移学习方向

### [51] 对抗迁移学习综述
- **Title**: A review on adversarial–based deep transfer learning mechanical fault diagnosis
- **Authors**: Multiple
- **Year**: 2024
- **Venue**: Journal of Big Data, 11, 403
- **Brief relevance**: 系统综述基于对抗网络的深度迁移学习在机械故障诊断中的应用。

### [52] DAGAN 域适应
- **Title**: Domain adaptation generative adversarial network (DAGAN) for fault diagnosis
- **Authors**: Jiang et al.
- **Year**: 2022
- **Venue**: IEEE Transactions on Industrial Informatics
- **Brief relevance**: 域适应 GAN 用于生成少数类数据增强知识迁移。

---

## 覆盖方向总结

| 方向 | 篇数 | 编号 |
|------|------|------|
| 基础方法（GAN/WGAN/CycleGAN/ACGAN/SMOTE） | 7 | [1]-[7] |
| 故障诊断 | 6 | [8]-[13] |
| 数据增强 | 7 | [14]-[20] |
| GAN + 故障诊断 | 15 | [21]-[35] |
| CycleGAN + 故障诊断 | 4 | [36]-[39] |
| 不平衡学习 | 4 | [40]-[43] |
| 自编码器 | 4 | [44]-[47] |
| 少样本/零样本 | 3 | [48]-[50] |
| 对抗迁移学习 | 2 | [51]-[52] |
