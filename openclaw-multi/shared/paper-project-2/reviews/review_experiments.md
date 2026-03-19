
## Experiments 章节审查意见 (Reviewer)

**总体评价**：MAJOR REVISION (大修)

**与范例论文的对比分析**：
对比范例论文（Example 1），当前草稿在实验部分的详细程度和严谨性上存在较大差距：
1. **数据集划分缺乏具体数据**：范例中明确列出了不同诊断任务（Task A, Task B）的训练集和测试集类别及样本数量（如范例的 Table II），而当前草稿仅停留在概念性的 GZSL 协议描述。
2. **缺乏网络结构参数表**：范例论文提供了详细的每一层网络结构、卷积核大小、输出维度等参数表（Table I: Architecture parameters），当前草稿对 WaveNet 架构的描述过于宽泛结构，且通篇未引用任何表格（Table I 完全缺失）。
3. **训练细节与可复现性缺失**：范例具详细的实现和对比说明，而当前草稿遗漏了优化器选择、学习率、Batch Size、Epoch 等基础且关键的训练超参数，导致完全无法复现。

**各 section 详细审查意见与具体修改建议**：
1. **Experimental Setup & Dataset Configuration**：
   - 描述了 CWRU 和 XJTU-SY 的基础信息，但在“Zero-Shot Learning”的数据集划分上过于笼统。
   - **修改建议**：必须补充具体的 Zero-Shot 诊断任务设置详情（明确哪些特定的故障类是 Seen，哪些是 Unseen类），补充每类的具体样本总数和划分比例，强烈建议参考范例以表格形式呈现。
2. **Implementation Details**：
   - 当前写了归一化、窗口大小 (1024)、1000次采样等，但缺乏深度学习训练的基本环境与超参数。
   - **修改建议**：补充优化器（如 Adam/AdamW）、初始学习率及衰减策略、批次大小（Batch Size）、迭代轮数等。
3. **表格引用（Table I）缺失问题**：
   - **修改建议**：请在文中插入对应网络结构的超参数表格（Table I），明确列出各层的参数配置（如卷积核尺寸、通道数等），并在文中相应位置显式引用（如 "The detailed architectural parameters are summarized in Table I."）。
4. **缺失对比方法（Baselines）和评价指标描述**：
   - **修改建议**：在开展具体实验结果分析前，应列出所采用的对比方法和评估指标（如 Accuracy、F1-Score 等）。
