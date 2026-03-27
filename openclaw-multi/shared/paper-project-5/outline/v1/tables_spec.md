# Tables Specification: Diff-LM-GZSL

| Table | Title | Column Definitions | Row Content | Format/Requirements |
| :--- | :--- | :--- | :--- | :--- |
| **Table I** | Related Work | Paper Ref, Method Type (ZSL/GZSL), Generator (VAE/GAN/Diff), Semantic (Attr/BERT), Domain | Comparison of FDAT, SCE, GLA-ZSL, FAGAN, SRWGAN, VAEGAN-AR, FREE, GZSLCFD, DP-CDDPM-AC | Summary comparison table |
| **Table II** | Network Architecture | Layer Name, Type, Input Dim, Output Dim, Activation | Details for Encoder, Decoder, LLM Projection, and Diffusion U-Net blocks | Detailed layer-by-layer specs |
| **Table III** | TEP Dataset Stats | Fault ID, Description, Training Samples, Test Samples (Seen/Unseen) | Breakdown of the 21 fault types in TEP, partitioned for ZSL/GZSL | Standard dataset table |
| **Table IV** | Hydraulic Dataset Stats | Fault Component, Status Levels, Attributes, Samples | Detailed breakdown of the Hydraulic System multi-fault dataset | Data partition summary |
| **Table V** | CWRU Dataset Stats | Bearing Status, Load (HP), RPM, Noise Level, Samples | Specifics for bearing fault 2D spectrogram generation | Data partition summary |
| **Table VI** | Fault Semantic Descripts | Fault ID, NLP Description String, Key Semantic Attributes | Natural language inputs for the LLM encoder for each dataset | Text-heavy table |
| **Table VII** | Baseline Perf: Case I | Method Name, ZSL Acc (%), GZSL Acc (%) [S, U, H] | Accuracy metrics for 9 baselines + Diff-LM-GZSL on TEP | Comparison table with standard dev (±) |
| **Table VIII** | Baseline Perf: Case II | Method Name, ZSL Acc (%), GZSL Acc (%) [S, U, H] | Accuracy metrics for 9 baselines + Diff-LM-GZSL on Hydraulic System | Comparison table with standard dev (±) |
| **Table IX** | Baseline Perf: Case III | Method Name, ZSL Acc (%), GZSL Acc (%) [S, U, H] | Accuracy metrics for 9 baselines + Diff-LM-GZSL on CWRU Spectrogram | Comparison table with standard dev (±) |
| **Table X** | Ablation Study | Scenario ID, w/o LLM, w/o Diff, w/o Align, Overall Acc (%) | Comparison of model variants to prove the efficacy of each module | Performance per variant |
| **Table XI** | LLM vs. Attributes | Mapping approach, Semantic Dim, ZSL Acc (%), Inference Time | Comparing manual binary attributes vs. LLM-extracted embeddings | Performance contrast |
| **Table XII** | Time Complexity | Training Time (min), Inference Time per Sample (ms) | Benchmarking Diff-LM-GZSL against GAN/VAE based methods | Efficiency table |
| **Table XIII** | Hyperparameter Sens | Guidance Scale $\gamma$, Steps $T$, Latent Dim, ZSL Acc | Study of key model parameters | Multi-column grid |
| **Table XIV** | Statistical Signif. | T-test results, p-values across datasets | Proving the statistical significance of improvements over baselines | Scientific validation |

**Target Total Tables:** 14
