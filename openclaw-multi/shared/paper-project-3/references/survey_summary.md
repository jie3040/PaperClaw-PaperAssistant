# Literature Survey Summary: Zero-Shot Fault Diagnosis with Diffusion Models

**Target Journal:** IEEE TIM | **Date:** 2026-03-13

---

## 1. Technical Routes (3 Major Directions)

### 1.1 GAN-Based Zero-Shot Diagnosis
- **CycleGAN-SD (SOTA):** 96.50% (TPTS), 84.06% (TEP), 76.41% (Hydraulic)
  - Semantic distance-guided transformation
  - Attribute regressor for consistency
  - Feature concatenation for discriminability
- **Limitations:** Training instability, mode collapse, domain shift

### 1.2 Diffusion Models (Emerging 2024-2026)
- **Advantages over GAN/VAE:**
  - Training stability (no adversarial loss)
  - High-quality samples (better distribution matching)
  - Diversity (stochastic sampling)
- **Applications:**
  - Lightweight DDPM for rotating machinery (Fan et al., 2025)
  - Time-frequency diffusion for transformer diagnosis (3.78% improvement over CVAE-GAN)
  - Conditional DDPM for power systems, material design
- **Gap:** Limited application in zero-shot fault diagnosis

### 1.3 Dual-Path Architectures
- **Motivation:** Capture multi-scale (local + global) and multi-domain (time + frequency) features
- **Designs:**
  - CNN-Transformer parallel paths
  - Dual-branch convolution with attention
  - Multi-domain fusion (time + frequency)
- **Benefits for Zero-Shot:** Complementary features improve generalization to unseen classes

---

## 2. Research Gap (Critical!)

**No existing work combines:**
1. Diffusion models (superior generative quality)
2. Dual-path architecture (multi-scale feature capture)
3. Zero-shot learning (semantic-guided generation)

**Current SOTA (CycleGAN-SD) limitations:**
- Adversarial training instability
- Single-path feature extraction
- Manual nearest-class selection

---

## 3. Proposed Innovation: GDPDM-ZSD

**Generative Dual-Path Diffusion Model for Zero-Shot Diagnosis**

### Architecture
1. **Dual-Path Denoising Network**
   - Path 1: Time-domain (1D CNN + ResNet)
   - Path 2: Frequency-domain (Spectral conv + Attention)
   - Fusion: Cross-attention between paths

2. **Semantic-Guided Conditioning**
   - Attribute encoder (VAE) for semantic embeddings
   - Semantic distance injection (unseen → nearest seen)
   - Attribute regressor for consistency

3. **Training Objective**
   - Denoising loss: $\mathcal{L}_{denoise} = \mathbb{E}[||\epsilon - \epsilon_\theta(x_t, t, f_s, \Delta)||^2]$
   - Attribute consistency: $\mathcal{L}_{attr} = \mathbb{E}[||R(x_0) - c||^2]$
   - Total: $\mathcal{L} = \mathcal{L}_{denoise} + \lambda \mathcal{L}_{attr}$

### Workflow
1. **Training:** Learn dual-path diffusion on seen faults + semantic embeddings
2. **Generation:** Conditional sampling for unseen faults (guided by semantic distance)
3. **Diagnosis:** Train classifier on seen + generated unseen samples

### Expected Performance
- **Target:** 5-10% improvement over CycleGAN-SD
- **Rationale:** Diffusion stability + dual-path features + semantic guidance

---

## 4. Benchmark Datasets

### 4.1 TPTS (Three-Phase Transmission System)
- 6 fault classes (LG, LL, LLG, LLL, LLLG, Normal)
- 4 attributes (phase A/B/C, ground)
- Toy example for method validation

### 4.2 TEP (Tennessee Eastman Process)
- 21 fault modes (step, random, drift, sticking)
- 52 process variables
- 20 semantic attributes
- Standard benchmark for zero-shot diagnosis

### 4.3 Hydraulic System
- 144 fault combinations (cooler, valve, pump, accumulator)
- 14 one-hot attributes
- Real-world complexity

---

## 5. Evaluation Metrics

### Classification
- Accuracy (overall + per-class)
- Harmonic mean: $H = 2 \times \frac{Acc_{seen} \times Acc_{unseen}}{Acc_{seen} + Acc_{unseen}}$

### Generative Quality
- Pearson Correlation Coefficient (PCC > 0.5)
- Cosine Similarity (CS, higher is better)
- Fréchet Inception Distance (FID, lower is better)

### Domain Shift
- Maximum Mean Discrepancy (MMD)
- Wasserstein distance

---

## 6. Key Insights from Example Papers

### CycleGAN-SD (Example Paper 1)
- **Core Innovation:** Semantic distance + attribute regressor + feature concatenation
- **Performance:** Best GAN-based method (96.50% TPTS, 84.06% TEP)
- **Limitation:** Manual nearest-class selection, adversarial training

### Recent Diffusion Papers (2024-2026)
- **Fan et al. (2025):** Lightweight DDPM for small samples (stable training)
- **Transformer Diagnosis (2026):** Time-frequency diffusion (3.78% improvement)
- **Material Design:** Multi-target conditional diffusion (classifier-free guidance)

---

## 7. Recommended Methodology

### Phase 1: Semantic Embedding
- VAE encoder for attribute embeddings
- Compute semantic distance (unseen → nearest seen)

### Phase 2: Dual-Path Diffusion Training
- Forward diffusion: Add Gaussian noise to seen samples
- Dual-path denoising: Time + frequency paths with cross-attention
- Conditioning: Inject semantic embeddings via FiLM layers
- Loss: Denoising + attribute consistency

### Phase 3: Unseen Sample Generation
- Conditional sampling from Gaussian noise
- Semantic refinement via attribute regressor
- Feature concatenation (time + frequency features)

### Phase 4: Zero-Shot Diagnosis
- Train classifier on seen + generated unseen samples
- Test on real unseen fault data

---

## 8. Alignment with IEEE TIM

**Scope:** Novel measurement techniques, signal processing, intelligent systems, data-driven fault diagnosis

**Proposed Contributions:**
1. First dual-path diffusion model for zero-shot fault diagnosis
2. Semantic-guided conditioning for controlled generation
3. Superior performance (5-10% improvement over SOTA)
4. Training stability (eliminate adversarial issues)
5. Comprehensive evaluation on 3 benchmarks (TPTS, TEP, Hydraulic)

**Expected Impact:** Advance zero-shot fault diagnosis, enable rare fault detection, contribute to Industry 4.0

---

**End of Summary** (4.8KB)
