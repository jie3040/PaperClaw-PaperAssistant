# Prompts for Nanobanana Pro - 概念图生成

## Fig. 1 - Overall Architecture of PC-Diffusion Framework

**尺寸**: 1800×1000 pixels  
**标题**: Overall Architecture of the Proposed Physics-Constrained Diffusion Framework for Zero-Shot Fault Diagnosis

### 完整描述

创建一个水平三阶段流程图，展示完整的框架：

#### **阶段 1（左侧，约500px宽）：PINN 预训练**
- 顶部：输入框标注"Vibration Signals (Seen Faults)"，带波形图标
- 中间：神经网络图标标注"PINN"，显示3个隐藏层
- 底部：输出框标注"Learned Dynamics Model"，带方程符号
- 物理方程叠加层：LaTeX风格的"mẍ + cẋ + kx = F(t)"
- 颜色：深蓝色(#1976D2)用于框，灰色(#757575)用于网络

#### **阶段 2（中间，约600px宽）：PC-Diffusion 训练**
- 顶部：两个并行输入
  - 左：「Seen Fault Samples」（波形图标）
  - 右：「Semantic Vectors」（文本图标）
- 中间：大型 U-Net 架构图，显示：
  - 编码器路径（4个下采样块，左侧）
  - 解码器路径（4个上采样块，右侧）
  - 跳跃连接（虚线箭头）
  - 顶部的时间嵌入输入
- U-Net 下方的三个损失函数框：
  - 「L_freq」（频率图标）
  - 「L_period」（正弦波图标）
  - 「L_PINN」（方程图标）
- 底部：输出「Generated Unseen Fault Samples」
- 颜色：绿色(#4CAF50)用于U-Net，橙色(#FF9800)用于损失函数框

#### **阶段 3（右侧，约500px宽）：贝叶斯零样本推理**
- 顶部：输入「Test Signal (Unseen Fault)」
- 中间：两个并行分支
  - 左分支：「Feature Extractor (CNN)」→「Feature Vector」
  - 右分支：「Semantic Embedding」→「Semantic Space」
- 匹配模块：「Variational Inference」框，带概率分布图标
- 底部：两个输出
  - 「Predicted Class」（标签图标）
  - 「Uncertainty (95% CI)」（误差条图标）
- 颜色：紫色(#9C27B0)用于推理组件

### 连接关系
- 粗箭头(→)连接各阶段，标注数据流
- 虚线箭头表示反馈/约束路径
- 从阶段1的PINN到阶段2的损失函数有箭头（物理约束）

### 风格要求
- 干净的学术图表，白色背景，最小阴影
- 配色方案：
  - 主色：蓝色(#1976D2)、绿色(#4CAF50)、紫色(#9C27B0)
  - 次色：橙色(#FF9800)用于损失函数
  - 强调色：灰色(#757575)用于神经网络层
  - 文字：黑色(#000000)，标签字号14-16pt

### 特殊要求
- 包含数据类型的小图标（波形、文本、方程）
- 处理框使用圆角矩形
- 操作节点使用圆形
- 添加微妙的网格背景以增加技术感
- 右下角包含图例，解释箭头类型

---

## Fig. 3 - Generated Spectrogram Comparison

**尺寸**: 1800×600 pixels  
**标题**: CWT Spectrogram Comparison: Real, Standard DDPM, and PC-Diffusion

### 完整描述

创建一个1×3网格，展示CWT频谱图：

#### **列1（600×600px）：真实样本**
- 标题："(a) Real Sample"
- 频谱图：2D时频热力图
- X轴：时间（0-0.2秒）
- Y轴：频率（0-5000 Hz）
- 颜色映射：Jet色图（蓝→绿→黄→红）
- 模式：清晰的周期性脉冲，显示为垂直条纹

#### **列2（600×600px）：标准DDPM（无物理约束）**
- 标题："(b) Standard DDPM"
- 布局与列1相似
- 模式：结构较少，有一些伪影，缺少清晰的周期性

#### **列3（600×600px）：PC-Diffusion（提出的方法）**
- 标题："(c) PC-Diffusion (Proposed)"
- 布局与列1相似
- 模式：清晰的周期性结构，与真实样本匹配，物理上合理

### 颜色方案
- 热力图：Jet色图（蓝色表示低振幅，红色表示高振幅）
- 色条：每个子图右侧的垂直条，范围0-1（归一化振幅）
- 背景：白色
- 轴标签：黑色文字

### 风格要求
- 高分辨率科学可视化

### 特殊要求
- 每个子图包含色条
- 添加白色框突出显示关键差异（虚线矩形）
- 包含放大插图（100×100px）显示详细纹理
- 所有三个子图使用一致的颜色比例以便公平比较

---

## 说明

- **Fig.2（FFT频谱对比）已经用 matplotlib 生成**，不需要 nanobanana 生成
- **Fig.4-14（数据图）已经用 matplotlib 生成**，不需要 nanobanana 生成
- **只需要生成 Fig.1 和 Fig.3 这两张概念图**

生成后请保存为：
- `fig1_overall_architecture.png`（1800×1000）
- `fig3_spectrogram_comparison.png`（1800×600）

然后放到 `/home/liaowenjie/.openclaw-multi/shared/paper-project-2/figures/` 目录。
