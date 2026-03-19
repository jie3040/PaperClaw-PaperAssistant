# Detailed Concept Figure Prompts for PC-Diffusion Paper

## Fig. 1 - Overall Architecture of PC-Diffusion Framework

**Resolution**: 1600×900 pixels (300 DPI)  
**Format**: PNG with white background  
**Style**: Clean academic diagram, IEEE publication quality

### Prompt:

Create a professional horizontal three-stage pipeline diagram illustrating the Physics-Constrained Diffusion Model (PC-Diffusion) framework for zero-shot fault diagnosis with uncertainty quantification. The diagram should be publication-ready for IEEE Transactions on Instrumentation and Measurement.

**Stage 1 (Left section, ~450px width): Physics Prior & Semantic Extraction**

Top half - PINN Module:
- Input box (200×60px): "Vibration Signals (Seen Faults)" with small waveform icon (sinusoidal pattern, 30×20px)
- Center: Neural network diagram labeled "PINN" showing 3 hidden layers (each layer: 5 nodes, 40px diameter circles)
- Physics equation overlay in LaTeX style: "M ẍ + C ẋ + K x = F_fault(t)" in serif font (14pt)
- Output box (200×60px): "Learned Dynamics Model" with equation symbol icon
- Color scheme: Deep blue (#1976D2, RGB: 25,118,210) for boxes with rounded corners (8px radius), gray (#757575, RGB: 117,117,117) for neural network nodes
- Box style: 2px solid border

Bottom half - Semantic Extraction:
- Two parallel input boxes (each 180×50px):
  - Left: "Manual Physics Attributes" (fault frequency, amplitude features)
  - Right: "LLM High-Dim Embeddings" (text icon, 24×24px)
- Merge arrow (→) pointing to output box (200×60px): "Dual-Level Semantic Vector a"
- Color: Teal (#00897B, RGB: 0,137,123) for semantic modules

**Stage 2 (Center section, ~600px width): PC-Diffusion Training**

Top inputs:
- Left input (180×50px): "Seen Fault Samples x_s" with waveform icon
- Right input (180×50px): "Semantic Vectors a_s" with vector icon (arrows)

Center - Diffusion Process:
- Forward process (top): Noisy signal progression x_0 → x_T (5 small boxes, each 60×40px, progressively more noisy texture)
- Reverse process (bottom): Denoising x_T → x_0 (5 boxes, progressively cleaner)
- U-Net architecture diagram in center (300×200px):
  - Encoder path: 4 down-sampling blocks on left (64→128→256→512 channels, indicated by width: 40px→30px→20px→10px)
  - Decoder path: 4 up-sampling blocks on right (mirror of encoder)
  - Skip connections: Dashed gray arrows (#9E9E9E) connecting corresponding levels
  - Time embedding: Small box at top center labeled "t" (40×30px) feeding into U-Net
- Below U-Net: Three loss function boxes arranged horizontally (each 150×50px):
  - "L_freq_energy" with frequency spectrum icon (vertical bars, 20×15px)
  - "L_time_period" with sine wave icon (periodic pattern, 20×15px)
  - "L_PINN" with partial differential equation symbol (∂²/∂t²)
- Red dashed arrows (2px width, #F44336) from PINN (Stage 1) to loss boxes, labeled "Physical Constraints"
- Color scheme:
  - U-Net: Green (#4CAF50, RGB: 76,175,80) for main structure
  - Loss boxes: Orange (#FF9800, RGB: 255,152,0) with white text (12pt)
  - Diffusion boxes: Light gray gradient (#E0E0E0 to #BDBDBD)

Bottom output (200×60px): "Generated Unseen Samples x_u"

**Stage 3 (Right section, ~450px width): Bayesian Zero-Shot Inference**

Top input (180×50px): "Test Signal (Unseen Fault) x_test"

Center - Dual Encoders:
- Upper branch (200×80px): "Feature Extractor (CNN)" → "Feature Vector z_x"
  - CNN icon: 3 stacked rectangles (convolutional layers)
- Lower branch (200×80px): "Semantic Embedding" → "Semantic Space z_a"
  - Input: "Unseen Semantic a_u"

Bayesian Matching Module (250×120px):
- Box labeled "Variational Inference"
- Gaussian distribution icon: Bell curve with μ and σ labels
- Mathematical notation: p(z|a) = N(μ_θ(a), Σ_θ(a))
- Semi-transparent ellipses (3-4 overlapping, different colors) representing probability distributions

Bottom outputs (two boxes, each 180×50px):
- Left: "Predicted Class ŷ" with label/tag icon (24×24px)
- Right: "Uncertainty (95% CI)" with error bar icon (vertical line with caps, 20×30px)
- Color scheme: Purple (#9C27B0, RGB: 156,39,176) for all inference components

**Inter-stage Connections**:
- Thick arrows (4px width, solid) connecting stages:
  - Stage 1→2: "Physics Prior" (label above arrow, 12pt)
  - Stage 2→3: "Synthetic Samples" (label above arrow, 12pt)
- Dashed red arrows (2px width, #F44336) from Stage 1 PINN to Stage 2 loss functions
- Arrow style: Solid triangular heads (10px), slight curve for aesthetic flow

**Overall Style Requirements**:
- Background: Pure white (#FFFFFF)
- Font: Arial or Helvetica, sans-serif
- Label font size: 14pt for main labels, 12pt for sub-labels, 10pt for annotations
- Icon size: 24×24px for main icons, 20×20px for small icons
- Spacing: 50px horizontal gap between stages, 20px vertical spacing within stages
- Subtle drop shadow: 2px offset, 4px blur, 15% opacity black (#000000) for depth on main boxes
- Legend box (bottom-right, 220×80px):
  - Solid arrow: "Data Flow"
  - Dashed arrow: "Physical Constraint"
  - Font size: 10pt

**Technical Details**:
- Ensure all text is readable at 100% zoom
- Use consistent line weights: 2px for boxes, 1px for internal connections, 4px for main arrows
- Color contrast ratio ≥4.5:1 for accessibility (WCAG AA standard)
- Export as PNG with 300 DPI for print quality

---

## Fig. 2 - Physics-Constrained Diffusion Process

**Resolution**: 1200×700 pixels (300 DPI)  
**Format**: PNG with white background  
**Style**: High-tech engineering diagram, vector graphic appearance
**Important**: do not put any width scale (px) and font size in the figure (pt), and do not put any label 
**Important**: do not write any width scale (px)

### Prompt:

Create a detailed schematic focusing on the physics-constrained denoising process of the diffusion model. The diagram should illustrate how physical laws guide the reverse diffusion steps.

**Main Flow (Horizontal, 1000px width)**:

Left side - Noisy Input:
- Box (150×100px): "Noisy Signal x_T"
- Waveform visualization: Highly noisy vibration signal (random noise texture)
- Label: "t = T" (timestep indicator, 12pt)

Center - Denoising Steps:
- 4 intermediate boxes (each 150×100px), evenly spaced (50px gaps)
- Labels: "x_{T-1}", "x_{T-2}", "...", "x_1"
- Waveform progressively cleaner from left to right
- Arrows between boxes (3px width, solid, dark blue #1565C0)
- Above each arrow: "Denoising Step" label (10pt)

Right side - Clean Output:
- Box (150×100px): "Clean Signal x_0"
- Waveform visualization: Clear periodic impulses (fault signature)
- Label: "t = 0" (12pt)

**Physical Loss Regularizer (Bottom section, 1000×250px)**:

Center box (400×200px): "Physical Loss Regularizer"
- Background: Light orange (#FFE0B2)
- Border: 3px solid orange (#FF9800)

Two branches from regularizer:

Left branch - Frequency Domain:
- Box (250×120px): "Frequency Energy Conservation L_freq"
- FFT plot icon (150×80px): Frequency spectrum with vertical bars
- Mathematical notation: "||FFT(x_t)|| ≈ ||FFT(x_real)||" (10pt, serif font)
- Characteristic frequency markers: Vertical dashed lines at BPFI, BPFO positions
- Color: Purple (#7B1FA2) for frequency elements

Right branch - Time Domain:
- Box (250×120px): "Time-domain Periodicity L_period"
- Waveform icon (150×80px): Periodic impulse pattern with spacing markers
- Mathematical notation: "Autocorr(x_t) peaks at Δt = 1/f_fault" (10pt, serif font)
- Period markers: Vertical dashed lines showing impulse spacing
- Color: Green (#388E3C) for time-domain elements

**Feedback Connections**:
- Red dashed arrows (2px width, #D32F2F) from each branch back to denoising steps
- Arrow labels: "∇_x L_freq" and "∇_x L_period" (gradient notation, 10pt, italic)
- Arrows point upward to intermediate denoising boxes

**Additional Elements**:

Top-right corner - U-Net Icon (200×150px):
- Simplified U-Net architecture (encoder-decoder with skip connections)
- Label: "Denoising Network θ" (12pt)
- Dashed connection to denoising steps

Bottom-left corner - PINN Reference (180×80px):
- Box: "PINN Learned Dynamics"
- Equation: "M ẍ + C ẋ + K x = F(t)" (10pt, serif)
- Dashed arrow to Physical Loss Regularizer

**Style Requirements**:
- Background: White (#FFFFFF)
- Font: Arial for labels, Computer Modern (serif) for equations
- Line weights: 3px for main flow, 2px for feedback, 1px for internal details
- Color scheme:
  - Main flow: Deep blue (#1565C0)
  - Physical loss: Orange (#FF9800)
  - Frequency branch: Purple (#7B1FA2)
  - Time branch: Green (#388E3C)
  - Feedback: Red (#D32F2F)
- Drop shadow: 2px offset, 3px blur, 10% opacity on main boxes
- Export: PNG, 300 DPI

**Important**: do not put any width scale (px) and font size in the figure (pt), and do not write any label 
**Important**: do not write any width scale (px) 
**Important**: do not write any width scale (px) 
**Important**: do not write any width scale (px)

---

## Fig. 3 - Bayesian Semantic Embedding Network

**Resolution**: 1000×600 pixels (300 DPI)  
**Format**: PNG with white background  
**Style**: Mathematical and statistical visualization
**Important**: do not put any width scale (px) and font size in the figure (pt), and do not put any label 
**Important**: do not write any width scale (px)

### Prompt:

Create a diagram illustrating the Bayesian semantic embedding network structure, emphasizing the probabilistic nature of the feature space mapping.

**Top Section (500px width, 200px height): Dual Encoders**

Left Encoder - Signal Feature Extractor:
- Input box (150×50px): "Generated Fault Signal x"
- CNN architecture (200×120px):
  - 3 convolutional layers (stacked rectangles, progressively smaller: 60px→40px→30px width)
  - Labels: "Conv1 (64)", "Conv2 (128)", "Conv3 (256)" (10pt)
  - Pooling layers between (small downward arrows)
- Output box (120×50px): "Feature Vector z_x"
- Color: Blue gradient (#1976D2 to #1565C0)

Right Encoder - Semantic Embedding:
- Input box (150×50px): "Semantic Vector a"
- Two-tier structure (200×120px):
  - Top tier (100×50px): "Manual Attributes" (fault frequency, amplitude)
  - Bottom tier (100×50px): "LLM Embeddings" (high-dimensional features)
  - Merge layer (100×30px): "Concatenation"
- Fully connected layers (2 rectangles, 80×40px each)
- Output box (120×50px): "Semantic Embedding z_a"
- Color: Teal gradient (#00897B to #00695C)

**Center Section (800px width, 300px height): Joint Latent Space**

Background: Light gray (#F5F5F5) with subtle grid pattern

Probabilistic Distributions:
- 6-8 semi-transparent ellipses representing Gaussian distributions
- Each ellipse: 100×60px, different colors (blue, green, orange, purple, red)
- Opacity: 40% (alpha=0.4)
- Center point (μ) marked with small dot (8px diameter)
- Variance indicated by ellipse size (larger = higher uncertainty)

Class Labels:
- Text labels near each ellipse: "Seen Class 1", "Seen Class 2", ..., "Unseen Class 1*", "Unseen Class 2*"
- Unseen classes marked with asterisk (*)
- Font: 11pt, bold for unseen classes

Mathematical Notation (top-left corner, 200×80px):
- Equation: "p(z|a) = N(z; μ_θ(a), Σ_θ(a))" (12pt, serif font)
- Below: "μ: mean, Σ: covariance" (10pt)

Arrows from Encoders:
- Dashed arrows (2px, blue and teal) from encoder outputs to corresponding ellipses
- Labels: "z_x → p(z|x)" and "z_a → p(z|a)" (10pt)

**Bottom Section (800px width, 100px height): Variational Inference**

Center box (400×80px): "ELBO Optimization"
- Mathematical notation: "L_ELBO = E_q[log p(x|z)] - KL(q(z|x)||p(z|a))" (11pt, serif)
- Background: Light yellow (#FFF9C4)
- Border: 2px dashed orange (#FF9800)

Left arrow from latent space: "Reconstruction Loss" (10pt)
Right arrow from latent space: "KL Divergence" (10pt)

**Right Section (150px width, 400px height): Uncertainty Quantification**

Box (140×350px): "Predictive Distribution"
- Vertical axis: "Probability Density" (rotated 90°, 10pt)
- Horizontal axis: "Class Label" (10pt)
- Bar chart showing probability distribution over classes
- Bars: Different heights, color-coded (matching ellipse colors)
- Highest bar: Predicted class (darker color)
- Error bars on top: 95% confidence interval (vertical lines with caps)
- Label: "95% CI" with arrow pointing to error bars (10pt)

**Style Requirements**:
- Background: White (#FFFFFF)
- Font: Arial for labels, Computer Modern (serif) for equations
- Ellipse colors: Use colorblind-friendly palette
  - Blue (#2196F3), Green (#4CAF50), Orange (#FF9800), Purple (#9C27B0), Red (#F44336), Cyan (#00BCD4)
- Line weights: 2px for boxes, 1px for arrows, 3px for main connections
- Drop shadow: 1px offset, 2px blur, 8% opacity on boxes
- Grid pattern in latent space: 1px light gray (#E0E0E0) lines, 50px spacing
- Export: PNG, 300 DPI

**Special Requirements**:
- Ensure ellipses overlap slightly to show joint distribution
- Use consistent color mapping between ellipses and bar chart
- Mathematical notation should be clear and readable
- Confidence interval visualization should be prominent

**Important**: do not put any width scale (px) and font size in the figure (pt), and do not write any label 
**Important**: do not write any width scale (px) 
**Important**: do not write any width scale (px) 
**Important**: do not write any width scale (px)

---

## Additional Notes

**Color Palette Summary**:
- Primary: Blue (#1976D2, #1565C0, #2196F3)
- Secondary: Green (#4CAF50, #388E3C)
- Accent: Orange (#FF9800), Purple (#9C27B0), Teal (#00897B)
- Feedback/Constraint: Red (#D32F2F, #F44336)
- Neutral: Gray (#757575, #9E9E9E, #E0E0E0)

**Consistency Requirements**:
- All three figures should use the same font family (Arial/Helvetica)
- Consistent icon sizes (24×24px for main, 20×20px for small)
- Consistent line weights across figures
- Consistent drop shadow style
- All figures at 300 DPI for publication quality

**Accessibility**:
- Color contrast ratio ≥4.5:1 (WCAG AA)
- Include texture/pattern differences in addition to color
- Use clear, readable fonts (minimum 10pt)
- Avoid pure red-green distinctions (colorblind-friendly)

**File Naming**:
- Fig.1: `fig1_overall_architecture.png`
- Fig.2: `fig2_physics_constrained_diffusion.png`
- Fig.3: `fig3_bayesian_semantic_embedding.png`

**Save Location**:
- `/home/liaowenjie/.openclaw-multi/shared/paper-project-2/figures/`
