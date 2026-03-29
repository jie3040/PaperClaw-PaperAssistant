# 缩写检查报告

## 审查结论：REVISE

## 缩写清单

| 缩写 | 全称 | 首次出现位置 | 是否给出全称 | 状态 |
|------|------|-------------|-------------|------|
| CMSA-Trans | Cross-Modality Semantic Alignment Transformer | Abstract | ✅ | ✅ |
| LLM | Large Language Model | Abstract | ✅ | ✅ |
| TST | Time Series Transformer | Abstract | ✅ | ✅ |
| CWRU | Case Western Reserve University | Abstract | ✅ | ✅ |
| SEU | Southeast University | Abstract | ✅ | ✅ |
| IFD | Intelligent Fault Diagnosis | Section I, L45 | ✅ | ✅ |
| ZSL | Zero-Shot Learning | Section I, L54 | ✅ | ✅ |
| GPT-4 | Generative Pre-trained Transformer 4 | Section I, L62 | ✅ | ✅ |
| RNN | Recurrent Neural Network | Section I, L66 | ✅ | ✅ |
| LSTM | Long Short-Term Memory | Section I, L66 | ✅ | ✅ |
| PHM | Prognostics and Health Management | Section I, L70 | ✅ | ✅ |
| MHSA | Multi-Head Self-Attention | Section II, L82 | ✅ | ✅ |
| PE | Positional Encoding | Section II, L96 | ✅ | ✅ |
| FFN | Feed-Forward Network | Section II, L105 | ✅ | ✅ |
| ReLU | Rectified Linear Unit | Section II, L105 | ✅ | ✅ |
| GELU | Gaussian Error Linear Unit | Section II, L105 | ✅ | ✅ |
| LN | Layer Normalization | Section II, L105 | ✅ | ✅ |
| GZSL | Generalized Zero-Shot Learning | Section II, L118 | ✅ | ✅ |
| BERT | Bidirectional Encoder Representations from Transformers | Section II, L127 | ✅ | ✅ |
| CoT | Chain-of-Thought | Section II, L127 | ✅ | ✅ |
| WWM | Whole Word Masking | Section III, L172 | ✅ | ✅ |
| BPF | Ball Pass Frequency | Section III, L172 | ✅ | ✅ |
| CLIP | Contrastive Language-Image Pre-training | Section III, L152 | ✅ | ✅ |
| CNN | Convolutional Neural Network | Section III, L156 | ✅ | ✅ |
| 1D-CNN | one-dimensional Convolutional Neural Network | Section IV, L240 | ✅ | ✅ |
| AWGN | Additive White Gaussian Noise | Section IV, L313 | ✅ | ✅ |
| SNR | Signal-to-Noise Ratio | Section IV, L313 (正文); Fig caption L277 | ✅ | ✅ |
| GAN | Generative Adversarial Network | Section IV, L248 | ✅ | ✅ |
| t-SNE | t-Distributed Stochastic Neighbor Embedding | Section IV, L321 | ✅ | ✅ |
| IoT | Internet of Things | Section V, L348 | ✅ | ✅ |
| DMZSL | Deep Multi-modal ZSL | Section IV, L248 | ✅ | ✅ |
| AZSL | Attribute-based ZSL | Section IV, L248 | ✅ | ✅ |
| ZSL-GAN | ZSL-GAN (compound abbreviation) | Section IV, L248 | ✅ | ✅ |

## 需要修复的问题

### ❌ 1. [Section II, L127] "GPT" 首次出现未给出全称
"Large Language Models, such as GPT or Bidirectional Encoder Representations from Transformers (BERT)..."
- 文中 "Generative Pre-trained Transformer" 全称仅在 "GPT-4" 上下文中出现（L62），但 "GPT" 单独作为泛称使用时未给出全称。
- **修改建议**：将 "such as GPT or" 改为 "such as Generative Pre-trained Transformer (GPT) or"。

### ❌ 2. [Section IV, L248] "WDCNN" 首次出现未给出全称
"WDCNN \cite{zhang2017new}, a classic CNN-based model..."
- WDCNN 是一个 widely-used baseline，但全文未给出其全称（Wide Deep Convolutional Neural Network）。
- **修改建议**：改为 "a classic CNN-based model adapted for ZSL, namely Wide Deep Convolutional Neural Network (WDCNN) \cite{zhang2017new}"。

### ❌ 3. [Section IV, L248] "Bi-LSTM-ZSL" 首次出现未给出全称
"Bi-LSTM-ZSL \cite{chen2019bearing}, which captures temporal dependencies..."
- "Bi-LSTM" 的全称（Bidirectional Long Short-Term Memory）未给出。虽然 LSTM 已在 Section I 定义，但 Bi-LSTM 是一个新缩写形式。
- **修改建议**：改为 "Bidirectional LSTM-based ZSL (Bi-LSTM-ZSL) \cite{chen2019bearing}"。

### ❌ 4. [Section IV, L292] "1D-ResNet" 首次出现未给出全称
"replaces the Transformer encoder with a standard 1D-ResNet structure"
- ResNet（Residual Network）全文未给出全称。
- **修改建议**：改为 "a standard one-dimensional Residual Network (1D-ResNet) structure"。

## ⚠️ 一致性提醒（非阻塞项）

| 序号 | 位置 | 问题 | 建议 |
|------|------|------|------|
| 1 | L66 vs L105 | LSTMs 全称在 L66 定义为 "Long Short-Term Memory (LSTM) units"，L105 使用 "LSTM units" — 一致 ✅ | — |
| 2 | L129 | "CLIP-text" 使用连字符形式，建议与正文中 CLIP 保持一致，无需改动 | — |
| 3 | 全文 | "large language models" 在非缩写语境下有时全小写（如 L137），有时大写（LLM）。这不构成不一致，符合英文大小写规则 | — |
