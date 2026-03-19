# Artist Prompts - Concept Figures (v2)

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

## Fig.2: Domain Shift Illustration (Related Work/Methodology, 单栏)
**Prompt:**
Create a conceptual diagram illustrating the Domain Shift problem in zero-shot fault diagnosis for IEEE TIM journal.

**Content:**
- Show two overlapping 2D feature spaces (elliptical regions)
- Left ellipse (blue): "Seen Class Feature Distribution" with scattered blue dots
- Right ellipse (orange): "Unseen Class Feature Distribution" with scattered orange dots
- A gap/arrow between them labeled "Domain Shift"
- Below: show a generated distribution (dashed green ellipse) that poorly aligns with the real unseen distribution
- Label: "Generated features (without alignment)" with a red X
- Another generated distribution (solid green ellipse) that aligns well
- Label: "Generated features (with Attribute Consistency Loss)" with a green checkmark

**Style:**
- Background: White
- Seen: Blue tones
- Unseen: Orange tones
- Generated: Green tones (dashed vs solid to show before/after)
- Clean, minimal, IEEE style

**Important:** Do not write any dimensions or font sizes in the figure.

---

## Fig.3: CESM-Diff Overall Architecture (Methodology 3.1, 双栏宽幅)
**Prompt:**
Create a comprehensive system architecture diagram for "CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis" in IEEE TIM journal style.

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

**Style:**
- Background: White
- Feature processing: Blue (#2E86AB)
- Semantic processing: Purple (#7B2CBF)
- SMI module: Green (#2D936C)
- Clean rectangular and rounded shapes
- Arrows: Dark gray with arrowheads

**Important:** Do not write any width/height dimensions or font sizes in the figure.

---

## Fig.4: Semantic Manifold Interpolation Visualization (Methodology 3.6, 单栏)
**Prompt:**
Create a 2D visualization showing the Semantic Manifold Interpolation concept for zero-shot fault diagnosis in IEEE journal style.

**Content:**
- X-axis: Semantic Dimension 1
- Y-axis: Semantic Dimension 2

**Elements:**
- Show 4 "seen" fault classes as filled circles (blue, green, orange, red) with labels (e.g., "Inner Race", "Outer Race", "Ball Fault", "Normal")
- Show curved manifold surface connecting seen classes (light gray mesh/surface)
- Show 2 "unseen" fault classes as hollow diamond shapes at interpolated positions on the manifold
- Draw curved dashed lines (geodesic paths) connecting seen classes through unseen positions
- Add interpolation coefficients α along the paths
- Small legend in corner

**Style:**
- Background: White
- Seen classes: Solid colored circles
- Unseen classes: Hollow colored diamonds
- Manifold: Light gray curved surface/mesh
- Geodesic paths: Dashed colored lines

**Important:** Do not write any dimensions or font sizes in the figure.

---

## Fig.5: Dual-Path Denoising Process (Methodology 3.5, 单栏)
**Prompt:**
Create a detailed diagram showing the Dual-Path Denoising Process in IEEE style.

**Content - Vertical layout from top (t=T) to bottom (t=0):**

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
- Both merge at "Feature Concatenation" → Classification

**Style:**
- Background: White
- Feature path: Blue tones (#2E86AB)
- Semantic path: Purple tones (#7B2CBF)
- Noise: Random dot patterns, progressively less noisy
- Arrows: Dark gray with arrowheads

**Important:** Do not write any dimensions or font sizes in the figure.
