# Fig 2: CAC-CycleGAN-WGP Full Architecture

## Conceptual Diagram Prompt (Nana Banana Detailed Style)

### Canvas Settings
- **Dimensions**: 1800 × 1200 pixels
- **Resolution**: 300 DPI (publication quality)
- **Background**: Three-zone gradient
  - Left zone (Input): Light blue (#E8F4FC)
  - Middle zone (Core): Light green (#E8FCE8)
  - Right zone (Evaluation): Light orange (#FCE8E8)

---

## Visual Elements Description

### 1. LEFT ZONE — DATA INPUT (Input Distribution)

**Normal Samples (X) Block**
- Shape: Rounded rectangle with dashed blue border (stroke-width: 3px)
- Color: Light blue fill (#D4E9F7)
- Size: 180 × 100 px
- Position: Top-left of left zone (x: 150, y: 250)
- Label: "Normal Samples X" (bold, 18pt, dark blue)
- Sub-label: "Source Domain" (italic, 14pt, gray)

**Fault Samples (Y) Block**
- Shape: Rounded rectangle with dashed red border (stroke-width: 3px)
- Color: Light red fill (#F7D4D4)
- Size: 180 × 100 px
- Position: Bottom-left of left zone (x: 150, y: 450)
- Label: "Fault Samples Y" (bold, 18pt, dark red)
- Sub-label: "Target Domain" (italic, 14pt, gray)

**Input Arrows**
- Arrow from X → Generator G (solid, blue, arrowhead at end)
- Arrow from Y → Generator F (solid, red, arrowhead at end)
- Label above each arrow: "Input" (12pt, gray)

---

### 2. MIDDLE ZONE — CORE ARCHITECTURE (CycleGAN + CAC + WGP)

#### 2.1 Generator G (X → Ŷ)

**Generator G Box**
- Shape: Rounded rectangle with solid yellow border (stroke-width: 4px)
- Color: Light yellow fill (#FFF9E6)
- Size: 220 × 140 px
- Position: Upper-middle (x: 500, y: 200)
- Label: "G" (bold, 32pt, dark orange)
- Full label: "Generator G: X → Ŷ" (below, 16pt)

**Internal Structure (inset)**
- Show 3-layer representation:
  - Input layer: 4 small circles (representing input features)
  - Hidden layer: 6 circles (convolutional blocks)
  - Output layer: 4 circles (output features)
- Small trapezoid at bottom: "Conv + InstanceNorm + ReLU" annotation

#### 2.2 Generator F (Y → X̂)

**Generator F Box**
- Shape: Rounded rectangle with solid yellow border (stroke-width: 4px)
- Color: Light yellow fill (#FFF9E6)
- Size: 220 × 140 px
- Position: Lower-middle (x: 500, y: 420)
- Label: "F" (bold, 32pt, dark orange)
- Full label: "Generator F: Y → X̂" (below, 16pt)

**Internal Structure (inset)**
- Same 3-layer structure as G

#### 2.3 Cycle Consistency Arrows (Bidirectional)

**Forward Cycle Arrow**
- Curved arrow from G output → F input
- Path: G(Ŷ) → F → X̂
- Style: Dashed orange arrow
- Label: "Cycle: X → G(X) → F(G(X)) ≈ X" (14pt, on curved path)
- LaTeX annotation near arrow: "$\mathcal{L}_{cyc}$" (18pt, bold)

**Backward Cycle Arrow**
- Curved arrow from F output → G input
- Path: F(X̂) → G → Ŷ
- Style: Dashed orange arrow
- Label: "Cycle: Y → F(Y) → G(F(Y)) ≈ Y" (14pt, on curved path)

#### 2.4 Discriminator D (Dual D)

**Discriminator D for Y (D_Y)**
- Shape: Ellipse with solid green border (stroke-width: 3px)
- Color: Light green fill (#E6F7E6)
- Size: 180 × 100 px
- Position: Upper-right of middle zone (x: 850, y: 180)
- Label: "D_Y" (bold, 24pt, dark green)
- Full label: "Discriminator Y" (14pt, below)
- Function: Distinguishes Y (real) from Ŷ (fake)

**Discriminator D for X (D_X)**
- Shape: Ellipse with solid green border (stroke-width: 3px)
- Color: Light green fill (#E6F7E6)
- Size: 180 × 100 px
- Position: Lower-right of middle zone (x: 850, y: 420)
- Label: "D_X" (bold, 24pt, dark green)
- Full label: "Discriminator X" (14pt, below)
- Function: Distinguishes X (real) from X̂ (fake)

**Adversarial Loss Arrows**
- Arrow: Y → D_Y (solid green, labeled "Real Y")
- Arrow: Ŷ → D_Y (dashed green, labeled "Fake Ŷ")
- Arrow: X → D_X (solid green, labeled "Real X")
- Arrow: X̂ → D_X (dashed green, labeled "Fake X̂")
- LaTeX annotation: "$\mathcal{L}_{adv}$" (18pt, bold, near D boxes)

---

### 3. AUXILIARY MODULES (Overlaid on Core)

#### 3.1 CAC (Conditional Auxiliary Classifier)

**CAC Box G**
- Shape: Rounded rectangle (orange border, 2px)
- Color: Light orange fill (#FFF0E6)
- Size: 160 × 60 px
- Position: Overlaid on G output (x: 530, y: 350)
- Label: "CAC" (bold, 20pt, orange)
- Sub-label: "Class-conditional" (12pt, italic)
- Connection: Line from G output to CAC input

**CAC Box F**
- Shape: Rounded rectangle (orange border, 2px)
- Color: Light orange fill (#FFF0E6)
- Size: 160 × 60 px
- Position: Overlaid on F output (x: 530, y: 570)
- Label: "CAC" (bold, 20pt, orange)
- Sub-label: "Class-conditional" (12pt, italic)
- Connection: Line from F output to CAC input

**Classification Loss Arrow**
- Arrow from CAC → outside (right side)
- Label: "Classification Loss" (14pt)
- LaTeX annotation: "$\mathcal{L}_{cls}$" (18pt, bold)

#### 3.2 WGP (Wasserstein Gradient Penalty)

**WGP Box**
- Shape: Rounded rectangle (purple border, 2px)
- Color: Light purple fill (#F0E6FF)
- Size: 200 × 80 px
- Position: Below D boxes, centered (x: 800, y: 550)
- Label: "WGP Module" (bold, 18pt, purple)
- Sub-label: "Wasserstein + Gradient Penalty" (12pt)
- Annotation: "∥∇D∥₂ ≈ 1" (16pt, bold, inside box)

**WGP Connections**
- Curved arrow from D_Y → WGP (shows training flow)
- Curved arrow from D_X → WGP (shows training flow)
- Annotation: "$W(P_r, P_g)$" (18pt, below WGP box)

---

### 4. RIGHT ZONE — EVALUATION (SAE + Classification)

#### 4.1 SAE (Stacked Autoencoder)

**SAE Structure Diagram**
- Position: Right zone, upper section (x: 1150, y: 150)
- Overall size: 350 × 250 px

**Input Node**
- Shape: Cylinder (vertical)
- Color: Light blue (#D4E9F7)
- Label: "Input Features" (14pt)

**Encoder Layers**
- Shape: Trapezoid (narrowing downward)
- 3 intermediate layers shown as smaller trapezoids
- Labels: "Encoder 1", "Encoder 2", "Encoder 3" (12pt each)
- Arrow pointing down between layers

**Latent Space**
- Shape: Diamond/rhombus
- Color: Light purple (#E6D4F7)
- Size: 80 × 60 px
- Label: "Latent Space z" (bold, 14pt)
- Sub-label: "bottleneck" (italic, 10pt)

**Decoder Layers**
- Shape: Trapezoid (widening downward)
- 3 intermediate layers as smaller trapezoids
- Labels: "Decoder 1", "Decoder 2", "Decoder 3" (12pt each)

**Output Node**
- Shape: Cylinder (vertical)
- Color: Light green (#D4F7E6)
- Label: "Reconstructed Output" (14pt)

**Reconstruction Error Arrow**
- Arrow from SAE output → Quality Score box
- Label: "Reconstruction Error" (14pt)
- LaTeX annotation: "$||x - \hat{x}||_2^2$" (16pt)

**Quality Score Box**
- Shape: Rounded rectangle
- Color: Gold/yellow fill (#FFF9E6)
- Size: 150 × 50 px
- Position: Below SAE (x: 1250, y: 420)
- Label: "Quality Score" (bold, 16pt)

---

### 5. OUTPUT — CLASSIFICATION (Diagnostic Results)

**Fake Fault Samples (Ŷ) Output**
- Position: Right zone, lower section (x: 1150, y: 520)
- Shape: Rectangle with dashed border
- Color: Light yellow (#FFFDE6)
- Size: 180 × 80 px
- Label: "Fake Fault Samples Ŷ" (bold, 14pt)

**Classifier Ensemble**
- Four small boxes arranged horizontally below Ŷ:
  1. **SVM Box**: Rectangle, blue (#D4E9F7), label "SVM"
  2. **RF Box**: Rectangle, green (#D4F7E6), label "Random Forest"
  3. **MLP Box**: Rectangle, purple (#E6D4F7), label "MLP"
  4. **CNN Box**: Rectangle, orange (#F7E6D4), label "CNN"

**Decision Boundary Visualization**
- Small inset diagram in each classifier box
- Shows decision boundary with dots (two colors for two classes)
- Annotation: "Decision Boundary" (10pt, italic)

**Final Output Arrow**
- Arrow from all classifiers → "Diagnostic Result" box
- Label: "Voting / Ensemble" (14pt)
- Final box: "Fault Diagnosis" (bold, 18pt, dark red border)

---

## Color Palette Summary

| Element | Color Name | Hex Code |
|---------|------------|----------|
| Normal Domain | Blue | #2E86AB |
| Fault Domain | Red | #E94F37 |
| Generators | Yellow/Orange | #F39C12 |
| Discriminators | Green | #27AE60 |
| CAC Module | Orange | #E67E22 |
| WGP Module | Purple | #8E44AD |
| SAE Latent | Purple | #9B59B6 |
| Quality Score | Gold | #F1C40F |
| Background Light | Various | #E8F4FC, #E8FCE8, #FCE8E8 |

---

## LaTeX Formulas to Display

Place these formulas in appropriate positions:

1. **Cycle Consistency Loss** (near cycle arrows):
   $$\mathcal{L}_{cyc} = \mathbb{E}[|F(G(x)) - x|_1] + \mathbb{E}[|G(F(y)) - y|_1]$$

2. **Adversarial Loss** (near D boxes):
   $$\mathcal{L}_{adv} = \mathbb{E}_{y}[\log D_Y(y)] + \mathbb{E}_{x}[\log(1 - D_Y(G(x)))]$$

3. **Classification Loss** (near CAC):
   $$\mathcal{L}_{cls} = -\mathbb{E}_{x,y}[\log p(c|x,y)]$$

4. **Wasserstein Distance** (near WGP):
   $$W(P_r, P_g) = \inf_{\gamma \in \Pi(P_r, P_g)} \mathbb{E}_{(x,y)\sim\gamma}[|x - y|]$$

5. **Gradient Penalty** (inside WGP box):
   $$\lambda \mathbb{E}_{\hat{x}}[(||\nabla_{\hat{x}} D(\hat{x})||_2 - 1)^2]$$

---

## Arrow Legend

| Arrow Type | Meaning | Style |
|------------|---------|-------|
| → | Data flow | Solid, 2px |
| ⇾ | Real vs Fake | Dashed, 2px |
| ⟲ | Cycle consistency | Curved, dashed |
| ⇆ | Bidirectional | Double arrow |

---

## Final Check Requirements

- [ ] All three zones clearly visible with distinct backgrounds
- [ ] All shapes use specified border styles (solid/dashed)
- [ ] All LaTeX formulas properly rendered
- [ ] All arrows clearly labeled with direction indicators
- [ ] Generators G and F have visible internal structure
- [ ] CAC and WGP modules overlaid on generators/discriminators
- [ ] SAE shows complete encoder-decoder structure
- [ ] Classification ensemble shows 4 classifiers
- [ ] Resolution: 1800 × 1200 px, 300 DPI
- [ ] Fonts: ≥ 12pt for labels, ≥ 16pt for main titles

---

## Prompt for Image Generation

Generate the above architecture diagram using the detailed description. Ensure academic publication quality with clean lines, clear labels, and professional color scheme. The diagram should be understandable at a glance while showing all technical details for readers familiar with CycleGAN architectures.

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS