# 逻辑检查报告 v11

## 审查结论：REVISE

## 逻辑漏洞清单

| 序号 | 位置 | 漏洞类型 | 具体描述 | 改进建议 |
|------|------|---------|---------|---------|
| 1 | Section IV-A 正文 vs Table 2（CWRU 样本数） | 数据矛盾 | 正文称 CWRU 共 3,500 个样本（2,000 训练 + 500 验证 + 1,000 未见），但 Table 2 写为 "800/400 (200 per class)"，即仅 1,200 个样本。两者差距近 3 倍。 | 统一数据。若正文 3,500 为准，则 Table 2 需改为 2500/1000 或类似；若 Table 2 为准，则正文数据描述需全面修正。 |
| 2 | Section IV-A 正文 vs Table 2（SEU 样本数） | 数据矛盾 | 正文称 SEU 共 4,000 个片段（2,400 seen + 1,600 unseen），但 Table 2 写为 "600/300 (150 per class)"，即仅 900 个样本。两者差距超过 4 倍。 | 同上，统一正文与 Table 2 的样本数量描述。 |
| 3 | Section IV-A 正文 vs Table 2（SEU 采样频率） | 数据矛盾 | 正文称 SEU 采样频率为 5120 Hz，但 Table 2 写为 "10 kHz"。 | 确认实际采样率，统一为一处。 |
| 4 | Section IV-A 正文 vs Table 2（SEU 转速范围） | 数据矛盾 | 正文称转速为 "20 Hz and 30 Hz"（即 1200–1800 rpm），但 Table 2 写为 "800–2400 rpm"。 | 确认实际转速范围，统一为一处。 |
| 5 | Section IV-B 正文 vs Table 3（学习率） | 参数矛盾 | 正文称学习率为 "0.001"，但 Table 3 写为 "$1 \times 10^{-4}$"（0.0001），相差 10 倍。 | 确认实际学习率并统一。 |
| 6 | Section IV-B 正文 vs Table 3（Weight Decay） | 参数矛盾 | 正文称 weight decay 为 "$1e$-$4$"，但 Table 3 写为 "$1 \times 10^{-5}$"，相差 10 倍。 | 统一为一处。 |
| 7 | Section IV-B 正文 vs Table 3（Epochs） | 参数矛盾 | 正文称训练 "200-epoch"，但 Table 3 写为 "Epochs = 100"。且 Section IV-D 收敛曲线分析中也提到 "200 epochs"。 | 统一为一处。 |
| 8 | Section IV-B 正文 vs Table 3（Latent Dimension） | 参数矛盾 | 正文明确 "$d_{model} = 256$"，且 Section IV-F 敏感性分析结论为 "$d_{model} = 256$" 最优，但 Table 3 写 Latent Dimension = 512。 | Table 3 应改为 256，与正文和敏感性分析结论保持一致。 |
| 9 | Section IV-B 正文 vs Table 3（Signal/Semantic Feature Dimension） | 参数矛盾 | 正文称 BERT 输出 1024 维语义向量，映射到 256 维联合空间；但 Table 3 写 Signal Feature Dimension = 512、Semantic Feature Dimension = 512。三项数值均与正文不符。 | Table 3 应改为 Signal Feature Dimension = 256、Semantic Feature Dimension = 256（映射后），或增加原始语义维度 1024 的行。 |
| 10 | Tables 4–5（WDCNN 标注为 Supervised） | 逻辑不当 | Table 4 中 WDCNN 标记为 "WDCNN (Supervised)"，平均精度 91.9%（CWRU）和 89.4%（SEU）均被加粗标记为最高。这是零样本诊断对比实验表，将监督学习基线的精度加粗突出具有误导性——读者会误以为该方法是零 shot 方法中最好的。 | 将 WDCNN (Supervised) 作为上界参考单独列出（不参与 zero-shot 排名加粗），或在表注中明确说明仅 zero-shot 方法参与排名。 |
| 11 | Table 1（Target Attribute Vector 列） | 逻辑矛盾 | 论文核心论点是 LLM 语义优于人工属性，但 Table 1（标题为 "LLM-Generated Fault Descriptions"）包含 "Target Attribute Vector" 列，内容为手工二元属性如 (1,0,0,1)。这暗示 LLM 生成的是二元属性向量，与正文描述的 "1024-dimensional continuous semantic embeddings" 直接矛盾。 | 移除 Table 1 中的 "Target Attribute Vector" 列，或替换为 LLM 编码后的高维语义向量描述（如维度、编码器名称），保持与正文一致。 |

## 严重性评估

- **序号 1–4**（数据集描述矛盾）：严重。实验可复现性是学术论文的基石，正文与表格的样本数、采样率、转速范围均不一致，审稿人会直接质疑数据真实性。
- **序号 5–9**（超参数矛盾）：严重。正文描述与汇总表参数相差 2–10 倍，直接影响实验可复现性和消融实验的可信度。
- **序号 10**（监督基线加粗）：中度。具有误导性但不影响实验逻辑本身。
- **序号 11**（属性向量列矛盾）：中度。与论文核心论点存在矛盾。

## 修改优先级

1. **第一优先**：统一 Table 2 与正文的数据集描述（序号 1–4）
2. **第一优先**：统一 Table 3 与正文的所有超参数（序号 5–9）
3. **第二优先**：修正 Table 4–5 中 WDCNN 的加粗标注（序号 10）
4. **第二优先**：修正 Table 1 的 Target Attribute Vector 列（序号 11）
