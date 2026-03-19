# Artist Prompts - Concept Figures (v4)

## Fig.1: Traditional vs Zero-Shot Fault Diagnosis (Introduction, 双栏宽幅)
**Prompt:**
Create a side-by-side comparison diagram for IEEE TIM journal showing Traditional Fault Diagnosis vs Zero-Shot Fault Diagnosis.

**Left Side - "Traditional Fault Diagnosis":**
- Show a database icon with labeled fault samples (Fault A, B, C, D) with checkmarks
- Arrow pointing to a classifier (rectangular box)
- Output: Can only diagnose Fault A, B, C, D
- A red X next to "New Fault E?" indicating failure

**Right Side - "Zero-Shot Fault Diagnosis (Ours)":**
- Show a smaller database with only Fault A, B, C (seen classes)
- Plus a text description box: "Fault E: high vibration, temperature rise..."
- Arrow through "CLIP Semantic Encoder" + "Generative Model" blocks
- Output: Can diagnose Fault A, B, C, D, E (including unseen)
- A green checkmark next to "New Fault E?" indicating success

**Style:**
- Background: White
- Left side border: Light red/pink tint
- Right side border: Light green tint
- Clean rectangular shapes, IEEE professional style
- Arrows: Dark gray with arrowheads
- Text: Arial, black

**Important:** Do not write any width/height dimensions or font sizes in the figure.

---

## Fig.2: CESM-Diff Overall Architecture + Domain Shift (Methodology 3.1 + 3.6, 双栏宽幅)
**Prompt:**
Create a comprehensive system architecture diagram for "CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis" in IEEE TIM journal style. Include domain shift illustration at bottom.

**Left Section - Input Processing:**
- A vibration signal waveform icon labeled "Raw Vibration Signal"
- Arrow to "Data Preprocessing" block (STFT/CWT transformation)
- Output: 2D feature representation

- A text box containing fault descriptions (e.g., "Bearing wear, temperature increase, vibration anomaly")
- Arrow pointing to "CLIP Text Encoder" (blue rounded rectangle, with a snowflake icon indicating frozen weights)
- Output: continuous semantic vector (shown as a 1D feature bar with gradient colors)

**Center Section - Dual-Path Diffusion:**
- Two parallel vertical pipelines:
  1. **Feature Path** (top): U-Net style denoising with progressively cleaner feature representations
  2. **Semantic Path** (bottom): Semantic vector diffusion with intermediate states
- Bidirectional arrows between paths labeled "Cross-Path Attention"

**Right Section - Output & SMI:**
- Generated fault features from Feature Path
- "Semantic Manifold Interpolation" module showing interpolation between semantic vectors
- Final output: "Classifier" → fault diagnosis result

**Bottom Section - Domain Shift Illustration (smaller, below main architecture):**
- Show two overlapping 2D feature spaces (elliptical regions)
- Left ellipse (blue): "Seen Class Distribution"
- Right ellipse (orange): "Unseen Class Distribution" 
- A gap/arrow between them labeled "Domain Shift"
- Show generated features (green) bridging the gap with Attribute Consistency Loss

**Style:**
- Background: White
- Feature processing: Blue (#2E86AB)
- Semantic processing: Purple (#7B2CBF)
- SMI module: Green (#2D936C)
- Domain shift: Blue/Orange/Green ellipses
- Clean rectangular and rounded shapes
- Arrows: Dark gray with arrowheads

**Important:** Do not write any width/height dimensions or font sizes in the figure.

---

## Fig.3: Dual-Path Denoising + Semantic Manifold Interpolation (Methodology 3.5 + 3.6, 单栏)
**Prompt:**
Create a combined diagram showing both the Dual-Path Denoising Process and Semantic Manifold Interpolation for IEEE TIM journal.

**Top Section - Dual-Path Denoising (vertical layout from t=T to t=0):**

**Top (t=T):**
- Gaussian noise icon (random dots pattern)
- Splits into two parallel streams

**Middle steps (3-4 intermediate steps shown):**
- Left stream: "Feature Denoising" blocks — noise progressively removed, features become cleaner
- Right stream: "Semantic Refinement" blocks — semantic vector progressively refined
- At each step: curved arrow from Semantic to Feature labeled "Cross-Attention"

**Bottom (t=0):**
- Left: Clean generated fault feature (solid blue shape)
- Right: Refined semantic embedding (solid purple shape)
- Both merge at "Feature Concatenation"

**Bottom Section - Semantic Manifold Interpolation (right side, separate from main flow):**
- X-axis: Semantic Dimension 1
- Y-axis: Semantic Dimension 2
- Show 4 "seen" fault classes as filled circles (blue, green, orange, red) with labels
- Show curved manifold surface connecting seen classes (light gray mesh/surface)
- Show 2 "unseen" fault classes as hollow diamond shapes at interpolated positions on the manifold
- Draw curved dashed lines (geodesic paths) connecting seen classes through unseen positions

**Style:**
- Background: White
- Feature path: Blue tones (#2E86AB)
- Semantic path: Purple tones (#7B2CBF)
- Noise: Random dot patterns, progressively less noisy
- Manifold: Light gray curved surface/mesh
- Seen classes: Solid colored circles
- Unseen classes: Hollow colored diamonds
- Arrows: Dark gray with arrowheads

**Important:** Do not write any width/height dimensions or font sizes in the figure.
