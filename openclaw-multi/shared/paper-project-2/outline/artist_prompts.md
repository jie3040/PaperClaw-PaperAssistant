# Artist Prompts for PC-Diffusion ZSL Framework

### Fig. 1 - Overall Architecture of PC-Diffusion Framework
- **编号**: Fig. 1
- **标题**: Overall Architecture of the Proposed Physics-Informed Diffusion Zero-Shot Fault Diagnosis Framework
- **尺寸**: 1600 × 900 pixels
- **描述**: A horizontal comprehensive flowchart containing three main blocks. 
  - **Left Block (Physics Prior & Semantics)**: Shows raw vibration signals being processed by PINN on top, and dual-level semantic extraction (Manual + LLM) on the bottom.
  - **Middle Block (PC-Diffusion)**: Shows the forward noise adding and reverse denoising process of the diffusion model. Most importantly, draw an arrow indicating "Physics Constraint Loss" (Frequency & Time constraints) injecting into the reverse denoising steps.
  - **Right Block (Bayesian ZSL & Inference)**: Shows the generated unseen samples feeding into a Bayesian Neural Network, mapping to a semantic space. Output shows a prediction with a probability distribution (bell curve) indicating "Uncertainty Quantification".
- **风格**: Clean academic diagram, highly professional, white background.
- **配色**: Primary #1976D2 (Blue) for standard data flows, Secondary #388E3C (Green) for physics-related modules, Accent #F57C00 (Orange) for probabilistic/Bayesian modules.
- **特殊**: Use distinct, elegant icons for PINN, LLM, and Diffusion blocks. Include minor math notations like $x_t$, $x_{t-1}$, $\mathcal{L}_{phy}$ in the diffusion block.

### Fig. 2 - Physics-Constrained Diffusion Process
- **编号**: Fig. 2
- **标题**: Detailed Schematic of the Physics-Constrained Denoising Process
- **尺寸**: 1200 × 700 pixels
- **描述**: Focus strictly on the diffusion reverse process. Shows a noisy vibration signal $x_T$ sequentially denoised to a clean signal $x_0$. At each step, a "Physical Loss Regularizer" block evaluates the intermediate signal. The regularizer splits into two branches: "Frequency Energy Conservation" (showing an FFT plot icon) and "Time-domain Periodicity" (showing a wave waveform).
- **风格**: High-tech engineering style, vector graphic appearance, clean white background.
- **配色**: Deep Blue base, Red dashes for loss feedback loops, Purple for frequency domain elements.
- **特殊**: Use dashed arrows for the backward gradient flowing from the physical loss to update the denoising network.

### Fig. 3 - Bayesian Semantic Embedding Network
- **编号**: Fig. 3
- **标题**: Structure of the Bayesian Zero-Shot Semantic Embedding
- **尺寸**: 1000 × 600 pixels
- **描述**: Two parallel encoders. Upper encoder takes generated fault signal features (CNN architecture). Lower encoder takes combined semantic vectors. They align in a joint latent space. Instead of point embeddings, the latent space shows clouds/ellipses representing Gaussian distributions $\mathcal{N}(\mu, \sigma^2)$ for Bayesian uncertainty.
- **风格**: Mathematical and statistical visual style.
- **配色**: Teal and Grey with semi-transparent overlapping circles (ellipses) to represent probability distributions.
- **特殊**: Explicitly label mean $\mu$ and variance $\sigma$ parameters.