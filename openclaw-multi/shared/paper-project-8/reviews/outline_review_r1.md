# 框架对齐审查报告 — v1

**项目**: CMSA-Trans: Cross-Modality Semantic Alignment Transformer  
**审查模式**: A（框架对齐审查，阶段 3.5）  
**审查日期**: 2026-03-29

## 审查结论：REVISE

---

## 逐项对标结果

| 维度 | 黄金标准 | 当前框架 | 判定 | 说明 |
|------|---------|---------|------|------|
| 章节数量 | 7 sections（Abstract, I-V, References） | 7（Abstract, I-V, References） | ✅ | 完全匹配 |
| 章节名称 | 必须覆盖黄金标准所有名称 | 完全覆盖 | ✅ | |
| 子章节数 | 与范例对标 | Background 3个, Method 5个, Experiments 6个 | ✅ | 合理分布 |
| Abstract 字数 | 170-210（target 190） | 190 | ✅ | |
| Introduction 字数 | 1200-1500（target 1350） | 1350 | ✅ | |
| Background 字数 | 1000-1300（target 1150） | 1150 | ✅ | |
| Method 字数 | 1400-1900（target 1650） | 1650 | ✅ | |
| Experiments 字数 | 2300-3000（target 2650） | 2650 | ✅ | |
| Conclusion 字数 | 150-250（target 190） | 190 | ✅ | |
| 总正文字数 | 6500-8000（target 7200） | 6990 | ✅ | 在范围内 |
| 段落级字数分配 | 每个 section 标注子段字数 | 全部标注 | ✅ | |
| 字数加和校验 | 子段之和 = section 总字数 | 全部校验通过 | ✅ | |
| 图表总数 | 8-15 figures | 8 figures | 🟡 | 偏下限但满足范围 |
| 图表类型覆盖 | 5种类型必须覆盖 | 概念图✅ 架构图✅ 实验平台❌ 结果图✅ 对比图✅ | ❌ | 缺少「Experimental setup/platform」图 |
| 表格总数 | 6-12 tables | 6 tables | 🟡 | 偏下限但满足范围 |
| 表格类型覆盖 | 5种类型必须覆盖 | 数据集✅ 超参数✅ 结果对比✅ 消融✅ 相似度评估❌ | ❌ | 缺少「Similarity/evaluation metrics」类表格 |
| 公式数量 | 8-15 | 8 | 🟡 | 偏下限但满足范围 |
| 参考文献总数 | 30-45（target 35） | 38 | ✅ | |
| Introduction 引用占比 | ≥50% | 52.6% (20/38) | ✅ | |
| figure* 双栏 | 关键概念图用 figure* | Fig.1, 3, 4, 7 双栏 | ✅ | |
| Abstract 单段 | 无换行 | 已注明单段 | ✅ | |
| Conclusion 贡献总结+future work | 必须包含 | 已包含 | ✅ | |
| 消融实验 | 必须包含 | 4.4 节 | ✅ | |
| SOTA 对比（≥4-5 methods） | 必须包含 | 5 methods | ✅ | |
| Visual analysis (t-SNE等) | 必须包含 | 4.6 节 | ✅ | |
| 数据集数量（≥2） | 必须包含 | CWRU, SEU | ✅ | |
| Index terms | Required, 4-8 terms | 未提及 | ❌ | 框架中未规划 Index Terms |
| 贡献列表编号 | Introduction 中编号 3-4 items | 4 items 编号 | ✅ | |
| 论文组织说明 | Introduction 最后段描述 II-V | P6 已规划 | ✅ | |

---

## ❌ 不通过项的具体修改要求

### 1. 图表类型覆盖 — 缺少「Experimental setup/platform」图
**修改要求**：在 Section IV.1 或 IV.2 中新增一张 **Experimental setup/platform** 图（如 CWRU 试验台实物照片或示意图），编号建议为 **Fig. 8**（或插入 Fig. 1 和 Fig. 2 之间），使图片总数达到 9 张。

### 2. 表格类型覆盖 — 缺少「Similarity/evaluation metrics」类表格
**修改要求**：在 Section III.4 或 Section IV 中新增一张展示 **信号特征与语义原型之间相似度/距离度量** 的表格（如 cosine similarity matrix 或 prototype distance），使表格总数达到 7 张。建议编号为 **Table 7**，放置于 Cross-Modality Alignment 小节之后或 ablation study 中。

### 3. Index Terms 未规划
**修改要求**：在 Abstract 下方增加 **Index Terms** 规划，列出 4-8 个关键词。建议包含：`Zero-shot learning`, `Fault diagnosis`, `Rotating machinery`, `Transformer`, `Cross-modal alignment`, `Large language model`, `Semantic prototyping`。字数约 30 词，不计入 Abstract 字数。

---

## 🟡 预警项（建议优化，非强制）

1. **图片数量偏下限**（8/8-15）：建议增至 10 张以上，可在 ablation 或 sensitivity analysis 中补充条形图或雷达图。
2. **表格数量偏下限**（6/6-12）：建议补充至 8 张以上，如增加「不同 embedding 维度对比表」或「LLM 生成 vs 手工标注的详细语义对比表」。
3. **公式数量偏下限**（8/8-15）：建议增至 10+，如在 Method 部分补充 positional encoding 公式、zero-shot classification score 公式等。

---

## 统计汇总
- ✅ 通过：21 项
- 🟡 预警：3 项
- ❌ 不通过：3 项
