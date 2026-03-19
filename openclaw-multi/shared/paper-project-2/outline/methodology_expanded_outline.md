# Expanded Methodology Outline (Section III)

**Target Word Count:** 3500-4000 words (Aligned with IEEE TIM standards)

This document provides a detailed structural plan for significantly expanding the Methodology section. Each subsection outlines the required technical concepts, mathematical formulations, architecture details, and depth needed to meet top-tier journal standards.

## A. Problem Formulation (Target: ~300 words)
*   **Objectives:** Expand the mathematical definition of Generalized Zero-Shot Learning (GZSL) in the context of fault diagnosis. Clearly delineate seen (source) and unseen (target) domains.
*   **Content Points:**
    *   Define the source domain data distribution (seen classes with ample data).
    *   Define the target domain data distribution (unseen classes with zero or limited data).
    *   Define the semantic space acting as a bridge (combining manual expert attributes and LLM-generated text embeddings).
    *   Explicitly state the mapping objective from semantic space to signal space.
*   **Formulas:**
    *   Seen dataset definition: $\mathcal{D}_s = \{(x_i^s, y_i^s)\}_{i=1}^{N_s}$
    *   Unseen dataset definition: $\mathcal{D}_u = \{(x_i^u, y_i^u)\}_{i=1}^{N_u}$
    *   Semantic descriptors: $A = \{a_1, a_2, ..., a_C\}$
    *   Generative mapping objective function: $G(z, a, c) \rightarrow \hat{x}$
*   **Depth Standard:** Comparable to rigorously mathematically defined problem settings in standard IEEE TIM diagnosis papers; ensure every variable has a physical/data interpretation.

## B. Overall Framework (Target: ~400 words)
*   **Objectives:** Provide a macroscopic view of the data flow and how the three main modules interact seamlessly.
*   **Content Points:**
    *   Introduce the three-stage architecture pipeline: 1) Bayesian Semantic Embedding Extraction; 2) Physics-Informed Prior Infusion (PINN); 3) Physics-Constrained Conditional Diffusion (PC-Diffusion).
    *   Trace the exact data flow: Raw vibration signals / Expert Text $\to$ Semantic Extraction $\to$ Physical Prior Integration $\to$ Noise-to-Signal Generation $\to$ Final Classification.
    *   Describe the interface and dimensionality matching between these three modules.
*   **Architecture Details:** High-level layer connections, tensor dimensionalities mapping between the semantic latent space and physical prior space.
*   **Formulas:**
    *   High-level flow equations bridging modules: $S = f_{sem}(text)$, $P = f_{phys}(k, c, m)$, $X_{gen} = f_{diff}(S, P, z_{noise})$

## C. Physics-Informed Prior Learning (PINN) (Target: ~800 words)
*   **Objectives:** Bridge deep learning with physical mechanics by deriving full bearing dynamics and defining the PINN solver.
*   **Content Points:**
    *   Complete derivation of rotating machinery/bearing dynamic equations (incorporating stiffness, damping, and characteristic fault frequencies).
    *   PINN network architecture specs (MLP layers extracting physical states).
    *   Methodology for training the PINN and calculating multi-part loss (data-driven + physics-driven PDE residuals).
    *   Mechanism for adaptive physical parameter learning.
*   **Formulas:**
    *   2nd-order differential equation for bearing vibration: $M\ddot{x} + C\dot{x} + Kx = F(t, \omega_{fault})$
    *   PDE Residual calculation: $\mathcal{F}_{res} = M\ddot{\hat{x}} + C\dot{\hat{x}} + K\hat{x} - F(t)$
    *   Combined Loss: $\mathcal{L}_{PINN} = \lambda_1 \mathcal{L}_{data}(\hat{x}, x) + \lambda_2 \mathcal{L}_{PDE}(\mathcal{F}_{res})$
*   **Architecture Specs:** 4-6 hidden MLP layers, e.g., 256 units per layer, `tanh` or `sin` activation functions suitable for calculating gradients (autograd) for PDEs.

## D. Physics-Constrained Diffusion Models (PC-Diffusion) (Target: ~1000 words)
*   **Objectives:** Provide the core generative mechanism with explicit and rigorous derivations of both forward and reverse processes, adding physics constraints.
*   **Content Points:**
    *   Complete derivation of the forward Markov diffusion process (Gaussian noise injection).
    *   Reparameterization trick for arbitrary timestep sampling.
    *   Reverse (denoising) process parameterized by neural networks.
    *   Physical constraint injection mechanism (e.g., via cross-attention layers merging PINN priors into the UNet bottleneck).
    *   Multi-domain loss derivations (incorporating Time-domain MSE and Frequency-domain FFT loss to assure spectral consistency).
    *   Classifier-free guidance mechanism for conditional generation using semantic vectors.
*   **Formulas:**
    *   Forward transition: $q(x_t | x_{t-1}) \sim \mathcal{N}(\sqrt{1-\beta_t}x_{t-1}, \beta_t I)$
    *   Arbitrary timestep marginal: $q(x_t | x_0) \sim \mathcal{N}(\sqrt{\bar{\alpha}_t}x_0, (1-\bar{\alpha}_t)I)$
    *   Reverse process: $p_\theta(x_{t-1} | x_t, c, p) \sim \mathcal{N}(\mu_\theta(x_t, t, c, p), \Sigma_\theta(x_t, t))$
    *   Denoising objective: $\mathcal{L}_{simple} = \mathbb{E}_{x_0, \epsilon, t} [\|\epsilon - \epsilon_\theta(x_t, t, c, p)\|^2]$
    *   Frequency domain constraint: $\mathcal{L}_{freq} = \|\text{FFT}(x_0) - \text{FFT}(\hat{x}_0)\|^2$
*   **Architecture Specs:** 1D-UNet with discrete time embeddings, 4 downsampling/upsampling blocks, ResNet blocks + Cross-Attention layers, `SiLU` activations.

## E. Bayesian Semantic Embedding (Target: ~600 words)
*   **Objectives:** Detail how unstructured expert knowledge and text are mapped to a probabilistic latent space to handle target domain uncertainty.
*   **Content Points:**
    *   Two-tier semantic space construction: combining manual hard attributes (e.g., fault sizes) with soft LLM-embedded text descriptions.
    *   Variational inference framework for defining the semantic distribution rather than point estimates.
    *   Full derivation of the Evidence Lower Bound (ELBO) and Kullback-Leibler (KL) divergence.
    *   Uncertainty propagation: How sampling from this semantic distribution feeds robust noise variations to the generator.
*   **Formulas:**
    *   Variational posterior: $q_\phi(z|x, a)$
    *   Prior distribution: $p_\theta(z|a) \sim \mathcal{N}(0, I)$
    *   ELBO objective: $\mathcal{L}_{ELBO} = \mathbb{E}_{q_\phi} [\log p_\theta(x|z,a)] - D_{KL}(q_\phi(z|x,a) \| p_\theta(z|a))$
*   **Architecture Specs:** Text encoders (e.g., BERT/SciBERT frozen heads), followed by dual projecting MLPs estimating mean $\mu$ and log-variance $\log(\sigma^2)$.

## F. Training Strategy and Algorithms (Target: ~400 words)
*   **Objectives:** Newly added subsection to meticulously describe model optimization and implementation practically.
*   **Content Points:**
    *   Three-stage training protocol explanation:
        1.  Pretrain PINN on simulated analytical physics data.
        2.  Train Bayesian Semantic Embedding on seen fault textual attributes.
        3.  Jointly train PC-Diffusion with frozen PINN/Semantic encoders.
    *   Learning rate scheduling (e.g., Cosine Annealing with Warmup) and optimizer selection (AdamW).
    *   Convergence criteria for the diffusion model and early stopping logic.
*   **Formatting Details:** Provide structural references for Algorithm 1 (Training) and Algorithm 2 (Zero-shot Inference generation).

---
*Note: This structure aims to directly address the expert reviewers' comments by expanding the ~928-word methodology to a theoretically dense, rigorous ~3900-word section fitting the IEEE TIM standard.*