# Selected Idea — Project 8

## Idea 1: Cross-Modality Semantic Alignment Transformer (CMSA-Trans)

**Title**: Cross-Modality Semantic Alignment Transformer: Leveraging LLM-Generated Fault Semantics for Zero-Shot Fault Diagnosis of Rotating Machinery

**核心创新点**: 
- 用 LLM 自动生成故障语义描述，替代人工属性标注
- 跨模态互注意力（Mutual-Attention）对齐振动信号特征与语义空间
- 基于 Transformer 的时序编码器捕获长程依赖

**技术路线**:
1. Signal Encoder: 时序 Transformer（TST）提取振动信号长时相关特征
2. Semantic Prototyping: LLM 生成故障类型文本描述向量
3. Cross-Attention Alignment: Transformer Decoder 结构，信号特征为 Query，语义向量为 Key/Value
4. Zero-Shot Head: 余弦相似度分类

**预期优势**: 
- 无需人工定义语义属性
- 对未知故障类别识别能力强
- 引入工业先验知识增强鲁棒性
