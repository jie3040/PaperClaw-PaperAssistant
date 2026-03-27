# Concept Figure Prompts for CAC-CycleGAN-WGP Paper

This document contains detailed English prompts for generating two concept figures using Gemini.

---

## Figure 1: CAC-CycleGAN-WGP Overall Pipeline

A comprehensive, high-resolution scientific flowchart illustrating the complete CAC-CycleGAN-WGP fault diagnosis framework, presented in a horizontal four-stage pipeline layout.

**Stage 1: Data Input and Preprocessing (Left Section, Light Blue Background)**

The pipeline begins at the left edge with a 'Raw Vibration Signals' cylindrical icon (gradient blue #2196F3 to #1976D2) containing a sinusoidal waveform pattern inside. Two arrows emerge from this icon, pointing rightward.

The upper branch leads to a rounded rectangular box labeled 'FFT Preprocessing' (dashed border, orange #FF9800) containing a small spectrum analysis icon showing frequency peaks. Below this, an arrow points to a 'Frequency Domain Features' rounded box (solid border, light orange #FFE0B2) with mathematical notation '$\mathcal{F}\{x(t)\}$' displayed inside.

The lower branch contains a 'Fault Label' rounded box (dashed border, green #4CAF50) connected to a parallel 'Normal Domain Samples' rounded box (solid border, teal #009688) and 'Fault Domain Samples' rounded box (solid border, coral #FF7043).

All boxes in this stage have rounded corners with 2px solid borders and are connected by straight arrows (2px, dark gray #424242).

**Stage 2: Generation - CycleGAN with CAC and WGP (Center-Left Section, Light Green Background)**

A large dashed rounded rectangle (green border #4CAF50, light green background #E8F5E9) encompasses this complex stage. The title 'CycleGAN with Conditional Auxiliary Classifier and Wasserstein Gradient Penalty' appears at the top in bold serif font.

The stage is divided into two symmetric halves. The upper half represents the Normal to Fault transformation pipeline:

A rounded box labeled 'Normal Domain $X$' (solid border, deep blue #1565C0) sits at the left. An arrow points to a yellow rounded box 'Generator G: $G(X)$' (solid border, amber #FFC107) containing a schematic CNN architecture diagram with convolutional layers, residual blocks, and upsampling layers. Below the generator, a text label 'WGP Constraint' (italic, gray #757575) appears with a small gradient penalty visualization.

Adjacent to the generator, a cyan box 'Discriminator $D_Y$' (solid border, cyan #00BCD4) displays a PatchGAN architecture with multiple convolutional layers. A curved arrow points from the generator output back to the discriminator, forming an adversarial training loop.

A dashed box labeled 'CAC Module' (orange border #FF9800, light orange background #FFF3E0) is positioned between the generator and discriminator, containing a classification head with fault type labels '$c_1, c_2, c_3$'. An arrow connects this to the generator, indicating conditional generation.

The lower half mirrors this structure for Fault to Normal transformation:

A rounded box labeled 'Fault Domain $Y$' (solid border, coral #FF7043) at the left connects to a yellow rounded box 'Generator F: $F(Y)$' (solid border, amber #FFC107) with identical CNN architecture. A corresponding 'Discriminator $D_X$' (solid border, cyan #00BCD4) appears on the right side.

Between the two domains, curved arrows illustrate the cycle-consistency loss: an arrow from 'Generator G' output looping through 'Generator F' back to the input, labeled 'Cycle Consistency: $F(G(X)) \approx X$' in mathematical notation.

The WGP constraint is visualized as a green gradient penalty curve (light green #C8E6C9) connecting to both generators, with text labels '$\mathbb{W}(\mathbb{P}_r, \mathbb{P}_g)$' and 'Gradient Penalty'.

**Stage 3: Quality Evaluation (Center-Right Section, Light Purple Background)**

A dashed rounded rectangle (purple border #9C27B0, light purple background #F3E5F5) contains this evaluation stage.

A large arrow from Stage 2 enters a rounded box labeled 'Generated Samples Evaluator' (solid border, deep purple #7B1FA2). Inside, a diagram shows a Stacked Autoencoder (SAE) architecture with encoder layers (blue nodes), bottleneck layer (purple node), and decoder layers (green nodes).

From this box, two parallel arrows point to two evaluation components:

The upper branch leads to a teal box 'Structural Authenticity Evaluation (SAE)' (solid border, teal #00796B) containing a reconstruction error formula '$L_{SAE} = \|x - \hat{x}\|^2$'. Below it, a bar chart shows 'Feature Fidelity Scores' with multiple bars in blue and orange.

The lower branch leads to a coral box 'Pearson Correlation Coefficient (PCC)' and 'Cosine Similarity (CS)' (solid border, #E64A19) showing correlation matrices with heatmap colors ranging from blue to red.

A vertical arrow connects these two evaluation boxes to a 'Quality Score Aggregation' yellow box (solid border, #FBC02D) where scores are combined using weighted averaging.

**Stage 4: Fault Diagnosis (Right Section, Light Orange Background)**

The final stage features a dashed rounded rectangle (orange border #E65100, light orange background #FFF3E0) with title 'SVM Fault Classifier'.

A thick arrow from the quality evaluation stage enters a rounded box 'Feature Vector Concatenation' (solid border, deep orange #EF6C00) which combines features from generated samples and original training data.

This connects to a diagram of a Support Vector Machine (SVM) with hyperplane separation. The visualization shows a 2D feature space with data points (circles in blue, green, and orange representing different fault classes) and a maximum margin hyperplane (dashed line, purple #7B1FA2). Support vectors are highlighted with larger circle sizes.

To the right of the SVM diagram, a 'Classification Results' rounded box (solid border, green #388E3C) displays a confusion matrix heatmap with accuracy metrics.

At the far right, a final box labeled 'Fault Diagnosis Report' (solid border, dark green #1B5E20) contains a document icon with diagnostic outputs including fault type, severity level, and confidence score.

**Inter-stage Connections:**

- Straight thick arrows (3px, dark blue #0D47A1) connect Stage 1 to Stage 2, Stage 2 to Stage 3, and Stage 3 to Stage 4.
- Each arrow is labeled with the data flow: 'Preprocessed Features', 'Generated Fault Samples', 'Quality-Scored Features', 'Diagnostic Prediction'.
- Arrow heads are standard triangular arrowheads (10px).

**Overall Style:**

Clean academic diagram, flat design with subtle gradients, IEEE publication quality. Color scheme: Blue (#1565C0, #2196F3) for normal domain and technical components, Orange (#FF9800, #FF7043) for fault domain and highlights, Green (#4CAF50, #009688) for evaluation and success indicators. White background with light colored section backgrounds. 2px solid borders on all boxes with 8px border radius. Mathematical notation in LaTeX style serif font.

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS

---

## Figure 2: GAN Architecture Detailed Diagram

A detailed, high-resolution technical illustration of the CycleGAN architecture with conditional auxiliary classification and Wasserstein gradient penalty, presented in a modern isometric technical diagram style.

**Main Layout:**

The figure is organized into three horizontal sections: the upper portion shows the generator architecture, the middle section displays the discriminator and CAC module, and the lower section illustrates the cycle consistency and WGP constraints.

**Generator Architecture (Upper Section, Cyan Background):**

A large stylized neural network block represents the Generator, rendered in isometric perspective with depth shading.

The Generator consists of:

An input layer represented as a horizontal bar (blue gradient, #00BCD4 to #0097A7) labeled 'Input: Normal Domain Signal $X$' with dimensional label '$128 \times 1$'. Below this, three convolutional blocks are depicted:

**Convolutional Block 1:** A 3D rectangular prism (cyan #26C6DA) with internal layer visualization showing 64 filters of size $7 \times 7$, stride 1. A text label 'Conv + IN + ReLU' appears on the front face. An arrow with label '$64 \times 128 \times 1$' points to the next block.

**Convolutional Block 2:** A larger 3D prism (teal #26A69A) showing 128 filters of size $3 \times 3$, stride 2. Label reads 'Conv + IN + ReLU' with output '$128 \times 64 \times 64$'.

**Convolutional Block 3:** Another prism (green #66BB6A) showing 256 filters of size $3 \times 3$, stride 2. Output label '$256 \times 32 \times 32$'.

Nine residual blocks are illustrated as a stacked sequence of 3D cubes (light blue #81D4FA with dark blue edges #0288D1), each containing a internal skip connection visualization. Each ResBlock is labeled '$256 \times 32 \times 32$', and they are connected by curved arrows showing the residual pathway: '$x + \mathcal{F}(x)$'.

Two upsampling blocks follow:

**Upsampling Block 1:** A 3D expanding prism (yellow #FFEE58) showing transposed convolution with 128 filters, size $3 \times 3$, stride 2. Output '$128 \times 64 \times 64$'.

**Upsampling Block 2:** Another expanding prism (orange #FFA726) showing 64 filters, output '$64 \times 128 \times 128$'.

The output layer is a final convolutional layer rendered as a horizontal bar (deep orange #FF7043) labeled 'Output: Fault Domain Sample $G(X)$' with output dimension '$128 \times 1$'.

**Discriminator and CAC Module (Middle Section, Orange Background):**

Below the generators, two discriminator networks are shown in parallel arrangement:

**Discriminator $D_Y$ (for Fault Domain):** A PatchGAN architecture rendered as a vertical stack of 3D convolutional layers:

- Input layer: horizontal bar (coral #FF8A65) labeled 'Generated/Fake Fault Sample'
- Conv layer 1: prism (light coral #FFAB91) with 64 filters, $4 \times 4$, stride 2, label 'LeakyReLU'
- Conv layer 2: prism (deeper coral #FF7043) with 128 filters, $4 \times 4$, stride 2
- Conv layer 3: prism (deep coral #F4511E) with 256 filters, $4 \times 4$, stride 2
- Output: A grid of small squares (PatchGAN output) in gradient colors (blue to red) labeled '$30 \times 30 \times 1$ patch probabilities'

**Conditional Auxiliary Classifier (CAC):** Attached to the generator output, a vertical classification module rendered in isometric style:

- An input connection arrow from Generator output enters a 'Feature Layer' rectangular prism (purple #AB47BC)
- A branching structure leads to a 'Classification Head' prism (deep purple #7B1FA2) with fully connected layers
- Three output nodes (circles in green #66BB6A, yellow #FFEE58, orange #FFA726) are labeled '$c_1$: Bearing Fault', '$c_2$: Gear Fault', '$c_3$: Misalignment'
- A probability distribution bar chart shows softmax outputs below each class

**Wasserstein Gradient Penalty (Lower Section, Green Background):**

Below the adversarial training section, the WGP constraint is illustrated:

A coordinate system with two axes: horizontal axis labeled 'Generated Distribution $\mathbb{P}_g$' and vertical axis labeled 'Real Distribution $\mathbb{P}_r$'. A curved line (gradient from blue to red) represents the optimal transport plan. A shaded region between the distributions is labeled 'Gradient Penalty Region'.

A text box displays the WGP loss formula:

$$\mathcal{L}_{WGP} = \mathbb{E}_{\hat{x} \sim \hat{\mathbb{P}}} [\|\nabla_{\hat{x}} D(\hat{x})\| - 1]^2$$

where $\hat{x}$ is interpolated between real and generated samples.

A small inset diagram shows the interpolation process: a real sample point (blue circle), a generated sample point (orange circle), and intermediate interpolated points (gray circles) along a straight line connecting them.

**Cycle Consistency Loop (Bottom Section, Light Blue Background):**

At the bottom, the cycle consistency mechanism is visualized as a circular flow diagram:

- Starting from 'Normal Domain $X$' (blue rounded box, top left)
- Arrow labeled '$G$' points to 'Fault Domain $G(X)$' (orange rounded box, top right)
- Arrow labeled '$F$' points from 'Fault Domain $G(X)$' back to 'Recovered Normal $F(G(X))$' (blue rounded box, bottom right)
- A dashed arrow connects 'Recovered Normal' back to original 'Normal Domain $X$', labeled 'Cycle Consistency Loss: $\|F(G(X)) - X\|_1$'

A parallel cycle runs in reverse:

- Starting from 'Fault Domain $Y$' (orange rounded box, bottom left)
- Arrow labeled '$F$' points to 'Normal Domain $F(Y)$' (blue rounded box, bottom right)
- Arrow labeled '$G$' points from 'Normal Domain $F(Y)$' back to 'Recovered Fault $G(F(Y))$' (orange rounded box, top right)
- A dashed arrow labeled 'Cycle Consistency Loss: $\|G(F(Y)) - Y\|_1$' completes the loop.

**Style and Colors:**

Modern technical isometric illustration with subtle 3D depth effects. Color scheme: Cyan and teal (#00BCD4, #26C6DA, #0097A7) for generator components, Orange and coral (#FF9800, #FF7043, #FF8A65) for fault domain and discriminator, Green (#66BB6A, #4CAF50) for cycle consistency indicators, Purple (#AB47BC, #7B1FA2) for CAC module, Yellow (#FFEE58, #FBC02D) for highlights.

All neural network layers rendered as 3D prisms with visible depth. Skip connections shown as curved pipes with arrowheads. Mathematical notation in LaTeX style serif font. White background with light colored section backgrounds. Subtle drop shadows on all elements for depth. No borderless elements; all boxes have visible outlines.

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS

---

*End of prompts. Both figures are designed for academic publication quality and should be generated at 300 DPI for print.*