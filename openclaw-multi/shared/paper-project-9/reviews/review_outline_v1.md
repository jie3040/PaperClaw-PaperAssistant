# 框架对齐审查报告 (v1)
## 审查结论：REVISE

**原因总结**：存在多个不符合黄金标准的项，包括Introduction字数超标（1500 > 900 max）、额外独立Problem Formulation章节、Proposed Method字数超标（3200 > 2500）、Conclusion字数超标（400 > 300）、章节编号与黄金标准错位。主要问题需调整结构和字数分配。

## 逐项对标结果

| 维度 | 黄金标准 | 当前框架 | 判定 | 说明 |
|------|----------|----------|------|------|
| **总词数** | 8500-9500 (target 9000) | 9000 | ✅ | 精确匹配 |
| **总页数预估** | 11-17页 (target 14) | 未明确，但词数对应约14页 | 🟡 | 依赖最终格式化，暂接受 |
| **章节数量** | 5主节 + Abstract (I-V) | 6主节 + Abstract (I-VI + III.Problem) | ❌ | 多出Problem Formulation章节，Proposed/Experiments/Conclusion编号错位为IV/V/VI |
| **章节名称覆盖** | Abstract, I.Intro, II.Related, III.Proposed, IV.Experiments, V.Conclusion | 全覆盖，但多Problem Formulation | ❌ | 需移除独立Problem Formulation，合并至III.Proposed开篇 |
| **Introduction字数** | 700-900 (≤1000) | ~1500 | ❌ | 超标66%，需缩减至800-900词 |
| **总图数** | 5-12 (target 8) | 8 | ✅ | 匹配 |
| **总表数** | 4-8 (target 6) | 6 | ✅ | 匹配 |
| **Introduction引用数** | ≥总50% (≥20/40) | ≥20 | ✅ | 匹配 |
| **Related Work字数** | 500-900 | ~1000 | 🟡 | 轻微超标(+11%)，可接受但建议压缩至850 |
| **Proposed Method字数** | 1500-2500 | ~3200 | ❌ | 超标28%，需缩减至2200-2400词 |
| **Experiments字数** | 1500-2500 | ~2200 | ✅ | 匹配 |
| **Conclusion字数** | 150-300 | ~400 | ❌ | 超标33%，需缩减至250-300词 |
| **Abstract字数** | 150-250 | ~200 | ✅ | 匹配 |
| **Problem Formulation独立章节** | 无（建议合并至Method） | 独立III (~600词) | ❌ | 需合并至Proposed Method开篇，节省~200词用于Intro调整 |
| **关键公式覆盖** | ≥6-15 (target10)，含对比学习、注意力、MAML等 | F1故障诊断、F2对比损失、F3注意力、F4 MAML meta (至少4个明确) | 🟡 | 覆盖核心，但数量偏少，Proposed中需补充2-3个（如谱图生成公式、适配器公式） |
| **IEEE TIM风格** | IEEEtran.cls, 罗马数字节, single para Abstract, figure*/figure | 匹配（罗马数字、单段Abstract、figure计划） | ✅ | 符合 |
| **子章节字数加和** | 子段和=节总字数 | 各节子段和接近总字数（e.g. Intro 1300→1500 pad） | 🟡 | 小偏差，可在写作中精确调整 |
| **图表类型覆盖** | 架构图、结果图、t-SNE、比较表等（范例推断） | 覆盖pipeline、架构、问题图、结果、消融、t-SNE | ✅ | 合理分布 |

## ❌ 不通过项的具体修改要求
1. **移除独立III. Problem Formulation**：将P1-P3内容（~400词核心）合并至IV→III. Proposed Method的A. Overall Framework开篇，作为问题定义。删除整个III节，节省章节编号并~200词。**量化**：新III.Proposed总字数控制在2600（原3200-600），再内部缩减至2300。
2. **Introduction缩减**：从1500→850词。**具体**：压缩A1/A3各减50词（背景/局限泛化），删除A7 organization（移至Intro末1句），目标子段：250+150+200+200+200+150-150=1000→进一步精简挑战/机会描述各-75词至850。
3. **Proposed Method缩减**：从3200→2300词。**具体**：C. VLM Fine-tuning减200词（公式解释简要化），D. MAML减100词，E. Inference减50词；补充2公式（谱图公式+适配器，~50词各）。
4. **Conclusion缩减**：从400→280词。**具体**：C1减至150，C2/C3各减30词，聚焦核心贡献避免重复。
5. **章节编号修正**：调整为标准I-V（无III.Problem后：I Intro, II Related, III Proposed[+Problem], IV Exp, V Conc）。
6. **公式补充**：在Proposed B添加谱图生成公式 \( S = \mathcal{STFT}(x_{vib}) \) (~30词)；D添加内循环适配 \( \theta' = \theta - \alpha \nabla \mathcal{L}_{task}(\theta) \) (~30词)。总公式≥6。

**调整后预计总词数**：9000 - (1500-850) - (3200-2300) - (400-280) + minor pads ≈ 9000维持平衡。

**预计时间**：框架调整30min，确认后可进入内容写作。
