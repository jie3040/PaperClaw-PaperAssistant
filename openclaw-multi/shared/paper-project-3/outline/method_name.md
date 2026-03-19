# Method Name Design

**Full Name**: CLIP-Guided Dual-path Diffusion Model
**Abbreviation**: CDDM

**Rationale**:
- **CLIP-Guided (C)**: Directly highlights the core innovation—leveraging large language models and contrastive pre-training (like CLIP) to replace rigid, discrete 0/1 binary attributes with rich, continuous semantic text embeddings as generation guides.
- **Dual-path (D)**: Highlights the structural novelty of the denoising network, operating simultaneously in the time domain and time-frequency domain to capture multi-scale features.
- **Diffusion Model (DM)**: Highlights the generative backbone, which solves the mode collapse and training instability issues of legacy GAN-based methods.
- **Acronym Length & Flow**: "CDDM" is a 4-letter acronym. It is concise, easy to remember, and perfectly matches the naming conventions common in IEEE TIM (e.g., DDPM, CDCGAN).