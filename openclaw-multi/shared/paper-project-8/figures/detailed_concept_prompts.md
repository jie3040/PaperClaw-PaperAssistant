# Detailed Concept Prompts: CMSA-Trans (Project 8)

---

## Fig. 1: Conceptual Framework of Zero-Shot Diagnosis

A detailed, high-resolution scientific diagram illustrating the zero-shot fault diagnosis framework, presented in a clean industrial 3D isometric or flat vector style.

**Left Section: Industrial Signal Acquisition**

On the left side, a rotating mechanical piece is depicted, specifically a motor with bearings shown in deep blue color. The motor has a cylindrical body with visible shaft and bearing components. Small vibration sensors (depicted as small green triangles) are attached to the motor housing.

From the motor, a curved arrow points to a cyan waveform display panel showing a time-domain vibration signal with peaks and valleys. The waveform is rendered in light blue color against a dark blue background.

**Center Section: CMSA-Trans Processing**

A large, prominent brain icon in violet/purple color is positioned in the center, labeled "CMSA-Trans" in bold white text. Inside the brain icon, smaller diagrams show the cross-modality attention mechanism - three overlapping circles representing Q, K, V matrices in different shades of purple.

A thick arrow connects the waveform panel to the brain icon, labeled "Signal Features (fv)" in orange text.

**Right Section: LLM and Output**

On the right side, a generic LLM (Large Language Model) icon is depicted as a purple cube stack with neural network connections, labeled "LLM (e.g., GPT-4)". 

From the LLM icon, a curved arrow points toward the brain icon, labeled "Semantic Prototypes (fs)" in light green text.

At the far right, an output box in soft green displays a clear label "Unseen Fault: Inner Race Fault at 0.5mm" in bold black text. Below this, additional output examples are shown: "Outer Race Fault", "Rolling Element Fault" in smaller text boxes.

**Connecting Elements**

Dotted arrows connect the brain icon to the output box, showing the alignment process. A star-shaped icon labeled "Semantic Prototype" is positioned between the LLM and the output, indicating how semantic knowledge guides the diagnosis.

**Color Scheme**
- Deep Blue: Industrial components (motor, bearings)
- Soft Green: Success states, labels, output boxes
- Violet/Purple: LLM and AI components
- Cyan: Signal waveforms and connections
- Orange: Technical labels and annotations

**Special Requirements**: All colors use light pastel tones, font style should be Comic Sans MS for labels.

---

## Fig. 2: Signal TST Encoder Block

A technical flowchart of the Time-Series Transformer (TST) encoder block, presented in a professional academic schematic style with clear fonts (Helvetica/Arial), black text on white background.

**Input Section (Left)**

At the far left, a rounded rectangle in light gray shows "Input Vibration Signal" with a waveform icon inside. Below this, text indicates "1D Time Series: x(t) ∈ R^(T×1)".

A thick arrow points from the input to a cyan-colored block labeled "1D Convolution Embedding". Inside this block, a small diagram shows a convolution kernel sliding over the input, with text "Conv1D(k=3, stride=1)".

**Positional Encoding**

An arrow leads from the embedding block to a light blue rectangle labeled "Positional Encoding". Inside, a sine/cosine wave pattern is shown with the formula "PE(pos, 2i) = sin(pos/10000^(2i/d))" displayed in a smaller text box.

**Multi-Head Self-Attention Core**

The main body shows a large dashed box labeled "Transformer Encoder Layer" in gray border. Inside this box:

A horizontal flow shows the multi-head self-attention mechanism. Three parallel arrows enter from the left, labeled Q (Query), K (Key), and V (Value) in cyan, blue, and green colors respectively.

A central rounded rectangle labeled "Multi-Head Self-Attention" with internal structure showing 8 attention heads (represented by small circles in gradations of cyan). Text below indicates "H=8 heads".

An arrow leads from this to a small triangle labeled "Add & Norm" in light orange, representing the residual connection and LayerNorm operation.

**Feed-Forward Network**

Following the attention layer, an arrow points to a blue rectangle labeled "Feed-Forward Network (FFN)" with internal structure showing two linear transformation layers. Text indicates "Linear → ReLU → Linear".

Another "Add & Norm" triangle follows.

**Output Section (Right)**

At the right side, an arrow exits the transformer layer box pointing to an output rectangle labeled "Encoded Features" with the dimension "f_v ∈ R^(L×D)" displayed. Below this, text shows "D=512 latent dimension".

**Residual Connections**

Throughout the diagram, curved dashed arrows show residual connections from input to output of each major block, rendered in light gray color.

**Color Scheme**
- Gradations of Cyan: Attention-related components
- Light Gray: Residual connections and borders
- Light Blue: Positional encoding
- Orange: LayerNorm and normalization
- White background with black text

**Special Requirements**: All colors use light pastel tones, font style should be Comic Sans MS for labels.

---

## Fig. 3: Overall Architecture of CMSA-Trans

A comprehensive dual-stream architecture diagram presented in flat vector, professional academic style (TikZ/Visio look) with dark blue, purple, and orange color scheme.

**Top Stream: Signal Processing Pathway**

At the top left, a cyan rounded rectangle labeled "Input Vibration Signal" with a waveform icon inside.

An arrow points right to a rounded rectangle in light blue labeled "TST Signal Encoder", which contains a small transformer icon inside.

Another arrow leads to a larger rectangle in dark blue labeled "Signal Features (f_v)" with dimension "f_v ∈ R^(L×D)" displayed inside. The rectangle has a subtle gradient from dark blue to lighter blue.

**Bottom Stream: Semantic Processing Pathway**

At the bottom left, a purple rounded rectangle labeled "Fault Name / Category Text" is shown. Example text "Inner Race Fault" is visible inside.

An arrow points right to a violet rounded rectangle labeled "Large Language Model (LLM)" containing a brain/cube icon.

Another arrow leads to a purple rectangle labeled "Semantic Prototyping (f_s)" with dimension "f_s ∈ R^(L×D)" displayed inside. This rectangle has a gradient from purple to lighter lavender.

**Middle Section: Cross-Modality Mutual Attention**

In the center between the two streams, a large dashed box in light orange border labeled "Cross-Modality Mutual Attention Module" spans vertically.

Inside this box, the attention mechanism is illustrated with:

- Two sets of Q, K, V matrices: one in blue (from signal) and one in purple (from semantic)
- An overlapping region showing the attention computation
- Mathematical notation displayed: "Attention(Q_s, K_v, V_v)" and "Attention(Q_v, K_s, V_s)"

Diagonal arrows connect the signal features to the attention module (labeled "Q_s, K_s, V_s") and similarly for semantic features.

**Output Section (Right)**

At the far right, a green rounded rectangle labeled "Zero-Shot Decision Head" contains a classifier icon.

An arrow from the attention module points to this decision head, labeled "Fused Features".

Below the decision head, output labels are shown: "Unseen Fault Category Prediction" with example outputs like "Outer Race Fault", "Rolling Element Fault", etc.

**Legend and Labels**

A legend box in the bottom right corner shows color coding:
- Dark Blue: Signal processing components
- Purple: LLM/Semantic components  
- Orange: Technical labels and attention module

Key mathematical symbols are placed near respective components without using formulas in the diagram.

**Color Scheme**
- Dark Blue: Signal pathway components
- Purple: LLM and semantic pathway components
- Orange: Technical labels, annotations, and attention module border
- Light Cyan: Connection arrows
- Green: Output and decision head

**Special Requirements**: All colors use light pastel tones, font style should be Comic Sans MS for labels.

---

## Fig. 7: t-SNE Visualization of Feature Alignment

A pair of scatter plots presented side-by-side, showing feature alignment before and after the CMSA-Trans model training, in high-resolution academic style with soft transparency on overlapping points.

**Plot (a): Before Alignment**

The left panel labeled "(a) Before Alignment" shows a 2D t-SNE plot with scattered clusters:

- Four distinct clusters are visible in different colors (blue, orange, green, red from Tab-10 palette)
- The clusters are loosely spread out across the plot area
- Each cluster has a star-shaped icon labeled "Semantic Prototype" nearby but not well-aligned
- The clusters appear diffuse with points spread over a large area
- Axis labels: "t-SNE Dimension 1" (x-axis) and "t-SNE Dimension 2" (y-axis) in 12pt sans-serif font
- Title: "Before Alignment" in bold 14pt font

Each cluster represents an unseen fault category with label markers:
- Blue cluster: "Inner Race Fault"
- Orange cluster: "Outer Race Fault"  
- Green cluster: "Rolling Element Fault"
- Red cluster: "Ball Pass Frequency Fault"

The points have 50% transparency to show density variations.

**Plot (b): After Alignment**

The right panel labeled "(b) After Alignment" shows a 2D t-SNE plot with:

- The same four clusters but now much denser and more compact
- All clusters are more tightly grouped and show clear separation
- Each cluster is now aligned with a prominent star-shaped icon labeled "Semantic Prototype" at its center
- The star icons are larger and more prominent than in plot (a)
- The overall spread of clusters is smaller, indicating better alignment
- Same axis labels and title formatting as plot (a)

**Visual Enhancement**

Dashed lines connect each cluster center to its corresponding semantic prototype star in plot (b), showing the alignment effect.

A color legend in the bottom right shows the four category colors with their names.

**Overall Layout**

Both plots are enclosed in a unified border with the main title "t-SNE Visualization of Feature Alignment" at the top in bold 16pt font.

**Color Scheme**
- Tab-10 Palette: Blue (#1f77b4), Orange (#ff7f0e), Green (#2ca02c), Red (#d62728)
- Light transparency: 50% alpha for point markers
- Dark gray: Axis lines and labels
- Yellow/Gold: Semantic prototype star icons

**Special Requirements**: All colors use light pastel tones, font style should be Comic Sans MS for labels.

---

*Note: These detailed prompts are designed for generation via Gemini or similar image generation tools. The prompts focus on clear structure descriptions, element types, relative positions, color themes, and connection relationships while avoiding mathematical formulas in the visual output.*