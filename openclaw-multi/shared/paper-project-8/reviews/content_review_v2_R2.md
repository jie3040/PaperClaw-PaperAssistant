# 内容对齐审查报告（R2）

## 审查结论：REVISE

---

## 1. 逐项对标结果

### 1.1 字数对标

| Section | 实际词数 | 黄金标准范围 | 偏差 | 判定 |
|---------|---------|-------------|------|------|
| Abstract | 182 | 170–210 | +7% | ✅ |
| Introduction | 1327 | 1200–1500 | -2% | ✅ |
| Background | 1187 | 1000–1300 | +3% | ✅ |
| Method | 1942 | 1400–1900 | +2.2% | 🟡 |
| Experiments | 2963 | 2300–3000 | +12% | ✅ |
| Conclusion | 175 | 150–250 | -8% | ✅ |
| **Total Body** | **7776** | **6500–8000** | **+8%** | ✅ |

### 1.2 引用对标

| 维度 | 实际 | 黄金标准 | 判定 |
|------|------|---------|------|
| bib 总条目 | 52 | 30–45 | ❌ 超出上限 7 条 |
| 正文实际引用 | 39 | 30–45 | ✅ |
| Introduction 引用数 | 25 | ≥50% × 39 = 20 | ✅ (64%) |
| Background 引用数 | 7 | ~6 | ✅ |
| Method 引用数 | 7 | ~4 | 🟡 偏多 |
| Experiments 引用数 | 11 | ~8 | 🟡 偏多 |
| Conclusion 引用数 | 0 | 0 | ✅ |

### 1.3 内容完整性对标

| 维度 | 要求 | 实际 | 判定 |
|------|------|------|------|
| Section 完整性 | Outline 每节都有 draft | 6 个 section 全部存在 | ✅ |
| 数据集 | ≥2 benchmark | CWRU + SEU | ✅ |
| SOTA 基线 | ≥4–5 方法 | WDCNN, ZSL-GAN, DMZSL, AZSL, Bi-LSTM-ZSL (5个) | ✅ |
| 消融实验 | 验证各组件 | 4 组消融 (Full/NoLLM/NoAttn/Base) | ✅ |
| 可视化 | t-SNE / confusion matrix | 均有提及 | ✅ |
| 参数敏感性 | 嵌入维度 / SNR | 均有 | ✅ |
| 图表类型覆盖 | 框架图/混淆矩阵/t-SNE/SNR曲线 | 全部提及 | ✅ |
| Index Terms | 4–8 terms | 未在 abstract.tex 中出现 | ❌ |

### 1.4 公式对标

| 维度 | 要求 | 实际 | 判定 |
|------|------|------|------|
| 公式总数 | 8–15 | 8 (Background 3 + Method 5) | 🟡 刚达标下限 |
| Outline Eq.8（分类效用函数） | 应在 Method 中 | **缺失** — experiments.tex 引用了 "Eq.8" 但 Method 中未定义 | ❌ |

---

## 2. ❌ 不通过项的具体修改要求

### ❌-1: bib 文件冗余和重复条目（必须修复）

**问题**：references.bib 包含 52 条，但正文仅引用 39 条。存在**重复条目**和**占位符式引用键**：

| 问题类型 | 具体条目 |
|---------|---------|
| 重复 | `zhang2017new` 与 `zhang2017wdcnn` 是同一篇论文 |
| 重复 | `radford2021learning` 与 `radford2021clip` 是同一篇论文 |
| 重复 | `reimers2019sbert` 与 `reimers2019sentence` 是同一篇论文 |
| 重复 | `chen2020simclr` 与 `chen2020simple` 是同一篇论文 |
| 占位符键 | `industrial_llm_ref` 引用键不规范 |

**修改要求**：
1. 合并 4 对重复条目，统一引用键
2. 重命名 `industrial_llm_ref` 为规范格式（如 `li2024industrial_llm`）
3. 清理 13 条未引用的 bib 条目（或将必要的条目补充引用到正文中）
4. 最终 bib 总条目标定在 **40–42 条**

### ❌-2: Eq.8（分类效用函数）缺失（必须修复）

**问题**：experiments.tex 第 3 节引用 "the utility function Eq.8"，但 method.tex 中只定义到 Eq.7（对比损失函数），不存在 Eq.8。

**修改要求**：
1. 在 method.tex 的 Section 3.5 中补充 Eq.8（零样本分类效用函数），例如基于余弦相似度的最近原型匹配公式
2. 或者在 experiments.tex 中删除对 Eq.8 的引用，改用文字描述

### ❌-3: Abstract 缺少 Index Terms（必须修复）

**问题**：黄金标准 `formatting.index_terms` 要求 4–8 个 Index Terms，outline 也列出了 7 个术语，但 abstract.tex 中未包含 `\begin{IEEEkeywords}...\end{IEEEkeywords}`。

**修改要求**：
在 abstract.tex 末尾（`\end{abstract}` 之前或之后，取决于模板格式）添加：
```latex
\begin{IEEEkeywords}
Zero-shot learning, Fault diagnosis, Transformer, Large language model, Cross-modal alignment, Rotating machinery, Semantic prototyping
\end{IEEEkeywords}
```

---

## 3. 🟡 需关注项（建议改进，不阻塞）

### 🟡-1: Method 字数略超上限
Method 1942 词超出黄金标准上限 1900 词 42 词（+2.2%）。偏差在容差范围内，但建议精简 Section 3.1（Overall Architecture）中的冗余描述，将字数控制在 1900 以内。

### 🟡-2: Introduction 段落数量超标
Outline 规划 6 段，实际 Introduction 约 8–9 段（P4 之后的 LLM 详细讨论、cross-modal alignment 论述、attention-based architectures 段落等显得冗长）。建议合并为 6 段结构，与 outline 严格对齐。

### 🟡-3: method.tex 底部包含注释掉的 bib 条目
method.tex 末尾有约 15 行注释掉的 bib 代码，应删除以保持代码整洁。

### 🟡-4: 公式数量偏少
实际 8 个公式，仅达到黄金标准下限。Background 中 Transformer 的 Positional Encoding 公式和 FFN 公式（outline 提及）未以公式环境呈现，建议补充 1–2 个以提高技术深度。

### 🟡-5: Experiments 引用分布
Experiments 中 `lei2020applications`、`hochreiter1997long`、`zhang2021attention`、`jia2016deep` 等引用在上下文中关联性偏弱，建议替换为更直接相关的对比实验文献。

---

## 4. 各 Section 评定汇总

| Section | 评定 | 说明 |
|---------|------|------|
| abstract.tex | 🟡 | 字数合格，缺 Index Terms |
| introduction.tex | ✅ | 内容完整，段落略多 |
| background.tex | ✅ | 字数、引用、公式均合格 |
| method.tex | ❌ | Eq.8 缺失，字数微超，含注释代码 |
| experiments.tex | ✅ | 内容全面，结构完整 |
| conclusion.tex | ✅ | 字数合适，内容完整 |
| references.bib | ❌ | 重复条目 + 未引用条目 + 占位符键 |

---

## 5. 修改优先级

| 优先级 | 编号 | 修改项 | 预估工作量 |
|--------|------|--------|-----------|
| P0 | ❌-2 | 补充 Eq.8 或删除引用 | 5 min |
| P0 | ❌-3 | 添加 Index Terms | 2 min |
| P0 | ❌-1 | 清理 bib 重复和冗余 | 15 min |
| P1 | 🟡-3 | 删除 method.tex 注释代码 | 2 min |
| P1 | 🟡-2 | 精简 Introduction 段落 | 20 min |
| P2 | 🟡-1 | 精简 Method 字数 | 10 min |
| P2 | 🟡-4 | 补充 Background 公式 | 15 min |
| P2 | 🟡-5 | 优化 Experiments 引用 | 10 min |

---

**最终判定：REVISE** — 存在 3 项 ❌ 必须修复项（Eq.8 缺失、Index Terms 缺失、bib 冗余），修复后预期可达到 ACCEPT 标准。
