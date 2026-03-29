# Data Plots Spec: CMSA-Trans (Project 8)

| Plot ID | Title | Type | Data Description | Style and Quality |
|:---|:---|:---|:---|:---|
| **Fig. 4** | Confusion Matrix: CWRU Dataset | Heatmap | Normalized accuracy (0-1) for unseen categories. X-axis: Predicted (Unseen), Y-axis: True (Unseen). | High contrast, using `magma` or `viridis` color map. Labels: 12pt sans-serif. |
| **Fig. 5** | Confusion Matrix: SEU Dataset | Heatmap | Similar to Fig. 4 for SEU gearbox faults. | Matching style with Fig. 4. |
| **Fig. 6** | Accuracy vs. SNR (Signal-To-Noise Ratio) | Line Chart | X-axis: SNR in dB (-4, -2, 0, 2, 4, 6, 8, 10). Y-axis: Zero-Shot Accuracy (%). Lines: **CMSA-Trans (Bold Red with Squares)**, WDCNN (Dashed Gray), etc. | Error bars for 5-fold cross-validation. Professional academic linewidth (1.5-2pt). |
| **Fig. 8** | Training Convergence Curves | Line Chart | Dual Y-axis: Left (Loss), Right (Accuracy). X-axis: Epoch (0-100). | Solid lines for Training, Dashed for Validation. Legend in top-right corner. |
| **Fig. 9** | Parameter Sensitivity: Embedding Dimension | Bar Chart | X-axis: Dimension Size (e.g., 64, 128, 256, 512, 1024). Y-axis: Unseen Task Accuracy (%). | Grouped bars by dataset (CWRU vs. SEU). Colors matching industrial blue/green scheme. |
| **Fig. 10** | Accuracy Comparison (Boxplots) | Boxplot | Statistical distribution of accuracy over 50 random seen/unseen category splits. | Median line and outliers indicated. |
