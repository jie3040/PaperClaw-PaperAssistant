# Detailed Concept Figure Prompts

## Fig.1: Overall Architecture (双栏宽幅)

Create a comprehensive system architecture diagram for "CLIP-Enhanced Semantic Manifold Diffusion for Zero-Shot Fault Diagnosis" in the IEEE TIM journal style. The diagram should be double-column wide format (approximately 15cm width).

### Layout Structure

The diagram is divided into three horizontally-arranged main sections connected by arrows:

**Section 1: Input Processing (左侧)**

Place a rounded rectangle at the top left containing sample fault descriptions. Use multiple lines of text such as:
- "Bearing wear"
- "Temperature increase"  
- "Vibration anomaly"
- "Gear tooth damage"

Add a thick dark gray arrow pointing downward from this text box to a blue rounded rectangle labeled "CLIP Text Encoder". Inside this encoder box, show a simple neural network icon with input and output nodes.

From the CLIP Text Encoder, show an arrow pointing rightward to a horizontal 1D feature bar representing the semantic vector. Use gradient colors transitioning from light blue to purple to indicate semantic encoding. Label this bar "Semantic Vector" with mathematical notation "z_s".

**Section 2: Dual-Path Diffusion (中间)**

In the center section, show two parallel vertical pipelines:

1. **Feature Path (上侧)**: A vertical stack of 3 blue rounded rectangles showing the denoising process. Each rectangle contains a progressively cleaner feature representation - the first shows noisy random patterns, the second shows semi-structured features, the third shows clean features. Add small waveform icons inside each to represent feature maps.

2. **Semantic Path (下侧)**: A vertical stack of 3 purple rounded rectangles below the Feature Path. Each shows the semantic vector at different diffusion time steps with varying levels of noise overlay.

Between these two paths, add bidirectional curved arrows at each stage labeled "Cross-path Attention". Show small attention weight matrices (small grid icons) at each attention point to represent the attention mechanism.

**Section 3: Output (右侧)**

From the bottom of the Feature Path, show an arrow pointing right to a light blue rectangle labeled "Generated Fault Features". Inside, show a clean feature representation with distinct patterns.

Add an arrow from the Semantic Path output to merge with the Feature Path at a "Feature Concatenation" module (shown as a rectangle combining two inputs).

Finally, show the concatenated features flowing to the right edge labeled "Discriminative Fault Features for Classification".

### Color Scheme
- Background: Pure white (#FFFFFF)
- Feature processing elements: Blue (#2E86AB)
- Semantic processing elements: Purple (#7B2CBF)
- Arrows and text: Dark gray (#333333)
- Use subtle light gray shadows under major elements

### Style Requirements
- Clean rectangular and rounded shapes
- Professional IEEE style: minimal decorations, clear hierarchy
- All text labels in Arial font, black color
- No dimension annotations (px, pt, cm) in the figure

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS

---

## Fig.2: Semantic Manifold Interpolation (单栏)

Create a 2D visualization showing the Semantic Manifold Interpolation concept for zero-shot fault diagnosis in IEEE journal style. Single column format (approximately 8cm width).

### Axes Setup
- X-axis: Label "Semantic Dimension 1" at the bottom
- Y-axis: Label "Semantic Dimension 2" on the left
- Both axes should have tick marks and be black lines

### Data Points

**Seen Classes (3个实心圆):**
1. Blue filled circle in upper-left region labeled "Bearing Fault"
2. Green filled circle in center-right region labeled "Gear Fault"  
3. Orange filled circle in lower-left region labeled "Seal Fault"

**Interpolaion Regions:**
Show gradient shaded areas between the seen classes. Use light blue to white gradient fills to represent the interpolation space. The interpolation should form triangular regions connecting the three seen classes.

**Unseen Classes (3个空心菱形):**
Place hollow diamond shapes (no fill, black outline) in the interpolation regions:
1. Between Bearing and Gear faults
2. Between Gear and Seal faults
3. Between Seal and Bearing faults
Label these as "Unseen 1", "Unseen 2", "Unseen 3" or similar generic labels.

**Connections:**
Draw dashed lines from each seen class to nearby unseen classes to show the interpolation relationship. Use thin black dashed lines.

### Legend
Add a small legend in the upper right corner:
- Solid circle = Seen fault class
- Hollow diamond = Unseen fault class
- Dashed line = Manifold interpolation path

### Style Requirements
- Background: White
- Font: Arial, black text
- No dimension annotations in the figure

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS
---

## Fig.3: Dual-Path Denoising Process (单栏)

Create a detailed diagram showing the Dual-Path Denoising Process in diffusion model for fault diagnosis, IEEE style. Single column format (approximately 8cm width).

### Vertical Layout (Top to Bottom)

**Row 1: Initial State (t=T)**
At the top, show a random noise pattern icon (scattered dots) labeled "x_T (Noisy Input)" in a light gray rounded rectangle.

From this noise input, show two parallel arrows branching downward to start the dual paths:

**Feature Path (左侧一列):**
- Row 2 (t=T-1): Blue rounded rectangle showing noisy feature with some structure. Label "Feature Denoising Step 1"
- Row 3 (t=T-2): Slightly cleaner blue rectangle. Label "Feature Denoising Step 2"
- Row 4 (t=T-3): Even cleaner feature representation. Label "Feature Denoising Step 3"
- Continue for 4-5 total denoising steps
- Bottom: Clean feature rectangle with smooth patterns. Label "x_0 (Clean Features)"

**Semantic Path (右侧一列):**
- Row 2: Purple rounded rectangle with noisy semantic vector. Label "Semantic Refinement Step 1"
- Row 3: Purple rectangle with refined semantic. Label "Semantic Refinement Step 2"
- Row 4: Further refined purple rectangle. Label "Semantic Refinement Step 3"
- Continue for matching number of steps
- Bottom: Clean semantic embedding. Label "z_0 (Clean Semantic)"

**Cross-path Attention:**
Between Feature and Semantic paths at each row, show curved arrows connecting them:
- Small curved arrows from Semantic to Feature path
- Label these arrows "Cross Attention" with small attention weight icons (small 2x2 grid symbols)

**Output (Bottom):**
- Show the clean features and clean semantic embedding merging at a "Feature Concatenation" module
- Final output rectangle: "x_final (Discriminative Features)"

### Visual Details
- Use distinct blue tones (#2E86AB to lighter shades) for Feature Path
- Use distinct purple tones (#7B2CBF to lighter shades) for Semantic Path
- Noise representation: Random dot patterns
- Clean features: Solid geometric shapes with smooth edges
- Arrows: Dark gray with clear arrowheads

### Style Requirements
- Background: White
- Professional IEEE journal style
- No dimension annotations in the figure

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS

---

## General Requirements for All Figures

1. Output format: PNG with transparent or white background
2. Resolution: Minimum 150 DPI, preferably 300 DPI
3. No width/height annotations (px, pt, cm, inches)
4. No font size annotations
5. Professional, clean appearance suitable for academic publication
6. All text must be readable at print size