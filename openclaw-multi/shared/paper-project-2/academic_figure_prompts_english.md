# Detailed Academic Prompts for Conceptual Figures

## Figure 1: Overall Architecture of the Physics-Constrained Diffusion Framework

**Image Specifications:**
- Resolution: 1800×1000 pixels at 300 DPI
- Format: PNG with white background
- Style: Clean academic diagram suitable for IEEE Transactions on Instrumentation and Measurement

**Prompt:**

Generate a professional three-stage horizontal pipeline diagram illustrating the complete architecture of the Physics-Constrained Diffusion Model (PC-Diffusion) framework for zero-shot bearing fault diagnosis. The diagram must be publication-ready with clear visual hierarchy and technical accuracy.

**Stage 1 (Left Section, approximately 500px width): PINN Pre-training Module**

Components:
- Input box at top: "Vibration Signals (Seen Faults)" with small sinusoidal waveform icon
- Central element: Neural network diagram labeled "PINN" (Physics-Informed Neural Network) showing 3 hidden layers with interconnected nodes
- Output box at bottom: "Learned Dynamics Model" with mathematical notation symbol
- Overlaid physics equation in LaTeX-style serif font: "mẍ + cẋ + kx = F(t)"

Visual specifications:
- Box color: Deep blue (#1976D2, RGB: 25,118,210) with rounded corners (8px radius)
- Border: 2px solid stroke
- Neural network nodes: Gray (#757575, RGB: 117,117,117) circles with connecting lines
- Font: Arial or Helvetica, 14pt for main labels, 12pt for equations

**Stage 2 (Center Section, approximately 600px width): PC-Diffusion Training Module**

Components:
- Dual inputs at top:
  - Left: "Seen Fault Samples" with waveform icon
  - Right: "Semantic Vectors" with document/text icon
- Central architecture: Large U-Net structure displaying:
  - Encoder pathway: 4 down-sampling blocks on left (progressively narrowing, labeled with channel dimensions: 64→128→256→512)
  - Decoder pathway: 4 up-sampling blocks on right (mirror of encoder)
  - Skip connections: Dashed gray arrows (#9E9E9E) connecting corresponding encoder-decoder levels
  - Time embedding: Small box at top center labeled "t" with arrow feeding into U-Net
- Loss function modules below U-Net (arranged horizontally):
  - "L_freq" with frequency spectrum icon (vertical bars representing FFT)
  - "L_period" with sinusoidal wave icon
  - "L_PINN" with partial differential equation symbol (∂/∂t notation)
- Output box at bottom: "Generated Unseen Fault Samples"

Visual specifications:
- U-Net structure: Green (#4CAF50, RGB: 76,175,80) with gradient shading to indicate depth
- Loss function boxes: Orange (#FF9800, RGB: 255,152,0) with white text, rounded rectangles
- Skip connections: 2px dashed lines in gray
- Block dimensions: Encoder blocks decrease in height (128px→96px→64px→48px), decoder mirrors this

**Stage 3 (Right Section, approximately 500px width): Bayesian Zero-Shot Inference Module**

Components:
- Input box at top: "Test Signal (Unseen Fault)"
- Dual processing branches:
  - Left branch: "Feature Extractor (CNN)" → "Feature Vector" (connected by solid arrow)
  - Right branch: "Semantic Embedding" → "Semantic Space" (connected by solid arrow)
- Central matching module: "Variational Inference" box with Gaussian distribution icon (bell curve with μ, σ notation)
- Dual outputs at bottom:
  - "Predicted Class" with classification label icon
  - "Uncertainty (95% CI)" with error bar icon (vertical line with horizontal caps)

Visual specifications:
- All components: Purple (#9C27B0, RGB: 156,39,176) color scheme
- Box style: Rounded rectangles matching Stage 1 design
- Font: Consistent with other stages

**Inter-Stage Connections:**

- Main data flow arrows: 4px width, solid black (#212121) with triangular heads
  - Stage 1 → Stage 2: Labeled "Physics Prior"
  - Stage 2 → Stage 3: Labeled "Synthetic Samples"
- Constraint arrows: 2px width, dashed red (#F44336) from Stage 1 PINN to Stage 2 loss functions, labeled "Physical Constraints"
- Arrow style: Slight bezier curve for visual flow, 45° angle at connections

**Overall Design Specifications:**

- Background: Pure white (#FFFFFF)
- Typography: Arial or Helvetica sans-serif throughout
  - Main labels: 16pt bold
  - Sub-labels: 14pt regular
  - Annotations: 12pt regular
- Icon dimensions: 24×24px for all small icons
- Spacing: 40px horizontal gap between stages, 20px vertical spacing within components
- Drop shadow: 2px offset, 4px blur radius, 20% opacity black for subtle depth
- Legend box (bottom-right corner, 200×100px): Explain arrow types
  - Solid arrow = Data flow
  - Dashed arrow = Physical constraint
  - Legend background: Light gray (#F5F5F5) with 1px border

**Technical Requirements:**
- All text must be crisp and readable at 100% zoom
- Line weights: 2px for component borders, 1px for internal connections, 4px for main arrows
- Color contrast ratio ≥4.5:1 for WCAG AA accessibility compliance
- Export as PNG with lossless compression at 300 DPI

---

## Figure 3: Continuous Wavelet Transform Spectrogram Comparison

**Image Specifications:**
- Resolution: 1800×600 pixels at 300 DPI
- Format: PNG
- Style: High-resolution scientific visualization with heatmap representation

**Prompt:**

Create a rigorous scientific visualization comparing Continuous Wavelet Transform (CWT) spectrograms of bearing fault signals across three conditions: (a) real experimental data, (b) standard DDPM-generated synthetic data, and (c) PC-Diffusion-generated synthetic data. The visualization must demonstrate that PC-Diffusion produces time-frequency patterns with correct physical characteristics matching real bearing fault signatures.

**Layout Configuration:**
Three side-by-side spectrograms in a 1×3 grid, each subplot 600×600 pixels with 50px horizontal spacing.

**Subplot (a) - Left Panel (600×600px): Real Bearing Fault Signal**

Title: "(a) Real Sample" in bold 14pt font, centered 10px above plot

Axes configuration:
- X-axis: Time (seconds), range [0, 0.2], major ticks at 0, 0.05, 0.1, 0.15, 0.2
- Y-axis: Frequency (Hz), range [0, 5000], major ticks at 0, 1000, 2000, 3000, 4000, 5000
- Axis labels: "Time (s)" and "Frequency (Hz)" in 12pt font
- Tick labels: 10pt font

Spectrogram characteristics (representing inner race fault, 0.021" defect depth):
- Colormap: Jet (blue→cyan→green→yellow→orange→red)
  - Blue (#0000FF): Amplitude = 0.0
  - Cyan (#00FFFF): Amplitude = 0.2
  - Green (#00FF00): Amplitude = 0.4
  - Yellow (#FFFF00): Amplitude = 0.6
  - Orange (#FF8000): Amplitude = 0.8
  - Red (#FF0000): Amplitude = 1.0
- Physical pattern features:
  - Distinct vertical stripes indicating periodic impulse events
  - Impulse spacing: approximately 6.2 milliseconds (corresponding to Ball Pass Frequency Inner race, BPFI ≈ 162 Hz)
  - Harmonic components visible at 324 Hz and 486 Hz (2×BPFI and 3×BPFI)
  - Energy concentration in 0-2000 Hz frequency band
  - Natural noise texture with slight irregularities in impulse amplitudes (realistic variation)
  - Background noise floor at approximately 0.1-0.15 normalized amplitude

Colorbar:
- Position: Right edge of subplot, 20px width, 550px height
- Label: "Normalized Amplitude" in 11pt font, rotated 90° counterclockwise
- Tick marks: 0.0, 0.5, 1.0 with labels

**Subplot (b) - Center Panel (600×600px): Standard DDPM Generated Signal**

Title: "(b) Standard DDPM" in bold 14pt font

Axes configuration: Identical to subplot (a)

Spectrogram characteristics (demonstrating lack of physical constraints):
- Same colormap as subplot (a) for fair comparison
- Pattern deficiencies:
  - Vertical stripes present but with irregular spacing (5-8ms variation, physically implausible)
  - Weak or absent harmonic structure at 2×BPFI and 3×BPFI
  - Energy spread across wider frequency range (0-3000 Hz) instead of concentrated band
  - Horizontal streak artifacts at random frequencies (unphysical)
  - Overly smooth texture lacking natural noise characteristics
  - Impulse amplitudes too uniform (unrealistic consistency)

Annotation:
- Dashed white rectangle (2px line width) highlighting problematic region: 100×200px box at time [0.05, 0.1]s and frequency [0, 1000]Hz
- Small arrow pointing to irregular impulse region with text label: "Missing Periodicity" in 10pt font

Colorbar: Identical to subplot (a)

**Subplot (c) - Right Panel (600×600px): PC-Diffusion Generated Signal**

Title: "(c) PC-Diffusion (Proposed)" in bold 14pt font

Axes configuration: Identical to subplot (a)

Spectrogram characteristics (demonstrating physics-informed generation):
- Same colormap as subplot (a)
- Pattern features matching real data:
  - Clear periodic vertical stripes with correct spacing: 6.2ms (BPFI = 162 Hz)
  - Well-defined harmonic components at 324 Hz and 486 Hz
  - Energy distribution concentrated in 0-2000 Hz band (matching real data)
  - Natural noise texture similar to real sample
  - Realistic amplitude variations in impulse events
  - Background noise floor consistent with real measurements

Annotation:
- Dashed green rectangle (2px line width) at same location as subplot (b) box, highlighting well-matched region
- Small green checkmark icon (✓, 16×16px) near title indicating "Physically Plausible"

Colorbar: Identical to subplot (a)

**Global Specifications:**

Color scale consistency:
- All three subplots use identical colormap with vmin=0.0, vmax=1.0 (normalized amplitude)
- Ensure colorbar alignment across all panels

Typography:
- Font family: Arial or Helvetica sans-serif
- Subplot titles: 14pt bold
- Axis labels: 12pt regular
- Tick labels: 10pt regular
- Annotations: 10pt regular
- Colorbar label: 11pt regular

Layout:
- Subplot spacing: 50px horizontal gap
- Overall figure border: 1px solid black (#000000)
- Margins: 20px on all sides

Optional enhancement (zoom-in insets):
- Small magnified views (100×100px each) in bottom-right corner of each subplot
- Show detailed texture of impulse region: time [0.08, 0.10]s, frequency [0, 500]Hz
- White border (2px) to distinguish from main plot
- Same colormap and scale as parent subplot

**Technical Specifications:**

- Heatmap interpolation: Bilinear for smooth color gradients
- Aspect ratio: 1:1 (equal scaling) for accurate time-frequency representation
- Grid lines: None (clean heatmap without overlaid grid)
- Anti-aliasing: Enabled for smooth edges on text and annotations
- Export format: PNG with lossless compression, 300 DPI, RGB color space (not CMYK)

**Physical Context for Accurate Generation:**

This figure demonstrates the superiority of physics-constrained diffusion models in generating bearing fault signals with correct characteristic frequencies. Real bearing faults produce periodic impulse responses when rolling elements pass over surface defects. The Ball Pass Frequency Inner race (BPFI) is calculated from bearing geometry and shaft speed. Standard DDPM fails to capture this periodic structure and harmonic content, while PC-Diffusion successfully generates physically plausible signals due to embedded physics constraints (frequency-domain energy conservation, time-domain periodicity, and PINN-learned dynamics). The vertical stripes in the time-frequency representation correspond to impulse events, and their spacing directly relates to the fault characteristic frequency.

---

## Additional Technical Notes

**Color Accuracy:**
- Use exact hex color codes provided for consistency with paper's established color scheme
- Ensure colors remain distinguishable when converted to grayscale (for potential black-and-white printing)
- Avoid pure black (#000000) for text on colored backgrounds; use dark gray (#212121) for better readability

**Resolution and Quality:**
- Generate at minimum 300 DPI for publication-grade quality
- Apply anti-aliasing to all text and vector elements for smooth rendering
- Use PNG format with lossless compression (avoid JPEG artifacts)
- Ensure no pixelation or blurring when viewed at 100% zoom

**Accessibility Compliance:**
- Maintain color contrast ratio ≥4.5:1 for all text elements (WCAG AA standard)
- Include pattern/texture differences in addition to color coding (for colorblind accessibility)
- Use clear, readable fonts with minimum 10pt size at actual print size

**File Naming Convention:**
- Figure 1: `fig1_overall_architecture.png`
- Figure 3: `fig3_spectrogram_comparison.png`

**Output Directory:**
`/home/liaowenjie/.openclaw-multi/shared/paper-project-2/figures/`
