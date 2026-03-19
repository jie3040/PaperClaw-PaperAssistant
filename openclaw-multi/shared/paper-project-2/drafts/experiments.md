# Experiments

## Experimental Setup
To evaluate the efficacy and robustness of the proposed PC-Diffusion framework, experiments are conducted utilizing two widely recognized benchmark datasets: the Case Western Reserve University (CWRU) bearing dataset and the Xi'an Jiaotong University - Sumyoung (XJTU-SY) bearing fault lifecycle dataset. 

The CWRU dataset provides vibration signals collected at a sampling frequency of 12kHz under varying motor loads (0-3 HP). The dataset encompasses artificial faults implemented via electro-discharge machining with fault diameters ranging from 0.007 to 0.021 inches. In contrast, the XJTU-SY dataset reflects accelerated run-to-failure conditions sampled at 25.6kHz, representing extreme industrial degradation over complex life-cycles. 

## Dataset Configuration for Zero-Shot Learning
For both datasets, we formulate a Generalized Zero-Shot Learning (GZSL) protocol by splitting the fault conditions into explicitly disjoint seen and unseen categories. The detailed dataset split configuration, explicitly listing the seen and unseen fault classes and their sample counts, is provided in Table II. During training, the PC-Diffusion model and the Bayesian embedding module only access the raw time-series signatures and semantics of the seen classes. For the test phase, evaluation targets encompass measuring the algorithm's diagnostic accuracy against a hold-out test set merging both seen and entirely unseen class signals. 

**Table II: Dataset Split Configuration for Zero-Shot Learning**
| Dataset | Task | Seen Classes (Samples) | Unseen Classes (Samples) |
|---------|------|------------------------|--------------------------|
| CWRU    | A    | Normal (1000), IF 0.007 (1000), OF 0.007 (1000) | IF 0.014 (500), OF 0.014 (500) |
| CWRU    | B    | Normal (1000), IF 0.014 (1000), OF 0.014 (1000) | IF 0.021 (500), OF 0.021 (500) |
| XJTU-SY | C    | Condition 1 (1000), Condition 2 (1000)          | Condition 3 (500), Condition 4 (500) |

## Implementation Details
Data preprocessing comprises standardized min-max normalization alongside a fixed temporal slicing window to yield uniformly sized input sequences of 1024 points. The PC-Diffusion architecture utilizes an enhanced WaveNet-based 1D convolutional network as the primary noise prediction back-bone. 1000 diffusion timesteps are simulated under a linear noise scheduling regime. The detailed architectural parameters of the network are summarized in Table I.

**Table I: Network Architecture Parameters**
| Layer | Type | Kernel Size | Stride | Channels | Output Dimension |
|-------|------|-------------|--------|----------|------------------|
| 1 | 1D Conv | 7 | 1 | 64 | 1024 x 64 |
| 2 | ResBlock (WaveNet) | 3 | 1 | 128 | 1024 x 128 |
| 3 | ResBlock (WaveNet) | 3 | 1 | 128 | 1024 x 128 |
| 4 | ResBlock (WaveNet) | 3 | 1 | 256 | 1024 x 256 |
| 5 | 1D Conv | 1 | 1 | 512 | 1024 x 512 |
| 6 | Fully Connected | - | - | - | 128 |

For model training, we utilize the **AdamW optimizer** with an initial **learning rate of 1e-4**. A cosine annealing learning rate decay schedule is applied during training. The **batch size** is set to 64, and the model is trained for a total of **200 epochs** to ensure robust convergence. LLM semantic generation for the Bayesian embedding is obtained leveraging cutting-edge large architectural models guided by engineered expert-prompt dictionaries. The entire infrastructure is implemented on PyTorch using dual RTX 4090 GPUs.

## Baselines and Evaluation Metrics
To rigorously evaluate the proposed framework, we compare it against several state-of-the-art baselines:
- **DA-DCGAN**: Dual-Attention Deep Convolutional GAN.
- **WGAN-GP**: Wasserstein GAN with Gradient Penalty.
- **DiffViT**: Vision Transformer-based Diffusion network.
- **FD-LLM**: Zero-shot diagnosis using Large Language Models.

The evaluation metrics encompass standard classification Accuracy and F1-Score. For the Generalized Zero-Shot Learning (GZSL) scenario, we additionally report the accuracy on seen classes ($S$), the accuracy on unseen classes ($U$), and their harmonic mean ($H = 2SU / (S + U)$), which stands as the primary metric for GZSL performance.