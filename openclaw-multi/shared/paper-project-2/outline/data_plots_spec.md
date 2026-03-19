# Data Plots Specifications

### Fig. 4 - Validation of Physical Consistency (Generated Signals)
- **编号**: Fig. 4
- **标题**: Comparison of physical consistency between standard Diffusion and PC-Diffusion generated signals.
- **图表类型**: Multiple Subplots (2x2 grid) of Line Plots.
- **数据说明**: 
  - Top Left: Time-domain waveform of standard Diffusion (showing non-periodic noise anomalies).
  - Top Right: Time-domain waveform of PC-Diffusion (showing clear fault impact periodicity).
  - Bottom Left: Frequency envelope spectrum of standard.
  - Bottom Right: Frequency envelope spectrum of PC-Diffusion.
- **尺寸**: figsize=(12, 8)
- **样式要求**: 
  - X-axis: Time (s) or Frequency (Hz).
  - Y-axis: Amplitude (g).
  - Colors: Standard Diffusion in Red, PC-Diffusion in Blue. 
  - Thin lines for high-frequency vibration signals. Grid enabled.

### Fig. 5 - t-SNE Visualization of Feature Space
- **编号**: Fig. 5
- **标题**: t-SNE visualization of real and generated features in the joint semantic space.
- **图表类型**: Scatter Plot.
- **数据说明**: X and Y are t-SNE reduced 2D dimensions. Points represent samples.
- **尺寸**: figsize=(8, 6)
- **样式要求**: 
  - Real seen classes (Solid circles, different colors).
  - Real unseen classes (Stars or Triangles, different colors).
  - Generated unseen classes by PC-Diffusion (Hollow circles, matching colors of real unseen).
  - Include a clear legend outside the plot box. 

### Fig. 6 - Uncertainty Quantification (Confidence Calibration)
- **编号**: Fig. 6
- **标题**: Predictive uncertainty distribution for seen vs. unseen classes.
- **图表类型**: Ridge Plot or Overlapping KDE (Kernel Density Estimation) Density Plots.
- **数据说明**: X-axis is Predictive Entropy (Uncertainty limit). Y-axis is Density.
- **尺寸**: figsize=(8, 5)
- **样式要求**: 
  - Distribution for "Seen Classes" clustered at low entropy (Left, Green shade).
  - Distribution for "Unseen Classes" clustered at higher entropy (Right, Orange shade).
  - Add a vertical dashed line indicating the empirical threshold for out-of-distribution detection.

### Fig. 7 - Confusion Matrices for Unseen Classes
- **编号**: Fig. 7
- **标题**: Confusion matrices of zero-shot diagnosis on CWRU and XJTU-SY test sets.
- **图表类型**: Heatmaps (1x2 subplots).
- **数据说明**: X-axis True Label, Y-axis Predicted Label. Values are percentage accuracies (%).
- **尺寸**: figsize=(12, 5)
- **样式要求**: 
  - Use `Blues` colormap. Include colorbar. Annotate cells with accurate percentage numbers.