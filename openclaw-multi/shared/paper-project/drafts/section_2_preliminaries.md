# II. Preliminaries

## A. Problem Formulation

Cross-equipment few-shot fault diagnosis addresses the challenge of transferring fault detection capabilities from a source equipment domain with abundant labeled data to a target equipment domain with severely limited samples. Formally, we define the problem as follows.

Let $\mathcal{X} \subset \mathbb{R}^{d}$ denote the signal space, where $d$ represents the dimensionality of vibration signals (e.g., time-series length or frequency bins). The fault label space is $\mathcal{Y} = \{1, 2, \ldots, C\}$, where $C$ is the number of fault classes including the healthy state. We consider two equipment domains: a source domain $\mathcal{D}_s$ and a target domain $\mathcal{D}_t$, each characterized by distinct data distributions $P_s(x, y)$ and $P_t(x, y)$ respectively.

The source equipment provides a large labeled dataset $D_s = \{(x_i^s, y_i^s)\}_{i=1}^{N_s}$, where $x_i^s \in \mathcal{X}$ is a vibration signal and $y_i^s \in \mathcal{Y}$ is the corresponding fault label, with $N_s \gg 1$ (typically thousands of samples). In contrast, the target equipment offers only a few-shot support set $D_t = \{(x_j^t, y_j^t)\}_{j=1}^{N_t}$, where $N_t = K \times C$ with $K \in \{1, 3, 5, 10\}$ samples per class. This extreme data scarcity in the target domain constitutes the cold-start problem.

The distribution shift between domains arises from multiple factors: (1) equipment-specific mechanical characteristics (bearing geometry, material properties), (2) operating conditions (rotational speed, load variations), and (3) sensor configurations (sampling rate, mounting position, sensor type). Despite these differences, fault mechanisms often share underlying physical principles across equipment types. For instance, outer race defects in bearings produce characteristic periodic impulses regardless of the specific bearing model, though the impulse frequency and amplitude may vary.

Our objective is to learn a transferable representation function $f: \mathcal{X} \rightarrow \mathcal{Z}$ that maps raw signals to a latent space $\mathcal{Z}$ where equipment-invariant fault patterns are preserved while equipment-specific confounders are factored out. Given the learned representation and the few-shot target samples $D_t$, we aim to train a classifier $g: \mathcal{Z} \rightarrow \mathcal{Y}$ that achieves high accuracy on the target test set $D_t^{test}$. The key challenge is to maximize cross-equipment generalization while minimizing the dependency on target domain samples.

## B. Latent Diffusion Models

Denoising Diffusion Probabilistic Models (DDPM) [1] have emerged as powerful generative models that learn data distributions through a gradual denoising process. A diffusion model consists of two Markov chains: a forward diffusion process that progressively corrupts data with Gaussian noise, and a reverse denoising process that learns to recover the original data.

The forward diffusion process is defined as a fixed Markov chain that gradually adds Gaussian noise to a data sample $x_0 \sim q(x_0)$ over $T$ timesteps:

$$q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1-\beta_t} x_{t-1}, \beta_t \mathbf{I})$$

where $\{\beta_t\}_{t=1}^T$ is a variance schedule with $0 < \beta_1 < \beta_2 < \cdots < \beta_T < 1$. Using the reparameterization trick, we can sample $x_t$ directly from $x_0$ in closed form:

$$x_t = \sqrt{\bar{\alpha}_t} x_0 + \sqrt{1-\bar{\alpha}_t} \epsilon, \quad \epsilon \sim \mathcal{N}(0, \mathbf{I})$$

where $\alpha_t = 1 - \beta_t$ and $\bar{\alpha}_t = \prod_{s=1}^t \alpha_s$. As $t \rightarrow T$, the distribution $q(x_T | x_0)$ approaches an isotropic Gaussian $\mathcal{N}(0, \mathbf{I})$.

The reverse process learns to denoise by approximating the posterior $q(x_{t-1}|x_t)$ with a parameterized model $p_\theta(x_{t-1}|x_t)$:

$$p_\theta(x_{t-1}|x_t) = \mathcal{N}(x_{t-1}; \mu_\theta(x_t, t), \Sigma_\theta(x_t, t))$$

In practice, the model is trained to predict the noise $\epsilon$ added at each step, leading to the simplified training objective:

$$\mathcal{L}_{\text{simple}} = \mathbb{E}_{t, x_0, \epsilon} \left[ \| \epsilon - \epsilon_\theta(x_t, t) \|^2 \right]$$

where $\epsilon_\theta$ is typically implemented as a U-Net architecture [2].

While DDPM demonstrates impressive generation quality, operating directly in high-dimensional pixel space is computationally expensive. Latent Diffusion Models (LDM) [3] address this limitation by performing diffusion in a compressed latent space. An autoencoder first maps data to a lower-dimensional latent representation: $z = \mathcal{E}(x)$, where $\mathcal{E}: \mathbb{R}^d \rightarrow \mathbb{R}^{d'}$ with $d' \ll d$. The diffusion process then operates on $z$ rather than $x$, significantly reducing computational cost. After sampling from the latent diffusion model, the decoder reconstructs the final output: $\hat{x} = \mathcal{D}(z)$.

For conditional generation, the denoising network is conditioned on additional information such as class labels $y$, leading to the conditional objective:

$$\mathcal{L}_{\text{cond}} = \mathbb{E}_{t, z_0, \epsilon, y} \left[ \| \epsilon - \epsilon_\theta(z_t, t, y) \|^2 \right]$$

This enables controlled generation of samples from specific classes, which is essential for fault diagnosis applications where we need to synthesize samples of particular fault types. The latent diffusion framework provides both computational efficiency (10-100× speedup) and stable training dynamics, making it suitable for industrial time-series generation tasks.

## C. Causal Representation Learning

Causal representation learning aims to discover latent factors that reflect the true causal structure underlying observed data, rather than merely capturing statistical correlations [4]. This is formalized through Structural Causal Models (SCM), which represent causal relationships as directed acyclic graphs (DAGs).

A structural causal model $\mathcal{M} = (\mathbf{S}, P_{\mathbf{U}})$ consists of a set of structural equations $\mathbf{S}$ and a distribution $P_{\mathbf{U}}$ over exogenous variables $\mathbf{U}$. Each endogenous variable $V_i$ is determined by a structural equation:

$$V_i := f_i(\text{PA}_i, U_i)$$

where $\text{PA}_i$ denotes the parents of $V_i$ in the causal graph and $U_i$ is an exogenous noise variable. The key distinction from standard probabilistic models is that SCMs support interventional reasoning through the do-operator [5]: $P(Y | do(X=x))$ represents the distribution of $Y$ when $X$ is set to $x$ by external intervention, breaking the natural causal mechanism.

In the context of fault diagnosis, we can construct a causal graph where fault type $F$ and equipment characteristics $E$ are root causes that influence the observed vibration signal $X$. The causal relationships can be expressed as:

$$F \rightarrow X \leftarrow E$$

Here, $F$ represents causal factors (fault type, severity, location) that are equipment-invariant, while $E$ represents spurious factors (equipment-specific confounders such as geometry, operating speed, sensor properties). The observed signal $X$ is generated by a structural equation:

$$X = h(F, E, U)$$

where $h$ is a complex nonlinear function and $U$ represents measurement noise.

Disentangled representation learning [6] seeks to decompose the latent space into independent factors that align with the underlying causal structure. A representation $z = [z_c, z_s]$ is considered disentangled if: (1) $z_c$ captures causal factors $F$ that are invariant across equipment, (2) $z_s$ captures spurious factors $E$ that are equipment-specific, and (3) $z_c$ and $z_s$ are statistically independent: $P(z_c, z_s) = P(z_c)P(z_s)$.

To achieve disentanglement, we can employ information-theoretic regularization. The total correlation (TC) [7] measures the dependence among latent variables:

$$\text{TC}(z) = \text{KL}\left( q(z) \| \prod_{i=1}^{d'} q(z_i) \right)$$

Minimizing TC encourages factorization of the latent distribution. Additionally, we enforce independence between causal and spurious factors by minimizing their mutual information:

$$\mathcal{L}_{\text{indep}} = I(z_c; z_s) = \text{KL}\left( q(z_c, z_s) \| q(z_c)q(z_s) \right)$$

Interventional training further strengthens causal learning by augmenting the training process with synthetic interventions. For example, we can simulate $do(E=e')$ by replacing equipment-specific factors while keeping fault factors fixed, forcing the model to learn the true causal direction.

The advantage of causal disentanglement for cross-equipment transfer is clear: by isolating equipment-invariant causal factors $z_c$, we can transfer fault knowledge to new equipment by only adapting the equipment-specific factors $z_s$. This reduces the few-shot learning problem from learning the entire signal distribution to learning only the equipment-specific characteristics, which requires far fewer samples.

---

**References for Section II:**

[1] J. Ho, A. Jain, and P. Abbeel, "Denoising diffusion probabilistic models," in *Proc. NeurIPS*, 2020, pp. 6840–6851.

[2] O. Ronneberger, P. Fischer, and T. Brox, "U-Net: Convolutional networks for biomedical image segmentation," in *Proc. MICCAI*, 2015, pp. 234–241.

[3] R. Rombach, A. Blattmann, D. Lorenz, P. Esser, and B. Ommer, "High-resolution image synthesis with latent diffusion models," in *Proc. CVPR*, 2022, pp. 10684–10695.

[4] B. Schölkopf, F. Locatello, S. Bauer, N. R. Ke, N. Kalchbrenner, A. Goyal, and Y. Bengio, "Toward causal representation learning," *Proc. IEEE*, vol. 109, no. 5, pp. 612–634, 2021.

[5] J. Pearl, *Causality: Models, Reasoning, and Inference*, 2nd ed. Cambridge, U.K.: Cambridge Univ. Press, 2009.

[6] I. Higgins, L. Matthey, A. Pal, C. Burgess, X. Glorot, M. Botvinick, S. Mohamed, and A. Lerchner, "β-VAE: Learning basic visual concepts with a constrained variational framework," in *Proc. ICLR*, 2017.

[7] R. T. Q. Chen, X. Li, R. Grosse, and D. Duvenaud, "Isolating sources of disentanglement in variational autoencoders," in *Proc. NeurIPS*, 2018, pp. 2610–2620.
