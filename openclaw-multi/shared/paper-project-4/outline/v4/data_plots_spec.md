# Data Plots Specification (v4)

## Fig.4: t-SNE Visualization (Experiments 4.4)
- **Type**: 2D scatter plot
- **Purpose**: Show feature distribution of seen vs unseen vs generated classes
- **X-axis**: t-SNE dimension 1
- **Y-axis**: t-SNE dimension 2
- **Elements**:
  - Seen classes: Filled circles, each class a different color (blue, green, orange, etc.)
  - Unseen classes (real): Filled triangles (red shades)
  - Generated features (ours): Hollow circles matching unseen class colors
- **Subplots**: 2 panels — (a) without CESM-Diff, (b) with CESM-Diff
- **Legend**: Bottom, horizontal layout
- **Dataset**: CWRU Bearing

## Fig.5: Interpolation Coefficient Sensitivity (Experiments 4.4)
- **Type**: Line plot
- **Purpose**: Show effect of interpolation coefficient α on unseen class accuracy
- **X-axis**: Interpolation coefficient α (0.0 to 1.0, step 0.1)
- **Y-axis**: Classification accuracy (%)
- **Lines**: 
  - Solid line: Unseen accuracy
  - Dashed line: Seen accuracy
  - Dotted line: H-Mean
- **Markers**: Circle, square, triangle respectively
- **Dataset**: CWRU Bearing

## Fig.6: Training Convergence (Experiments 4.4)
- **Type**: Line plot (dual y-axis)
- **Purpose**: Show loss convergence during training
- **X-axis**: Epoch (0 to max)
- **Y-axis (left)**: Loss value (L_total, L_diffusion, L_AC)
- **Y-axis (right)**: Validation accuracy (%)
- **Lines**: Different colors for each loss component + accuracy
- **Dataset**: CWRU Bearing

## Supplementary Plots (use if space permits, not numbered in main paper)

### S1: MMD Distribution Comparison
- **Type**: Bar chart
- **Purpose**: Compare distribution alignment (MMD score) between methods
- **X-axis**: Methods (DAP, ESZSL, f-CLSWGAN, DP-CDDPM-AC, Ours)
- **Y-axis**: MMD score (lower is better)
- **Color**: Gray bars, ours in blue

### S2: Ablation Grouped Bar Chart
- **Type**: Grouped bar chart
- **Purpose**: Visual companion to Table 3
- **X-axis**: Model configurations (Full, w/o CLIP, w/o Dual-Path, w/o CPA, w/o SMI, w/o ACL)
- **Y-axis**: Accuracy (%)
- **Groups**: 3 bars per config (Seen Acc, Unseen Acc, H-Mean)
- **Colors**: Blue, orange, green
