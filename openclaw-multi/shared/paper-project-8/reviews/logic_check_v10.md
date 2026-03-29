# 逻辑检查报告 — CMSA-Trans (v10)

## 审查结论：REVISE

---

## 逻辑漏洞清单

| 序号 | 位置 | 漏洞类型 | 具体描述 | 改进建议 |
|------|------|---------|---------|---------|
| 1 | Section IV-A（SEU 数据集描述）与 Table 5（SEU 结果表） | 数据与表格不一致 | 正文明确指出 SEU 数据集有 **4 个未见类**：Worn Tooth、Root Crack、Pitting、Surface Wear（"1,600 test samples, 400 per class"），但 Table 5 仅列出 **2 列未见类结果**（Worn Tooth、Root Fault），缺少 Pitting 和 Surface Wear 的逐类准确率。Table 5 的 Average = (84.3 + 80.7) / 2 = 82.5，是按 **2 类** 计算的均值，与正文宣称的 4 类不一致。 | 将 Table 5 扩展为 4 列未见类（Worn Tooth、Root Crack/Root Fault、Pitting、Surface Wear），并重新计算 Average 为 4 类均值。同时更新 Table 6 中 SEU 的 CMSA-Trans-Full 值以保持一致。 |
| 2 | Eq. (10) 与 Table 3（Hyperparameters） | 公式与超参数不一致 | Eq. (10) 仅定义了一个损失函数 $\mathcal{L}_{total}$（基于余弦相似度的交叉熵）。但 Table 3 列出 **两个独立损失权重**：Alignment Loss Weight = 0.5 和 Classification Weight = 1.0。Section IV-E 收敛分析中也提到"classification loss and contrastive alignment loss"的"balanced combination"。全文未给出组合这两个损失的公式。 | 补充完整损失函数公式，例如 $\mathcal{L} = \lambda_1 \mathcal{L}_{cls} + \lambda_2 \mathcal{L}_{align}$，其中 $\lambda_1 = 1.0$、$\lambda_2 = 0.5$，并分别定义 $\mathcal{L}_{cls}$ 和 $\mathcal{L}_{align}$。 |
| 3 | Section IV-A 正文 vs. Table 5 列名 | 术语不一致 | 正文称 SEU 未见类之一为 **"Root Crack"**，但 Table 5 列名写为 **"Root Fault"**。同一故障类型在文中使用两个不同名称，影响可读性和一致性。 | 统一全文术语，建议统一为 "Root Crack"（与正文描述一致），同时修改 Table 5 列名。 |
| 4 | Section III-C（Semantic Prototyping）vs. Section IV-B（Implementation Details） | 模型选型不一致 | Section III-C 提到使用 **SBERT** 对 LLM 文本进行编码（"using a sentence-level embedding model such as SBERT"），但 Section IV-B 明确指定使用 **BERT-large with WWM** 产生 1024 维语义向量。两者是不同的预训练模型，读者无法确定实际使用的是哪一个。 | 统一为实际使用的模型。如果使用 BERT-large，则在 Section III-C 中将 SBERT 改为 BERT-large；反之亦然。 |

---

## 通过项（无需修改）

| 检查项 | 结果 |
|--------|------|
| Table 2（数据集）样本数与正文一致 | ✅ CWRU: 2500/1000（正文 2000+500/1000）；SEU: 2400/1600（正文一致） |
| Table 2 转速与正文一致 | ✅ SEU 20-30 Hz = 1200-1800 rpm |
| 超参数：正文 vs Table 3 | ✅ 学习率 1e-3、batch 64、Adam、weight decay 1e-4、epochs 200、layers 4、heads 8、d_model 256 全部一致 |
| LLM 语义维度：正文 1024→256 vs Table 3 | ✅ 一致 |
| 消融实验正文数值 vs Table 6 | ✅ CWRU: 89.4/81.6/83.9/85.1 全部匹配；SEU: 82.5/74.7/77.0/78.4 全部匹配 |
| 消融降幅计算 | ✅ NoLLM: 82.5-74.7=7.8（正文称 7.8%）；NoAttn: 82.5-77.0=5.5（正文称 5.5%） |
| CWRU 未见类定义 vs Table 4 列名 | ✅ Inner Race + Combined，Average = (91.7+87.1)/2 = 89.4，与 Table 6 Full 一致 |
| CWRU 未见类 Table 4 与 Table 6 Full 值一致 | ✅ 均为 89.4% |
| SEU 未见类 Table 5 与 Table 6 Full 值一致 | ✅ 均为 82.5%（但两者均仅基于 2 类计算，与正文 4 类矛盾，见 Issue #1） |
