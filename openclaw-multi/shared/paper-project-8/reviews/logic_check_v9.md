# 逻辑检查报告

## 审查结论：REVISE

本报告按照逻辑检查 skill 的要求，以"挑剔性阅读"方式逐段审视论文论证逻辑，仅关注严重影响理解、逻辑混乱、事实错误或关键术语定义不清的问题。

---

## 逻辑漏洞清单

| 序号 | 位置 | 漏洞类型 | 具体描述 | 改进建议 |
|------|------|---------|---------|---------|
| 1 | Section IV-A（实验设置，第1段）+ Table 2 | 数据自相矛盾 | 正文称 CWRU 数据集共 3,500 个样本（训练 2,000 + 验证 500 + 未见类 1,000），但 Table 2 写为 Seen/Unseen = 800/400（合计 1,200）。两个数字差距近 3 倍。SEU 同理：正文称 4,000 个样本，Table 2 写为 600/300（合计 900）。 | 统一正文与 Table 2 的数据。推荐以正文描述为准（3,500 CWRU / 4,000 SEU），修改 Table 2 对应数值。 |
| 2 | Section IV-A（SEU 数据集描述）+ Table 2 | 采样频率与转速自相矛盾 | 正文称 SEU 采样频率 5120 Hz、转速 20 Hz 和 30 Hz（即 1200/1800 rpm），但 Table 2 写采样频率 10 kHz、转速 800–2400 rpm。 | 统一正文与 Table 2 的 SEU 数据集参数，确保一致。 |
| 3 | Section IV-E（消融实验正文）+ Table 6（ablation） | 消融实验数据严重不一致 | 正文称 CWRU Full=89.4%、NoLLM=81.6%、NoAttn=83.9%、Base=85.1%；SEU Full=82.5%、NoLLM=74.7%、NoAttn=77.0%、Base=78.4%。但 Table 6 显示 CWRU Unseen=75.9%、w/o TST=68.4%、w/o LLM=61.2%、w/o Cross-Attn=58.7%。两组数字完全不同，无法对应。 | 必须统一消融实验正文描述与 Table 6 的数值。这是最严重的逻辑错误之一。 |
| 4 | Section IV-D（第1段）+ Table 4/Table 5 | 基线方法数量不匹配 | 正文列出 5 个基线方法：WDCNN、ZSL-GAN、DMZSL、AZSL、Bi-LSTM-ZSL。但 Table 4 和 Table 5 仅展示 3 个方法（WDCNN、ZSL-GAN、DMZSL），缺少 AZSL 和 Bi-LSTM-ZSL 的实验数据。 | 补充 AZSL 和 Bi-LSTM-ZSL 在两个数据集上的结果到 Table 4 和 Table 5 中；或删除正文对这两个方法的引用。 |
| 5 | Section IV-B（实现细节）+ Table 3 + Section III-D | 超参数前后矛盾 | 正文称学习率 0.001、训练 200 epochs、weight decay=1e-4、d_model=256、语义维度 1024→256。但 Table 3 写学习率 1e-4、epochs=100、weight decay=1e-5、latent dim=512、semantic dim=512。三处描述互相矛盾。 | 统一超参数。正文、Table 3、Method 章节的公式必须使用同一组数值。 |
| 6 | Section IV-B（实现细节）+ Section III-B | 架构描述矛盾 | 实现细节段称使用"custom three-layer 1D-CNN backbone"配合 Transformer，但 Section III-B（Signal Encoder）仅描述了 TST 的 patch embedding 方案，未提及任何 CNN backbone。读者无法判断实际架构是什么。 | 在 Section III-B 中补充 CNN backbone 的描述，或删除实现细节中关于 1D-CNN 的表述，保持与 Method 章节一致。 |
| 7 | Table 1 | 逻辑矛盾：与论文核心主张冲突 | 论文的核心贡献是"消除手工属性标注"（eliminating the need for labeled samples of target fault categories），但 Table 1 最后一列为"Target Attribute Vector"，包含 (1,0,0,1) 等手工标注的二进制属性向量。这直接与论文论点矛盾。 | 删除 Table 1 的"Target Attribute Vector"列，或将其替换为 LLM 嵌入向量的维度/类型说明。 |
| 8 | Table 4 + Table 5 | 不公平比较的逻辑问题 | WDCNN 被标注为"(Supervised)"——即使用了测试集类别的标注数据进行训练——这与零样本学习场景下的比较不公平。监督方法在已知所有类别时自然优于零样本方法，这一比较无法证明 CMSA-Trans 的优越性。 | 将 WDCNN (Supervised) 替换为零样本设定下的 WDCNN（使用属性匹配），或将其移至单独的"参考行"并明确说明这只是上界参考值。 |
| 9 | Section IV-A（CWRU 未见类定义）+ Table 4 列名 | 未见类定义与结果表格列名不匹配 | 正文定义 CWRU 未见类为"inner race faults (IR, 0.021'') 和 complex multi-component fault combinations (0.028'' ball failure)"，且 Outer Race 为已见类。但 Table 4 的列名为 Inner Race、Outer Race、Rolling Element、Ball Pass——Outer Race 出现在本应是未见类的结果表中。SEU 同理：正文称未见类为 Worn 和 Root，Table 5 列名却是 Gear Tooth Wear、Gear Crack、Pitting、Wear。 | 重新定义未见/已见类划分并同步修改正文和表格列名，确保一致。 |
| 10 | Section IV-F（第2段，SNR 分析）| 数据逻辑不合理 | 正文称 SNR=0 dB 时 CMSA-Trans 达到 75.6%，比 WDCNN 高 12.3%。但 Table 4 显示 CWRU 无噪声条件下 CMSA-Trans 平均仅 75.9%。0 dB 噪声条件下的准确率不应与干净条件下几乎相同。 | 重新核实 SNR 实验数据。正常预期应为：干净条件 > SNR=10 dB > SNR=0 dB。当前数据不符合物理直觉。 |

---

## 总结

本文存在 **10 处严重的逻辑/数据不一致问题**，主要集中在：

1. **正文与表格数据严重矛盾**（序号 1、2、3、5、9）——这是最致命的问题，直接影响论文可信度。
2. **架构与方法描述不一致**（序号 6）——读者无法复现。
3. **核心主张与示例矛盾**（序号 7）——Table 1 的属性向量列直接否定了论文的主要贡献。
4. **实验设计逻辑缺陷**（序号 8、10）——不公平比较和不符合物理直觉的数据。

以上每条都必须在修改后重新核实数据的一致性。
