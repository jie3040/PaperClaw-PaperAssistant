# Concept Prompts for Diff-LM-GZSL Figures
# Language-Driven Latent Diffusion for Continuous Semantic Alignment in Zero-Shot Fault Diagnosis

---

## Fig. 1: Conceptual Illustration — Traditional ZSL vs. Diff-LM-GZSL

### Prompt

Create a professional academic diagram comparing Traditional Zero-Shot Learning (ZSL) with the proposed Diff-LM-GZSL method. The diagram should be suitable for IEEE double-column publication with clean lines and no decorative elements.

**Layout:** Split the figure into two main sections with a vertical divider. The LEFT side shows "Traditional ZSL" and the RIGHT side shows "Diff-LM-GZSL".

**Left Side - Traditional ZSL:**
- Top box: "Handcrafted Binary Attributes" showing a vector [0,1,0,1] with small icons representing fault types
- Arrow pointing down to middle box: "GAN/VAE Generator"
- Arrow pointing down to bottom box: "Synthesized Features" with a 2D scatter plot showing overlapping distributions
- Add a warning annotation: "Domain Shift Problem" with a red arrow pointing to the overlapping area
- Color scheme: Muted gray tones with orange highlights for the problem areas

**Right Side - Diff-LM-GZSL:**
- Top box: "Natural Language Fault Descriptions" showing sample text lines ("Inner race fault with periodic impulse...", "Outer race defect...")
- Arrow pointing down to second box: "LLM/BERT Encoder"
- Arrow pointing down to third box: "Continuous Semantic Vectors" showing a flowing vector representation [0.82, -0.15, 0.67, ...]
- Arrow pointing down to fourth box: "Conditional Latent Diffusion" with a stylized diffusion process icon
- Arrow pointing down to bottom box: "High-Quality Synthesized Features" with a 2D scatter plot showing well-separated clusters
- Add a checkmark annotation: "Semantic Alignment Resolved" in green
- Color scheme: Blue tones (#2E86AB, #A23B72) with green for the resolved indicator

**Center:**
- Add comparison arrows between corresponding elements on both sides
- At the bottom, add a text box: "Key Innovation: Continuous semantic embedding + Latent diffusion for better domain alignment"

**Style Requirements:**
- Professional academic diagram aesthetic
- Clean geometric shapes (rounded rectangles for boxes, arrows for flow)
- Use consistent line weights
- Include minimal text labels in Helvetica or Arial font
- No gradients or shadows
- White background

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS
---

## Fig. 2: Overall Architecture of Diff-LM-GZSL

### Prompt

Create a comprehensive system architecture diagram for the proposed Diff-LM-GZSL method, suitable for IEEE TIM publication. The diagram should show the complete pipeline from input to classification output.

**Layout:** Three main horizontal modules from left to right, connected by data flow arrows.

**Module 1 - Language-Driven Semantic Embedding (Left):**
- Input: "Fault Text Descriptions T" displayed as a document icon with sample text lines
- Box: "BERT Encoder" with architecture diagram inside showing transformer layers
- Arrow to: "Semantic Projection Layer" (W_s, b_s)
- Output: "Semantic Vector a ∈ R^{d_a}" shown as a vertical numerical vector with flowing lines
- Annotate: "Pre-trained language understanding" below this module
- Color theme: Light blue (#E8F4FD) fill with #2E86AB border

**Module 2 - Conditional Latent Diffusion Model (Center):**
- Box at top: "Random Noise x_T" represented as random dots pattern
- Large central component: "U-Net Architecture" with:
  - Encoder path (left side) with downsampling blocks
  - Bottleneck with cross-attention mechanism
  - Decoder path (right side) with upsampling blocks
- Show "Cross-Attention" mechanism with a highlighted box showing semantic condition 'c' being injected
- Side input: "Semantic Condition c" from Module 1, connected to each attention block
- Output at bottom: "Synthesized Features x̂" shown as organized feature patterns
- Annotate: "ε_θ (UNet with Cross-Attention)" near the main architecture
- Color theme: Light purple (#F0E6FA) fill with #6B4C9A border

**Module 3 - Semantic Alignment & Classification (Right):**
- Top input: "Seen Class Features x_seen" from Dataset
- Arrow from Module 2 output: "Synthesized Features x̂"
- Box: "MMD Alignment Module" showing distribution matching visualization
- Arrow to: "Feature Concatenation" [x_seen; x̂]
- Box: "Softmax Classifier"
- Output: "Fault Category Prediction ŷ"
- Annotate loss functions on arrows: "L_diff" (between Module 2 and 3), "L_align" (at MMD), "L_recon" (reconstruction loss)
- Color theme: Light green (#E8F5E9) fill with #2E7D32 border

**Data Flow Annotations:**
- Label all arrows with variable names: x (vibration signal), T (text), s (semantic), a (projected), c (condition), x̂ (synthesized)
- Use dashed lines for gradient flow
- Add small text labels near each module indicating their function

**Style Requirements:**
- Professional IEEE academic style
- Uniform box sizes within each module
- Clear arrow heads indicating direction
- Mathematical notation in italic
- Minimal text, focus on visual flow
- White background with subtle grid alignment

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS
---

## Fig. 3: Details of Language-Driven Semantic Module

### Prompt

Create a detailed diagram showing the internal structure of the Language-Driven Semantic Embedding module. This figure should illustrate how natural language descriptions are converted into continuous semantic vectors.

**Layout:** Top-down flow with input at top and output at bottom, with a comparison section at the bottom.

**Main Flow (Upper 2/3 of figure):**
- Input section: Multiple text lines representing fault descriptions:
  - "Inner race fault with periodic impulse at BPFO frequency..."
  - "Outer race defect with random amplitude modulation..."
  - "Ball bearing spall with spectral harmonics..."
- Each line slightly different color to show multiple descriptions
- Arrows converging to: "BERT/LLM Encoder"
- Inside encoder box show:
  - Input embedding layer
  - Transformer encoder layers (stack of 6-12 boxes)
  - Output layer
- Highlight "[CLS] Token" extraction point with a star marker
- Arrow to: "Semantic Projection Layer"
- Show this as a neural network box with:
  - Weight matrix W_s
  - Bias vector b_s
  - Activation function (ReLU/tanh)
- Formula annotation nearby: "a = tanh(W_s · h_[CLS] + b_s)"
- Output: "Continuous Semantic Vector a ∈ R^{d_a}" displayed as a horizontal vector with 8-10 numerical entries showing real-valued numbers

**Comparison Section (Lower 1/3):**
- Split into two columns with a vertical divider
- Left column: "Traditional Binary Attributes"
  - Show vector: [1, 0, 1, 0, 0, 1]
  - Annotation: "Discrete, limited expressiveness"
  - Color: Gray tones
- Right column: "Our Continuous Semantics"
  - Show vector: [0.82, -0.15, 0.67, 0.33, -0.41, 0.89]
  - Annotation: "Continuous, rich semantic space"
  - Color: Blue tones (#2E86AB)
- Add arrow between columns labeled: "Semantic Enrichment"

**Visual Style:**
- Use soft color gradients for the encoder to show depth
- Highlight the [CLS] token extraction point with a glowing effect (no actual glow, just emphasis)
- Clean connection lines with rounded corners
- Mathematical notation in LaTeX style
- Professional academic aesthetic suitable for IEEE

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS
---

## Fig. 4: Conditional Diffusion Denoising Step

### Prompt

Create a detailed visualization of the conditional latent diffusion process showing both forward (noising) and reverse (denoising) directions. This figure should illustrate how the model generates high-quality features through iterative refinement.

**Layout:** Horizontal flow from left to right, with separate sections for forward and reverse processes.

**Overall Structure:**
- Top section: Forward Diffusion (noise addition) going left to right
- Bottom section: Reverse Diffusion (denoising) going right to left
- Middle horizontal line separating the two with arrows indicating direction

**Top - Forward Diffusion Process:**
- Start (left): "x_0 (Real Features)" shown as a clear, organized pattern (e.g., structured dots)
- Series of arrows and small boxes showing: x_0 → x_1 → x_2 → ... → x_T
- Each step shows more noise added (progressively more random dot patterns)
- Annotate each arrow: "q(x_t|x_{t-1})" for the diffusion step
- End (right): "x_T (Pure Gaussian Noise)" shown as completely random scattered dots
- Add annotation: "Forward Process: Gradual noise addition"
- Color: Gradual transition from organized (blue) to random (gray)

**Bottom - Reverse Denoising Process:**
- Start (right): "x_T (Pure Noise)" - same as top end
- Large central component: "U-Net Denoiser ε_θ"
  - Show internal structure with:
    - Skip connections (encoder to decoder)
    - Cross-attention blocks (show 'c' input)
  - Label each block with time step t
- Series showing: x_T → x_{T-1} → x_{T-2} → ... → x_0
- Each step shows clearer patterns emerging
- Annotate each arrow: "p_θ(x_{t-1}|x_t, c)" for the reverse step
- End (left): "x_0 (Synthesized Features)" shown as high-quality feature representation
- Add annotation: "Reverse Process: Iterative denoising with semantic condition"

**Cross-Attention Conditioning:**
- Add a vertical connection from the side showing "Semantic Condition c"
- Show 'c' being injected at each U-Net block via cross-attention mechanism
- Use dashed lines to show the conditioning
- Annotate: "c provides semantic guidance at each step"

**Key Elements:**
- Use distinct colors: Blue for clean features, gray for noise, purple for the U-Net
- Show the progressive refinement visually
- Include step numbers (t=0, t=1, ..., t=T)
- Mathematical subscripts clearly visible
- Legend or annotation explaining the two directions

**Style Requirements:**
- Professional academic diagram
- Clean geometric representations
- Consistent arrow styles
- No decorative elements
- White background
- Suitable for IEEE double-column format

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS
---

## General Style Guidelines

All figures should follow these conventions:
- **Font:** Helvetica or Arial for labels, Computer Modern (LaTeX) for mathematical notation
- **Colors:** Use a limited palette of 4-6 colors maximum per figure
  - Primary: #2E86AB (blue)
  - Secondary: #A23B72 (magenta)
  - Accent: #2E7D32 (green)
  - Neutral: #616161 (gray)
- **Lines:** Uniform stroke width (1-2pt)
- **Background:** Pure white
- **Aspect ratios:** Suitable for 3.5 inch single-column or 7 inch double-column width
- **No shadows, gradients, or 3D effects**
- **Minimal text, maximum visual communication**