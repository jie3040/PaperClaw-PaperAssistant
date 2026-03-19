# Data Plots Specifications (Python Matplotlib)

### Fig. 4 - Zero-Shot Accuracy Bar Chart Comparison
- **编号**: Fig. 4
- **标题**: Harmonic Mean Accuracy Comparison across Datasets
- **图表类型**: Grouped Bar Chart
- **数据说明**: 
  - X-axis: Datasets (TPTS, TEP, Hydraulic)
  - Y-axis: Harmonic Mean Accuracy (H-score, % from 40% to 100%)
  - Grouped Bars: CycleGAN-SD, CVAE-GAN, Standard DDPM, Proposed CDDM (4 bars per dataset)
- **尺寸**: `figsize=(10, 6)`
- **样式要求**: 
  - Colors: Muted academic palette (e.g., `#E41A1C`, `#377EB8`, `#4DAF4A`, `#984EA3`).
  - Outline: Black edge on bars with `edgecolor='black', linewidth=1.2`.
  - Grid: `axis='y', linestyle='--', alpha=0.7`.
  - Legend: Upper left corner, `frameon=False`.
- **特殊要求**: Annotate the top of the CDDM bar with its exact value.

### Fig. 5 - t-SNE Feature Visualization
- **编号**: Fig. 5
- **标题**: t-SNE Visualization of Generated vs. Real Features
- **图表类型**: 2D Scatter Plot
- **数据说明**:
  - X/Y-axis: t-SNE dimension 1 and 2
  - Markers represent data points: Real Seen classes (circles), Real Unseen classes (triangles), Generated Unseen classes from CDDM (stars).
- **尺寸**: `figsize=(8, 8)`
- **样式要求**: 
  - Transparency: `alpha=0.6` to show overlapping density.
  - Ticks: Remove axis ticks (empty lists) to keep it clean.
- **特殊要求**: High contrast colors for easily distinguishing overlapping clusters (Real unseen vs. Generated unseen).

### Fig. 6 - Ablation Study on Cross-Modal Consistency Loss Weight ($\lambda$)
- **编号**: Fig. 6
- **标题**: Impact of Contrastive Consistency Loss Weight on Model Performance
- **图表类型**: Line Chart with Error Bars
- **数据说明**:
  - X-axis: $\lambda$ value (0.01, 0.1, 0.5, 1.0, 2.0, 5.0) on a log scale.
  - Y-axis: Unseen Class Accuracy (%)
- **尺寸**: `figsize=(8, 6)`
- **样式要求**: 
  - Line: Solid thick line (`linewidth=2.5`), marker `o` (`markersize=8`).
  - Color: `#1976D2`.
  - Fill: Shaded variance region `fill_between` using standard deviation.
- **特殊要求**: `plt.xscale('log')`, grid enabled, mark the optimal $\lambda$ point with a vertical dashed line down to the x-axis.