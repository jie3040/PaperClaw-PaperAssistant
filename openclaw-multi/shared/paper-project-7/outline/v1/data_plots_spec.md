# Data Plots Spec: CAC-CycleGAN-WGP Charts

| Plot Id | Figure No. | Type | Data Description | Style & Labeling |
|---|---|---|---|---|
| **DP-1** | Fig 8 | Line Plot | Discriminator and Generator loss (Y-axis: Loss; X-axis: Iterations). Show two subplots: (a) Discriminator, (b) Generator. Substantial drop in first 1k iterations, then convergence near 4k. | Solid line for D_loss, dashed line for G_loss. Grid lines enabled. |
| **DP-2** | Fig 10 | Multi-line Plot | Diagnostic Accuracy vs. Balance Ratio (BR). X-axis: BR (1:100, 1:50, 1:25, 1:20, 1:10, 1:5, 1:2, 1:1). Y-axis: Accuracy (%). Plots for SVM, Boosting, MLP, CNN. | Markers for each BR step. Color-coded lines for different classifiers (e.g., CNN: Red, SVM: Blue). Legend: top-left. |
| **DP-3** | Fig 11 | Confusion Matrix (Heatmap) | 10x10 matrix (0-9) for Bearing case. Subplots (a)-(d) for BR 1:100, 1:20, 1:5, 1:1. Each cell shows count. Diagonal: correct classifications. Off-diagonal: misclassifications. | Color gradient: light to dark (higher count = darker). Annotated with number counts. |
| **DP-4** | Fig 12 | Line Plot | Accuracy curves for Single-class scenarios in Case I (Class 1, 4, 7 as minority). X-axis: BR. Y-axis: Accuracy. Subplots (a), (b), (c) for each class. | Different line styles for different classifiers within each subplot. |
| **DP-5** | Fig 17 | Multi-line Plot | Diagnostic Accuracy vs. BR for Case II: Gearbox. Similar setup to DP-2. Includes RF classifier. | 5 lines for classifiers. X-axis: Gearbox BR logic (1:100, 1:50, 1:40, 1:20, 1:10, 1:5, 1:4, 1:2, 1:1). |
| **DP-6** | Fig 19 | Line Plot | Single-class Diagnosis Accuracy for Case II (Class 3, 4, 5, 6 as minority). 4 subplots showing accuracy trends from BR 1:100 to 1:1. | Professional academic chart style with markers and specific colors. |
| **DP-7** | Fig 21 | Comparison Line Plot | ACWGAN-GP vs. RO/SMOTE/ADASYN/GAN (Bearing). (a) SVM, (b) CNN. X-axis: BR. Y-axis: Accuracy (%). | Highlight ACWGAN-GP line with markers for emphasis. Other methods in muted colors. |
| **DP-8** | Fig 22 | Comparison Line Plot | ACWGAN-GP vs. others (Gearbox case). Similar logic to DP-7. (a) SVM, (b) CNN. | Distinct markers for each method. Legend clearly indicating the proposed method. |
