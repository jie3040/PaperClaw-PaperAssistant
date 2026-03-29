# 框架对齐审查报告 (Stage 3.5 — v1)

## 审查结论：REVISE

---

## 逐项对标结果

| # | 审查项 | 黄金标准 | 当前框架 | 判定 | 说明 |
|---|--------|---------|---------|------|------|
| 1 | 章节结构 | 5-section (I-V) + Abstract + References | ✅ 匹配：Abstract, I-V, References | ✅ PASS | 完全符合 IEEE TIM 格式 |
| 2 | 章节数量 | total_sections=7 (含Abstract/References) | 7个顶层章节 | ✅ PASS | — |
| 3 | 子章节数 | 未明确指定，但范例含3-5个子章节 | Section II: 3, Section III: 5, Section IV: 6, 共14个子章节 | ✅ PASS | 合理 |
| 4 | 章节名称 | Abstract, Introduction, Background, Method, Experiments, Conclusion, References | 完全匹配 | ✅ PASS | — |
| 5 | Abstract 篇幅 | 190词 (170-210) | 190词 | ✅ PASS | — |
| 6 | Introduction 篇幅 | 1350词 (1200-1500) | 1350词，P1-P6 有字数分配 | ✅ PASS | — |
| 7 | Introduction 引用比 | ≥50% 总引用 | 20/38=52.6% | ✅ PASS | — |
| 8 | Background 篇幅 | 1150词 (1000-1300) | 1150词 | ✅ PASS | — |
| 9 | Method 篇幅 | 1650词 (1400-1900) | 1650词 | ✅ PASS | — |
| 10 | Experiments 篇幅 | 2650词 (2300-3000) | 2650词 | ✅ PASS | — |
| 11 | Conclusion 篇幅 | 190词 (150-250) | 190词 | ✅ PASS | — |
| 12 | 总正文字数 | 7200词 (6500-8000) | 6990词 | ✅ PASS | 6990 在 6500-8000 范围内 |
| 13 | 段落级字数分配 | 每个section标注子段/子节字数 | 每个section均有子段字数并标注加和 | ✅ PASS | — |
| 14 | 字数加和校验 | 子段之和 = section总字数 | 全部通过 (已标注 ✓) | ✅ PASS | — |
| 15 | 参考文献数量 | 35 (30-45) | 38 | ✅ PASS | — |
| 16 | 图总数 | 8-15 张 | 8张 (Fig. 1-8) | ✅ PASS | 处于下限 |
| 17 | 图类型覆盖 | Conceptual/framework, Architecture, Experimental setup/platform, Results plots, Comparison charts | ✅ Conceptual (Fig.1), ✅ Architecture (Fig.2-3), ❌ **缺少 Experimental setup/platform 图**, ✅ Results (Fig.4-5), ✅ Visualization (Fig.7), ✅ Data plots (Fig.6,8) | ❌ FAIL | 见下方修改要求 |
| 18 | 表总数 | 6-12 个 | 6张 (Table 1-6) | ✅ PASS | 处于下限 |
| 19 | 表类型覆盖 | Dataset description, Hyperparameters, Results comparison, Ablation study, Similarity/evaluation metrics | ✅ Dataset (T2), ✅ Hyperparameters (T3), ✅ Results (T4-5), ✅ Ablation (T6), ✅ Spec/Comparison (T1), ❌ **缺少相似度/评估指标对比表** | ❌ FAIL | 见下方修改要求 |
| 20 | 公式总数 | 8-15 个 | 8个 (Eq. 1-8) | ✅ PASS | 处于下限 |
| 21 | Index Terms | 4-8 terms (Required) | ❌ 框架中**未提及** Index Terms | ❌ FAIL | 见下方修改要求 |
| 22 | Contributions | 编号列表 3-4 项 | 4项编号列表 (P5) | ✅ PASS | — |
| 23 | 论文组织结构 | 最后一段描述剩余章节 | P6 (~100词) 描述 Sections II-V | ✅ PASS | — |
| 24 | 实验平台图 | Required (golden standard types) | ❌ 无 | ❌ FAIL | 与第17项重复 |
| 25 | 相似度/评估指标对比表 | Required (golden standard types) | ❌ 无 | ❌ FAIL | 与第19项重复 |
| 26 | 数据集数量 | ≥2 benchmark datasets | CWRU + SEU (2个) | ✅ PASS | — |
| 27 | SOTA对比方法 | ≥4-5 methods | 5 methods | ✅ PASS | — |
| 28 | 消融实验 | Required | ✅ 有 (Table 6) | ✅ PASS | — |
| 29 | t-SNE/可视化分析 | Required | ✅ 有 (Fig. 7) | ✅ PASS | — |

---

## ❌ 不通过项的具体修改要求

### 1. 缺少 Experimental Setup/Platform 图
- **位置**: Section IV.1 或 IV.2
- **要求**: 新增 1 张图（建议 Fig. X），展示实验平台（如轴承测试台/齿轮箱实验台的物理装置照片或示意图），标注传感器位置、数据采集设备等
- **量化**: 至少 1 张，使图总数增至 9 张
- **建议**: 可放在 Section IV.1 Experimental Setup 中，与数据集描述配合

### 2. 缺少相似度/评估指标对比表
- **位置**: Section IV.3 或 IV.4
- **要求**: 新增 1 个表，包含 cosine similarity、precision、recall、F1-score、HM（Harmonic Mean）等评估指标的详细对比
- **量化**: 至少 1 个表，使表总数增至 7 个
- **建议**: 可放在 Table 4-5 的比较结果后，或作为 IV.3 的补充表

### 3. 缺少 Index Terms
- **位置**: Abstract 之后（IEEE TIM 格式要求）
- **要求**: 列出 4-8 个索引术语（如：*Zero-shot learning, Fault diagnosis, Transformer, Large language model, Cross-modal alignment, Rotating machinery, Semantic prototyping*）
- **量化**: 5-7 个术语

---

## 🟡 建议改进项（非强制）

| 项 | 建议 | 优先级 |
|----|------|--------|
| 图总数仅 8 张（下限） | 建议增至 9-10 张以提高论文视觉丰富度 | 中 |
| 表总数仅 6 张（下限） | 建议增至 7-8 张 | 中 |
| 公式总数仅 8 个（下限） | 如方法细节丰富，可适当增加 1-2 个公式 | 低 |

---

## 总结

框架整体与黄金标准高度对齐，章节结构、字数分配、引用规划均合规。存在 **3 项必须修改**：
1. 新增实验平台图 (Fig. X)
2. 新增相似度/评估指标对比表 (Table X)
3. 补充 Index Terms

修改后重新提交审查。
