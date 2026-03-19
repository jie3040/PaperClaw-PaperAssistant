# Table Specifications

### Table I - Dataset Details and ZSL Task Splitting
- **编号**: Table I
- **标题**: Description of Zero-Shot Diagnostic Tasks on CWRU and XJTU-SY Datasets
- **列定义**:
  - Task ID (String, center)
  - Dataset (String, center)
  - Seen Fault Classes (String, left)
  - Unseen Fault Classes (String, left)
  - Training Samples (Integer, right)
  - Testing Samples (Integer, right)
- **格式要求**: IEEE style, `booktabs` package (`\toprule`, `\midrule`, `\bottomrule`), no vertical lines. 

### Table II - Comparison of Zero-Shot Fault Diagnosis Performance
- **编号**: Table II
- **标题**: ZSL Classification Accuracy Comparison with State-of-the-Art Methods
- **列定义**:
  - Methods (String, left)
  - Task A (CWRU): Seen Acc (S), Unseen Acc (U), Harmonic Mean (H) (Floats with %, right)
  - Task B (XJTU-SY): Seen Acc (S), Unseen Acc (U), Harmonic Mean (H) (Floats with %, right)
- **格式要求**: Multi-column headers for Tasks. Best results in **bold**. Include classical ZSL (e.g., CADA-VAE) and latest ZSL fault diagnosis methods.

### Table III - Ablation Study on Model Components
- **编号**: Table III
- **标题**: Ablation Study of PC-Diffusion and Bayesian Embedding
- **列定义**:
  - Model Variant (String, left)
  - Physics Loss Constraint ($\checkmark$ or $\times$, center)
  - Dual-level Semantics ($\checkmark$ or $\times$, center)
  - Bayesian Uncertainty ($\checkmark$ or $\times$, center)
  - Harmonic Mean (H) on Task A (Float %, right)
  - Harmonic Mean (H) on Task B (Float %, right)
- **格式要求**: Standard IEEE `booktabs`. Use checkmarks for active components. Bottom row is the full proposed model with bold results.