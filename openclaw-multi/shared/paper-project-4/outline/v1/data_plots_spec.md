# Data Plots Specification

## Plot 1: t-SNE Visualization
- **Type**: 2D scatter plot
- **Purpose**: Show feature distribution of seen vs unseen classes
- **X-axis**: t-SNE dimension 1
- **Y-axis**: t-SNE dimension 2
- **Colors**: 
  - Seen classes: Blue shades
  - Unseen classes: Red/orange markers
  - Generated features: Hollow markers

## Plot 2: Semantic Interpolation vs Accuracy
- **Type**: Line plot
- **Purpose**: Show effect of interpolation coefficient on accuracy
- **X-axis**: Interpolation coefficient (0.0 to 1.0)
- **Y-axis**: Classification accuracy (%)
- **Lines**: Different line styles for different unseen classes

## Plot 3: MMD Distribution Comparison
- **Type**: Bar chart / box plot
- **Purpose**: Compare distribution alignment between methods
- **X-axis**: Different methods (Ours, DP-CDDPM-AC, CycleGAN-SD, etc.)
- **Y-axis**: MMD score (lower is better)

## Plot 4: Ablation Study Results
- **Type**: Grouped bar chart
- **Purpose**: Show contribution of each component
- **X-axis**: Model configurations
- **Y-axis**: Accuracy (%)
- **Grouping**: Seen Acc, Unseen Acc, H-Mean

## Plot 5: Training Convergence
- **Type**: Line plot
- **Purpose**: Show loss convergence during training
- **X-axis**: Epoch / Iteration
- **Y-axis**: Loss value
- **Lines**: Different colors for different loss components
