# Tables Specifications

### Table I: Detailed Description of the Benchmark Datasets
- **编号**: Table I
- **标题**: Description of Fault Datasets Used in Experiments
- **列定义**:
  1. `Dataset` (Left alignment, String)
  2. `Sensors` (Center alignment, Integer)
  3. `Total Classes` (Center alignment, Integer)
  4. `Seen Classes` (Center alignment, Integer)
  5. `Unseen Classes` (Center alignment, Integer)
  6. `Textual Descriptions` (Center alignment, Integer)
- **行数据描述**:
  - TPTS (Three-Phase Transmission System), 3 sensors, 6 classes, 4 seen, 2 unseen, 6 descriptions.
  - TEP (Tennessee Eastman Process), 52 sensors, 21 classes, 16 seen, 5 unseen, 21 descriptions.
  - Hydraulic System, 14 sensors, 144 classes, 120 seen, 24 unseen, 144 descriptions.
- **格式要求**: IEEE standard format, `\toprule`, `\midrule`, `\bottomrule` from the `booktabs` package. No vertical lines.

### Table II: Zero-Shot Fault Diagnosis Accuracy Comparison
- **编号**: Table II
- **标题**: Comparison of Zero-Shot Classification Performance (Accuracy % and Harmonic Mean)
- **列定义**:
  1. `Method` (Left)
  2. `TPTS_Seen` (Center)
  3. `TPTS_Unseen` (Center)
  4. `TPTS_Harmonic` (Center)
  5. `TEP_Seen` (Center)
  6. `TEP_Unseen` (Center)
  7. `TEP_Harmonic` (Center)
- **行数据描述**: Evaluate baseline GANs (CVAE-GAN), the previous SOTA (CycleGAN-SD), standard DDPM, and Proposed CDDM. (Data will be finalized during the experiment stage, but placeholders with optimal bounds based on the survey target should be used).
- **格式要求**: Bold the highest values in each column representing Unseen and Harmonic Mean accuracy (e.g., **98.2%**). IEEE style. Use `\multirow` if needed.