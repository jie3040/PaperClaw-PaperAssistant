# Literature Survey Report: Zero-Shot Fault Diagnosis Based on Generative Dual-Path Diffusion Model with Data Augmentation

**Target Journal:** IEEE Transactions on Instrumentation and Measurement (TIM)

**Survey Date:** March 13, 2026

**Surveyor:** AI Agent (Surveyor)

---

## Executive Summary

This comprehensive literature survey investigates the state-of-the-art in zero-shot fault diagnosis with a focus on generative models, particularly diffusion-based approaches and dual-path architectures. The survey covers 40+ recent publications (2024-2026) and identifies key research directions, technical gaps, and opportunities for innovation in applying generative dual-path diffusion models to zero-shot fault diagnosis scenarios.

**Key Findings:**
- Diffusion models are emerging as superior alternatives to GANs/VAEs for fault data augmentation
- Dual-path architectures effectively capture multi-scale and multi-domain features
- Domain shift remains a critical challenge in zero-shot learning
- Conditional diffusion models show promise for controlled fault sample generation
- Limited research combines diffusion models with dual-path architectures for zero-shot diagnosis

---

## 1. Research Background and Motivation

### 1.1 Zero-Shot Fault Diagnosis Paradigm

Zero-shot learning (ZSL) addresses the critical industrial challenge where certain fault types cannot be collected in advance due to:
- High operational costs
- Safety concerns (catastrophic failures)
- Rare occurrence of specific faults
- New equipment without historical fault data

**Core Principle:** Leverage semantic knowledge (fault attributes) to bridge seen and unseen fault classes, enabling diagnosis without target fault samples during training.

### 1.2 Evolution of Generative Models in Fault Diagnosis

**Timeline of Generative Approaches:**

1. **GAN-based Methods (2018-2022)**
   - WGAN, WGAN-GP for stable training
   - Conditional GAN (CGAN) for attribute-guided generation
   - CycleGAN for domain transformation
   - **Limitations:** Mode collapse, training instability, domain shift

2. **VAE-based Methods (2019-2023)**
   - CVAE for conditional generation
   - VAE-GAN hybrids for improved quality
   - **Limitations:** Gaussian assumption, blurry samples, limited diversity

3. **Diffusion Models (2023-Present)**
   - DDPM (Denoising Diffusion Probabilistic Models)
   - Conditional DDPM (CDDPM) for controlled generation
   - **Advantages:** Training stability, high-quality samples, diverse generation

---

## 2. Technical Route Classification

### 2.1 Generative Model-Based Zero-Shot Diagnosis

#### 2.1.1 GAN-Based Approaches

**Representative Works:**

1. **CycleGAN-SD (Example Paper 1 - Liao et al.)**
   - **Method:** Cycle-consistent GAN with semantic distance
   - **Innovation:** Transforms faults between domains using semantic distance
   - **Key Components:**
     - Semantic distance calculation in attribute space
     - Attribute regressor for consistency constraint
     - Feature concatenation for enhanced discriminability
   - **Performance:** 96.50% accuracy on TPTS, 84.06% on TEP, 76.41% on hydraulic system

2. **FAGAN (Fault Auxiliary GAN)**
   - Triplet loss for discriminative sample generation
   - Addresses mode collapse through auxiliary loss

3. **SRWGAN (Semantic Refinement WGAN)**
   - Wasserstein distance with gradient penalty
   - Semantic refinement module for domain shift mitigation

4. **VAEGAN-AR (VAE-GAN with Attribute Regressor)**
   - End-to-end framework combining VAE and GAN
   - Attribute regressor for feature-attribute alignment

**Common Challenges:**
- Domain shift: Generated samples deviate from true unseen fault distribution
- Training instability: Adversarial training convergence issues
- Mode collapse: Limited diversity in generated samples

#### 2.1.2 Diffusion Model-Based Approaches

**Emerging Trend (2024-2026):**

1. **DDPM for Data Augmentation**
   - **Fan et al. (2025):** Lightweight DDPM for rotating machinery with small samples
   - **Advantages:** Stable training, no adversarial loss, high-quality generation

2. **Conditional Diffusion Models**
   - **CDDPM Applications:**
     - Power system scenario generation
     - Material design with multi-target properties
     - Structural health monitoring damage imaging
   - **Key Feature:** Classifier-free guidance for controlled generation

3. **Time-Frequency Diffusion Models**
   - **Transformer winding fault diagnosis (2026):**
     - Time-frequency domain transformation
     - ConvNeXt-1D for feature extraction
     - 3.78% improvement over CVAE-GAN

4. **Diffusion-GAN Hybrids**
   - **Cross-domain fault diagnosis:**
     - Diffusion model for target domain augmentation
     - GAN for balancing imbalanced data
     - Joint training with deep learning classifier

**Advantages over GAN/VAE:**
- **Stability:** No adversarial training, deterministic reverse process
- **Quality:** Higher fidelity samples, better distribution matching
- **Diversity:** Stochastic sampling enables varied generation
- **Flexibility:** Easy conditioning on attributes, labels, or features

### 2.2 Dual-Path Architecture for Feature Extraction

#### 2.2.1 Motivation for Dual-Path Design

**Multi-Scale Feature Capture:**
- Local patterns (high-frequency fault signatures)
- Global context (low-frequency operational trends)

**Multi-Domain Representation:**
- Time domain: Temporal dependencies
- Frequency domain: Spectral characteristics
- Time-frequency domain: Transient features

#### 2.2.2 Representative Dual-Path Architectures

1. **CNN-Transformer Parallel Paths**
   - **CNN Path:** Local feature extraction, spatial patterns
   - **Transformer Path:** Global dependencies, long-range correlations
   - **Fusion:** Attention-based or concatenation-based integration
   - **Applications:** Bearing fault diagnosis, concrete crack monitoring

2. **Dual-Branch Convolutional Networks**
   - **Branch 1:** Squeeze-and-excitation (SE) operations
   - **Branch 2:** Global attention mechanisms
   - **Application:** Sensor fault diagnosis in digital twins

3. **DCA-BiGRU (Dual-path Convolution with Attention + BiGRU)**
   - **Spatial Path:** Dual-path convolution with attention
   - **Temporal Path:** Bidirectional GRU for sequence modeling
   - **Application:** Small sample fault diagnosis

4. **Multi-Domain Dual-Path**
   - **Path 1:** Time-domain features (raw signals)
   - **Path 2:** Frequency-domain features (FFT, wavelet)
   - **Fusion:** Transformer attention-guided integration

#### 2.2.3 Dual-Path Benefits for Zero-Shot Learning

- **Complementary Features:** Different paths capture orthogonal information
- **Robustness:** Redundancy improves generalization to unseen classes
- **Semantic Alignment:** Multi-scale features better match attribute descriptions
- **Transfer Learning:** Dual paths facilitate knowledge transfer across domains

### 2.3 Attribute-Based Semantic Embedding

#### 2.3.1 Semantic Space Construction

**Attribute Definition Methods:**

1. **Expert Knowledge-Based**
   - Fault location (component, subsystem)
   - Fault cause (mechanical, electrical, thermal)
   - Fault severity (minor, moderate, severe)
   - **Example (TEP):** 20 attributes covering process variables, disturbance types

2. **Data-Driven Semantic Extraction**
   - VAE encoder for dense semantic representation
   - Pre-trained language models (BERT, GPT) for textual descriptions
   - CLIP/CLAP for multi-modal alignment

3. **Hybrid Approaches**
   - Combine expert attributes with learned embeddings
   - Simulation-driven semantic construction

#### 2.3.2 Semantic Distance and Consistency

**Semantic Distance Metrics:**
- L1/L2 norm in attribute space
- Cosine similarity for normalized embeddings
- Wasserstein distance for distribution matching

**Consistency Constraints:**
- **Attribute-Consistent Loss:** Regressor predicts attributes from generated features
- **Cycle-Consistent Loss:** Bidirectional transformation preserves content
- **Contrastive Loss:** Pull same-class features together, push different classes apart

#### 2.3.3 Domain Shift Mitigation

**Problem:** Model trained on seen classes biased toward seen attributes when predicting unseen samples.

**Solutions:**

1. **Generative Approaches:**
   - Generate pseudo-unseen samples for training
   - Attribute regressor enforces semantic alignment

2. **Feature Alignment:**
   - Adversarial domain adaptation
   - Maximum mean discrepancy (MMD) minimization

3. **Meta-Learning:**
   - Simulate domain shifts during training
   - Learn transferable representations

4. **Test-Time Adaptation:**
   - LLM-driven semantic adjustment
   - Online learning with distribution shift detection

---

## 3. Research Gaps and Opportunities

### 3.1 Identified Gaps

1. **Limited Diffusion Model Application in Zero-Shot Fault Diagnosis**
   - Most diffusion work focuses on few-shot or cross-domain scenarios
   - No comprehensive framework combining diffusion with zero-shot learning

2. **Lack of Dual-Path Diffusion Architectures**
   - Existing diffusion models use single-path U-Net
   - Dual-path design could enhance multi-scale feature generation

3. **Insufficient Semantic Guidance in Diffusion Models**
   - Current conditional diffusion relies on simple label conditioning
   - Rich attribute information underutilized

4. **Domain Shift in Diffusion-Generated Samples**
   - Even diffusion models suffer from distribution mismatch
   - Need explicit semantic consistency mechanisms

5. **Computational Efficiency**
   - Diffusion models require many sampling steps (50-1000)
   - Real-time diagnosis applications need acceleration

### 3.2 Proposed Innovation Directions

#### 3.2.1 Generative Dual-Path Diffusion Model (GDPDM)

**Architecture Design:**

1. **Dual-Path Denoising Network**
   - **Path 1:** Time-domain feature generation
     - 1D convolutional layers for temporal patterns
     - Residual connections for gradient flow
   - **Path 2:** Frequency-domain feature generation
     - Spectral convolution or FFT-based processing
     - Attention mechanisms for frequency selection
   - **Fusion Module:** Cross-attention between paths

2. **Semantic-Guided Conditioning**
   - **Attribute Encoder:** VAE or Transformer for semantic embedding
   - **Semantic Distance Injection:** Condition on distance to nearest seen class
   - **Adaptive Conditioning:** Learnable weighting of attribute dimensions

3. **Consistency Regularization**
   - **Attribute Regressor:** Predict attributes from generated features
   - **Cycle Consistency:** Reverse diffusion should recover original semantics
   - **Contrastive Learning:** Maximize inter-class separation

#### 3.2.2 Data Augmentation Strategy

**Multi-Stage Generation:**

1. **Stage 1: Coarse Generation**
   - Generate diverse fault samples conditioned on attributes
   - Use fewer diffusion steps for efficiency

2. **Stage 2: Semantic Refinement**
   - Fine-tune samples using attribute regressor feedback
   - Ensure alignment with target semantic space

3. **Stage 3: Feature Concatenation**
   - Extract intermediate features from dual paths
   - Concatenate with generated samples for enhanced discriminability

#### 3.2.3 Zero-Shot Diagnosis Framework

**Training Phase:**
1. Train dual-path diffusion model on seen fault classes
2. Learn semantic embedding space (VAE encoder)
3. Train attribute regressor for consistency

**Generation Phase:**
1. Compute semantic distance from seen to unseen classes
2. Generate pseudo-unseen samples via conditional diffusion
3. Apply semantic refinement and feature concatenation

**Diagnosis Phase:**
1. Train classifier on seen + generated unseen samples
2. Test on real unseen fault data
3. Optional: Test-time adaptation with LLM guidance

---

## 4. Benchmark Datasets and Evaluation Metrics

### 4.1 Standard Datasets

#### 4.1.1 Bearing Fault Datasets

1. **CWRU (Case Western Reserve University)**
   - **Description:** Motor bearing faults under various loads
   - **Fault Types:** Inner race, outer race, ball faults
   - **Advantages:** Distinct fault pulses, clear fault signatures
   - **Usage:** Most widely used benchmark

2. **Paderborn University Bearing Dataset**
   - **Description:** Accelerated lifetime testing
   - **Fault Types:** Natural degradation faults
   - **Advantages:** Realistic fault progression

3. **IMS Bearing Dataset**
   - **Description:** Run-to-failure experiments
   - **Fault Types:** Progressive degradation
   - **Advantages:** Long-term monitoring data

#### 4.1.2 Process Industry Datasets

1. **Tennessee Eastman Process (TEP)**
   - **Description:** Chemical process simulation
   - **Variables:** 52 process measurements
   - **Fault Types:** 21 fault modes (step, random, drift, sticking)
   - **Attributes:** 20 semantic attributes
   - **Usage:** Standard benchmark for zero-shot diagnosis

2. **Hydraulic System Dataset**
   - **Description:** Real hydraulic test rig
   - **Fault Types:** 144 combinations (cooler, valve, pump, accumulator)
   - **Attributes:** 14 one-hot encoded attributes
   - **Advantages:** Real-world complexity

#### 4.1.3 Electrical Fault Datasets

1. **Three-Phase Transmission System (TPTS)**
   - **Description:** Electrical fault simulation
   - **Fault Types:** 6 classes (LG, LL, LLG, LLL, LLLG, Normal)
   - **Attributes:** 4 attributes (phase A/B/C, ground)
   - **Usage:** Toy example for method validation

### 4.2 Evaluation Metrics

#### 4.2.1 Classification Metrics

1. **Accuracy:** Overall correct classification rate
2. **Precision/Recall/F1:** Per-class performance
3. **Confusion Matrix:** Detailed misclassification analysis

#### 4.2.2 Generative Quality Metrics

1. **Pearson Correlation Coefficient (PCC)**
   - Measures linear correlation between generated and real features
   - Threshold: PCC > 0.5 indicates significant correlation

2. **Cosine Similarity (CS)**
   - Measures distribution similarity
   - Range: [0, 1], higher is better

3. **Fréchet Inception Distance (FID)**
   - Measures distribution distance in feature space
   - Lower is better

4. **Inception Score (IS)**
   - Measures quality and diversity
   - Higher is better

#### 4.2.3 Zero-Shot Specific Metrics

1. **Seen vs. Unseen Accuracy**
   - Separate evaluation on seen and unseen classes
   - Assess generalization capability

2. **Harmonic Mean (H)**
   - Balance between seen and unseen performance
   - H = 2 × (Acc_seen × Acc_unseen) / (Acc_seen + Acc_unseen)

3. **Domain Shift Measurement**
   - Distribution distance between generated and real unseen samples
   - Maximum Mean Discrepancy (MMD), Wasserstein distance

---

## 5. Comparative Analysis of Methods

### 5.1 Performance Comparison (Based on Example Papers)

| Method | TPTS (%) | TEP (%) | Hydraulic (15 unseen) (%) | Training Stability | Generation Quality |
|--------|----------|---------|---------------------------|-------------------|-------------------|
| FDAT | 69.60 | 68.06 | 57.91 | High | N/A (non-generative) |
| SCE | 95.30 | 77.40 | 71.05 | High | N/A (embedding-based) |
| FAGAN | 86.55 | 73.89 | 57.97 | Medium | Medium |
| SRWGAN | 83.25 | 74.36 | 69.39 | Medium | Medium |
| VAEGAN-AR | 87.75 | 81.61 | 67.09 | Medium-High | Medium-High |
| FREE | 90.95 | 77.50 | 70.55 | High | High |
| **CycleGAN-SD** | **96.50** | **84.06** | **76.41** | High | High |
| Diffusion-based (projected) | - | - | - | **Very High** | **Very High** |

### 5.2 Method Characteristics

#### 5.2.1 Non-Generative Methods

**FDAT (Fault Direct Attributes Prediction):**
- **Approach:** Direct attribute prediction from features
- **Pros:** Simple, interpretable
- **Cons:** Suffers from domain shift, lowest accuracy

**SCE (Semantic-Consistent Embedding):**
- **Approach:** Feature-attribute embedding with consistency loss
- **Pros:** Good performance, stable training
- **Cons:** Requires careful embedding space design

#### 5.2.2 GAN-Based Methods

**FAGAN:**
- **Innovation:** Triplet loss for discriminative generation
- **Limitation:** Still suffers from mode collapse

**SRWGAN:**
- **Innovation:** Semantic refinement module
- **Limitation:** Complex training procedure

**VAEGAN-AR:**
- **Innovation:** Combines VAE and GAN strengths
- **Limitation:** Gaussian assumption limits diversity

**CycleGAN-SD (State-of-the-Art GAN):**
- **Innovation:** Semantic distance-guided transformation, attribute regressor
- **Strengths:** Best GAN-based performance, addresses domain shift
- **Limitation:** Still adversarial training, potential instability

#### 5.2.3 Diffusion-Based Methods (Emerging)

**Advantages:**
- **Training Stability:** No adversarial loss, deterministic optimization
- **Sample Quality:** Higher fidelity, better distribution matching
- **Diversity:** Stochastic sampling enables varied generation
- **Controllability:** Easy conditioning on attributes

**Challenges:**
- **Computational Cost:** Many sampling steps required
- **Limited Zero-Shot Application:** Most work on few-shot/cross-domain
- **Semantic Guidance:** Need better attribute integration

---

## 6. Key Findings from Example Papers

### 6.1 CycleGAN-SD (Example Paper 1)

**Core Contributions:**

1. **Semantic Distance-Guided Transformation**
   - Manually select nearest seen class based on Mean Semantic Gap (MSG)
   - Transform source domain faults to target domain using semantic distance
   - Preserves fundamental distribution of real faults

2. **Attribute-Consistent Constraint**
   - Regressor predicts attributes from generated samples
   - Enforces alignment between generated features and true attributes
   - Mitigates domain shift problem

3. **Feature Concatenation**
   - Extract hidden layer output from regressor
   - Concatenate with generated samples
   - Enhances discriminability in feature space

**Experimental Insights:**

- **Dataset Diversity:** Validated on 3 different scenarios (TPTS, TEP, Hydraulic)
- **Classifier Independence:** Consistent improvement across 5 classifiers (LSVM, NRF, PNB, MLP, CNN)
- **Ablation Study:** Removing feature concatenation or consistency loss degrades performance
- **Visualization:** t-SNE shows generated features closely match real features

**Limitations:**

- Manual selection of nearest fault category (not end-to-end)
- Adversarial training still has convergence challenges
- Limited to pairwise domain transformation

### 6.2 Insights from Recent Diffusion Papers (2024-2026)

1. **Lightweight DDPM for Rotating Machinery (Fan et al., 2025)**
   - Demonstrates diffusion superiority over GAN for small samples
   - Achieves stable training without mode collapse

2. **Time-Frequency Diffusion for Transformer Diagnosis (2026)**
   - 3.78% improvement over CVAE-GAN
   - Shows importance of domain-specific design

3. **Conditional Diffusion for Material Design**
   - Multi-target property control via classifier-free guidance
   - Suggests potential for multi-attribute fault generation

4. **Diffusion-GAN Hybrid for Cross-Domain Diagnosis**
   - Combines diffusion (target augmentation) + GAN (balancing)
   - Indicates complementary strengths of different generative models

---

## 7. Proposed Research Directions

### 7.1 Short-Term (6-12 months)

1. **Baseline Diffusion Model for Zero-Shot Diagnosis**
   - Implement DDPM/CDDPM for fault data generation
   - Compare with GAN-based methods on standard benchmarks
   - Establish performance baseline

2. **Semantic-Guided Conditioning**
   - Integrate attribute embeddings into diffusion process
   - Experiment with different conditioning strategies (concatenation, cross-attention, FiLM)

3. **Domain Shift Analysis**
   - Quantify domain shift in diffusion-generated samples
   - Develop metrics for semantic consistency

### 7.2 Medium-Term (12-18 months)

1. **Dual-Path Diffusion Architecture**
   - Design dual-path denoising network (time + frequency)
   - Implement cross-path attention mechanisms
   - Validate on multi-domain datasets

2. **Attribute Consistency Regularization**
   - Integrate attribute regressor into diffusion training
   - Develop cycle-consistent diffusion for bidirectional generation

3. **Efficient Sampling Strategies**
   - Implement DDIM (Denoising Diffusion Implicit Models) for fast sampling
   - Explore distillation techniques for real-time diagnosis

### 7.3 Long-Term (18-24 months)

1. **Unified Zero-Shot Diagnosis Framework**
   - End-to-end training of diffusion model + classifier
   - Automatic semantic distance computation
   - Test-time adaptation with LLM guidance

2. **Multi-Modal Diffusion**
   - Incorporate vibration, acoustic, thermal signals
   - Cross-modal generation and fusion

3. **Industrial Deployment**
   - Real-world validation on industrial equipment
   - Uncertainty quantification for safety-critical applications
   - Explainability and interpretability enhancements

---

## 8. Recommended Methodology for Proposed Paper

### 8.1 Problem Formulation

**Given:**
- Seen fault classes: $\mathcal{S} = \{s_1, s_2, ..., s_N\}$ with samples $\{x_i^s, y_i^s\}$
- Unseen fault classes: $\mathcal{U} = \{u_1, u_2, ..., u_M\}$ without samples
- Semantic attributes: $\mathcal{A} = \{a_1, a_2, ..., a_K\}$ for all classes

**Objective:**
- Train model on $\mathcal{S}$ to diagnose faults in $\mathcal{U}$

### 8.2 Proposed Framework: GDPDM-ZSD

**Generative Dual-Path Diffusion Model for Zero-Shot Diagnosis**

#### Phase 1: Semantic Embedding Learning

1. **Attribute Encoder (VAE)**
   - Input: Binary attribute vectors $c \in \{0,1\}^K$
   - Output: Dense semantic embeddings $f_s \in \mathbb{R}^D$
   - Loss: Reconstruction + KL divergence

2. **Semantic Distance Computation**
   - For each unseen class $u_j$, find nearest seen class $s_i^*$
   - Compute semantic distance: $\Delta_{ij} = f_s(u_j) - f_s(s_i^*)$

#### Phase 2: Dual-Path Diffusion Training

1. **Forward Diffusion Process**
   - Gradually add Gaussian noise to seen fault samples
   - $q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1-\beta_t} x_{t-1}, \beta_t I)$

2. **Dual-Path Denoising Network**
   - **Time-Domain Path:** 1D CNN + ResNet blocks
   - **Frequency-Domain Path:** Spectral convolution + Attention
   - **Cross-Path Fusion:** Multi-head cross-attention
   - **Conditioning:** Inject semantic embeddings via FiLM layers

3. **Reverse Diffusion Process**
   - Predict noise: $\epsilon_\theta(x_t, t, f_s, \Delta)$
   - Denoise: $x_{t-1} = \frac{1}{\sqrt{\alpha_t}}(x_t - \frac{1-\alpha_t}{\sqrt{1-\bar{\alpha}_t}}\epsilon_\theta) + \sigma_t z$

4. **Training Objective**
   - Denoising loss: $\mathcal{L}_{denoise} = \mathbb{E}_{t,x_0,\epsilon}[||\epsilon - \epsilon_\theta(x_t, t, f_s, \Delta)||^2]$
   - Attribute consistency: $\mathcal{L}_{attr} = \mathbb{E}[||R(x_0) - c||^2]$
   - Total loss: $\mathcal{L} = \mathcal{L}_{denoise} + \lambda \mathcal{L}_{attr}$

#### Phase 3: Unseen Sample Generation

1. **Conditional Sampling**
   - Start from Gaussian noise: $x_T \sim \mathcal{N}(0, I)$
   - Condition on unseen class attributes and semantic distance
   - Iteratively denoise: $x_T \rightarrow x_{T-1} \rightarrow ... \rightarrow x_0$

2. **Semantic Refinement**
   - Pass generated samples through attribute regressor
   - Adjust samples to better align with target attributes

3. **Feature Concatenation**
   - Extract dual-path intermediate features
   - Concatenate with generated samples: $\tilde{x} = [x_0, h_{time}, h_{freq}]$

#### Phase 4: Zero-Shot Diagnosis

1. **Classifier Training**
   - Train on seen samples + generated unseen samples
   - Use enhanced features $\tilde{x}$ for improved discriminability

2. **Testing**
   - Evaluate on real unseen fault data
   - Compare with baseline methods

### 8.3 Expected Contributions

1. **Novel Architecture:** First dual-path diffusion model for zero-shot fault diagnosis
2. **Semantic Guidance:** Effective integration of attribute knowledge into diffusion process
3. **Superior Performance:** Expected 5-10% improvement over CycleGAN-SD
4. **Training Stability:** Eliminate adversarial training issues
5. **Theoretical Analysis:** Provide insights into why dual-path diffusion works

---

## 9. Conclusion and Recommendations

### 9.1 Summary of Key Findings

1. **Diffusion Models are Emerging as Superior Generative Approach**
   - Better stability, quality, and diversity than GANs/VAEs
   - Limited application in zero-shot fault diagnosis (research gap)

2. **Dual-Path Architectures Enhance Feature Representation**
   - Capture multi-scale and multi-domain information
   - Improve robustness and generalization

3. **Domain Shift Remains Critical Challenge**
   - Attribute consistency constraints are effective
   - Semantic distance guidance helps bridge seen-unseen gap

4. **Benchmark Datasets are Well-Established**
   - TEP, CWRU, Hydraulic system widely used
   - Standardized evaluation enables fair comparison

### 9.2 Recommendations for Proposed Research

1. **Start with Strong Baseline**
   - Implement CDDPM with attribute conditioning
   - Replicate CycleGAN-SD results for comparison

2. **Incremental Innovation**
   - Add dual-path architecture to diffusion model
   - Integrate attribute regressor for consistency
   - Implement feature concatenation strategy

3. **Comprehensive Evaluation**
   - Test on all three benchmark datasets (TPTS, TEP, Hydraulic)
   - Compare with 5+ baseline methods
   - Conduct ablation studies for each component

4. **Theoretical Contribution**
   - Analyze why dual-path diffusion improves zero-shot learning
   - Provide convergence guarantees or sample complexity bounds

5. **Practical Considerations**
   - Implement efficient sampling (DDIM, distillation)
   - Provide code and pre-trained models for reproducibility
   - Discuss computational costs and real-time feasibility

### 9.3 Alignment with IEEE TIM Scope

**IEEE Transactions on Instrumentation and Measurement** focuses on:
- Novel measurement techniques and instrumentation
- Signal processing for measurement systems
- Intelligent systems for industrial applications
- Data-driven methods for fault diagnosis

**Proposed Research Alignment:**
- **Instrumentation:** Vibration sensors, process measurements
- **Measurement:** Fault feature extraction and quantification
- **Intelligence:** Deep generative models for zero-shot learning
- **Application:** Industrial fault diagnosis (bearings, chemical processes, hydraulic systems)

**Expected Impact:**
- Advance state-of-the-art in zero-shot fault diagnosis
- Provide practical solution for rare fault detection
- Contribute to Industry 4.0 and predictive maintenance

---

## 10. References (Selected Key Papers)

### Zero-Shot Learning

1. Liao et al., "Cycle-Consistent Generating Network Based on Semantic Distance for Zero-Shot Fault Diagnosis," IEEE TIM, 2024
2. Feng & Zhao, "Fault description based attribute transfer for zero-sample industrial fault diagnosis," IEEE TII, 2021
3. Hu et al., "Semantic-consistent embedding for zero-shot fault diagnosis," IEEE TII, 2023

### Diffusion Models

4. Fan et al., "A novel lightweight DDPM-based data augmentation method for rotating machinery fault diagnosis with small sample," 2025
5. "Power Transformer Winding Fault Diagnosis Method Based on Time–Frequency Diffusion Model and ConvNeXt-1D," Applied Sciences, 2026
6. "Augmentation framework for HVAC fault diagnosis based on denoising diffusion models," ScienceDirect, 2025

### Dual-Path Architectures

7. "Transformer Attention-Guided Dual-Path Framework for Bearing Fault Diagnosis," MDPI, 2025
8. "Bearing fault diagnosis based on efficient cross space multiscale CNN transformer parallelism," Scientific Reports, 2025

### Generative Models Comparison

9. "A fault diagnosis data augmentation method integrating multimodal non-Gaussian denoising diffusion generative adversarial network," ScienceDirect, 2025
10. "Generative Models for HVAC Fault Detection and Diagnosis," Journal of Building Design and Environment, 2025

### Domain Adaptation

11. "Few-shot cross-domain fault diagnosis via adversarial meta-learning," Scientific Reports, 2025
12. "Adjust to reality: LLM-driven test-time semantic adjustment for zero-shot fault diagnosis," ScienceDirect, 2025

---

**End of Survey Report**

**Next Steps:**
1. Review and refine proposed methodology
2. Implement baseline diffusion model
3. Design dual-path architecture
4. Prepare experimental setup
5. Begin manuscript drafting for IEEE TIM submission