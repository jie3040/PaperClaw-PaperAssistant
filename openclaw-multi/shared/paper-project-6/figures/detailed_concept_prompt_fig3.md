# Fig 3: SAE Network Structure — Detailed Concept Prompt

## Target Visualization
SAE (Stacked Autoencoder) Network Architecture Diagram in AIAI scientific illustration style

---

## Canvas Specifications
- **Dimensions**: 1500 × 900 px
- **Resolution**: 300 DPI
- **Background**: Pure white (#FFFFFF)
- **Format**: PNG with transparency

---

## Layout Structure

### Vertical Flow (Top to Bottom)
```
[Input Layer]
     ↓ (arrow, 128 dims)
[Encoder Layer 1] → [Encoder Layer 2] → [Bottleneck Layer]
     ↓ (arrow)         ↓ (arrow)           ↓ (arrow)
[Decoder Layer 3] → [Decoder Layer 4] → [Output Layer]
     ↓
[Loss Function Display]
     ↓
[Quality Assessment Badge]
```

### Horizontal Arrangement
- Left third: Input layer (128 nodes, trapezoid shape)
- Center: Encoder (blue→green→yellow) + Bottleneck + Decoder (green→blue)
- Right third: Output layer (128 nodes, trapezoid shape)
- Bottom center: Loss function formula
- Bottom right: Quality assessment label with checkmark

---

## Layer-by-Layer Specifications

### 1. Input Layer (左侧 / Left Side)
- **Shape**: Trapezoid with parallel sides horizontal
- **Nodes**: 128-dimensional feature representation
- **Label**: "Input: Real/Fake Features" (bold, 14pt)
- **Dimension Tag**: "128" below the layer
- **Color Theme**: Light gray gradient (#E8E8E8 to #D0D0D0)
- **Position**: Left side, vertically centered

### 2. Encoder Block (编码器)

#### Encoder Layer 1 (第一隐藏层)
- **Shape**: Ellipse (blue)
- **Node Count**: 64 nodes (represented as 6×6 grid of small circles inside)
- **Label**: "Encoder 1" (12pt)
- **Annotation**: "BatchNorm" badge attached
- **Color**: Blue (#4A90D9)
- **Dimension Arrow**: 128 → 64 (above arrow)
- **Position**: Below input layer, left-center

#### Encoder Layer 2 (第二隐藏层)
- **Shape**: Ellipse (green)
- **Node Count**: 32 nodes (5×5 grid representation)
- **Label**: "Encoder 2" (12pt)
- **Annotation**: "Dropout = 0.2" badge
- **Color**: Green (#5CB85C)
- **Dimension Arrow**: 64 → 32 (above arrow)
- **Position**: Below Encoder 1

#### Bottleneck Layer (瓶颈层)
- **Shape**: Ellipse (yellow/gold)
- **Node Count**: 16 nodes (4×4 grid representation)
- **Label**: "Bottleneck" (12pt, bold)
- **Annotations**:
  - "Sparse Constraint (ρ = 0.05)" badge
  - KL Divergence formula: $D_{KL} = \rho\log(\frac{\rho}{\hat{\rho}}) + (1-\rho)\log(\frac{1-\rho}{1-\hat{\rho}})$
- **Color**: Gold/Yellow (#F5C242)
- **Dimension Arrow**: 32 → 16 (above arrow)
- **Position**: Bottom of encoder section

### 3. Decoder Block (解码器) — Symmetric to Encoder

#### Decoder Layer 3 (第三隐藏层)
- **Shape**: Ellipse (green)
- **Node Count**: 32 nodes
- **Label**: "Decoder 1" (12pt)
- **Color**: Green (#5CB85C)
- **Dimension Arrow**: 16 → 32 (above arrow)
- **Position**: Below bottleneck, right-center

#### Decoder Layer 4 (第四隐藏层)
- **Shape**: Ellipse (blue)
- **Node Count**: 64 nodes
- **Label**: "Decoder 2" (12pt)
- **Color**: Blue (#4A90D9)
- **Dimension Arrow**: 32 → 64 (above arrow)
- **Position**: Below Decoder 1

### 4. Output Layer (右侧 / Right Side)
- **Shape**: Trapezoid (mirrored to input)
- **Nodes**: 128-dimensional reconstructed features
- **Label**: "Reconstructed Features" (bold, 14pt)
- **Dimension Tag**: "128" below the layer
- **Color Theme**: Light gray gradient (#E8E8E8 to #D0D0D0)
- **Position**: Right side, vertically aligned with input

---

## Connection Arrows

### Specifications
- **Style**: Solid straight arrows with arrowheads
- **Thickness**: 2-3px
- **Color**: Dark gray (#555555)
- **Arrowheads**: Filled triangles, proportional to line thickness
- **Dimension Labels**: Positioned above each arrow showing dimension transformation (e.g., "128 → 64")

### Arrow Path
1. Input → Encoder 1: "128 → 64"
2. Encoder 1 → Encoder 2: "64 → 32"
3. Encoder 2 → Bottleneck: "32 → 16"
4. Bottleneck → Decoder 1: "16 → 32"
5. Decoder 1 → Decoder 2: "32 → 64"
6. Decoder 2 → Output: "64 → 128"

---

## Loss Function Display

### Position
- Centered below the bottleneck layer
- White background box with subtle border

### Formula Display
$$\mathcal{L}_{SAE} = \|x - \hat{x}\|_2^2 + \beta \cdot D_{KL}$$

Where:
- β = 0.1 (reconstruction-sparsity trade-off parameter)
- $\|x - \hat{x}\|_2^2$: Mean squared reconstruction error
- $D_{KL}$: KL divergence for sparse representation

### Visual Style
- **Background**: Light yellow box (#FFFEF0) with 1px border (#E0E0E0)
- **Formula**: Bold, 16pt, dark gray (#333333)
- **Parameter Annotations**: 10pt, italic, blue (#4A90D9)
- **Box Dimensions**: ~400 × 80 px

---

## Quality Assessment Badge

### Position
- Bottom right corner (aligned with output layer)

### Content
- **Icon**: Green checkmark (✓) in circle
- **Text**: "Reconstruction Error < threshold → High Quality Synthetic"
- **Colors**:
  - Checkmark circle: Green (#28A745)
  - Checkmark icon: White (#FFFFFF)
  - Text: Dark gray (#333333)

### Visual Style
- **Badge Shape**: Rounded rectangle
- **Background**: Light green (#E7F5E7)
- **Border**: 1px solid green (#28A745)
- **Icon Size**: 24 × 24 px
- **Font**: 11pt, medium weight

---

## Color Palette Summary

| Element | Color Code | Usage |
|---------|------------|-------|
| Blue | #4A90D9 | Encoder Layer 1, Decoder Layer 4 |
| Green | #5CB85C | Encoder Layer 2, Decoder Layer 1 |
| Yellow/Gold | #F5C242 | Bottleneck Layer |
| Light Gray | #E8E8E8 | Input/Output layers |
| Dark Gray | #555555 | Arrows, text |
| White | #FFFFFF | Background |
| Light Yellow | #FFFEF0 | Loss function box |
| Light Green | #E7F5E7 | Quality badge |
| Green Success | #28A745 | Checkmark |

---

## Symmetry Requirements

### Visual Balance
- Input layer (left) mirrors Output layer (right)
- Encoder layers (left-center) mirror Decoder layers (right-center)
- Blue→Green→Yellow gradient flows downward
- Yellow→Green→Blue gradient flows upward (decoder)
- Total composition should be horizontally balanced around center vertical axis

### Color Symmetry
```
Top:    [Gray Input] → [Blue] → [Green] → [Yellow Bottleneck] → [Green] → [Blue] → [Gray Output]
        128          64        32        16                   32        64        128
```

---

## Typography Specifications

| Element | Font | Size | Weight | Color |
|---------|------|------|--------|-------|
| Layer Labels | Arial/Helvetica | 12pt | Bold | #333333 |
| Dimension Tags | Arial/Helvetica | 10pt | Regular | #666666 |
| Input/Output Labels | Arial/Helvetica | 14pt | Bold | #333333 |
| Loss Formula | Computer Modern/LaTeX style | 16pt | Bold | #333333 |
| Annotations | Arial/Helvetica | 10pt | Regular | #4A90D9 |
| Quality Badge | Arial/Helvetica | 11pt | Medium | #333333 |

---

## Technical Notes for Image Generation

1. **Style**: AIAI scientific research illustration — clean, professional, academic
2. **No gradients on ellipses**: Use solid colors with subtle shadow for depth
3. **Grid representation**: Node counts shown as abstract grid patterns inside ellipses
4. **Mathematical expressions**: Rendered clearly with proper LaTeX-style typography
5. **White space**: Adequate padding around all elements (minimum 20px)
6. **Alignment**: Perfect vertical alignment of input/output, horizontal centering of encoder/decoder blocks

特殊要求：所有颜色用浅色系，字体用 Comic Sans MS