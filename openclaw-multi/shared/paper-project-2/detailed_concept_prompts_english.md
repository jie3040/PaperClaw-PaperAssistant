# Detailed English Prompts for Concept Figures (Nanobanana Pro)

## Fig.1 - Overall Architecture of PC-Diffusion Framework

**Resolution**: 1800×1000 pixels (300 DPI)  
**Format**: PNG with transparent background option  
**Style**: Clean academic diagram, IEEE publication quality

### Prompt:

Create a professional three-stage horizontal pipeline diagram illustrating the Physics-Constrained Diffusion Model (PC-Diffusion) framework for zero-shot fault diagnosis. The diagram should be publication-ready for IEEE Transactions on Instrumentation and Measurement.

**Stage 1 (Left section, ~500px width): PINN Pre-training**
- Top input box: "Vibration Signals (Seen Faults)" with a small waveform icon (sinusoidal pattern)
- Center: Neural network diagram labeled "PINN" showing 3 hidden layers with interconnected nodes
- Bottom output box: "Learned Dynamics Model" with mathematical equation symbol
- Overlay physics equation in LaTeX style: "mẍ + cẋ + kx = F(t)" in serif font
- Color scheme: Deep blue (#1976D2, RGB: 25,118,210) for boxes with rounded corners, gray (#757575, RGB: 117,117,117) for neural network nodes
- Box style: Rounded rectangles with 8px corner radius, 2px solid border

**Stage 2 (Center section, ~600px width): PC-Diffusion Training**
- Top dual inputs:
  - Left input: "Seen Fault Samples" with waveform icon
  - Right input: "Semantic Vectors" with text/document icon
- Center: Large U-Net architecture diagram showing:
  - Encoder path: 4 down-sampling blocks on left side, each block progressively smaller (64→128→256→512 channels indicated by width)
  - Decoder path: 4 up-sampling blocks on right side, mirror of encoder
  - Skip connections: Dashed gray arrows connecting corresponding encoder-decoder levels
  - Time embedding: Small box at top center labeled "t" feeding into U-Net
- Below U-Net: Three loss function boxes arranged horizontally:
  - "L_freq" with frequency spectrum icon (vertical bars)
  - "L_period" with sine wave icon
  - "L_PINN" with partial differential equation symbol
- Bottom output: "Generated Unseen Fault Samples" box
- Color scheme: 
  - U-Net: Green (#4CAF50, RGB: 76,175,80) for main structure
  - Loss boxes: Orange (#FF9800, RGB: 255,152,0) with white text
  - Skip connections: Dashed gray (#9E9E9E) arrows
- U-Net blocks: Rectangular with gradient fill showing depth

**Stage 3 (Right section, ~500px width): Bayesian Zero-Shot Inference**
- Top input: "Test Signal (Unseen Fault)" box
- Center dual branches:
  - Left branch: "Feature Extractor (CNN)" → "Feature Vector" (connected by solid arrow)
  - Right branch: "Semantic Embedding" → "Semantic Space" (connected by solid arrow)
- Matching module: "Variational Inference" box with Gaussian distribution icon (bell curve)
- Bottom dual outputs:
  - "Predicted Class" with label/tag icon
  - "Uncertainty (95% CI)" with error bar icon (vertical line with caps)
- Color scheme: Purple (#9C27B0, RGB: 156,39,176) for all inference components
- Box style: Rounded rectangles matching Stage 1

**Inter-stage Connections**:
- Thick arrows (4px width) connecting stages, labeled with data flow descriptions:
  - Stage 1→2: "Physics Prior"
  - Stage 2→3: "Synthetic Samples"
- Dashed arrows (2px width, #F44336 red) from Stage 1 PINN to Stage 2 loss functions, labeled "Physical Constraints"
- Arrow style: Solid triangular heads, slight curve for aesthetic flow

**Overall Style Requirements**:
- Background: Pure white (#FFFFFF)
- Font: Arial or Helvetica, sans-serif
- Label font size: 14-16pt for main labels, 12pt for sub-labels
- Icon size: 24×24px for small icons
- Spacing: 40px horizontal gap between stages, 20px vertical spacing within stages
- Subtle drop shadow: 2px offset, 4px blur, 20% opacity black for depth
- Optional: Very light gray grid background (#F5F5F5) for technical aesthetic
- Legend box (bottom-right, 200×100px): Explain arrow types (solid=data flow, dashed=constraint)

**Technical Details**:
- Ensure all text is readable at 100% zoom
- Use consistent line weights: 2px for boxes, 1px for internal connections, 4px for main arrows
- Color contrast ratio ≥4.5:1 for accessibility (WCAG AA standard)
- Export as PNG with 300 DPI for print quality

---

## Fig.3 - CWT Spectrogram Comparison: Real vs. Generated Samples

**Resolution**: 1800×600 pixels (300 DPI)  
**Format**: PNG  
**Style**: Scientific visualization, high-resolution heatmap

### Prompt:

Create a high-quality scientific visualization comparing Continuous Wavelet Transform (CWT) spectrograms across three conditions: real bearing fault signals, standard DDPM-generated signals, and PC-Diffusion-generated signals. The figure should demonstrate that PC-Diffusion produces physically plausible time-frequency patterns matching real data.

**Layout**: 1×3 grid of spectrograms, each 600×600px

**Column 1 (Left, 600×600px): Real Sample**
- Title: "(a) Real Sample" in bold, 14pt font, centered above
- Spectrogram: 2D time-frequency heatmap showing bearing inner race fault (0.021" depth)
- X-axis: Time (seconds), range 0 to 0.2s, tick marks every 0.05s
- Y-axis: Frequency (Hz), range 0 to 5000 Hz, tick marks every 1000 Hz
- Axis labels: "Time (s)" and "Frequency (Hz)" in 12pt font
- Colormap: Jet (blue→cyan→green→yellow→orange→red)
  - Blue (#0000FF) for low amplitude (0.0)
  - Cyan (#00FFFF) for 0.2
  - Green (#00FF00) for 0.4
  - Yellow (#FFFF00) for 0.6
  - Orange (#FF8000) for 0.8
  - Red (#FF0000) for high amplitude (1.0)
- Pattern characteristics:
  - Clear vertical stripes indicating periodic impulses
  - Impulse spacing: ~6.2ms (corresponding to BPFI ≈ 162 Hz)
  - Harmonics visible at 324 Hz, 486 Hz (2×BPFI, 3×BPFI)
  - Energy concentrated in 0-2000 Hz band
  - Natural noise texture, slightly irregular impulse amplitudes
- Colorbar: Vertical bar on right edge, 20px wide, labeled "Amplitude (normalized)" with ticks at 0, 0.5, 1.0

**Column 2 (Center, 600×600px): Standard DDPM (No Physics)**
- Title: "(b) Standard DDPM" in bold, 14pt font
- Same axis configuration as Column 1
- Pattern characteristics:
  - Less structured appearance, missing clear periodicity
  - Vertical stripes present but irregular spacing (5-8ms variation)
  - Weaker harmonics, energy spread across wider frequency range
  - Some artifacts: horizontal streaks at random frequencies
  - Overly smooth texture, lacking natural noise
  - Impulse amplitudes too uniform (unrealistic)
- Colorbar: Same as Column 1
- Visual difference markers:
  - Dashed white rectangle (2px line) highlighting irregular impulse region (100×200px box at time 0.05-0.1s, freq 0-1000Hz)
  - Small annotation arrow pointing to artifact with text "Missing periodicity"

**Column 3 (Right, 600×600px): PC-Diffusion (Proposed)**
- Title: "(c) PC-Diffusion (Proposed)" in bold, 14pt font
- Same axis configuration as Column 1
- Pattern characteristics:
  - Clear periodic vertical stripes matching real sample
  - Correct impulse spacing: ~6.2ms (BPFI = 162 Hz)
  - Well-defined harmonics at 324 Hz, 486 Hz
  - Energy distribution matches real data (concentrated in 0-2000 Hz)
  - Natural noise texture similar to real sample
  - Slight amplitude variations (physically realistic)
- Colorbar: Same as Column 1
- Visual similarity markers:
  - Dashed green rectangle (2px line) highlighting well-matched region (same location as Column 2 box)
  - Small checkmark icon (✓) in green near title indicating "Physically plausible"

**Special Requirements**:
- Consistent color scale across all three subplots: vmin=0.0, vmax=1.0 (normalized amplitude)
- Zoom-in insets (optional, 100×100px each):
  - Small magnified view in bottom-right corner of each subplot
  - Shows detailed texture of impulse region (time 0.08-0.10s, freq 0-500Hz)
  - White border (2px) to distinguish from main plot
- Grid lines: None (clean heatmap)
- Subplot spacing: 50px horizontal gap between columns
- Overall figure border: 1px solid black (#000000)

**Technical Specifications**:
- Heatmap interpolation: Bilinear for smooth gradients
- Aspect ratio: Equal (square pixels) for accurate time-frequency representation
- Font: Arial or Helvetica, sans-serif
- Axis tick label size: 10pt
- Axis label size: 12pt
- Title size: 14pt, bold
- Colorbar label size: 11pt
- Export: PNG, 300 DPI, RGB color space

**Physical Context** (for AI model understanding):
- This visualization demonstrates that PC-Diffusion generates bearing fault signals with correct characteristic frequencies (BPFI = Ball Pass Frequency Inner race)
- Real bearing faults produce periodic impulses when rolling elements pass over defects
- Standard DDPM fails to capture this physics, while PC-Diffusion succeeds due to physics-informed constraints
- The vertical stripes represent impulse events in time-frequency domain
- Harmonics (integer multiples of fundamental frequency) are key indicators of physical plausibility

---

## Additional Notes for Nanobanana Pro:

**Color Accuracy**:
- Use exact hex codes provided for consistency with paper's color scheme
- Ensure colors are distinguishable in grayscale (for print compatibility)
- Avoid pure black (#000000) for text on colored backgrounds; use dark gray (#212121) instead

**Resolution & Quality**:
- Generate at 300 DPI minimum for publication quality
- Use anti-aliasing for smooth edges on text and shapes
- Ensure no compression artifacts (use PNG, not JPEG)

**Accessibility**:
- Color contrast ratio ≥4.5:1 for text (WCAG AA)
- Include texture/pattern differences in addition to color (for colorblind readers)
- Use clear, readable fonts (minimum 10pt at 100% zoom)

**File Naming**:
- Fig.1: `fig1_overall_architecture.png`
- Fig.3: `fig3_spectrogram_comparison.png`

**Save Location**:
- `/home/liaowenjie/.openclaw-multi/shared/paper-project-2/figures/`
