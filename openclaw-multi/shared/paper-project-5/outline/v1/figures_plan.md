# Figures Plan: Diff-LM-GZSL

| Figure | Title | Description | Placement |
| :--- | :--- | :--- | :--- |
| **Fig. 1** | Conceptual Overview | Comparison between traditional discrete attribute ZSL and proposed language-driven diffusion ZSL. Highlights the transition from binary vectors to continuous LLM-based embeddings. | Section II-P7 |
| **Fig. 2** | Overall Framework | High-level architecture: Features → LLM Encoder → Conditional Latent Diffusion Model → Synthetic Feature Generator → Classifier. | Section IV-A |
| **Fig. 3** | Semantic Embedding Module | Detailed view of the BERT/LLM integration. Showing how natural language fault descriptions (e.g., "valve leakage in HP circuit") are mapped to semantic vectors. | Section IV-C |
| **Fig. 4** | Conditional Diffusion Process | Visualization of the forward (noise addition) and reverse (denoising conditioned on LLM vectors) processes in the latent space. | Section IV-D |
| **Fig. 5** | Case I: TEP Metrics | Confusion matrix and accuracy bar charts for the TEP dataset across different ZSL/GZSL scenarios. | Section V-B |
| **Fig. 6** | Case II: Hydraulic Metrics | Confusion matrix and accuracy comparison for the Hydraulic System dataset. | Section V-C |
| **Fig. 7** | Case III: CWRU Metrics | Results for 2D Spectrogram data from CWRU, showing performance on image-like features. | Section V-D |
| **Fig. 8** | t-SNE Visualization | Visual representation of real vs. synthesized features for unseen classes to demonstrate generative fidelity. | Section V-B |
| **Fig. 9** | Loss Convergence | Training loss curves for the diffusion model and the semantic alignment loss. | Section V-E |
| **Fig. 10** | Parameter Sensitivity | Influence of noise levels and semantic guidance scale on final diagnosis accuracy. | Section V-E |
| **Fig. 11** | Error Analysis | Qualitative analysis of misclassified samples in the GZSL setting. | Section V-E |

**Target Total Figures:** 11
