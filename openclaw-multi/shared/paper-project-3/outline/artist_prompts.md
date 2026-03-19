# Concept Figures Prompts (CDDM)

### Fig. 1 - Overall Cross-Modal Zero-Shot Diagnosis Framework (CDDM)
- **编号**: Fig. 1
- **标题**: Overall Architecture of the Proposed CLIP-Guided Dual-path Diffusion Model (CDDM) for Zero-Shot Fault Diagnosis.
- **尺寸**: 1800×1000 pixels
- **描述**: 
  分为上下两部分。上半部分（Part A）展示"Continuous Semantic Encoding"—左侧是一个大脑和文档图标代表 LLM，提取一段文本描述（"Valve leakage causing pressure drop"），右箭头指向一个高维嵌入向量（Continuous Dense Vector）。
  下半部分（Part B）是核心。左侧是真实传感器信号（Seen Faults），通过 Forward Diffusion 加噪变成纯高斯噪声。右侧是 Reverse Denoising 过程：从噪声出发，使用该"高维嵌入向量"作为 Condition 指南，输入到一个具有两条分支的网络（上分支: Time Domain 1D-CNN；下分支: Time-Frequency Domain Spectral Conv）。两个分支通过 Cross-Attention 层汇合。最终输出生成的 Unseen Fault 信号并进入诊断分类器。
- **风格**: Clean IEEE academic style, white background, high-tech industrial aesthetic.
- **配色**: 
  - Primary (Semantic/Text): #1976D2 (RGB: 25, 118, 210) - Blue
  - Secondary (Time Path): #388E3C (RGB: 56, 142, 60) - Green
  - Accent (Freq Path): #F57C00 (RGB: 245, 124, 0) - Orange
  - Background Base: #FFFFFF (RGB: 255, 255, 255)
- **特殊**: Use solid arrows for data flow and dashed arrows for condition injection. Include LaTeX mathematical symbols like $x_0$, $x_T$, $\epsilon_\theta$.