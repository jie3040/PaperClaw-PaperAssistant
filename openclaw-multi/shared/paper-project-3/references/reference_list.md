# Reference List - Zero-Shot Fault Diagnosis Literature

## 1. Zero-Shot Learning with Diffusion Models (2024-2026)

### 1.1 Core Diffusion-Based Fault Diagnosis

1. **Zero-shot fault diagnosis using soft semantic embedding of diffusion-encoded probability**
   - Authors: Not specified
   - Journal: Advanced Engineering Informatics (2025)
   - URL: https://www.sciencedirect.com/science/article/abs/pii/S1474034625002125
   - Key Contribution: SEDEP method combining diffusion-encoded features with semantic embedding
   - Relevance: Direct application of diffusion models to zero-shot fault diagnosis

2. **Virtual sample diffusion generation method guided by large language model-generated knowledge**
   - Authors: Sun, Z., Yao, Q., Shi, L. et al.
   - Journal: Journal of Zhejiang University-SCIENCE A, 26, 895–916 (2025)
   - URL: https://link.springer.com/article/10.1631/jzus.A2400560
   - Key Contribution: LLM-guided diffusion for building thermal systems zero-shot diagnosis
   - Relevance: Multimodal integration with LLM and diffusion models

3. **DifFGAN: A Fault Diagnosis Data Augmentation Method Based on Adversarial Training and Diffusion Model**
   - Authors: Zhang, H., Liu, Z., Si, H., Chen, Z., Xie, H.
   - Journal: IEEE Access 13 (2025): 108756–108765
   - Key Contribution: Hybrid GAN-Diffusion architecture for hydropower units
   - Relevance: Combines adversarial training with diffusion models

4. **BearGen: LLM-guided signal generation framework for bearing fault diagnosis**
   - Journal: Advanced Engineering Informatics (2026)
   - URL: https://www.sciencedirect.com/science/article/abs/pii/S1474034626000923
   - Key Contribution: LLM-guided diffusion model for bearing fault signal generation
   - Relevance: Multimodal approach preserving signal characteristics

5. **FaultDiffusion: Few-Shot Fault Time Series Generation with Diffusion Model**
   - arXiv: 2511.15174 (November 2025)
   - URL: https://arxiv.org/html/2511.15174
   - Key Contribution: Few-shot fault time series generation using diffusion
   - Relevance: Addresses limited labeled fault data scenarios

6. **Diffusion model-assisted cross-domain fault diagnosis for rotating machinery under limited data**
   - Journal: Reliability Engineering & System Safety (2025)
   - URL: https://www.sciencedirect.com/science/article/abs/pii/S0951832025005733
   - Key Contribution: Cross-domain diagnosis with diffusion-based data augmentation
   - Relevance: Addresses data scarcity in target domains

### 1.2 Diffusion Models for Anomaly Detection

7. **DZAD: Diffusion-based Zero-shot Anomaly Detection**
   - Authors: Zhang, T., Gao, L., Li, X., Gao, Y.
   - Conference: AAAI 2025, 39(10), 10131-10138
   - URL: https://ojs.aaai.org/index.php/AAAI/article/view/33099
   - Key Contribution: Zero-shot anomaly detection using diffusion models
   - Relevance: Theoretical foundation for zero-shot diffusion applications

8. **Composite material surface microscopic defect detection combining diffusion models and zero-shot learning**
   - Journal: Scientific Reports (December 2025)
   - URL: https://www.nature.com/articles/s41598-025-29871-w
   - Key Contribution: Deep fusion diffusion model with zero-shot mechanism
   - Relevance: Defect detection without training samples

9. **Industrial Anomaly Detection Based on Improved Diffusion Model: A Review**
   - Journal: Cognitive Computation (November 2025)
   - URL: https://link.springer.com/article/10.1007/s12559-025-10517-y
   - Key Contribution: Comprehensive review of diffusion models in industrial anomaly detection
   - Relevance: State-of-the-art survey on diffusion applications

10. **RoadFusion: Latent Diffusion Model for Pavement Defect Detection**
    - arXiv: 2507.15346 (July 2025)
    - URL: https://arxiv.org/html/2507.15346
    - Key Contribution: Dual-path feature adaptation with latent diffusion
    - Relevance: Dual-path architecture concept

## 2. GAN-Based Zero-Shot Fault Diagnosis (Baseline Methods)

### 2.1 Cycle-Consistent and Semantic-Guided GANs

11. **Cycle-Consistent Generating Network Based on Semantic Distance for Zero-Shot Fault Diagnosis**
    - Authors: Liao, W., Wu, L., Xu, S., Fujimura, S.
    - Journal: IEEE Transactions on Instrumentation and Measurement (2025)
    - Key Contribution: CycleGAN-SD with semantic distance and attribute consistency
    - Relevance: Current state-of-the-art, direct comparison baseline
    - Performance: 96.50% (TPTS), 84.06% (TEP), 76.41% (Hydraulic)

12. **Semantic-consistent embedding for zero-shot fault diagnosis**
    - Authors: Hu, Z., Zhao, H., Yao, L., Peng, J.
    - Journal: IEEE Trans. Ind. Inform., 19(5), 7022-7031 (May 2023)
    - Key Contribution: Barlow matrix for consistency loss
    - Relevance: Attribute embedding baseline

13. **Fault description based attribute transfer for zero-sample industrial fault diagnosis**
    - Authors: Feng, L., Zhao, C.
    - Journal: IEEE Trans. Ind. Inform., 17(3), 1852–1862 (March 2021)
    - Key Contribution: FDAT - first attribute-based zero-shot fault diagnosis
    - Relevance: Foundational work in the field

14. **Auxiliary Information-Guided Industrial Data Augmentation for Any-Shot Fault Learning and Diagnosis**
    - Authors: Zhuo, Y., Ge, Z.
    - Journal: IEEE Trans. Ind. Inform., 17(11), 7535–7545 (Nov. 2021)
    - Key Contribution: FAGAN with triplet loss
    - Relevance: GAN-based baseline

15. **Bias-eliminated semantic refinement for any-shot learning**
    - Authors: Feng, L., Zhao, C., Li, X.
    - Journal: IEEE Trans. Image Process., 31, 2229-2244 (2022)
    - Key Contribution: SRWGAN with semantic refinement
    - Relevance: Addresses domain shift in GANs

16. **Feature Generating Network with Attribute-Consistency for Zero-Shot Fault Diagnosis**
    - Authors: Shao, L., Lu, N., Jiang, B., Simani, S.
    - Journal: IEEE Trans. Ind. Inform. (Jan. 2024)
    - Key Contribution: VAEGAN-AR integrating VAE and GAN
    - Relevance: Hybrid generative approach

### 2.2 Data Augmentation with GANs

17. **A poisson flow-based data augmentation and lightweight diagnosis framework for imbalanced rolling bearing faults**
    - Journal: PLOS One (October 2025)
    - URL: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0332994
    - Key Contribution: PFRNet using Poisson Flow generative model
    - Relevance: Alternative generative approach

18. **CWMS-GAN: A small-sample bearing fault diagnosis method based on continuous wavelet transform**
    - Journal: PLOS One (April 2025)
    - URL: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0319202
    - Key Contribution: Continuous Wavelet Convolution with GAN
    - Relevance: Signal-specific GAN architecture

19. **An enhanced generative adversarial network for longer vibration time data generation**
    - Journal: Engineering Applications of Artificial Intelligence (April 2025)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S0952197625007602
    - Key Contribution: Enhanced GAN for variable operating conditions
    - Relevance: Addresses temporal data generation

20. **A fault diagnosis data augmentation method integrating multimodal non-Gaussian denoising diffusion GAN**
    - Journal: Advanced Engineering Informatics (August 2025)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S147403462500669X
    - Key Contribution: Hybrid diffusion-GAN architecture
    - Relevance: Combines both generative paradigms

## 3. Diffusion Model Theory and Acceleration

### 3.1 Core Diffusion Model Papers

21. **Denoising Diffusion Probabilistic Models (DDPM)**
    - Authors: Ho, J., Jain, A., Abbeel, P.
    - Conference: NeurIPS 2020
    - Key Contribution: Original DDPM formulation
    - Relevance: Theoretical foundation

22. **Denoising Diffusion Implicit Models (DDIM)**
    - Authors: Song, J., Meng, C., Ermon, S.
    - Conference: ICLR 2021
    - Key Contribution: Deterministic sampling, 50-100× speedup
    - Relevance: Fast sampling for practical applications

23. **Evolution of Fast Sampling Techniques in Diffusion Models: From DDPM to Modern Accelerated Inference**
    - Journal: TechRxiv (March 2025)
    - URL: https://www.techrxiv.org/users/904775/articles/1279447
    - Key Contribution: Comprehensive review of acceleration techniques
    - Relevance: Sampling efficiency optimization

### 3.2 Conditional Diffusion Models

24. **Classifier-Free Diffusion Guidance**
    - Authors: Ho, J., Salimans, T.
    - Key Contribution: Conditioning without explicit classifier
    - Relevance: Flexible conditioning mechanism

25. **Latent Diffusion Models**
    - Authors: Rombach, R., et al.
    - Conference: CVPR 2022
    - Key Contribution: Diffusion in compressed latent space
    - Relevance: Computational efficiency

## 4. Zero-Shot Learning Theory

### 4.1 Domain Shift and Attribute Consistency

26. **Transductive multi-view zero-shot learning**
    - Authors: Fu, Y., Hospedales, T.M., Xiang, T., Gong, S.
    - Journal: IEEE Trans. Pattern Anal. Mach. Intell., 37(11), 2332–2345 (2015)
    - Key Contribution: Domain shift problem formulation
    - Relevance: Theoretical foundation for domain shift

27. **High-Discriminative Attribute Feature Learning for Generalized Zero-Shot Learning**
    - arXiv: 2404.04953 (April 2024)
    - URL: https://arxiv.org/html/2404.04953v1
    - Key Contribution: Attribute-centric representations
    - Relevance: Addresses domain shift through attribute learning

28. **Fine-Grained Zero-Shot Learning with Attribute-Centric Representations**
    - arXiv: 2512.12219 (December 2025)
    - URL: https://arxiv.org/html/2512.12219
    - Key Contribution: Attribute-level reasoning with mixture of experts
    - Relevance: Fine-grained attribute modeling

29. **Zero-shot Domain Adaptation Based on Attribute Information**
    - Authors: Ishii, M., Sugiyama, M.
    - Conference: ACML 2019
    - URL: https://proceedings.mlr.press/v101/ishii19a.html
    - Key Contribution: Attribute-based domain adaptation
    - Relevance: Theoretical framework for attribute transfer

### 4.2 Semantic Embedding Methods

30. **SimZSL: Zero-Shot Learning Beyond a Pre-defined Semantic Embedding Space**
    - Journal: International Journal of Computer Vision (May 2025)
    - URL: https://link.springer.com/article/10.1007/s11263-025-02422-6
    - Key Contribution: κ-MDS for prototype learning from similarities
    - Relevance: Novel semantic space construction

31. **A Hybrid Semantic-Based Embedded Zero-Shot Learning Method for Compound Fault Diagnosis**
    - Journal: Measurement Science and Technology (October 2025)
    - URL: https://iopscience.iop.org/article/10.1088/1361-6501/ae1a02
    - Key Contribution: Hybrid human-defined and machine-extracted semantics
    - Relevance: Compound fault diagnosis with semantic fusion

32. **Learning visual-and-semantic knowledge embedding for zero-shot image classification**
    - Journal: Applied Intelligence (May 2022)
    - URL: https://link.springer.com/article/10.1007/s10489-022-03443-1
    - Key Contribution: Knowledge graph with GCN for ZSL
    - Relevance: Graph-based semantic embedding

## 5. Benchmark Datasets and Evaluation

### 5.1 CWRU Bearing Dataset

33. **Bearing Fault Detection and Diagnosis Using Case Western Reserve University Dataset With Deep Learning**
    - Journal: IEEE Access (2020)
    - URL: https://ieeexplore.ieee.org/document/9078761/
    - Key Contribution: Comprehensive review of CWRU dataset usage
    - Relevance: Standard benchmark reference

34. **Rolling element bearing diagnostics using the Case Western Reserve University data: A benchmark study**
    - Journal: Mechanical Systems and Signal Processing (May 2015)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S0888327015002034
    - Key Contribution: Benchmark study methodology
    - Relevance: Evaluation protocol

35. **Benchmarking deep learning models for bearing fault diagnosis using the CWRU dataset: A multi-label approach**
    - arXiv: 2407.14625 (July 2024)
    - URL: https://arxiv.org/abs/2407.14625
    - Key Contribution: Multi-label formulation addressing data leakage
    - Relevance: Proper dataset splitting methodology

### 5.2 Tennessee Eastman Process

36. **An extended Tennessee Eastman simulation dataset for fault-detection and decision support systems**
    - Journal: Computers & Chemical Engineering (March 2021)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S0098135421000594
    - Key Contribution: Extended TEP dataset with performance benchmarks
    - Relevance: Standard chemical process benchmark

37. **Benchmarking Machine Learning Fault Detection Methods on the Tennessee Eastman Process Dataset**
    - Journal: ChemRxiv (January 2026)
    - URL: https://chemrxiv.org/doi/full/10.26434/chemrxiv.10001628/v1
    - Key Contribution: Comprehensive ML method comparison
    - Relevance: Evaluation methodology

### 5.3 Other Datasets

38. **Condition monitoring of a complex hydraulic system using multivariate statistics**
    - Authors: Helwig, N., Pignanelli, E., Schütze, A.
    - Conference: IEEE IMTC (May 2015)
    - Key Contribution: Hydraulic system dataset
    - Relevance: Real-world industrial benchmark

## 6. Related Deep Learning Architectures

### 6.1 Attention Mechanisms and Transformers

39. **Deep Attention Relation Network: A Zero-Shot Learning Method for Bearing Fault Diagnosis**
    - Authors: Chen, Z., Wu, J., Deng, C., Wang, X., Wang, Y.
    - Journal: IEEE Trans. Rel., 72(1), 79–89 (March 2023)
    - Key Contribution: Attention-based zero-shot learning
    - Relevance: Attention mechanism for fault diagnosis

40. **Swin Transformer for citrus disease diagnosis with DDPM**
    - Journal: Frontiers in Plant Science (January 2026)
    - URL: https://www.frontiersin.org/journals/plant-science/articles/10.3389/fpls.2023.1267810/full
    - Key Contribution: Transformer + DDPM for disease diagnosis
    - Relevance: Transformer-diffusion integration

### 6.2 Few-Shot and Meta-Learning

41. **Few-shot cross-domain fault diagnosis via adversarial meta-learning**
    - Journal: Scientific Reports (November 2025)
    - URL: https://www.nature.com/articles/s41598-025-25854-z
    - Key Contribution: Meta-learning for cross-domain diagnosis
    - Relevance: Related learning paradigm

42. **A novel temporal classification prototype network for few-shot bearing fault detection**
    - Journal: Scientific Reports (April 2025)
    - URL: https://www.nature.com/articles/s41598-025-98963-4
    - Key Contribution: Temporal prototype network
    - Relevance: Few-shot learning approach

43. **A class-incremental learning method for fault diagnosis based on CKAN-KAN**
    - Journal: Journal of Intelligent Manufacturing (January 2026)
    - URL: https://link.springer.com/article/10.1007/s10845-025-02752-9
    - Key Contribution: Incremental learning for fault diagnosis
    - Relevance: Continual learning paradigm

## 7. Multimodal and Hybrid Approaches

44. **Enhancing multimodal fault diagnosis in mechanical systems via mixture of experts**
    - Journal: Complex & Intelligent Systems (August 2025)
    - URL: https://link.springer.com/article/10.1007/s40747-025-02061-x
    - Key Contribution: Mixture of experts with diffusion model
    - Relevance: Multimodal integration strategy

45. **Diffusion model-driven smart design and manufacturing: Prospects and challenges**
    - Journal: Journal of Manufacturing Systems (July 2025)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S0278612525001864
    - Key Contribution: Comprehensive review of diffusion in manufacturing
    - Relevance: Industrial application perspectives

## 8. Signal Processing and Feature Extraction

46. **D3A-TS: denoising-driven data augmentation in time series**
    - Journal: International Journal of Data Science and Analytics (January 2026)
    - URL: https://link.springer.com/article/10.1007/s41060-025-00990-x
    - Key Contribution: Denoising diffusion for time series augmentation
    - Relevance: Time series-specific diffusion techniques

47. **An Advanced Convolutional Neural Network for Bearing Fault Diagnosis under Limited Data**
    - arXiv: 2509.11053 (September 2025)
    - URL: https://arxiv.org/html/2509.11053
    - Key Contribution: DAC-FCF framework with CCLR-GAN
    - Relevance: Limited data scenario handling

## 9. Evaluation Metrics and Visualization

48. **A survey and experimental study for embedding-aware generative models**
    - Journal: Neural Networks (September 2024)
    - URL: https://www.sciencedirect.com/science/article/abs/pii/S0959152424001379
    - Key Contribution: Comprehensive evaluation of generative ZSL models
    - Relevance: Evaluation methodology

## 10. Recent IEEE TIM Publications (2024-2025)

49. **Adaptive Fault Diagnosis and Decision-Making Method Based on Multi-Spectrum Evaluation**
    - Authors: Zhang, X., Li, Y., Liu, Y., Li, D., Chen, X.
    - Journal: IEEE Trans. Instrum. Meas., Vol. 72 (2023)
    - Key Contribution: Multi-spectrum evaluation for traction motor bearings
    - Relevance: Recent IEEE TIM fault diagnosis work

50. **Pseudo-Label Guided Sparse Deep Belief Network Learning Method for Fault Diagnosis**
    - Authors: Chen, C., et al.
    - Journal: IEEE Trans. Instrum. Meas., Vol. 72 (Jan. 2023)
    - Key Contribution: Pseudo-labeling for radar component diagnosis
    - Relevance: Semi-supervised learning approach

---

## Summary Statistics

- **Total References:** 50+
- **Publication Period:** 2015-2026 (focus on 2024-2026)
- **Diffusion Model Papers:** 15+
- **GAN-Based Methods:** 12+
- **Zero-Shot Theory:** 8+
- **Benchmark Datasets:** 5+
- **IEEE TIM Publications:** 5+

## Key Research Gaps Identified

1. **Limited diffusion models in zero-shot fault diagnosis** (only 3-4 direct applications)
2. **No dual-path diffusion architecture** for fault diagnosis
3. **Semantic distance guidance** underexplored in diffusion models
4. **Fast sampling techniques** (DDIM) not applied to fault diagnosis
5. **Attribute consistency** not integrated with diffusion training

## Recommended Citation Format for Survey

When citing this survey in the paper:
- "According to recent literature survey (2024-2026), diffusion models have emerged as a promising alternative to GANs for fault diagnosis data augmentation [refs], with superior stability and generation quality."
- "Current state-of-the-art zero-shot fault diagnosis methods achieve 84-96% accuracy on benchmark datasets [CycleGAN-SD, VAEGAN-AR], but suffer from domain shift and training instability."
- "DDIM sampling enables 50-100× speedup compared to DDPM [ref], making diffusion models practical for real-time fault diagnosis applications."
