# 内容对齐审查报告 — v1

**审查模式**: B（内容对齐审查，阶段 4.5a）
**审查日期**: 2026-03-29
**审查版本**: drafts/v1/

---

## 审查结论：REVISE

存在 **5 项严重问题** 和 **3 项一般问题**，必须修订后重新审查。

---

## 逐 Section 审查

### 1. Abstract — PASS ✅

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 170-210 | ~184 | ✅ |
| 内容覆盖 | 工业背景/方法/数据集/结果 | 全部覆盖 | ✅ |
| 单段落无换行 | 要求 | 满足 | ✅ |
| Index Terms | 4-8 terms | 6 terms | ✅ |

---

### 2. Introduction — FAIL 🟡/❌

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 1200-1500 | ~1309 | ✅ |
| 引用数量 | ≥20（目标38的≥50%） | 19 | ❌ |
| 段落结构 | P1-P6 六段 | 满足6段结构 | ✅ |
| 贡献列表 | 3-4 items | 4 items | ✅ |
| 论文组织段落 | 最后一段 | 满足 | ✅ |
| Outline 覆盖 | 6个子要点 | 全部覆盖 | ✅ |

**❌ 问题**：
- 引用数为 19，差 **1 条**达到 ≥20 的门槛。需在 Introduction 中新增至少 1 条引用（建议补充与 CMSA-Trans 最相关的对比方法文献）。

**修改要求**：在 Introduction 中新增 ≥1 条引用，使总数达到 ≥20。

---

### 3. Background (Theoretical Background) — FAIL ❌

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 1000-1300 | ~993 | ❌ |
| 子章节 | 2.1/2.2/2.3 三节 | 2.1/2.2/2.3 | ✅ |
| 公式 | Eq.1-3 | Eq.1-3 | ✅ |
| 引用 | ~6 refs | ~8 refs | ✅ |
| Outline 覆盖 | Transformer/ZSL/LLM 三节 | 全部覆盖 | ✅ |

**❌ 问题**：
- 字数 993，距下限 1000 差 **7 词**。

**修改要求**：扩写 ≥7 词至 ≥1000 词（建议在 2.3 节补充 LLM prompting 策略的更多细节）。

---

### 4. Method (Proposed Method) — FAIL ❌

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 1400-1900 | ~1795 | ✅ |
| 子章节 | 3.1-3.5 五节 | 3.1-3.5 | ✅ |
| 公式 | Eq.3-8（6个） | Eq.4-8（5个，background 3+method 5=8 total） | ✅ |
| 引用 | ~4 refs | **0** refs | ❌ |
| Outline 覆盖 | Overall/Signal/LLM/Alignment/Training | 全部覆盖 | ✅ |
| Table 1 引用 | LLM语义示例表 | **未定义/未引用** | ❌ |
| Fig. 3 引用 | 架构图 | **未定义/未引用** | ❌ |
| 错别字 | — | "matritx"（应为 matrix） | ❌ |

**❌ 问题**：
1. **0 条引用**，黄金标准要求 Method 章节有 ~4 条引用。需为 TST 架构、SBERT/CLIP 文本编码器、对比学习等相关方法补充引用。
2. **Table 1 未定义**：Outline 要求 Table 1（LLM Semantic Prompts and Resulting Attributes）出现在 3.3 节，但 tex 文件中无 table 环境。
3. **Fig. 3 未定义**：Outline 要求 CMSA-Trans 架构图出现在 3.1 节，但 tex 文件中无 figure 环境。
4. **错别字**："matritx" → "matrix"（Cross-Modality Alignment 小节最后一段）。

**修改要求**：
- 新增 ≥4 条方法相关引用（如 TST 原文、SBERT、CLIP、对比学习等）。
- 在 3.3 节添加 Table 1 环境（LLM 语义提示词与生成结果示例）。
- 在 3.1 节添加 Fig. 3 环境（CMSA-Trans 架构图，双栏）。
- 修正 "matritx" 为 "matrix"。

---

### 5. Experiments — FAIL ❌❌（严重不足）

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 2300-3000 | ~1698 | ❌❌ |
| 子章节 | 4.1-4.6 六节 | 4.1-4.6 | ✅ |
| 引用 | ~8 refs（SOTA 基线） | **5 refs（key1-key5）但 bib 中不存在** | ❌❌ |
| 表格定义 | Table 2-6 | **未定义 table 环境** | ❌ |
| 图片定义 | Fig 4-8 | **未定义 figure 环境** | ❌ |
| 数据集描述 | CWRU + SEU | 文字描述有，但无 Table 2 环境化 | 🟡 |

**❌ 问题**：

1. **字数严重不足**：1698 词 vs 目标 2300-3000，**差 600-1300 词**。需大幅扩充以下子节：
   - **4.1 Experimental Setup**（目标 450 词，当前约 300 词）：需补充数据集样本数详情、数据分割策略的详细说明、信号预处理的具体参数说明。
   - **4.3 Zero-Shot Recognition**（目标 600 词，当前约 400 词）：需增加逐类性能分析、与每个基线方法的详细对比讨论。
   - **4.4 Ablation Study**（目标 500 词，当前约 250 词）：需补充每个变体的定量结果讨论、消融维度的更多分析。

2. **引用的 bib key 不存在**：experiments.tex 中引用了 `key1`-`key5`，但 references.bib 中**完全没有这些条目**。这些 SOTA 基线文献（WDCNN, ZSL-GAN, DMZSL, AZSL, Bi-LSTM）必须添加到 bib 文件中。

3. **所有 Table/Figure 环境缺失**：
   - 缺少 Table 2（数据集描述）、Table 3（超参数）、Table 4（CWRU 对比结果）、Table 5（SEU 对比结果）、Table 6（消融实验）
   - 缺少 Fig. 4-8（混淆矩阵、准确率图、SNR 曲线、t-SNE、训练曲线等）
   - 文中 `\ref{tab:comparison}`、`\ref{tab:ablation}`、`\ref{fig:accuracy_bar}` 等均指向未定义的 label

4. **引用总数**：5 条基线引用为空 key，实际 experiments 章节有效引用为 0。

**修改要求**：
- 扩充 experiments 至 **≥2300 词**（建议至少 2400 词）。
- **将 key1-key5 替换为正确的 bib 条目**并添加到 references.bib：WDCNN (Zhang 2017 已有 zhang2017new)、ZSL-GAN、DMZSL、AZSL、Bi-LSTM ZSL 相关文献。
- **添加所有 Table 和 Figure 环境**（至少 Table 2-6 + Fig 4-8 的 LaTeX 框架）。
- experiments 章节补充 ≥8 条有效引用。

---

### 6. Conclusion — PASS ✅

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 字数 | 150-250 | ~175 | ✅ |
| 内容 | 总结贡献+未来工作 | 全部覆盖 | ✅ |

---

### 7. References (references.bib) — FAIL ❌

| 维度 | 黄金标准 | 实际 | 判定 |
|------|---------|------|------|
| 总数 | 35-45 | 33 | ❌ |
| intro 占比 | ≥50% | 19/33 = 57.6% | ✅ |
| 分布 | intro:20, bg:6, method:4, exp:8 | intro:19, bg:8, method:0, exp:0 | ❌❌ |

**❌ 问题**：
1. 总数 33，差 **2 条**达到 35 下限。
2. method 和 experiments 章节有效引用为 0（method 无 \cite，experiments 的 key1-key5 不存在）。
3. `transformer_orig` 和 `vaswani2017attention` 是同一篇论文的重复条目，应合并。

**修改要求**：
- 删除重复条目 `transformer_orig`，统一使用 `vaswani2017attention`。
- 新增 ≥4 条参考文献（method 相关 4 条 + experiments 基线 5 条 - 重复删 1 条 + 总量补 2 条 ≈ 需新增至少 **8 条**）。
- 修正 experiments.tex 中的空 bib key。
- 最终使总参考文献数达到 **≥35 条**。

---

## 全局问题汇总

| 序号 | 严重程度 | 位置 | 问题描述 | 修改要求 |
|:---:|:---:|------|---------|---------|
| 1 | 🔴 严重 | experiments | 字数 1698，差 600+ 词 | 扩充至 ≥2300 词 |
| 2 | 🔴 严重 | experiments | key1-key5 bib key 不存在 | 替换为正确条目并添加到 bib |
| 3 | 🔴 严重 | experiments | 所有 Table/Figure 环境缺失 | 添加 Table 2-6 + Fig 4-8 |
| 4 | 🟠 中等 | references.bib | 总数 33 < 35 | 新增至 ≥35 |
| 5 | 🟠 中等 | method | 0 条引用 | 新增 ≥4 条 |
| 6 | 🟡 轻微 | introduction | 引用数 19，差 1 | 新增 ≥1 条 |
| 7 | 🟡 轻微 | background | 字数 993，差 7 | 扩写至 ≥1000 |
| 8 | 🟡 轻微 | method | "matritx" 错别字 | 修正为 "matrix" |
| 9 | 🟠 中等 | method/outline | Table 1、Fig 3 环境缺失 | 添加对应 LaTeX 环境 |

---

## 修订优先级

1. **P0（必须）**：修复 experiments 字数不足 + 添加 Table/Figure 环境 + 修复空 bib key
2. **P0（必须）**：新增参考文献使总数 ≥35，删除重复条目
3. **P1（重要）**：method 补充引用 + 添加 Table 1/Fig 3
4. **P2（建议）**：introduction 补 1 引用、background 补 7 词、修正错别字

---

## 审查判定：**REVISE**

需按上述优先级完成修订后重新提交内容对齐审查。
