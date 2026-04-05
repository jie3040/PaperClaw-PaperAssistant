# 内容对齐审查报告 (阶段 4.5, R2, v3)

## 审查结论：REVISE

**审查基准**：
- 黄金标准：SHARED/golden_standard.json (文件不存在，使用 outline/v2/paper_outline.md 作为替代基准，总目标 9000 词，范围 8500-9500)
- 框架：SHARED/outline/v2/paper_outline.md
- 实际草稿：SHARED/drafts/v3/ 所有 .tex 文件
- 当前总词数：7139 (wc -w)

## 逐项对标结果

| 维度 | 黄金标准 (outline v2) | 当前实际 | 偏差 | 判定 | 说明 |
|------|-----------------------|----------|------|------|------|
| Section 完整性 | 所有 sections (Abstract, I-V, Conclusion) 有对应 draft | 全覆盖 | 0% | ✅ | 所有文件存在 |
| 总词数 | 8500-9500 (9000 目标) | 7139 | -21% | ❌ | 差 1361 词，未达标 |
| Abstract 词数 | ~200 | 190 | -5% | ✅ | 在 ±25% 内 |
| Introduction 词数 | ~850 | 1155 | +36% | ❌ | 超标 >25% |
| Related Work 词数 | ~900 | 1029 | +14% | ✅ | 在 ±25% 内 |
| Method 词数 | ~2500 | 2205 | -12% | ✅ | 在 ±25% 内 |
| Experiments 词数 | ~2250 | 2294 | +2% | ✅ | 在 ±25% 内 |
| Conclusion 词数 | ~300 | 266 | -11% | ✅ | 在 ±25% 内 |
| 公式数量 (Method) | ≥10 | 10 (Eq.1-10) | 0 | ✅ | 精确匹配 F1-F10 |
| 图表引用完整性 | Fig.1-8 全引用；Table I-VI 全引用 | Fig.1,2,5,6,7,8 引用；Fig.3,4 缺失；Tables 全覆盖 (I-VII) | 部分缺失 | ❌ | Fig.3 (Dual-modality alignment), Fig.4 (Cross-attention) 无正文引用 |
| 子章节覆盖 | Outline 每个子节要点体现 | 全覆盖 | 0 | ✅ | Intro A1-A6, Related RA1-RC2 等全现 |
| 实验完整性 | 数据集、基线、指标、主实验、消融 | 全有 (CWRU/Paderborn, CNN/Transformer/DANN 等, Acc/F1/MCC, Tables/Figs) | 0 | ✅ | 详尽，包括 cross-domain |
| Introduction 引用数量 | ≥ 总引用 50% | Intro ~29 引用；全篇 ~80+ | ~36% | ❌ | 未达 50%，需 Intro 扩充引用 |

## ❌ 不通过项的具体修改要求

1. **总词数不足**：当前 7139，目标 9000。**要求**：全篇扩充 1361 词。具体：Experiments +500 词 (添加 cross-dataset per-class 分析和更多 limitations)；Method +500 词 (扩展 ablation tables 和 prompt sensitivity)；Related Work +361 词 (添加更多 VLM non-RGB 案例)。重新 wc -w 验证 ≥9000。
   
2. **Introduction 词数超标**：1155 vs 850 (+36%)。**要求**：缩减至 900-1000 词。具体：合并 A2/A3 子节 (去除冗余 domain shift 示例，-200 词)；精简贡献列表 (-55 词)。wc -w 后 ≤1000 词。

3. **图表引用缺失**：Fig.3, Fig.4 未引用。**要求**：在 Method 子节 B (Overall Framework) 末尾添加：``Dual-modality alignment module (Fig.~\ref{fig:3}) and cross-attention decoder (Fig.~\ref{fig:4}) integrate as shown.'' 确保所有 Fig.1-8 有至少一次引用。

4. **Introduction 引用不足**：~29 vs 全篇 ~80 (36%)。**要求**：在 Intro 添加 ≥20 新引用 (总 Intro ≥49)，聚焦 survey [vibration PdM 经济损失、CWRU/Paderborn 基准局限]。使用 \cite{new1-new20}，确保 ≥50% 总引用。从 arXiv/IEEE 补充真实 refs。