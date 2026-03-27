# 文献调研精简摘要 — CAC-CycleGAN-WGP

> 原始文献：52篇，覆盖9个方向。完整文献见 survey_raw.md。

---

## 核心背景

本文方法：CAC-CycleGAN-WGP — 将正常轴承振动信号通过 CycleGAN（+辅助分类器+WGAN-GP梯度惩罚）转换为故障样本，解决不平衡数据问题。

---

## 关键 Baseline 文献（方法组件来源）

| 编号 | 方法 | 期刊/会议 | 年份 | 在本文中的作用 |
|------|------|-----------|------|----------------|
| [1] | GAN (Goodfellow et al.) | NeurIPS | 2014 | GAN 基础 |
| [2] | WGAN (Arjovsky et al.) | ICML | 2017 | Wasserstein 距离 |
| [3] | WGAN-GP (Gulrajani et al.) | NeurIPS | 2017 | 梯度惩罚，核心组件 |
| [4] | CycleGAN (Zhu et al.) | ICCV | 2017 | 循环一致性，核心架构 |
| [5] | ACGAN (Odena et al.) | ICML | 2017 | 辅助分类器模块 |
| [6] | SMOTE (Chawla et al.) | JAIR | 2002 | 对比方法 baseline |
| [7] | CWGAN-GP (Zhu et al.) | Inf. Sci. | 2019 | ACWGAN-GP 前驱 |

---

## 最相关竞争方法（用于对比实验引用）

| 编号 | 方法 | 期刊 | 年份 | 关联性 |
|------|------|------|------|--------|
| [26] | IACWGAN-GP | Machines | 2023 | ★★★ 最直接竞争 |
| [35] | ACWGAN | IJICIC | 2022 | ★★★ ACWGAN 实现 |
| [27] | 改进ACWGAN | Nonlinear Dyn. | 2025 | ★★ 铁路轴承 |
| [34] | ACWGAN+小波+ResNet | Machines | 2025 | ★★ 不平衡诊断 |
| [28] | AC-WGAN-GP高光谱 | Remote Sens. | 2022 | ★★ 小样本分类 |
| [36] | CycleGAN不平衡诊断 | Neural Comput. | 2025 | ★★ CycleGAN同类 |
| [37] | 1D-CycleGAN | Measurement | 2024 | ★★ CycleGAN同类 |

---

## 诊断器/评估器相关文献

| 编号 | 方法 | 期刊 | 年份 |
|------|------|------|------|
| [21] | ACGAN-SDAE | PLOS ONE | 2021 |
| [44] | SAE动态学习率 | Adv. Mater. Sci. | 2020 |
| [10] | CNN-LSTM | Appl. Intel. | 2020 |
| [11] | 宽核CNN-LSTM迁移 | Adv. Mech. Eng. | 2022 |

---

## 综述文献（用于 Introduction 背景铺垫）

- [8] 深度学习轴承诊断综述 (Neurocomputing, 2019)
- [32] GAN不平衡故障诊断综述 (JCDE, 2024)
- [40] 不平衡学习综述 (AI Review, 2024)
- [49] 少样本诊断综述 (Sustainability, 2023)
- [51] 对抗迁移学习综述 (J. Big Data, 2024)

---

## 引用策略提示（给 Ideator/Architect/Writer）

- Introduction 引用数 ≥ 总引用50%（约 26+ 篇）
- 核心 baseline：[1][2][3][4][5][6][7] 必引
- 竞争方法：[26][35][27][34][28] 用于 Related Work + Experiments 对比
- CycleGAN同类：[36][37][38][39] 在 Related Work 区分本文贡献
- 综述：[8][32][40] 用于 Intro 开篇引用
