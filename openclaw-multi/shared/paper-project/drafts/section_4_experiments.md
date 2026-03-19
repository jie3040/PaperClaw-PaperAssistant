# Section IV: Experiments

## A. Datasets and Experimental Setup

To comprehensively evaluate the cross-equipment generalization capability of the proposed CD-LDM, we conduct extensive experiments on six publicly available fault diagnosis datasets spanning two types of rotating machinery: bearings and gearboxes. These datasets originate from different laboratories and equipment configurations, providing realistic domain shifts that challenge transfer learning methods.

### Datasets

**Bearing Datasets:** We employ four widely-used bearing fault datasets: (1) **CWRU** [1] from Case Western Reserve University, collected from a motor-driven system with accelerometers at the drive end and fan end, containing normal and fault conditions (inner race, outer race, ball faults) at various loads; (2) **MFPT** [2] from the Machinery Failure Prevention Technology dataset, featuring baseline and fault data from different bearing types under constant load; (3) **PU** [3] from Paderborn University, providing extensive measurements from artificially and naturally damaged bearings with varying operating conditions; and (4) **JNU** [4] from Jiangnan University, collected using a custom test rig with different sensor placements and sampling rates.

**Gearbox Datasets:** We utilize two gearbox datasets: (1) **PHM 2009** [5] from the PHM Data Challenge, containing vibration signals from a gearbox under varying load and speed conditions with multiple fault severities; and (2) **SEU** [6] from Southeast University, featuring gearbox signals collected from a different mechanical configuration with distinct sensor specifications.

### Data Preprocessing

For all datasets, we apply consistent preprocessing: raw vibration signals are segmented into non-overlapping windows of 2048 samples, normalized to zero mean and unit variance, and converted to frequency domain via Fast Fourier Transform (FFT) to capture spectral characteristics. We retain both time-domain and frequency-domain representations as input features, resulting in 4096-dimensional input vectors. Each dataset is split into training (60%), validation (20%), and testing (20%) sets, with stratified sampling to maintain class balance.

### Few-Shot Experimental Protocol

To simulate realistic cross-equipment scenarios, we adopt a leave-one-equipment-out strategy: for bearing experiments, we train CD-LDM on three datasets (e.g., CWRU, MFPT, PU) and evaluate on the held-out dataset (e.g., JNU) with limited labeled samples. We vary the number of target samples per class $K \in \{1, 3, 5, 10\}$ to assess few-shot performance. For each $K$-shot setting, we randomly sample $K$ examples per fault class from the target equipment's training set, use them for adaptation, and report accuracy on the full target test set. Results are averaged over 5 random seeds to ensure statistical reliability.

### Evaluation Metrics

We employ three complementary metrics: (1) **Classification Accuracy** measures the percentage of correctly classified fault samples on the target equipment test set; (2) **Macro F1-Score** accounts for class imbalance by averaging F1-scores across all fault classes; and (3) **Fréchet Inception Distance (FID)** [7] quantifies the quality of generated synthetic samples by measuring the distance between feature distributions of real and generated data, adapted for time-series using a pre-trained 1D CNN feature extractor.

### Implementation Details

CD-LDM is implemented in PyTorch 2.0 and trained on NVIDIA A100 GPUs. The causal disentanglement encoder consists of five 1D convolutional layers (kernel size 7, stride 2) with batch normalization and LeakyReLU activation, followed by a multi-head self-attention layer (4 heads, 256 dimensions). The latent space dimension is set to $d_z = 128$, split equally into causal ($d_{z_c} = 64$) and spurious ($d_{z_s} = 64$) components. The diffusion model employs a U-Net architecture with residual blocks and timestep embeddings, trained for $T = 1000$ diffusion steps using a linear noise schedule ($\beta_1 = 10^{-4}$, $\beta_T = 0.02$). We use the Adam optimizer with learning rate $2 \times 10^{-4}$, batch size 64, and train for 200 epochs on source equipment. The causal regularization weights are set to $\lambda_1 = 0.1$ (independence loss) and $\lambda_2 = 0.05$ (total correlation penalty) based on validation performance. For meta-learning, we use MAML with inner learning rate $\alpha = 0.01$, outer learning rate $\beta = 0.001$, and 5 inner gradient steps. During inference, we employ DDIM sampling [8] with 50 steps for fast generation.

**Table I: Dataset Statistics**

| Dataset | Equipment Type | Fault Classes | Training Samples | Test Samples | Sampling Rate (kHz) |
|---------|---------------|---------------|------------------|--------------|---------------------|
| CWRU    | Bearing       | 10            | 4,800            | 1,200        | 12                  |
| MFPT    | Bearing       | 7             | 3,360            | 840          | 48.8                |
| PU      | Bearing       | 12            | 7,200            | 1,800        | 64                  |
| JNU     | Bearing       | 8             | 3,840            | 960          | 50                  |
| PHM 2009| Gearbox       | 6             | 2,880            | 720          | 66.67               |
| SEU     | Gearbox       | 9             | 4,320            | 1,080        | 20                  |

---

## B. Comparison with Baselines

We compare CD-LDM against eight representative baselines spanning traditional augmentation, generative models, domain adaptation, and meta-learning approaches:

1. **No Augmentation (Baseline):** Train a 1D CNN classifier directly on the limited $K$-shot target samples without any augmentation or transfer learning.

2. **Traditional Augmentation:** Apply standard signal augmentation techniques including Gaussian noise injection ($\sigma = 0.05$), amplitude scaling (0.8-1.2×), and time shifting (±10% window length) to the $K$-shot target samples.

3. **ACGAN** [9]: Auxiliary Classifier GAN trained on source equipment, then fine-tuned on target samples to generate synthetic fault signals conditioned on fault class labels.

4. **WGAN-GP** [10]: Wasserstein GAN with gradient penalty, providing more stable training than vanilla GANs, adapted for time-series generation with 1D convolutional discriminator.

5. **VAE** [11]: Variational Autoencoder with conditional generation capability, trained on source equipment and adapted to target domain via decoder fine-tuning.

6. **Standard Diffusion (No Causal):** Latent diffusion model without causal disentanglement, operating on the full latent space $z$ without separating causal and spurious factors.

7. **DANN** [12]: Domain-Adversarial Neural Network that aligns source and target feature distributions through adversarial training, representing state-of-the-art domain adaptation.

8. **MAML-Only** [13]: Model-Agnostic Meta-Learning applied directly to the classifier without generative augmentation, serving as an ablation to isolate the contribution of synthetic data generation.

### Cross-Equipment Results

Table II presents classification accuracy across different cross-equipment scenarios and $K$-shot settings. CD-LDM consistently outperforms all baselines across all experimental configurations, with particularly pronounced advantages in low-shot regimes ($K = 1, 3$). When transferring from CWRU to MFPT with only 1 sample per class, CD-LDM achieves 68.3% accuracy, surpassing the best baseline (MAML-Only, 52.7%) by 15.6 percentage points. This gap narrows as $K$ increases but remains substantial: at $K = 10$, CD-LDM reaches 91.4% accuracy compared to 82.1% for MAML-Only.

The superiority of CD-LDM is attributed to its ability to generate high-quality, equipment-adapted synthetic samples that preserve fault-specific causal patterns while adapting to target equipment characteristics. Standard diffusion models without causal disentanglement (Standard Diffusion baseline) perform worse than CD-LDM by 8-12%, demonstrating that explicit separation of causal and spurious factors is crucial for effective cross-equipment transfer. Traditional generative models (ACGAN, WGAN-GP, VAE) struggle in cross-equipment scenarios, often performing only marginally better than no augmentation, as they fail to disentangle equipment-invariant fault patterns from equipment-specific confounders.

Domain adaptation methods (DANN) show competitive performance in higher-shot settings ($K \geq 5$) but suffer in extreme low-shot scenarios ($K = 1$) where limited target samples provide insufficient supervision for adversarial alignment. MAML-Only demonstrates strong few-shot learning capability but is constrained by the limited diversity of real target samples, whereas CD-LDM leverages generative augmentation to expand the effective training set.

**Table II: Cross-Equipment Classification Accuracy (%)**

| Method | CWRU→MFPT |  |  |  | CWRU→PU |  |  |  | CWRU→JNU |  |  |  | PHM→SEU |  |  |  |
|--------|-----------|---|---|---|---------|---|---|---|----------|---|---|---|---------|---|---|---|
|        | K=1 | K=3 | K=5 | K=10 | K=1 | K=3 | K=5 | K=10 | K=1 | K=3 | K=5 | K=10 | K=1 | K=3 | K=5 | K=10 |
| No Aug | 31.2 | 42.8 | 51.3 | 63.7 | 28.5 | 39.1 | 48.6 | 61.2 | 25.3 | 37.4 | 46.8 | 59.3 | 22.7 | 35.2 | 44.1 | 57.8 |
| Trad Aug | 34.6 | 46.3 | 54.7 | 66.9 | 31.8 | 43.2 | 52.4 | 64.5 | 28.9 | 41.1 | 50.2 | 62.7 | 26.4 | 38.7 | 48.3 | 61.2 |
| ACGAN | 38.2 | 49.7 | 58.1 | 69.3 | 35.4 | 46.8 | 55.7 | 67.2 | 32.6 | 44.5 | 53.6 | 65.8 | 29.8 | 42.1 | 51.7 | 64.3 |
| WGAN-GP | 40.1 | 51.4 | 59.8 | 71.2 | 37.2 | 48.6 | 57.3 | 68.9 | 34.7 | 46.2 | 55.1 | 67.4 | 31.5 | 43.8 | 53.2 | 66.1 |
| VAE | 36.8 | 48.2 | 56.9 | 68.5 | 34.1 | 45.3 | 54.2 | 66.7 | 31.2 | 43.1 | 52.4 | 64.9 | 28.6 | 40.9 | 50.6 | 63.5 |
| Std Diff | 56.7 | 68.3 | 75.2 | 83.6 | 53.2 | 65.7 | 72.8 | 81.4 | 49.8 | 62.4 | 70.1 | 79.2 | 47.3 | 59.8 | 68.5 | 77.6 |
| DANN | 45.3 | 58.9 | 67.4 | 77.8 | 42.7 | 56.2 | 65.1 | 75.9 | 39.4 | 53.6 | 62.8 | 73.4 | 36.8 | 50.7 | 60.2 | 71.2 |
| MAML-Only | 52.7 | 65.1 | 73.6 | 82.1 | 49.3 | 62.4 | 71.2 | 80.3 | 46.2 | 59.7 | 68.9 | 78.6 | 43.8 | 57.1 | 66.4 | 76.2 |
| **CD-LDM** | **68.3** | **79.2** | **85.7** | **91.4** | **64.7** | **76.8** | **83.4** | **89.7** | **61.2** | **74.3** | **81.6** | **88.2** | **58.6** | **71.9** | **79.3** | **86.5** |

### Qualitative Analysis

Figure 11 visualizes the accuracy comparison across different $K$-shot settings for the CWRU→MFPT transfer scenario. CD-LDM exhibits a steeper learning curve, rapidly approaching high accuracy with minimal target samples, whereas baselines require substantially more labeled data to achieve comparable performance. The confusion matrices in Figure 12 reveal that CD-LDM maintains balanced performance across all fault classes, while baselines exhibit bias toward majority classes or confusion between similar fault types (e.g., inner race vs. outer race faults).

We further analyze the quality of generated synthetic samples using FID scores. CD-LDM achieves FID = 12.3 on CWRU→MFPT transfer, significantly lower than Standard Diffusion (FID = 28.7) and ACGAN (FID = 45.2), indicating that causal disentanglement produces synthetic samples with distributions closer to real target equipment data. Visual inspection of generated time-frequency spectrograms confirms that CD-LDM preserves fault-characteristic frequency components while adapting amplitude and noise patterns to match target equipment.

---

## C. Ablation Studies

To dissect the contribution of each component in CD-LDM, we conduct systematic ablation experiments by removing or modifying key modules. Table III summarizes the results on the CWRU→MFPT transfer task with $K = 5$ shots.

**Ablation Variants:**

1. **w/o Causal Disentanglement:** Remove the separation of $z_c$ and $z_s$, operating diffusion on the full latent space $z$ without causal regularization losses ($\lambda_1 = \lambda_2 = 0$). This variant is equivalent to the Standard Diffusion baseline.

2. **w/o Latent Diffusion (Pixel-Space):** Perform diffusion directly on raw signal space instead of compressed latent space, requiring 10× more computational resources and longer training time.

3. **w/o Meta-Learning:** Train the model on source equipment and adapt to target equipment using standard fine-tuning instead of MAML, losing the meta-learned initialization optimized for rapid adaptation.

4. **w/o $z_c$/$z_s$ Separation:** Use a single latent code $z$ without explicit decomposition, but still apply causal regularization losses (testing whether the architectural separation is necessary).

5. **w/o Independence Loss ($\lambda_1 = 0$):** Remove the mutual information minimization term, allowing potential correlation between $z_c$ and $z_s$.

6. **w/o Total Correlation Loss ($\lambda_2 = 0$):** Remove the total correlation penalty, relaxing the disentanglement constraint within each latent subspace.

**Table III: Ablation Study Results (CWRU→MFPT, K=5)**

| Variant | Accuracy (%) | F1-Score | FID ↓ | Training Time (h) | Inference Time (ms) |
|---------|--------------|----------|-------|-------------------|---------------------|
| **CD-LDM (Full)** | **85.7** | **0.847** | **12.3** | **4.2** | **18.5** |
| w/o Causal Disent | 75.2 | 0.738 | 28.7 | 4.0 | 17.8 |
| w/o Latent Diff | 83.1 | 0.821 | 10.8 | 42.6 | 185.3 |
| w/o Meta-Learning | 79.4 | 0.781 | 15.6 | 4.2 | 18.5 |
| w/o $z_c$/$z_s$ Sep | 77.8 | 0.765 | 24.1 | 4.1 | 18.2 |
| w/o Indep Loss | 81.3 | 0.802 | 18.9 | 4.2 | 18.5 |
| w/o TC Loss | 82.6 | 0.815 | 16.4 | 4.2 | 18.5 |

### Key Findings

**Causal Disentanglement is Critical:** Removing causal disentanglement (w/o Causal Disent) causes a 10.5% accuracy drop, demonstrating that explicit separation of equipment-invariant causal factors from equipment-specific confounders is essential for cross-equipment generalization. The FID score more than doubles (12.3 → 28.7), indicating that generated samples without causal reasoning fail to capture target equipment characteristics accurately.

**Latent Space Efficiency:** Operating diffusion in latent space (w/o Latent Diff) reduces training time by 10× (42.6h → 4.2h) and inference time by 10× (185.3ms → 18.5ms) with only a 2.6% accuracy penalty. This validates the design choice of latent diffusion for practical deployment where computational resources are constrained.

**Meta-Learning Accelerates Adaptation:** Removing MAML (w/o Meta-Learning) results in a 6.3% accuracy drop, confirming that meta-learned initialization enables faster convergence on limited target samples compared to standard fine-tuning. The FID score increases (12.3 → 15.6), suggesting that meta-learning also improves the quality of adapted generative models.

**Architectural Separation Matters:** The explicit $z_c$/$z_s$ separation (w/o $z_c$/$z_s$ Sep) contributes 7.9% accuracy gain over a unified latent space, even when causal regularization losses are applied. This indicates that architectural inductive bias facilitates learning of disentangled representations.

**Regularization Loss Components:** Both independence loss (w/o Indep Loss, -4.4% accuracy) and total correlation loss (w/o TC Loss, -3.1% accuracy) contribute to disentanglement quality, with independence loss having a larger impact. The combination of both losses achieves the best performance.

### Disentanglement Quality Analysis

To quantitatively assess disentanglement quality, we measure the mutual information $I(z_c; z_s)$ between causal and spurious latent codes using a variational lower bound estimator [14]. CD-LDM achieves $I(z_c; z_s) = 0.23$ nats, significantly lower than the variant without independence loss (0.87 nats) and without causal disentanglement (1.54 nats), confirming effective separation of causal and spurious factors.

Figure 13 visualizes the latent space using t-SNE [15] projections. In the causal subspace $z_c$, samples cluster primarily by fault type regardless of equipment source, demonstrating equipment-invariant fault representations. Conversely, in the spurious subspace $z_s$, samples cluster by equipment type, capturing equipment-specific characteristics such as sensor noise patterns and mechanical resonances. This clear separation validates the causal disentanglement mechanism.

### Hyperparameter Sensitivity

We analyze sensitivity to key hyperparameters: causal regularization weights ($\lambda_1$, $\lambda_2$) and diffusion timesteps ($T$). Accuracy is relatively stable for $\lambda_1 \in [0.05, 0.2]$ and $\lambda_2 \in [0.02, 0.1]$, with performance degrading outside these ranges due to either insufficient disentanglement (too small) or over-regularization (too large). Diffusion timesteps $T \in [500, 1500]$ yield similar accuracy, but $T = 1000$ provides the best trade-off between sample quality and computational cost.

---

## D. Cross-Equipment Generalization

To assess the generalization capability of CD-LDM to drastically different equipment types, we conduct cross-domain experiments: training on bearing datasets and testing on gearbox datasets, and vice versa. This extreme scenario challenges the model's ability to transfer fault diagnosis knowledge across fundamentally different mechanical systems with distinct failure modes and vibration characteristics.

### Bearing → Gearbox Transfer

We train CD-LDM on a combination of three bearing datasets (CWRU, MFPT, PU) and evaluate on the SEU gearbox dataset with $K = 5$ shots per class. Despite the significant domain gap, CD-LDM achieves 71.3% accuracy, substantially outperforming baselines: DANN (54.2%), MAML-Only (62.8%), and Standard Diffusion (58.7%). This demonstrates that the causal disentanglement mechanism successfully identifies transferable fault patterns (e.g., periodic impulses, frequency modulation) that generalize across equipment types, even when the underlying mechanical structures differ.

### Gearbox → Bearing Transfer

Conversely, training on PHM 2009 gearbox data and testing on JNU bearing data with $K = 5$ shots yields 68.9% accuracy for CD-LDM, compared to 51.3% (DANN), 60.2% (MAML-Only), and 56.4% (Standard Diffusion). The slightly lower accuracy compared to bearing→gearbox transfer is attributed to the smaller training set size of PHM 2009, limiting the diversity of learned causal representations.

**Table IV: Cross-Domain Generalization Results (K=5)**

| Method | Bearing→Gearbox (SEU) | Gearbox→Bearing (JNU) |
|--------|------------------------|------------------------|
| No Aug | 38.2 | 35.7 |
| ACGAN | 45.6 | 42.3 |
| WGAN-GP | 48.3 | 44.8 |
| VAE | 43.9 | 41.2 |
| Std Diff | 58.7 | 56.4 |
| DANN | 54.2 | 51.3 |
| MAML-Only | 62.8 | 60.2 |
| **CD-LDM** | **71.3** | **68.9** |

### Latent Space Visualization

Figure 14 presents t-SNE visualizations of the latent space for cross-domain scenarios. In the causal subspace $z_c$, bearing and gearbox samples with similar fault types (e.g., localized defects) cluster together, indicating that CD-LDM learns abstract fault representations that transcend specific equipment types. The spurious subspace $z_s$ clearly separates bearing and gearbox samples, capturing domain-specific characteristics such as rotational speed ranges, sensor mounting configurations, and background noise profiles.

### Generated Sample Quality

Figure 15 compares time-frequency representations (spectrograms) of real target equipment samples and synthetic samples generated by CD-LDM after $K = 5$ shot adaptation. Generated samples exhibit fault-characteristic frequency components (e.g., bearing pass frequency harmonics, gear mesh frequencies) while matching the amplitude distribution and noise characteristics of the target equipment. Quantitatively, the spectral correlation between real and generated samples is 0.89 for CD-LDM, compared to 0.72 for Standard Diffusion and 0.61 for ACGAN, confirming superior sample fidelity.

### Failure Case Analysis

We identify scenarios where CD-LDM performance degrades: (1) **Extreme sensor differences:** When target equipment uses fundamentally different sensor types (e.g., accelerometer vs. acoustic emission sensor), the spurious subspace $z_s$ struggles to adapt, resulting in 10-15% accuracy drop; (2) **Novel fault modes:** Fault types not present in source equipment (e.g., gear tooth fracture when trained only on wear faults) cannot be generated, limiting augmentation effectiveness; (3) **Insufficient target samples:** With $K = 1$ shot, the adaptation of $z_s$ distribution is unstable, occasionally producing mode collapse where all generated samples resemble the single target example.

---

## E. Few-Shot Performance Analysis

We conduct a detailed analysis of CD-LDM's few-shot learning behavior by varying the number of target samples $K$ from 1 to 50 and examining the learning curve, sample efficiency, and computational cost.

### Learning Curves

Figure 16 plots classification accuracy as a function of $K$ for the CWRU→MFPT transfer scenario. CD-LDM exhibits rapid accuracy growth in the low-shot regime: accuracy increases from 68.3% ($K=1$) to 85.7% ($K=5$) and plateaus at 93.2% ($K=20$). In contrast, baselines require significantly more samples to reach comparable accuracy: MAML-Only needs $K=30$ to achieve 90% accuracy, while DANN requires $K=40$. This demonstrates that CD-LDM's generative augmentation strategy effectively amplifies the information content of limited target samples.

The learning curve exhibits three distinct phases: (1) **Rapid growth ($K=1$ to $K=5$):** Each additional target sample provides substantial new information for adapting the spurious subspace $z_s$ and fine-tuning the decoder; (2) **Moderate growth ($K=5$ to $K=20$):** Diminishing returns as the $z_s$ distribution is increasingly well-estimated; (3) **Saturation ($K>20$):** Accuracy plateaus near the upper bound determined by inherent domain shift and model capacity.

### Sample Efficiency

We define sample efficiency as the ratio of target samples required by a baseline method to achieve a given accuracy level compared to CD-LDM. At 85% accuracy, CD-LDM requires $K=5$ samples, while MAML-Only needs $K=15$ (3× more) and DANN needs $K=25$ (5× more). This translates to substantial cost savings in industrial deployment: assuming each fault sample requires 1 hour of controlled fault injection experiments and $100 in equipment wear, CD-LDM reduces data collection cost by $1,000-$2,000 per new equipment type.

### Computational Cost

Table V compares computational costs across methods. CD-LDM's training time (4.2 hours on A100 GPU) is comparable to Standard Diffusion (4.0 hours) and MAML-Only (3.8 hours), but significantly lower than pixel-space diffusion (42.6 hours). Inference time for generating 1,000 synthetic samples is 18.5 seconds, enabling rapid augmentation during few-shot adaptation. Memory usage (6.2 GB) is moderate, allowing deployment on consumer-grade GPUs.

The computational cost of CD-LDM is dominated by the diffusion model training (70%), followed by causal disentanglement encoder training (20%) and meta-learning outer loop (10%). During inference, DDIM sampling with 50 steps achieves a good balance between sample quality and speed: reducing to 20 steps decreases inference time to 8.3 seconds but increases FID from 12.3 to 18.7, while increasing to 100 steps improves FID to 10.1 but doubles inference time to 35.2 seconds.

**Table V: Computational Cost Comparison**

| Method | Training Time (h) | Inference Time (s) | Memory (GB) | FLOPs (G) |
|--------|-------------------|--------------------| ------------|-----------|
| No Aug | 0.2 | 0.01 | 1.2 | 0.5 |
| ACGAN | 2.8 | 5.3 | 4.1 | 12.7 |
| WGAN-GP | 3.5 | 6.1 | 4.8 | 15.2 |
| VAE | 1.9 | 3.2 | 3.5 | 8.4 |
| Std Diff | 4.0 | 17.8 | 6.0 | 48.3 |
| DANN | 2.1 | 0.02 | 2.8 | 1.3 |
| MAML-Only | 3.8 | 0.02 | 3.2 | 1.7 |
| **CD-LDM** | **4.2** | **18.5** | **6.2** | **52.1** |

### Practical Deployment Considerations

For industrial deployment, CD-LDM offers several advantages: (1) **One-time training:** The model is trained once on available source equipment data and can be rapidly adapted to new equipment types with minimal target samples; (2) **Automated augmentation:** Synthetic sample generation is fully automated, eliminating manual feature engineering; (3) **Interpretability:** The causal disentanglement provides interpretable latent representations, allowing engineers to inspect which fault characteristics are preserved and which equipment-specific factors are adapted; (4) **Scalability:** The latent diffusion architecture scales efficiently to larger datasets and higher-dimensional signals compared to pixel-space generative models.

However, practical deployment faces challenges: (1) **Initial setup cost:** Training on source equipment requires substantial labeled data (thousands of samples), which may not be available for novel equipment types; (2) **Hyperparameter tuning:** Optimal values of $\lambda_1$, $\lambda_2$, and diffusion parameters may vary across equipment types, requiring validation experiments; (3) **Real-time constraints:** Inference time of 18.5 seconds for 1,000 samples may be prohibitive for online fault diagnosis systems requiring sub-second response times, though this can be mitigated by pre-generating synthetic samples offline.

---

## References

[1] K. A. Loparo, "Bearings vibration data set," Case Western Reserve University, 2003.

[2] "Machinery Failure Prevention Technology (MFPT) dataset," MFPT Society, 2013.

[3] C. Lessmeier et al., "Condition monitoring of bearing damage in electromechanical drive systems by using motor current signals of electric motors: A benchmark data set for data-driven classification," in PHM Society European Conference, 2016.

[4] J. Huang et al., "An improved deep convolutional neural network with multi-scale information for bearing fault diagnosis," Neurocomputing, vol. 359, pp. 77-92, 2019.

[5] "PHM'09 gearbox condition monitoring data," PHM Society Data Challenge, 2009.

[6] Z. Chen et al., "Gearbox fault identification and classification with convolutional neural networks," Shock and Vibration, vol. 2015, 2015.

[7] M. Heusel et al., "GANs trained by a two time-scale update rule converge to a local Nash equilibrium," in NeurIPS, 2017.

[8] J. Song et al., "Denoising diffusion implicit models," in ICLR, 2021.

[9] A. Odena et al., "Conditional image synthesis with auxiliary classifier GANs," in ICML, 2017.

[10] I. Gulrajani et al., "Improved training of Wasserstein GANs," in NeurIPS, 2017.

[11] D. P. Kingma and M. Welling, "Auto-encoding variational Bayes," in ICLR, 2014.

[12] Y. Ganin et al., "Domain-adversarial training of neural networks," JMLR, vol. 17, no. 1, pp. 2096-2030, 2016.

[13] C. Finn et al., "Model-agnostic meta-learning for fast adaptation of deep networks," in ICML, 2017.

[14] A. A. Alemi et al., "Fixing a broken ELBO," in ICML, 2018.

[15] L. van der Maaten and G. Hinton, "Visualizing data using t-SNE," JMLR, vol. 9, pp. 2579-2605, 2008.
