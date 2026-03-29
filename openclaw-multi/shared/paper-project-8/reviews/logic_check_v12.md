# 逻辑检查报告 v12

## 审查结论：ACCEPT

## v11 审查的 11 个问题修复验证

| 序号 | 问题 | 修复状态 | 验证说明 |
|------|------|---------|---------|
| 1 | Table 2 CWRU 样本数 | ✅ 已修复 | Table 2 现为 2500/1000，与正文 2000 训练 + 500 验证 + 1000 未见 = 3500 一致 |
| 2 | Table 2 SEU 样本数 | ✅ 已修复 | Table 2 现为 2400/1600，与正文一致 |
| 3 | Table 2 SEU 采样频率 | ✅ 已修复 | Table 2 现为 5.12 kHz，与正文 5120 Hz 一致 |
| 4 | Table 2 SEU 转速范围 | ✅ 已修复 | Table 2 现为 1200–1800 rpm，与正文 20/30 Hz 一致 |
| 5 | Table 3 学习率 | ✅ 已修复 | Table 3 现为 $1 \times 10^{-3}$，与正文 0.001 一致 |
| 6 | Table 3 Weight Decay | ✅ 已修复 | Table 3 现为 $1 \times 10^{-4}$，与正文 $1e$-$4$ 一致 |
| 7 | Table 3 Epochs | ✅ 已修复 | Table 3 现为 200，与正文和收敛曲线分析一致 |
| 8 | Table 3 $d_{model}$ | ✅ 已修复 | Table 3 现为 256，与正文和敏感性分析结论一致 |
| 9 | Table 3 Signal/Semantic Dim | ✅ 已修复 | 现为 Signal Feature Dim.=256, LLM Semantic Dim.=1024→256，与正文一致 |
| 10 | Table 4-5 WDCNN 标注 | ✅ 已修复 | WDCNN 标注 $^\dagger$ Supervised upper bound，未加粗，脚注明确说明不直接参与零样本方法对比 |
| 11 | Table 1 属性向量列 | ✅ 已修复 | Target Attribute Vector 列已移除，替换为 Embed. Dim.=1024，与正文 1024 维语义嵌入一致 |

## 论文逻辑检查

逐段检查后，未发现新的逻辑漏洞。具体确认如下：

### 前提假设与推理链条
- ZSL 框架（Section II-B）的 seen/unseen 划分、兼容函数定义、GZSL 偏置问题的论述逻辑自洽。
- 跨模态对齐机制（Section III-D）的训练用 seen 原型作为 K,V、推理用最近语义原型匹配的设计符合标准 ZSL 范式，推理链条完整。
- 训练目标（Eq. 11-12）的 $\mathcal{L}_{total} = \lambda_{cls}\mathcal{L}_{cls} + \lambda_{align}\mathcal{L}_{align}$ 双损失设计合理，损失权重与 Table 3 一致。

### 数据与实验一致性
- CWRU：正文 3500 样本（2000+500+1000）= Table 2（2500/1000）✅
- SEU：正文 4000 样本（2400+1600）= Table 2（2400/1600）✅
- 消融实验（Table 6）数值与主实验（Tables 4-5）中 CMSA-Trans-Full 的精度一致（CWRU 89.4%, SEU 82.5%）✅
- 敏感性分析结论 $d_{model}=256$ 最优与 Table 3 设定一致 ✅
- 收敛曲线分析中引用的 200 epochs 与 Table 3 一致 ✅

### 结论与论据支撑
- 论文核心论点（LLM 语义优于人工属性）由消融实验 NoLLM 变体下降 7.8% 有力支撑。
- 噪声鲁棒性、t-SNE 可视化、注意力热图等辅助证据与主实验结论一致，无过度推断。
