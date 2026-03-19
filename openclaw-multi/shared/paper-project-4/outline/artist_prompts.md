# Artist Prompts - Concept Figures

## Fig.1: Overall Architecture (双栏宽幅)
**Prompt:**
Create a comprehensive system architecture diagram for "CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis" in the IEEE TIM journal style.

The diagram should show:

**Left Section - Input Processing:**
- A text box containing fault descriptions (e.g., "Bearing wear, temperature increase, vibration anomaly")
- An arrow pointing to "CLIP Text Encoder" (blue rounded rectangle)
- The encoder outputs a continuous semantic vector (shown as a 1D feature bar with gradient colors)

**Center Section - Dual-Path Diffusion:**
- Two parallel vertical pipelines:
  1. **Feature Path** (top): Shows a U-Net style denoising process with progressively cleaner feature representations
  2. **Semantic Path** (bottom): Shows semantic vector undergoing diffusion steps with intermediate noisy states

- A bidirectional arrow between the two paths labeled "Cross-path Attention" with small attention weight icons

**Right Section - Output:**
- Generated fault features emerge from the Feature Path
- Arrow pointing to "Feature Concatenation" module
- Final output: Discriminative fault features for classification

**Style:**
- Background: White
- Main elements: Blue (#2E86AB) for feature processing, Purple (#7B2CBF) for semantic processing
- Use clean rectangular and rounded shapes
- Arrows: Dark gray with arrowheads
- Text labels: Arial font, 10-12pt, black
- Add subtle shadows for depth
- IEEE style: Clean, professional, no excessive gradients

**Important:** Do not write any width scale (px) or font size (pt) in the figure.

## Fig.2: Semantic Manifold Interpolation (单栏)
**Prompt:**
Create a 2D visualization showing the Semantic Manifold Interpolation concept for zero-shot fault diagnosis in IEEE journal style.

**Content:**
- X-axis: Semantic Dimension 1
- Y-axis: Semantic Dimension 2

**Elements:**
- Show 3 "seen" fault classes as filled circles (blue, green, orange) with labels
- Show interpolated regions between seen classes as gradient shaded areas
- Show "unseen" fault classes as hollow diamond shapes at interpolated positions
- Draw dashed lines connecting seen classes to their interpolated unseen variants
- Add a small legend in the corner

**Style:**
- Background: White
- Seen classes: Solid circles with labels
- Unseen classes: Hollow diamonds
- Interpolation region: Light gradient fill (light blue to white)
- Axes: Black lines with tick marks
- Font: Arial, 10pt

**Important:** Do not write any dimensions or font sizes in the figure.

## Fig.3: Dual-Path Denoising Process (单栏)
**Prompt:**
Create a detailed diagram showing the Dual-Path Denoising Process in diffusion model for fault diagnosis, IEEE style.

**Content:**
- Show time steps from t=T to t=0 (top to bottom, vertical layout)

**Top row (t=T):**
- Noisy input: Random noise icon
- Two parallel streams starting from noise

**Middle rows (t=T-1 to t=1):**
- Each row shows two parallel blocks:
  1. Feature Denoising Block: Shows noise being progressively removed
  2. Semantic Refinement Block: Shows semantic vector being refined

- Curved arrows from Semantic to Feature path at each step (cross-path attention)

**Bottom row (t=0):**
- Final clean feature output from Feature Path
- Final semantic embedding from Semantic Path
- Feature concatenation operation shown as merging two streams

**Style:**
- Background: White
- Feature path: Blue tones (#2E86AB to #A23B58)
- Semantic path: Purple tones (#7B2CBF to #9D4EDD)
- Noise representation: Random dot patterns
- Clean features: Solid shapes with smooth edges
- Arrows: Dark gray, with arrowheads

**Important:** Do not write any dimensions or font sizes in the figure.
