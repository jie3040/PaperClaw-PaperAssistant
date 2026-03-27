# Detailed Concept Prompt for Fig 1: CAC-CycleGAN-WGP Architecture

## Overview
Generate a comprehensive conceptual illustration showing the overall architecture of the CAC-CycleGAN-WGP framework for imbalanced bearing fault diagnosis data augmentation. The diagram should be organized in a vertical stacked layout with 4 main sections.

---

## Section 1: Input Data (Top Layer)
**Background color:** Light blue (#E3F2FD)

### 1.1 Imbalanced Dataset Box
- **Shape:** Rounded rectangle (rounded box)
- **Border:** Solid, 2pt, navy blue (#1565C0)
- **Fill color:** White (#FFFFFF)
- **Label:** "Imbalanced Dataset" (top center)
- **Internal layout:** Two vertical sub-boxes side by side

#### 1.1.1 Normal Samples $X$
- **Shape:** Rectangle with dashed border
- **Border:** Dashed, 1.5pt, green (#2E7D32)
- **Fill color:** Light green (#E8F5E9)
- **Label:** $\mathbf{X}$ (center, bold, 14pt)
- **Sub-label:** "Normal Samples" below in smaller font (10pt)
- **Quantity annotation:** "$N_{normal}$ samples"

#### 1.1.2 Fault Samples $Y$
- **Shape:** Rectangle with dashed border
- **Border:** Dashed, 1.5pt, orange (#EF6C00)
- **Fill color:** Light orange (#FFF3E0)
- **Label:** $\mathbf{Y}$ (center, bold, 14pt)
- **Sub-label:** "Fault Samples" below in smaller font (10pt)
- **Quantity annotation:** "$N_{fault} \ll N_{normal}$" (indicating imbalance)

### Arrow from Section 1 to 2
- **Type:** Solid arrow with diamond head
- **Color:** Dark gray (#424242)
- **Label:** "Input" (above arrow, 10pt)
- **Style:** Thick (2pt), pointing downward

---

## Section 2: CycleGAN Translation (Middle-Top Layer)
**Background color:** Light green (#E8F5E9)

### 2.1 CycleGAN Core Block
**Shape:** Large rounded rectangle (main container)
- **Border:** Solid, 3pt, dark green (#1B5E20)
- **Fill color:** Very light green (#F1F8E9)
- **Title:** "CycleGAN Translation" (top, centered, 12pt bold)

#### 2.1.1 Generator G: $X \rightarrow \tilde{Y}$ (Left side)
- **Shape:** Cylinder (representing neural network)
- **Border:** Solid, 2pt, blue (#1565C0)
- **Fill color:** Light blue (#E3F2FD)
- **Label:** $G$ (center, bold, 16pt)
- **Sub-label:** "$X \rightarrow \tilde{Y}$" (below, 10pt)
- **Description:** "Generator: Normal → Fault"

#### 2.1.2 Generator F: $Y \rightarrow \tilde{X}$ (Right side)
- **Shape:** Cylinder (mirror of G)
- **Border:** Solid, 2pt, purple (#7B1FA2)
- **Fill color:** Light purple (#F3E5F5)
- **Label:** $F$ (center, bold, 16pt)
- **Sub-label:** "$Y \rightarrow \tilde{X}$" (below, 10pt)
- **Description:** "Generator: Fault → Normal"

#### 2.1.3 Cycle Consistency Arrow (Curved)
- **Type:** Curved double-headed arrow connecting bottom of G to bottom of F
- **Color:** Red (#C62828)
- **Style:** Dashed, 1.5pt
- **Label:** "Cycle Consistency" (curved text, 9pt)
- **Math:** $\tilde{X} = F(G(X))$, $\tilde{Y} = G(F(Y))$

#### 2.1.4 Discriminator $D$ (Bottom center)
- **Shape:** Hexagon
- **Border:** Solid, 2pt, red (#C62828)
- **Fill color:** Light red (#FFEBEE)
- **Label:** $D$ (center, bold, 14pt)
- **Sub-label:** "Discriminator" (below, 10pt)

### 2.2 CAC Module (Conditional Auxiliary Classifier)
**Position:** Attached to Generator G (left side)
- **Shape:** Small rectangle overlaid on G
- **Border:** Solid, 1pt, teal (#00695C)
- **Fill color:** Light teal (#E0F2F1)
- **Label:** CAC (corner, 10pt bold)
- **Function:** "Adds class condition to latent space"
- **Math annotation:** $P(y|x)$ estimation

### 2.3 WGP Module (Wasserstein + Gradient Penalty)
**Position:** Attached to Discriminator D (bottom)
- **Shape:** Small rectangle below D
- **Border:** Solid, 1pt, brown (#4E342E)
- **Fill color:** Light brown (#EFEBE9)
- **Label:** WGP (center, 10pt bold)
- **Function:** "Stabilizes training with gradient penalty"
- **Math annotation:** $\| \nabla_{\hat{x}} D(\hat{x}) \|_2 = 1$

### Arrow from Section 2 to 3
- **Type:** Solid arrow with triangle head
- **Color:** Dark gray (#424242)
- **Label:** "Generated Samples" (above, 10pt)
- **Style:** Medium thickness (1.5pt)

---

## Section 3: SAE Quality Evaluation (Middle-Bottom Layer)
**Background color:** Light yellow (#FFFDE7)

### 3.1 Stacked Autoencoder Block
**Shape:** Large rounded rectangle
- **Border:** Solid, 2pt, amber (#FF8F00)
- **Fill color:** Light amber (#FFF8E1)
- **Title:** "SAE Quality Evaluator" (top, centered, 12pt bold)

#### 3.1.1 Encoder (Left half)
- **Shape:** Trapezoid (narrowing inward)
- **Border:** Solid, 1.5pt, gray (#616161)
- **Fill color:** Light gray (#F5F5F5)
- **Label:** "Encoder" (center, 11pt)
- **Function:** "Feature extraction $h = f(x)$"

#### 3.1.2 Bottleneck (Center)
- **Shape:** Diamond
- **Border:** Solid, 2pt, black (#212121)
- **Fill color:** White (#FFFFFF)
- **Label:** $h$ (center, bold, 14pt)
- **Description:** "Latent representation"

#### 3.1.3 Decoder (Right half)
- **Shape:** Trapezoid (narrowing outward, mirror of encoder)
- **Border:** Solid, 1.5pt, gray (#616161)
- **Fill color:** Light gray (#F5F5F5)
- **Label:** "Decoder" (center, 11pt)
- **Function:** "Reconstruction $\hat{x} = g(h)$"

#### 3.1.4 Output Arrow (Right side)
- **Type:** Arrow pointing right
- **Color:** Green (#2E7D32)
- **Label:** "Reconstruction Error" (below, 9pt)
- **Math:** $\| x - \hat{x} \|_2^2$

### 3.2 Quality Metrics Annotation
- **Position:** Below SAE block
- **Shape:** Horizontal rectangle
- **Border:** Dashed, 1pt, blue (#1976D2)
- **Fill color:** White (#FFFFFF)
- **Content:** "Quality Metrics: Pearson Correlation, Cosine Similarity"

### Arrow from Section 3 to 4
- **Type:** Solid arrow with arrow head
- **Color:** Dark gray (#424242)
- **Label:** "Quality Assessment" (above, 10pt)

---

## Section 4: Output - Balanced Dataset (Bottom Layer)
**Background color:** Light purple (#F3E5F5)

### 4.1 Synthetic Fault Samples
- **Shape:** Rounded rectangle
- **Border:** Solid, 2pt, orange (#EF6C00)
- **Fill color:** Light orange (#FFE0B2)
- **Label:** $\tilde{Y}$ (center, bold, 16pt)
- **Sub-label:** "Synthetic Fault Samples" (below, 10pt)
- **Quantity annotation:** "$N_{synthetic}$ samples"

### 4.2 Balanced Dataset Merging
**Position:** Right side of synthetic samples
- **Shape:** Merge icon (two arrows combining into one)
- **Border:** Solid, 1.5pt, purple (#7B1FA2)
- **Fill color:** Light purple (#E1BEE7)

### 4.3 Final Balanced Dataset
- **Shape:** Large rounded rectangle
- **Border:** Solid, 3pt, green (#2E7D32)
- **Fill color:** Light green (#C8E6C9)
- **Label:** "Balanced Dataset" (center, 14pt bold)
- **Internal layout:** Two sub-boxes

#### 4.3.1 Combined Normal Samples
- **Shape:** Rectangle
- **Border:** Solid, 1pt, green (#2E7D32)
- **Fill color:** White (#FFFFFF)
- **Label:** $X \cup \tilde{X}$ (center, 12pt)
- **Content:** "Original + Reconstructed Normal"

#### 4.3.2 Combined Fault Samples
- **Shape:** Rectangle
- **Border:** Solid, 1pt, orange (#EF6C00)
- **Fill color:** White (#FFFFFF)
- **Label:** $Y \cup \tilde{Y}$ (center, 12pt)
- **Content:** "Original + Synthetic Fault"

### 4.4 Downstream Classifier
- **Position:** Below balanced dataset
- **Shape:** Cylinder (larger than generator cylinders)
- **Border:** Solid, 2pt, dark blue (#0D47A1)
- **Fill color:** Light blue (#BBDEFB)
- **Label:** "Classifier" (center, 12pt)
- **Sub-label:** "SVM / RF / MLP / CNN" (10pt)
- **Function:** "Fault Diagnosis"

### Arrow to Classifier
- **Type:** Thick solid arrow pointing down
- **Color:** Dark blue (#0D47A1)
- **Label:** "Training & Testing" (10pt)

---

## Main Components Sub-diagram (Bottom Right Corner)

### Detailed Network Architecture Detail
**Shape:** Small inset box with magnification icon
**Border:** Dashed, 1pt, gray (#9E9E9E)
**Title:** "Network Details" (10pt bold)

#### Generator G Architecture:
- **Input:** Signal $X$ (1D/2D)
- **Layers:** Conv1D → BatchNorm → ReLU → ... → Conv1D → Tanh
- **Output:** Generated fault signal $\tilde{Y}$

#### Discriminator D Architecture:
- **Input:** Signal (real or fake)
- **Layers:** Conv1D → LeakyReLU → ... → FC → Sigmoid
- **Output:** Probability score

#### CAC Classifier:
- **Input:** Latent feature from G
- **Layers:** FC → Softmax
- **Output:** Class probability $P(y|x)$

---

## Style Guidelines

### Color Palette Summary:
- **Blue tones:** Input data, generator G, classifier (#1565C0, #E3F2FD, #BBDEFB)
- **Green tones:** Normal samples, cycle consistency region (#2E7D32, #E8F5E9)
- **Orange tones:** Fault samples, synthetic output (#EF6C00, #FFF3E0)
- **Red tones:** Discriminator, warnings (#C62828, #FFEBEE)
- **Purple tones:** Generator F, balanced output (#7B1FA2, #F3E5F5)
- **Yellow/Amber tones:** SAE evaluator (#FF8F00, #FFFDE7)

### Typography:
- **Main labels:** LaTeX math mode ($\mathbf{X}$, $Y$, $G$, $F$, $D$, $CAC$, $WGP$, $SAE$)
- **Section titles:** Bold, 12pt
- **Sub-labels:** Regular, 10pt
- **Annotations:** Italic, 9pt

### Arrow Specifications:
- **Main flow arrows:** Solid, 2pt, dark gray
- **Cycle consistency:** Curved dashed, red
- **Feedback arrows:** Dotted, 1pt
- **Evaluation flow:** Solid, 1.5pt, with diamond heads

### Layout:
- **Overall:** Vertical 4-section stack (top to bottom)
- **Section heights:** Equal distribution
- **Internal spacing:** 10pt minimum between elements
- **Margin:** 15pt around entire diagram

---

## Output Requirements
- Format: Detailed text description for AI image generation (e.g., Gemini)
- Language: English
- Detail level: 50-100 lines describing all visual elements
- The description should be detailed enough for an AI to generate the exact diagram

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS