# 内容对齐审查报告 — Draft v1

**审查模式:** 模式 B（阶段 4.5a 内容对齐审查）
**审查日期:** 2026-03-23
**审查文件:** drafts/v1/ 全部初稿（7个 .tex 文件）
**对齐依据:** golden_standard.json + outline/v2/paper_outline.md

## 审查结论：REVISE

存在 7 项 ❌ 不通过项，须修订后重新审查。

---

## 一、逐项对标结果

### 1. 字数审查

| Section | 黄金标准 | Outline v2 目标 | 实际字数 | 偏差 | 判定 |
|---------|---------|----------------|---------|------|------|
| Abstract | 180-250 | ~300 | 237 | — | 🟡 (在黄金标准范围内，低于outline目标) |
| Introduction | 1500-2000 | ~1700 | 1243 | -26.9% | ❌ |
| Background | 1.5-2 pages | ~1200 | 1213 | +1.1% | ✅ |
| Method (total) | 3-4 pages | ~3500 | 3555 (1473+2082) | +1.6% | ✅ |
| Experiments (total) | 4-5 pages | ~4800 | 4821 (2759+2062) | +0.4% | ✅ |
| Conclusion | 200-350 | ~300 | ~120 | -60% | ❌ |

### 2. 引用审查

| 维度 | 目标 | 实际 | 判定 |
|------|------|------|------|
| Introduction 引用数 | ≥28 | 27 (unique refs from 6 \cite commands) | ❌ |
| 全文引用总数 | 34-54 (黄金) / 45-60 (outline) | 30 unique refs | ❌ |
| Experiments/Method 引用数 | 应有适量引用支撑 | 0 citations in experiments, 0 in method | ❌ |
| 引用格式 | 统一 `\cite{}` | 统一 | ✅ |

**详细统计:**
- Introduction: 27 unique refs (Gao2022, Lei2020, Liu2018, Zhang2021, Wang2019, Lampert2014, Xian2018, Li2020, Wang2021a, Chen2022, Grover2023, Zhang2022, Yan2021, Zhao2022, Xu2021, Devos2023, Kim2022, Mao2024, Ho2020, Rombach2022, Akata2015, Fu2015, Zhu2019, Brown2020, Radford2021, Li2023a, Wang2023b)
- Background: 3 refs (ho2020denoising, devlin2018bert, brown2020language)
- Method: 0 refs
- Experiments: 0 refs

### 3. 公式审查

| 维度 | 目标 | 实际 | 判定 |
|------|------|------|------|
| 公式总数 | 15 (Eq.1-15) | 18 (6 in Background + 12 in Method) | 🟡 (超出3个，均为合理补充) |
| 编号连续性 | 连续 | 连续（自动编号） | ✅ |
| Background 公式 | Eq.1-4 | Eq.1-6 (额外含 L_simple 和 general objective) | 🟡 |
| Method 公式 | Eq.5-15 | Eq.7-18 (因 Background 多出2个而偏移) | 🟡 |
| 内容一致性 | 与 outline 描述一致 | 核心公式均存在且描述一致 | ✅ |

### 4. 结构审查

| 维度 | 目标 | 实际 | 判定 |
|------|------|------|------|
| III-A~D (Background subsections) | 4个 | 4个齐全 | ✅ |
| IV-A~F (Method subsections) | 6个 | 6个齐全 | ✅ |
| V-A~E (Experiments subsections) | 5个 | 5个齐全 | ✅ |
| VI (Conclusion) | 独立 section | ✅ 存在 | ✅ |
| 每个 subsection 实质内容 | 均有实质内容 | 均有实质内容 | ✅ |
| `\section{}` 标签完整性 | Method/Experiments 需各有 `\section{}` | **缺失** `\section{Methodology}` 和 `\section{Experiments and Analysis}` | ❌ |
| Conclusion 位置 | 应为论文最后 | Conclusion 出现在 Extended Analysis、Statistical Significance、Interpretability 之前 | ❌ |

### 5. 图表审查

| 维度 | 目标 | 实际 | 判定 |
|------|------|------|------|
| Fig.1 (概念图) | Introduction 引用 | **未引用** | ❌ |
| Fig.2 (整体架构) | Method IV-A 引用 | 仅通过 `\ref{fig:framework}` 间接引用，未标注"Fig. 2" | ❌ |
| Fig.3 (语义模块细节) | Method IV-C 引用 | **未引用** | ❌ |
| Fig.4 (去噪步骤) | Method IV-D 引用 | ✅ "Fig. 4" | ✅ |
| Fig.5 (TEP 混淆矩阵) | Case I 引用 | ✅ | ✅ |
| Fig.6 (Hydraulic 混淆矩阵) | Case II 引用 | **未引用** | ❌ |
| Fig.7 (CWRU 混淆矩阵) | Case III 引用 | ✅ | ✅ |
| Fig.8 (t-SNE) | Case I 引用 | ✅ | ✅ |
| Fig.9 (Loss 曲线) | Case III 引用 | ✅ | ✅ |
| Fig.10 (Domain shift) | Method IV-E 引用 | ✅ | ✅ |
| Fig.11 (特征质量对比) | Case III 引用 | ✅ | ✅ |
| **Fig 引用合计** | 11 | **7** (缺失 Fig.1, 2, 3, 6) | ❌ |

| 维度 | 目标 | 实际 | 判定 |
|------|------|------|------|
| Table I (相关工作对比) | Introduction 引用 | **未引用** | ❌ |
| Table II (网络架构参数) | Method 引用 | ✅ `\ref{tab:network}` | ✅ |
| Table III (数据集统计) | Setup 引用 | ✅ `\ref{tab:datasets}` | ✅ |
| Table IV (属性定义) | Setup 引用 | **未引用** | ❌ |
| Table V (Case I 准确率) | Case I 引用 | ✅ `\ref{tab:tep_results}` | ✅ |
| Table VI (Case II 准确率) | Case II 引用 | ✅ `\ref{tab:hydraulic_results}` | ✅ |
| Table VII (Case III 准确率) | Case III 引用 | ✅ `\ref{tab:cwru_results}` | ✅ |
| Table VIII (消融实验) | Case II 引用 | ✅ `\ref{tab:ablation}` | ✅ |
| Table IX (CWRU 消融) | Case III 引用 | ✅ `\ref{tab:cwru_ablation}` | ✅ |
| Table X (MMD 分数) | Method IV-E 引用 | 文中提及"Table X"但无实际表格定义 | ❌ |
| Table XI (时间对比) | Discussion 引用 | ✅ `\ref{tab:time_complexity}` | ✅ |
| 额外 Table | — | `\ref{tab:cross_val}` (5-fold cross-validation, 不在 outline 中) | 🟡 |
| **Table 引用/定义合计** | 11 | **8 已定义 + 1 文中提及无定义 + 2 缺失** | ❌ |

### 6. 质量审查

| 维度 | 判定 | 说明 |
|------|------|------|
| 各 section 逻辑衔接 | ✅ | 过渡自然，逻辑连贯 |
| 术语和符号一致性 | 🟡 | 部分处同时使用 ZSL 和 ZSFD 缩写，需统一 |
| 重复内容 | ✅ | 无明显重复 |

---

## 二、❌ 不通过项的具体修改要求

### REVISE-1: Introduction 字数不足 (1243 → 1700)

**文件:** `introduction.tex`
**偏差:** -457 words (-26.9%)
**修改要求:** 扩充 Introduction 至 ≥1650 words（目标1700）。建议：
- P3 (非生成式 ZSL): 当前约 200 words，outline 目标 250 words → 扩充 ~50 words
- P4 (生成式 ZSL): 当前约 280 words，outline 目标 300 words → 扩充 ~20 words
- P5 (局限性): 当前约 180 words，outline 目标 200 words → 扩充 ~20 words
- P6 (LLM 潜力): 当前约 170 words，outline 目标 200 words → 扩充 ~30 words
- 新增 P9 (论文组织): 当前约 60 words → 扩充至 ~100 words（细化各 section 内容预告）
- **同时新增 1-2 个引用以满足 REVISE-3**

### REVISE-2: Conclusion 字数严重不足 (~120 → 200-350)

**文件:** `experiments_part2.tex`
**偏差:** 至少缺少 80 words
**修改要求:** 扩充 Conclusion 至 ≥250 words。建议增加：
- 各 Case Study 关键发现的总结性陈述（~50 words）
- 三大贡献与实验结果的对应关系说明（~50 words）
- 更具体的 future work 描述（~30 words）

### REVISE-3: 全文引用总数不足 (30 → ≥34)

**文件:** `introduction.tex`, `background.tex`, `method_part1.tex`, `method_part2.tex`, `experiments_part1.tex`, `experiments_part2.tex`
**修改要求:**
- Introduction 新增 ≥1 个引用（当前27，目标≥28）→ 总计28
- 全文新增 ≥4 个引用使总数达到 34（黄金标准下限）
- **Method 和 Experiments 部分必须有引用**（当前均为0），建议：
  - Method: 引用 BERT/CLIP 原始论文、cross-attention 机制相关文献、FiLM 论文（至少 3-5 个）
  - Experiments: 引用 TEP 数据集原始论文、CWRU 数据集论文、GZSL 评估指标相关文献（至少 3-5 个）

### REVISE-4: 缺失 `\section{}` 标签

**文件:** `method_part1.tex`, `experiments_part1.tex`
**修改要求:**
- 在 `method_part1.tex` 的第一个 `\subsection` 之前添加 `\section{Methodology}` (对应 Section III)
- 在 `experiments_part1.tex` 的第一个 `\subsection` 之前添加 `\section{Experiments and Analysis}` (对应 Section IV)

### REVISE-5: Conclusion 位置错误

**文件:** `experiments_part2.tex`
**修改要求:**
- 将 `\section{Conclusion}` 移至文件末尾（在 Interpretability subsection 之后）
- "Extended Analysis"、"Statistical Significance"、"Interpretability" 三个 subsection 应属于 Section IV (Experiments) 的子节，放在 Case III 和 Discussion 之后、Conclusion 之前

### REVISE-6: 缺失 Figure 引用 (4个)

**修改要求:**

| 缺失图 | 应添加位置 | 具体操作 |
|--------|-----------|---------|
| Fig.1 | `introduction.tex` P1 或 P7 | 添加 `as illustrated in Fig.~\ref{fig:concept}` 并确保对应 figure 环境存在 |
| Fig.2 | `method_part1.tex` IV-A (Overall Framework) | `\ref{fig:framework}` 已存在，确认 figure label 为 `fig:framework` 且标注为 "Fig.~2" |
| Fig.3 | `method_part1.tex` IV-C (Semantic Embedding) | 添加 `as shown in Fig.~\ref{fig:semantic_module}` 引用 |
| Fig.6 | `experiments_part1.tex` Case II | 在 Case II 结果分析中添加混淆矩阵引用 `Fig.~\ref{fig:hydraulic_confusion}` |

### REVISE-7: 缺失 Table 定义/引用 (3个)

**修改要求:**

| 缺失表 | 应添加位置 | 具体操作 |
|--------|-----------|---------|
| Table I (相关工作对比) | `introduction.tex` | 在文献综述部分（P3-P4 之后）添加比较表格，对比 ZSL 方法在属性类型、生成模型、对齐机制方面的差异 |
| Table IV (属性定义) | `experiments_part1.tex` V-A | 在 Experimental Setup 中添加传统属性 vs. 语言描述的属性定义表 |
| Table X (MMD 分数) | `method_part2.tex` IV-E | 方法部分文中已提及 "Table X, where the MMD scores indicate..."，但未定义表格。需添加实际的 MMD 评分表格 |

---

## 三、汇总

| 类别 | ✅ 通过 | 🟡 容差内 | ❌ 不通过 |
|------|--------|----------|----------|
| 字数 | 4/6 | 1/6 | 2/6 (Intro, Conclusion) |
| 引用 | 1/4 | 0/4 | 3/4 (Intro refs, Total refs, Method/Exp refs) |
| 公式 | 2/3 | 1/3 | 0/3 |
| 结构 | 5/7 | 0/7 | 2/7 (Section 标签, Conclusion 位置) |
| 图表 | 10/22 | 0/22 | 12/22 (4 Fig + 3 Table + 1 Table 定义缺失) |
| 质量 | 2/3 | 1/3 | 0/3 |

**总计: 7 项 ❌ → 判定 REVISE**

建议 Writer 按优先级处理：REVISE-4 (结构标签) 和 REVISE-5 (Conclusion 位置) 为最高优先级（影响编译和论文结构），其次 REVISE-3 (引用) 和 REVISE-1/2 (字数)，最后 REVISE-6/7 (图表)。
