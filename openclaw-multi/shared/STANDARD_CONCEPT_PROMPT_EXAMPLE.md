# 标准科研图 Prompt 范例（nana banana 风格）

## 用途
这是一个标准的科研流程图 prompt 范例，展示了如何用详细的英文描述生成高质量的学术级流程图。

## 范例 Prompt

A detailed, high-resolution scientific flowchart, divided into three vertically-stacked main steps, is presented.

**Step 1: Data Preprocessing (Orange Background, Rounded Box)**

The process begins with a 'Raw data' cylinder icon on the left.

Two parallel flows emerge from this icon.

The upper flow consists of a rounded box labelled 'Fault label' (dashed border), connected to a yellow rounded rectangular box 'Attribute analysis', leading to a rounded box 'Fault attribute' (dashed border) with a label '$c_0'.

The lower flow features a rounded box 'Fault sample' (dashed border), directed towards a cyan, upward-tapering trapezoidal block 'Feature extraction', which in turn leads to a rounded box 'Feature vectors' (dashed border) with a label '$X_0'.

To the right of these flows, an example of two attribute matrices is shown: 'Fault#1 (1 0 0 1)' and 'Fault#2 (0 1 0 1)' with column headers 'Att#1', 'Att#2', 'Att#3', 'Att#4'. Below this, a scatter plot of a 'Feature space' with multiple points in green, blue, and orange is depicted, with axes labelled.

Straight arrows connect all blocks within Step 1.

**Step 2: Model Training (Green Background, Dashed Rounded Box)**

A main title 'Forward Attribute Diffusion Process' text is above a horizontal chain of five yellow ellipses, labelled sequentially '$c_0 \rightleftarrows c_1 \rightleftarrows ... \rightleftarrows c_{T-2} \rightleftarrows c_{T-1} \rightleftarrows c_T'. All but the final ellipse have arrows connecting them to the next and previous ellipse, while the final ellipse $c_T$ is connected only to the previous $c_{T-1}$ and also has a downward-pointing arrow that splits, with one branch pointing backwards and upwards to form a dashed box labelled 'Reverse Attribute Diffusion Process' that links $c_T$ to the central ellipsis, and the other branch going downwards to a specific '$c_t' ellipse.

Below this, a main title 'Forward Feature Diffusion Process' text is above another horizontal chain of five blue ellipses, labelled sequentially '$X_0 \rightleftarrows X_1 \rightleftarrows ... \rightleftarrows X_{T-2} \rightleftarrows X_{T-1} \rightleftarrows X_T'. The connections are identical to the attribute diffusion chain, with a downward arrow from $X_T$ splitting, one branch backwards forming a dashed box 'Conditional Reverse Feature Diffusion Process' and the other branch downwards to a specific '$X_t' ellipse.

An additional dashed arrow from the specific '$c_t' ellipse also points down into the 'Conditional Reverse Feature Diffusion Process' box.

From these downward arrows, a large, thick arrow points downwards towards Step 3.

At the bottom, a section detailed with a red dashed box is shown:

A title '(a) Noise Prediction' is above a complex diagram. It shows an input bar chart of a feature vector '$x^i_t' with labels f1-f5, an input of '$t \rightarrow \sqrt{1 - \alpha_t}', and an input 'Attribute $c^i_j', all directed into a stylized cyan 'U-Net' block. The U-Net block has internal dashed connections. The output from the U-Net block is a 'Predicted Noise' bar chart with labels f1-f5 and a formula '$\epsilon_\theta(x^i_t, t, c^i_t)'.

Text to the right describes (a) Input $x^i_t$ and its corresponding hidden attribute representation into U-net to predict noise; (b) Utilize predicted noise to recalculate noised-sample $x^i_{t-1}$.

**Step 3: Feature Generation and Fault Diagnosis (Blue Background, Dashed Rounded Box)**

A main flow from Step 2 goes into Step 3.

It begins with an input 'Random noise' bar chart with labels f1-f5, leading to a yellow rounded rectangular box 'Reverse diffusion process', which also receives an input from a rounded box 'Attribute of unseen class ($c^u_j$)'.

The output from the 'Reverse diffusion process' block is a 'Generated feature of unseen class' bar chart with labels f1-f5.

From this bar chart, the flow splits. One branch goes to a yellow rounded rectangular box 'KL-Guided selection', leading to 'Quality evaluation' (yellow rounded box), then 'Feature concatenation' (yellow rounded box), and then to a scatter plot 'Discriminative feature space' with clusters.

The main flow continues from the 'Generated feature of unseen class' bar chart into the same 'Discriminative feature space' scatter plot.

From the 'Discriminative feature space' scatter plot, the flow goes into a trapezoid shaped box with a diagonal label 'Diagnosis model', and also to a diagram of a multi-layer neural network with input nodes (circles) in green, hidden nodes in blue, and output nodes in green, with all connections drawn. An arrow points from the network to the 'Diagnosis model' block, and another arrow points from the block back to the network diagram.

Straight arrows connect all blocks within Step 3.

A single thick arrow points from the bottom of Step 2 towards the top of Step 3.

## 关键特征

### 1. 结构清晰
- 分成多个主要步骤（Step 1, Step 2, Step 3）
- 每个步骤有明确的背景色和边框样式
- 垂直堆叠或水平排列

### 2. 元素详细
- 每个框的形状（rounded box, cylinder, trapezoid, ellipse）
- 每个框的颜色（orange, yellow, cyan, green, blue）
- 每个框的边框样式（solid, dashed）
- 每个框的标签和公式

### 3. 连接明确
- 箭头类型（straight, curved, thick, dashed）
- 箭头方向（upward, downward, leftward, rightward）
- 箭头分支（split, merge）

### 4. 细节丰富
- 图表类型（bar chart, scatter plot, matrix）
- 图表标签（f1-f5, Att#1-Att#4）
- 数学公式（$c_0$, $X_0$, $\epsilon_\theta$）
- 文本说明（描述输入输出、计算过程）

### 5. 专业术语
- 使用学术术语（Feature extraction, Noise Prediction, Reverse diffusion process）
- 使用数学符号（$c_0$, $X_0$, $\rightleftarrows$）
- 使用技术名词（U-Net, KL-Guided selection）


