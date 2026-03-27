# 框架对齐审查报告

**审查对象：** outline/v1/paper_outline.md
**审查模式：** 模式 A — 框架对齐审查
**审查时间：** 2026-03-25

## 审查结论：REVISE

---

## 逐项对标结果

| # | 维度 | 黄金标准 | 当前框架 | 判定 | 说明 |
|---|------|---------|---------|------|------|
| 1 | 章节结构 | I. Introduction, II. Theoretical Background, III. Proposed Method, IV. Experimental Results and Analysis, V. Conclusion | 一致（I–V） | ✅ | 符合 IEEE TIM 标准 |
| 2 | 总页数 | 12–17 页（~8000–12000 词） | ~8000 words | 🟡 | 偏下限，建议目标上调至 ~10000 词 |
| 3 | Abstract | 单段，无要点 | 未在 outline 中单独列出 | ❌ | 缺少 Abstract 段落规划 |
| 4 | Index Terms | 需要 | 未列出 | ❌ | IEEE TIM 要求 Index Terms |
| 5 | Introduction 字数 | ~1000 词 | 1500 词 | 🟡 | 偏高但可接受，建议 1000–1200 |
| 6 | 引言引用占比 | >50%（≥20 篇） | 标注 >25 篇 | ✅ | |
| 7 | Method 组件 | CycleGAN, CAC, WGP, SAE, SVM | 全部覆盖（3.1–3.5） | ✅ | |
| 8 | 公式 | 多个（loss, framework） | 3.3 提及 loss function | 🟡 | 建议明确标注各公式编号和位置 |
| 9 | 图表总数 | 10 图 + 7 表 | 埋点标注 Fig: 1,2,3,4,5,6,9,10,11,13,14,15,16,17,18,19,20（16 处）；Table: I–XI（11 处） | ❌ | **严重超标**：图标注 16 处（标准 10），表标注 11 处（标准 7） |
| 10 | 数据集 | Case I (CWRU), Case II | CWRU + IEEE PHM 2009 Gearbox | ✅ | |
| 11 | 实验完整性 | 多类不平衡 + 单类不平衡，多种 balance ratio | 4.3/4.4 均包含多类和单类 | ✅ | |
| 12 | 基线对比 | SMOTE, ADASYN, GAN, ACGAN | 4.5 提及 | 🟡 | 4.5 缺乏独立字数分配，标注 N/A |
| 13 | 参考文献 | 35–50 篇 | ~40+ | ✅ | |
| 14 | 段落级字数 | 各 section 标注子段字数 | 已标注 | ✅ | |
| 15 | 字数加和校验 | 各子段之和 = section 总字数 | Intro: 250+300+400+400+150=1500 ✅; BG: 200+300+300=800 ✅; Method: 300+500+400+400+400=2000 ✅; Exp: 400+800+1000+1000=3200 ✅; Concl: 200+200+100=500 ✅ | ✅ | 总计 8000 词 |
| 16 | 消融实验 | 未明确要求，但基线对比隐含 | 4.5 仅有文字描述 | ❌ | 缺少独立消融实验小节和字数分配 |

---

## ❌ 不通过项的修改要求

### 1. 缺少 Abstract 段落规划
- **修改要求：** 在 outline 顶部（Introduction 之前）增加 Abstract 段落，规划 150–200 词，包含：研究背景（1句）、问题陈述（1句）、方法概述（2句）、关键结果（2句）、贡献（1句）。
- **格式：** 单段，无要点符号。

### 2. 缺少 Index Terms
- **修改要求：** 在 Abstract 之后增加 Index Terms 段落，列出 3–5 个 IEEE 标准关键词，如：Fault diagnosis, generative adversarial network, imbalanced data, cycle-consistent GAN, bearing。

### 3. 图表数量严重超标
- **当前：** 图 ~16 处，表 ~11 处
- **目标：** 图 10（±1），表 7（±1）
- **修改要求：**
  - 图：精简至 9–11 张。建议合并相似频谱对比图（如 Fig 1,2,9,16 可合并为 2 张），合并 Case I/Case II 中重复结构的图（如 confusion matrix 可各保留 1 张代表）。
  - 表：精简至 6–8 张。Table I/II（数据集描述）可合并为 1 张；Table IV/V 可合并；Case II 的 Table IX/X/XI 可合并为 1–2 张。

### 4. Section 4.5 基线对比缺少独立字数分配
- **修改要求：** 将 4.5 从 "N/A" 改为独立子节，分配 400–600 词，明确列出对比方法、对比指标（Accuracy, F1, G-mean）、对比实验的表格/图编号。

### 5. 缺少消融实验设计
- **修改要求：** 在 Section IV 中新增 4.6 Ablation Study（~500 词），包含：
  - 消融组件：w/o CAC、w/o Cycle Loss、w/o WGP（即 WGAN-GP 替换为标准 GAN loss）、w/o SAE 筛选
  - 每个消融对应 1 张表或图
  - 验证各组件贡献度

### 6. 总字数偏保守
- **修改要求：** 建议将总目标从 8000 词上调至 9500–10500 词，新增 Abstract（200）+ Index Terms + 消融实验（500）+ 基线对比扩充（400）≈ 可填补缺口。

---

## 🟡 注意项（建议优化）

1. **Introduction 字数偏高（1500 vs 目标 ~1000）：** 可压缩 P3（Existing Solutions）至 300 词，将节省的 100 词分配给 Experiments 或 Ablation。
2. **公式规划不够明确：** 3.3 应列出具体公式编号，如 L_adv (Eq.1), L_cyc (Eq.2), L_cls (Eq.3), L_gp (Eq.4), L_total (Eq.5)。
3. **Conclusion 字数（500）偏多：** IEEE TIM Conclusion 通常 200–300 词，建议压缩至 300 词。

---

## 总结

框架整体结构符合 IEEE TIM 五节制要求，Method 组件覆盖完整，实验设计覆盖双数据集+双实验类型。主要问题集中在：(1) 图表数量严重超标需精简；(2) 缺少 Abstract/Index Terms 规划；(3) 基线对比和消融实验缺乏独立设计。**修改后可达到 ACCEPT 标准。**
