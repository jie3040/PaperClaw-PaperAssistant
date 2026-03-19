# Tables Specification (v2)

## Table 1: Dataset Statistics
| Dataset | # Samples | # Features | # Seen Classes | # Unseen Classes | # Attributes | Signal Type |
|---------|-----------|------------|----------------|------------------|--------------|-------------|
| TEP | 480/class | 52 | 12 | 3 | 20 | Process variables |
| Hydraulic System | 2205 | 128 | 114 | 30 | 14 | Multi-sensor |
| CWRU Bearing | 1000/class | 1024 (2D) | 7 | 3 | 8 | Vibration |

**Notes:** Include train/test split ratios and sampling frequency where applicable.

## Table 2: Main Results Comparison
| Method | TEP Acc (%) | TEP H-Mean (%) | Hydraulic Acc (%) | Hydraulic H-Mean (%) | CWRU Acc (%) | CWRU H-Mean (%) |
|--------|-------------|-----------------|--------------------|-----------------------|--------------|------------------|
| DAP | - | - | - | - | - | - |
| ESZSL | - | - | - | - | - | - |
| SAE | - | - | - | - | - | - |
| f-CLSWGAN | - | - | - | - | - | - |
| FDAT | - | - | - | - | - | - |
| SCE | - | - | - | - | - | - |
| DP-CDDPM-AC | - | - | - | - | - | - |
| CycleGAN-SD | - | - | - | - | - | - |
| **Ours (CESM-Diff)** | **-** | **-** | **-** | **-** | **-** | **-** |

**Notes:** Bold best results. Report mean ± std over 5 runs. H-Mean = harmonic mean of seen and unseen accuracy.

## Table 3: Ablation Study
| Configuration | Seen Acc (%) | Unseen Acc (%) | H-Mean (%) |
|---------------|--------------|----------------|------------|
| Full Model (CESM-Diff) | - | - | - |
| w/o CLIP Semantic (use binary attributes) | - | - | - |
| w/o Dual-Path (single feature path only) | - | - | - |
| w/o Cross-Path Attention | - | - | - |
| w/o SMI (no manifold interpolation) | - | - | - |
| w/o Attribute Consistency Loss | - | - | - |

**Notes:** All ablations on CWRU dataset. Report mean over 5 runs. This table merges the original Table 3 (Ablation) and Table 4 (Seen/Unseen Accuracy) into a single comprehensive ablation table.
