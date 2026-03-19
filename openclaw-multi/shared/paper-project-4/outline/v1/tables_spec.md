# Tables Specification

## Table 1: Dataset Statistics
| Dataset | # Samples | # Features | # Seen Classes | # Unseen Classes | # Attributes |
|---------|-----------|------------|----------------|------------------|--------------|
| TEP | 480/class | 52 | 12 | 3 | 20 |
| Hydraulic System | 2205 | 128 | 114 | 30 | 14 |
| CWRU Bearing | 1000 | 1024 (2D) | 7 | 3 | 8 |

## Table 2: Main Results Comparison
| Method | Group A Acc (%) | Group B Acc (%) | Group C Acc (%) | Avg Acc (%) |
|--------|-----------------|-----------------|-----------------|-------------|
| FDAT | - | - | - | - |
| SCE | - | - | - | - |
| DP-CDDPM-AC | - | - | - | - |
| CycleGAN-SD | - | - | - | - |
| **Ours (CESM-Diff)** | - | - | - | - |

## Table 3: Ablation Study
| Configuration | Seen Acc (%) | Unseen Acc (%) | Harmonic Mean (%) |
|---------------|--------------|----------------|-------------------|
| Full Model | - | - | - |
| w/o CLIP Semantic | - | - | - |
| w/o Dual-Path | - | - | - |
| w/o SMI | - | - | - |
| w/o Attribute Consistency | - | - | - |

## Table 4: Seen/Unseen Accuracy
| Method | Seen Accuracy | Unseen Accuracy | H-Mean |
|--------|---------------|-----------------|--------|
| Ours | TBD | TBD | TBD |
