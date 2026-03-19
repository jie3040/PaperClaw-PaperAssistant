# Figure Plan: CD-LDM Paper

**Paper:** Causal Disentangled Latent Diffusion Model for Cross-Equipment Few-Shot Fault Diagnosis  
**Target Journal:** IEEE TIM  
**Total Figures:** 16  
**Total Tables:** 5  
**Created:** March 10, 2026

---

## Figures

### Fig. 1: Cross-Equipment Fault Diagnosis Scenario
- **Section:** I.A (Introduction - Background)
- **Type:** Conceptual diagram
- **Description:** Illustrate the cross-equipment scenario with source equipment (abundant data) and target equipment (few-shot samples). Show different equipment types (bearings, gearboxes) with varying operating conditions.
- **Elements:**
  - Source equipment with labeled fault data
  - Target equipment with limited samples (K=1-5)
  - Visual representation of domain shift
  - Arrows showing knowledge transfer
- **Size:** 1 column
- **Priority:** High
- **Estimated Creation Time:** 2-3 hours

---

### Fig. 2: Problem Formulation Diagram
- **Section:** II.A (Preliminaries - Problem Formulation)
- **Type:** Schematic diagram
- **Description:** Visualize the mathematical problem setup with source and target domains, data distributions, and the few-shot learning objective.
- **Elements:**
  - Source domain D_s with distribution P_s(x,y)
  - Target domain D_t with distribution P_t(x,y)
  - Distribution shift illustration (e.g., overlapping Gaussian curves)
  - Few-shot support set and query set
- **Size:** 1 column
- **Priority:** Medium
- **Estimated Creation Time:** 2 hours

---

### Fig. 3: Causal Graph for Fault Diagnosis
- **Section:** II.C (Preliminaries - Causal Representation Learning)
- **Type:** Directed acyclic graph (DAG)
- **Description:** Show the causal relationships between fault type, equipment characteristics, and observed signals.
- **Elements:**
  - Nodes: Fault Type (F), Equipment Type (E), Operating Conditions (O), Observed Signal (X)
  - Edges: F→X, E→X, O→X (causal relationships)
  - Highlight F as causal factor, E and O as confounders
- **Size:** 0.5 column
- **Priority:** High
- **Estimated Creation Time:** 1-2 hours

---

### Fig. 4: Overall Architecture of CD-LDM
- **Section:** III.A (Proposed Method - Overall Architecture)
- **Type:** System architecture diagram
- **Description:** Comprehensive overview of the entire CD-LDM pipeline from input signal to generated samples.
- **Elements:**
  - Input: raw vibration signal
  - Causal disentanglement encoder: E(x) → [z_c, z_s]
  - Latent diffusion module: operates on z_c
  - Decoder: D(z_c, z_s) → reconstructed signal
  - Meta-learning wrapper (MAML)
  - Color-coded modules (encoder=blue, diffusion=green, decoder=orange)
- **Size:** 2 columns (full width)
- **Priority:** Critical
- **Estimated Creation Time:** 4-5 hours

---

### Fig. 5: Causal Disentanglement Module Architecture
- **Section:** III.B (Proposed Method - Causal Disentanglement)
- **Type:** Detailed network architecture
- **Description:** Detailed view of the encoder that separates causal and spurious factors.
- **Elements:**
  - 1D CNN layers with kernel sizes and channels
  - Attention mechanism
  - Branching into z_c and z_s pathways
  - Regularization losses (L_indep, L_TC)
- **Size:** 1.5 columns
- **Priority:** High
- **Estimated Creation Time:** 3-4 hours

---

### Fig. 6: Latent Space Visualization
- **Section:** III.B (Proposed Method - Causal Disentanglement)
- **Type:** t-SNE scatter plots (2 subplots)
- **Description:** Visualize the learned disentangled latent space.
- **Elements:**
  - Subplot (a): z_c colored by fault type (shows clustering by fault)
  - Subplot (b): z_s colored by equipment type (shows clustering by equipment)
  - Legend with fault classes and equipment types
- **Size:** 1 column
- **Priority:** High
- **Estimated Creation Time:** 2 hours (requires experimental data)

---

### Fig. 7: Latent Diffusion Process Illustration
- **Section:** III.C (Proposed Method - Latent Space Diffusion)
- **Type:** Process diagram
- **Description:** Illustrate the forward and reverse diffusion processes in latent space.
- **Elements:**
  - Forward process: z_c^0 → z_c^1 → ... → z_c^T (adding noise)
  - Reverse process: z_c^T → z_c^{T-1} → ... → z_c^0 (denoising)
  - U-Net denoising network
  - Time step t and class label y as conditioning
- **Size:** 2 columns (full width)
- **Priority:** High
- **Estimated Creation Time:** 3-4 hours

---

### Fig. 8: Cross-Equipment Transfer Workflow
- **Section:** III.D (Proposed Method - Cross-Equipment Transfer)
- **Type:** Workflow diagram
- **Description:** Show how the model transfers from source to target equipment.
- **Elements:**
  - Stage 1: Train on source equipment (freeze z_c generator)
  - Stage 2: Adapt z_s encoder to target equipment
  - Stage 3: Fine-tune decoder with few-shot target samples
  - Stage 4: Generate synthetic target samples
  - Arrows showing data flow
- **Size:** 2 columns (full width)
- **Priority:** High
- **Estimated Creation Time:** 3 hours

---

### Fig. 9: Meta-Learning Adaptation Procedure
- **Section:** III.E (Proposed Method - Few-Shot Adaptation)
- **Type:** Algorithm flowchart
- **Description:** Visualize the MAML inner and outer loop for few-shot adaptation.
- **Elements:**
  - Outer loop: iterate over equipment types (tasks)
  - Inner loop: adapt on K-shot support set
  - Gradient updates (inner: α, outer: β)
  - Support set and query set
- **Size:** 1 column
- **Priority:** Medium
- **Estimated Creation Time:** 2-3 hours

---

### Fig. 10: Sample Signals from Different Equipment
- **Section:** IV.A (Experiments - Datasets)
- **Type:** Multi-panel signal plots
- **Description:** Show example vibration signals from different equipment types in both time and frequency domains.
- **Elements:**
  - 4-6 subplots (CWRU, MFPT, PU, JNU, PHM, SEU)
  - Each subplot: time-domain waveform (top) + frequency spectrum (bottom)
  - Highlight differences in signal characteristics
- **Size:** 2 columns (full width)
- **Priority:** Medium
- **Estimated Creation Time:** 2-3 hours (requires data processing)

---

### Fig. 11: Accuracy Comparison Across K-Shot Settings
- **Section:** IV.B (Experiments - Comparison with Baselines)
- **Type:** Grouped bar chart
- **Description:** Compare classification accuracy of CD-LDM vs. baselines for different K values.
- **Elements:**
  - X-axis: K = {1, 3, 5, 10}
  - Y-axis: Accuracy (%)
  - Grouped bars for each method (8-9 methods)
  - Error bars (standard deviation over 5 runs)
  - Legend with method names
- **Size:** 1.5 columns
- **Priority:** Critical
- **Estimated Creation Time:** 2 hours (requires experimental results)

---

### Fig. 12: Confusion Matrices
- **Section:** IV.B (Experiments - Comparison with Baselines)
- **Type:** Heatmaps (2 subplots)
- **Description:** Compare confusion matrices for CD-LDM vs. best baseline.
- **Elements:**
  - Subplot (a): CD-LDM confusion matrix
  - Subplot (b): Best baseline confusion matrix
  - Color scale (white to dark blue)
  - Fault class labels on axes
- **Size:** 1 column
- **Priority:** Medium
- **Estimated Creation Time:** 1-2 hours (requires experimental results)

---

### Fig. 13: Ablation Study Results
- **Section:** IV.C (Experiments - Ablation Studies)
- **Type:** Bar chart with dual y-axes
- **Description:** Show the contribution of each component to performance and computational cost.
- **Elements:**
  - X-axis: Ablation variants (Full model, w/o causal, w/o latent, w/o meta, w/o disentangle)
  - Left Y-axis: Accuracy (%)
  - Right Y-axis: Training time (hours)
  - Bars for accuracy (blue) and training time (orange)
- **Size:** 1 column
- **Priority:** High
- **Estimated Creation Time:** 2 hours (requires experimental results)

---

### Fig. 14: t-SNE Visualization of Latent Space
- **Section:** IV.D (Experiments - Cross-Equipment Generalization)
- **Type:** t-SNE scatter plots (2 subplots)
- **Description:** Visualize how z_c and z_s capture different information across equipment.
- **Elements:**
  - Subplot (a): z_c colored by fault type (equipment-invariant)
  - Subplot (b): z_s colored by equipment type (fault-invariant)
  - Multiple equipment types in same plot
  - Legend with fault classes and equipment types
- **Size:** 1.5 columns
- **Priority:** High
- **Estimated Creation Time:** 2-3 hours (requires experimental data)

---

### Fig. 15: Generated vs. Real Samples Comparison
- **Section:** IV.D (Experiments - Cross-Equipment Generalization)
- **Type:** Time-frequency representations (spectrograms)
- **Description:** Qualitative comparison of generated and real fault signals.
- **Elements:**
  - 2×3 grid: 2 rows (real, generated) × 3 columns (3 fault types)
  - Spectrograms showing time-frequency content
  - Visual similarity assessment
- **Size:** 1.5 columns
- **Priority:** Medium
- **Estimated Creation Time:** 2-3 hours (requires experimental data)

---

### Fig. 16: Few-Shot Learning Curves
- **Section:** IV.E (Experiments - Few-Shot Performance Analysis)
- **Type:** Line plot
- **Description:** Show how accuracy improves with increasing number of target samples.
- **Elements:**
  - X-axis: Number of samples K (1 to 50, log scale)
  - Y-axis: Accuracy (%)
  - Multiple lines for different methods
  - Shaded regions for standard deviation
  - Highlight K=5 and K=10 (typical few-shot settings)
- **Size:** 1 column
- **Priority:** High
- **Estimated Creation Time:** 2 hours (requires experimental results)

---

## Tables

### Table I: Dataset Statistics
- **Section:** IV.A (Experiments - Datasets)
- **Columns:** Equipment Type | Dataset | Fault Classes | Training Samples | Test Samples | Sampling Rate (kHz)
- **Rows:** 6 datasets (CWRU, MFPT, PU, JNU, PHM, SEU)
- **Priority:** High
- **Estimated Creation Time:** 1 hour

---

### Table II: Cross-Equipment Classification Accuracy
- **Section:** IV.B (Experiments - Comparison with Baselines)
- **Columns:** Method | K=1 | K=3 | K=5 | K=10 | Average
- **Rows:** 8-9 methods (No Aug, Traditional Aug, ACGAN, WGAN-GP, VAE, Diffusion, DANN, MAML, CD-LDM)
- **Format:** Accuracy (%) with standard deviation
- **Highlight:** Best results in bold
- **Priority:** Critical
- **Estimated Creation Time:** 1 hour (requires experimental results)

---

### Table III: Ablation Study Results
- **Section:** IV.C (Experiments - Ablation Studies)
- **Columns:** Variant | Accuracy (%) | Training Time (h) | Inference Time (ms) | FLOPs (G)
- **Rows:** 5 variants (Full, w/o causal, w/o latent, w/o meta, w/o disentangle)
- **Priority:** High
- **Estimated Creation Time:** 1 hour (requires experimental results)

---

### Table IV: Cross-Domain Generalization Results
- **Section:** IV.D (Experiments - Cross-Equipment Generalization)
- **Columns:** Source → Target | CD-LDM | Best Baseline | Improvement (%)
- **Rows:** 4-6 transfer scenarios (e.g., CWRU→MFPT, Bearing→Gearbox)
- **Priority:** High
- **Estimated Creation Time:** 1 hour (requires experimental results)

---

### Table V: Computational Cost Comparison
- **Section:** IV.E (Experiments - Few-Shot Performance Analysis)
- **Columns:** Method | Training Time (h) | Inference Time (ms) | Memory (GB) | FLOPs (G)
- **Rows:** 5-6 main methods (ACGAN, WGAN-GP, VAE, Diffusion, CD-LDM)
- **Priority:** Medium
- **Estimated Creation Time:** 1 hour (requires experimental results)

---

## Figure Creation Workflow

### Phase 1: Conceptual Figures (Before Experiments)
**Timeline:** Week 1-2  
**Figures:** 1, 2, 3, 4, 5, 7, 8, 9  
**Tools:** PowerPoint, draw.io, TikZ (LaTeX), Adobe Illustrator  
**Assignee:** Architect + Illustrator

### Phase 2: Experimental Figures (After Experiments)
**Timeline:** Week 3-4  
**Figures:** 6, 10, 11, 12, 13, 14, 15, 16  
**Tools:** Python (matplotlib, seaborn), MATLAB  
**Assignee:** Experimenter + Illustrator  
**Dependencies:** Requires completed experiments and result data

### Phase 3: Tables (After Experiments)
**Timeline:** Week 3-4  
**Tables:** I, II, III, IV, V  
**Tools:** LaTeX (booktabs package), Excel  
**Assignee:** Experimenter  
**Dependencies:** Requires completed experiments and result data

---

## Quality Standards (IEEE TIM)

### Figure Requirements
- **Resolution:** Minimum 300 DPI for raster images
- **Format:** Vector (PDF, EPS) preferred; PNG/TIFF for photos
- **Font:** Arial or Times New Roman, minimum 8pt
- **Line width:** Minimum 0.5pt
- **Color:** Use colorblind-friendly palettes (avoid red-green)
- **Labels:** Clear axis labels with units
- **Captions:** Descriptive captions below figures

### Table Requirements
- **Format:** LaTeX booktabs style (professional horizontal lines only)
- **Font:** Consistent with main text (typically 9-10pt)
- **Alignment:** Numbers right-aligned, text left-aligned
- **Precision:** 2-3 significant figures for percentages, 1-2 for decimals
- **Captions:** Descriptive captions above tables

---

## Summary

- **Total Figures:** 16 (8 conceptual + 8 experimental)
- **Total Tables:** 5 (all experimental)
- **Critical Figures:** 4, 11 (must be high quality)
- **Estimated Total Creation Time:** 40-50 hours
- **Dependencies:** 8 figures + 5 tables require experimental results
- **Tools Needed:** Python (matplotlib, seaborn), PowerPoint/draw.io, LaTeX, Adobe Illustrator (optional)
