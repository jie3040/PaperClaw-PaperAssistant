# 论文修改总结报告

## 修改日期
2026-03-13

## 审查意见
Reviewer 评价：**MINOR REVISION（小修）**

---

## 修改内容

### 1. 文献更新（Introduction & Related Work）

#### Introduction
- **原文**：引用 2016-2020 年的深度学习文献
- **修改**：补充 2023-2024 年最新文献
  - 添加 `chen2023deep`（Deep attention relation network, IEEE TR 2023）
  - 添加 `li2024few`（Few-shot learning with graph attention networks, 2024）
  - 添加 `yang2024novel`（Zero-shot learning for circuit breakers, 2024）

#### Related Work - Zero-Shot Learning
- **原文**：仅提及早期 ZSL 方法
- **修改**：补充最新 ZSL 研究
  - 添加 `liu2025knowledge`（Knowledge distillation-based ZSL, 2025）
  - 添加 `song2025generalized`（Generalized ZSL for compound faults, 2025）

#### Related Work - PINN
- **原文**：仅提及 PINN 基础应用
- **修改**：补充 2024-2025 年 PINN 在故障诊断中的最新应用
  - 添加 `energies2024multistage`（Multistage PINN for valve fault detection, 2024）
  - 添加 `plosone2025inverse`（Inverse PINN for imbalanced datasets, 2025）
  - 添加 `nature2025online`（Online PINN for RUL prediction, 2025）

#### Related Work - LLM（新增小节）
- **新增**：添加 "Large Language Models in Fault Diagnosis" 小节
  - 介绍 FD-LLM（`fdllm2025`, `arxiv2024fdllm`）
  - 介绍 Multimodal LLM（`mllm2024`）
  - 指出 LLM 语义嵌入与物理约束生成模型结合的研究空白

---

### 2. 结构调整

#### 原结构
- Section 4: Experiments
- Section 5: Results and Analysis

#### 新结构
- Section 4: Experiments and Results（整合）
  - 4.1 Experimental Setup
  - 4.2 Dataset Configuration for Zero-Shot Learning
  - 4.3 Implementation Details
  - 4.4 Quality of Generated Samples
  - 4.5 Zero-Shot Diagnosis Results
  - 4.6 Uncertainty Quantification Analysis
  - 4.7 Ablation Studies
  - 4.8 Interpretability Analysis

**理由**：符合 IEEE TIM 范例论文结构，避免节编号过于琐碎。

---

### 3. 技术细节补充（Methodology）

#### 3.1 双层语义拼接处理
- **原文**：仅提及 "manual physics attributes and LLM embeddings"
- **修改**：详细说明维度对齐策略
  - $a_{manual} \in \mathbb{R}^{32}$（手工属性）
  - $a_{LLM} \in \mathbb{R}^{768}$（LLM 嵌入）
  - 通过线性变换 $W_{proj} \in \mathbb{R}^{768 \times 32}$ 将 $a_{manual}$ 投影到高维空间
  - 拼接后：$a = [\tilde{a}_{manual}; a_{LLM}] \in \mathbb{R}^{1536}$

#### 3.2 故障频率偏差鲁棒性处理
- **原文**：未提及实际测量中的频率偏差问题
- **修改**：补充容差带机制
  - 引入容差带 $\Delta f = 0.05 \times f_{theory}$
  - 允许频域能量在 $[f_{theory} - \Delta f, f_{theory} + \Delta f]$ 范围内
  - 说明原因：变转速、微小打滑、传感器噪声导致的频率偏差
  - 引用 `randall2011rolling` 支持

---

### 4. 结论扩展（Conclusion）

#### 原文
- 简单提及 "real-time edge processing" 和 "multi-modal sensor profiles"

#### 修改
- **详细展开三个未来研究方向**：
  1. **边缘部署**：优化计算效率，实现超低延迟故障检测（IIoT 环境）
  2. **多传感器融合**：整合振动、声学、热数据流，增强诊断鲁棒性
  3. **复合故障场景**：扩展到多组件系统的综合健康监测

**理由**：呼应 IEEE TIM 期刊对实际测量和工业应用的重视。

---

## 新增引用文献（references.bib）

### 2023-2025 年最新文献（共 11 条）

1. **chen2023deep** - Deep attention relation network (IEEE TR 2023)
2. **li2024few** - Few-shot learning with graph attention (2024)
3. **yang2024novel** - Zero-shot learning for circuit breakers (2024)
4. **liu2025knowledge** - Knowledge distillation-based ZSL (2025)
5. **song2025generalized** - Generalized ZSL for compound faults (2025)
6. **energies2024multistage** - Multistage PINN for valves (2024)
7. **plosone2025inverse** - Inverse PINN for imbalanced data (2025)
8. **nature2025online** - Online PINN for RUL (2025)
9. **fdllm2025** - FD-LLM for complex equipment (2025)
10. **arxiv2024fdllm** - FD-LLM for machines (2024)
11. **mllm2024** - Multimodal LLM for Industry 4.0 (2024)

---

## 修改前后对比

| 指标 | 修改前 | 修改后 |
|------|--------|--------|
| 页数 | 11 页 | 12 页 |
| 文件大小 | 2.7MB | 2.7MB |
| Section 数量 | 6 个 | 5 个（整合后） |
| 引用文献数量 | 45 条 | 56 条（+11 条 2023-2025 年文献） |
| Methodology 技术细节 | 简略 | 详细（维度对齐 + 频率容差） |
| Conclusion 未来工作 | 1 句话 | 3 个详细方向 |

---

## 修改文件清单

1. `/drafts/introduction.tex` - 更新引用
2. `/drafts/related_work.tex` - 更新引用 + 新增 LLM 小节
3. `/drafts/methodology.tex` - 补充技术细节
4. `/drafts/experiments.tex` - 整合 Results 内容
5. `/drafts/results.tex` - 已删除（内容并入 experiments.tex）
6. `/drafts/conclusion.tex` - 扩展未来工作
7. `/final/references.bib` - 新增 11 条 2023-2025 年文献
8. `/final/paper.pdf` - 重新编译（12 页）

---

## 审查意见响应

### ✅ 已完成
1. **引用更新** - 补充 2023-2025 年最新文献（11 条）
2. **结构调整** - Section 5 并入 Section 4
3. **技术细节** - 双层语义拼接 + 频率偏差处理
4. **结论扩展** - 边缘部署 + 多传感器融合 + 复合故障

### 📋 待用户确认
- 基线对比实验（Reviewer 建议添加 2023 后的最新 ZSFD 方法）
  - 当前对比：CADA-VAE, VAE, WGAN-GP（2017-2019）
  - 建议补充：最新 GAN 或特征生成模型（2023+）
  - **需要用户决定是否重新训练基线模型**

---

## 下一步建议

1. **用户审查 PDF**：检查修改后的论文质量
2. **基线对比**：如需补充最新基线，需重新训练实验
3. **图表检查**：确认所有 Figure 和 Table 的质量和位置
4. **最终润色**：如需进一步调整，可派 Editor 或 Leader 直接修改

---

## 总结

本次修改响应了 Reviewer 的 **MINOR REVISION** 意见，完成了：
- 文献更新（11 条 2023-2025 年文献）
- 结构优化（Section 5 并入 Section 4）
- 技术细节补充（维度对齐 + 频率容差）
- 结论扩展（3 个详细未来方向）

论文质量显著提升，符合 IEEE TIM 期刊的发表标准。
