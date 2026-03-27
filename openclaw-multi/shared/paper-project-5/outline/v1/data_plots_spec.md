# Data Plots Specification: Diff-LM-GZSL

| ID | Title | Plot Type | Data Description | Style Requirements |
| :--- | :--- | :--- | :--- | :--- |
| **D-1** | Baseline Comparison (TEP) | Grouped Bar Chart | Performance (ZSL Acc, GZSL S, U, H) for Diff-LM-GZSL vs. 9 baselines (FDAT to DP-CDDPM-AC) on TEP dataset. | IEEE standard, marker-rich, including error bars for $\pm 1\sigma$ across multiple trials. |
| **D-2** | Baseline Comparison (Hydraulic) | Grouped Bar Chart | Performance (ZSL Acc, GZSL S, U, H) for Diff-LM-GZSL vs. 9 baselines on Hydraulic System dataset. | Consistent with D-1, but with different pattern fill for bars. |
| **D-3** | Baseline Comparison (CWRU) | Grouped Bar Chart | Performance (ZSL Acc, GZSL S, U, H) for Diff-LM-GZSL vs. 9 baselines on CWRU 2D spectrogram data. | Focus on image-like features across different SNR/noise levels. |
| **D-4** | t-SNE (Real vs. Synth) | 2D Scatter Plot | t-SNE mapping of: 1. Real seen features; 2. Real unseen features (ground truth); 3. Synthesized unseen features from Diff-LM-GZSL. | Different markers ($\bullet, \star, \times$) and colors for each category to show overlap/fidelity. |
| **D-5** | Confusion Matrix (Seen/Unseen) | Heatmap | 21x21 (TEP) and 10x10 (others) matrix showing normalized accuracy for seen and unseen classes in a GZSL setting. | High-quality colormap (Blues or Viridis), with percentages in each cell where visible. |
| **D-6** | Ablation Study Impacts | Stacked/Component Bar Chart | Comparing full model against variants (w/o BERT, w/o Diff, w/o Alignment) to show % contribution of each part. | Color-coded components, with clear change in "H-score" (Harmonic Mean). |
| **D-7** | LLM vs. Attributes (Ablation) | Line Chart | Comparison of accuracy as the number of descriptive sentences (semantic complexity) increases vs. static attributes. | Smooth lines with shaded standard deviation area. |
| **D-8** | Training Convergence | Dual-axis Line Chart | X-axis: Epochs; Y1: Diffusion Loss; Y2: Semantic Alignment Loss. Shows stable training across all 3 datasets. | Continuous lines, clear legend, log-scale if necessary for loss values. |
| **D-9** | Parameter Sensitivity ($T$ steps) | Line/Surface Plot | Accuracy vs. number of diffusion steps (T) from 1 to 1000. Shows the trade-off between fidelity and speed. | Grid-lines for 1-step, 10-step, 100-step landmarks. |
| **D-10** | Feature Fidelity (MSE/FID) | Parallel Coordinates Plot | Metrics comparing real unseen features vs. synthesized ones across different baselines (GAN, VAE, Diff). | Thin lines for each method, with emboldened line for Diff-LM-GZSL. |

**Target Total Data Plots:** 10
