# Project 3 - Revision TODO List

## 审查结论：MAJOR REVISION REQUIRED

**总体问题**：当前草稿字数仅为范例论文的 53.7%（7,183 vs 13,370 词），Methodology 和 Experiments 章节严重不足。

---

## TODO 1: Methodology 扩充（优先级：最高）

**当前状态**：1,358 词
**目标字数**：至少 3,500 词（范例论文 4,607 词）
**对比率**：29.5% → 目标 76%+

### 具体任务
1. **扩充 Dual-Path Diffusion Architecture 描述**
   - 添加详细的网络架构图描述（对应 Figure 1）
   - 详细描述 Time Domain Path（1D-CNN）的每一层结构
   - 详细描述 Time-Frequency Path（Spectral Conv）的每一层结构
   - 添加 Cross-Attention Fusion 的数学公式和实现细节

2. **添加算法伪代码**
   - Algorithm 1: Forward Diffusion Process
   - Algorithm 2: Reverse Denoising Process
   - Algorithm 3: Training Procedure with Contrastive Consistency Loss

3. **扩充公式推导**
   - 详细推导 Diffusion Process 的数学原理
   - 详细推导 Contrastive Consistency Loss 的计算过程
   - 添加 Cross-Attention 机制的数学表达
   - 添加 Semantic Embedding 的计算公式

4. **添加训练细节**
   - 详细描述训练过程的每个步骤
   - 添加损失函数的权重设置
   - 添加优化器的选择和超参数
   - 添加训练收敛的判断标准

5. **添加模型复杂度分析**
   - 计算参数量
   - 计算计算复杂度（FLOPs）
   - 与 baseline 方法对比

**参考范例论文**：Section III. METHOD（4,607 词）

---

## TODO 2: Experiments 扩充（优先级：高）

**当前状态**：855 词
**目标字数**：至少 2,500 词（范例论文 4,078 词）
**对比率**：21.0% → 目标 61%+

### 具体任务
1. **扩充数据集描述**
   - TPTS：详细描述 3 个传感器的物理意义、采样频率、故障类型的物理特征
   - TEP：详细描述 52 个过程变量、21 种故障模式、每种故障的物理机理
   - Hydraulic：详细描述 14 个传感器、144 种故障组合、故障的物理原因

2. **添加数据预处理细节**
   - 数据归一化方法
   - 时间窗口划分策略
   - 数据增强方法（如果有）
   - 训练集/验证集/测试集划分比例

3. **扩充实验设置**
   - 详细列出所有超参数（学习率、batch size、epoch、diffusion steps 等）
   - 详细描述硬件环境（GPU 型号、内存、训练时间）
   - 详细描述软件环境（PyTorch 版本、CUDA 版本、Python 版本）
   - 详细描述 LLM/CLIP 的配置（模型版本、embedding 维度）

4. **添加 Baseline 方法描述**
   - CycleGAN-SD：详细描述其架构和训练方法
   - VAEGAN-AR：详细描述其架构和训练方法
   - SRWGAN：详细描述其架构和训练方法
   - Standard DDPM：详细描述其架构和训练方法

5. **添加评估指标详细说明**
   - Accuracy：计算公式和物理意义
   - Harmonic Mean：计算公式和为什么使用它
   - FID：计算公式和物理意义
   - MMD：计算公式和物理意义

**参考范例论文**：Section IV. EXPERIMENTS AND RESULTS（4,078 词）

---

## TODO 3: Results 整合与扩充（优先级：中）

**当前状态**：1,685 词（独立章节）
**建议**：考虑与 Experiments 合并（参考范例论文结构）

### 具体任务
1. **扩充结果分析**
   - 对每个数据集的结果进行深入分析（为什么 CDDM 更好？）
   - 添加错误案例分析（哪些故障类型容易混淆？为什么？）
   - 添加可视化分析（t-SNE 图的详细解读）

2. **扩充消融实验**
   - 详细描述每个消融实验的设置
   - 详细分析每个组件的贡献（Dual-Path、Contrastive Loss、LLM Embedding）
   - 添加消融实验的可视化结果

3. **添加鲁棒性分析**
   - 不同噪声水平下的性能
   - 不同 LLM prompt 下的性能
   - 不同 diffusion steps 下的性能

**参考范例论文**：Results 部分包含在 Section IV 中

---

## TODO 4: Introduction 微调（优先级：低）

**当前状态**：1,184 词
**范例论文**：1,567 词
**对比率**：75.6%（接近达标，但可以优化）

### 具体任务
1. 添加更多的背景文献引用（增加引用密度）
2. 扩充动机部分（为什么现有方法不够好？）
3. 更详细地描述贡献（每个贡献的具体创新点）

---

## TODO 5: Related Work 结构优化（优先级：低）

**当前状态**：1,483 词
**注意**：范例论文没有独立的 Related Work 章节，而是在 Introduction 和 Preliminary Knowledge 中穿插

### 具体任务
1. 考虑是否需要保留独立的 Related Work 章节（IEEE TIM 允许）
2. 如果保留，添加更多的批判性分析（不仅仅是罗列文献）
3. 添加对比表格（总结不同方法的优缺点）

---

## 返工优先级

1. **TODO 1: Methodology 扩充**（必须完成，字数差距最大）
2. **TODO 2: Experiments 扩充**（必须完成，字数差距最大）
3. **TODO 3: Results 整合与扩充**（建议完成）
4. **TODO 4: Introduction 微调**（可选）
5. **TODO 5: Related Work 结构优化**（可选）

---

## 预期结果

完成 TODO 1 和 TODO 2 后，总字数应达到：
- Methodology: 3,500+ 词
- Experiments: 2,500+ 词
- 其他章节: 3,183 词
- **总计**: 9,183+ 词（约 68.7% 的范例论文字数）

如果完成所有 TODO，总字数应达到 10,000+ 词（约 75% 的范例论文字数），符合 IEEE TIM 的发表标准。
