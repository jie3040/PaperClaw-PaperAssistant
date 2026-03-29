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
| IFD | Intelligent Fault Diagnosis | Section I | ✅ | ✅ |
| ZSL | Zero-Shot Learning | Section I | ✅ | ✅ |
| RNN | Recurrent Neural Network | Section I | ✅ | ✅ |
| LSTM | Long Short-Term Memory | Section I | ✅ | ✅ |
| PHM | Prognostics and Health Management | Section I | ✅ | ✅ |
| MHSA | Multi-Head Self-Attention | Section II-A | ✅ | ✅ |
| PE | Positional Encoding | Section II-A | ✅（文中 "positional encoding (PE)"） | ✅ |
| FFN | Feed-Forward Network | Section II-A | ✅ | ✅ |
| LN | Layer Normalization | Section II-A | ✅ | ✅ |
| GZSL | Generalized Zero-Shot Learning | Section II-B | ✅ | ✅ |
| CoT | Chain-of-Thought | Section II-C | ✅ | ✅ |
| WWM | Whole Word Masking | Section III-C | ✅ | ✅ |
| BPF | Ball Pass Frequency | Section III-C | ✅ | ✅ |
| AWGN | Additive White Gaussian Noise | Section IV-F | ✅ | ✅ |
| SNR | Signal-to-Noise Ratio | Section IV-F | ✅ | ✅ |
| t-SNE | t-Distributed Stochastic Neighbor Embedding | Section IV-G | ✅ | ✅ |
| IoT | Internet of Things | Section V | ✅ | ✅ |

## 需要修复的问题

### 1. ❌ "South East University" vs "Southeast University" 不一致

- **Abstract**: "Southeast University (SEU)"
- **Section IV-A**: "South East University (SEU)"（出现两次）

**修改要求**: 全文统一为 "Southeast University (SEU)"，包括 Section IV-A 中的两处。

### 2. ❌ "SEU" 在 Section III-C（fig caption）中未加注但已在 Abstract 定义

- Section III-C 的 Table 1 caption 中提到 "SEU" 但该处为引用已定义缩写，**可接受**。

### 3. 🟡 ReLU / GELU 全称未给出

- Section II-A: "ReLU or GELU" 作为 FFN 的激活函数出现，未给出全称。
- ReLU = Rectified Linear Unit，GELU = Gaussian Error Linear Unit
- **建议**: 首次出现时写 "Rectified Linear Unit (ReLU)" 和 "Gaussian Error Linear Unit (GELU)"。

### 4. 🟡 "1D-CNN" 全称未明确展开

- Section IV-B: "custom three-layer 1D-CNN backbone"
- 1D-CNN = one-dimensional Convolutional Neural Network，建议首次出现展开为 "one-dimensional Convolutional Neural Network (1D-CNN)"。

### 5. 🟡 "BERT" 全称未给出

- Section II-C: "GPT or BERT" — BERT 首次出现未给出全称（Bidirectional Encoder Representations from Transformers）。
- Section III-C: "BERT-large with Whole Word Masking (WWM)" — 同样未给出 BERT 全称。
- **建议**: Section II-C 首次出现时写 "GPT or Bidirectional Encoder Representations from Transformers (BERT)"。

### 6. 🟡 "CLIP" 全称未给出

- Section III-A: "contrastive learning architectures like CLIP"
- Section II-C: "CLIP-text"
- CLIP = Contrastive Language-Image Pre-training
- **建议**: 首次出现时写 "Contrastive Language-Image Pre-training (CLIP)"。

### 7. 🟡 "GPT-4" 全称未给出

- Section I: "GPT-4" — GPT = Generative Pre-trained Transformer，首次出现时仅写 "GPT-4"。
- **建议**: 首次出现时写 "Generative Pre-trained Transformer 4th generation (GPT-4)" 或在引出 LLM 时提及 GPT 全称。

## 判定依据

- ❌ 项 1（SEU 名称不一致）属于"同一术语缩写不一致"→ **REVISE**
- 🟡 项 3-7 为首次使用未给全称的常见深度学习缩写，建议一并修复以提升规范性
