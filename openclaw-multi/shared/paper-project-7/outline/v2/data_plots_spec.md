# Data Plots Spec v2: CAC-CycleGAN-WGP Charts

| Plot Id | Figure No. | Type | Data Description | Style & Labeling |
|---|---|---|---|---|
| **DP-1** | Fig 4 | Line Plot | Loss curves showing convergence and quality metrics (PCC/CS) over 10k iterations. | Solid/Dashed lines with dual Y-axis. |
| **DP-2** | Fig 6 | Heatmap & Line | Multiclass Accuracy vs BR; Confusion matrices for Case I (1:100 vs 1:1). | Color-scaled heatmaps for confusion matrices. |
| **DP-3** | Fig 7 | Heatmap & Line | Multiclass Accuracy vs BR; Confusion matrices for Case II (1:100 vs 1:1). | Consistent color styling with Fig 6. |
| **DP-4** | Fig 9 | Multi-line Plot | Comparison plot for Accuracy across all baselines (Proposed, SMOTE, ADASYN, GAN). | Marker-based lines; Proposed method highlighted in Red. |
| **DP-5** | Fig 10 | Bar Chart | Ablation metrics showing Accuracy for 4-5 variants (w/o CAC, w/o Cycle, etc.). | Grouped bar chart with error bars. |
