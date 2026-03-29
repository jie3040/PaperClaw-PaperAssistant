# Tables Spec: CMSA-Trans (Project 8) - v2

| Table ID | Title | Column Definitions | Row Description | Format Requirements |
|:---|:---|:---|:---|:---|
| **Table 1** | Example of LLM-Generated Fault Descriptions | Fault Category, LLM Prompt, Generated Description (Snippet), Target Attribute Vector Sample | Examples: "Inner Race Fault", "Outer Race Fault", "Rolling Element Fault" at various intensities. | Single-Column, LaTeX `tabular`. |
| **Table 2** | Description of Rotating Machinery Benchmark Datasets | Dataset Name, Sampling Freq, Number of Samples (Seen/Unseen), Load Type, Speed (rpm) | Rows: CWRU Bearing Dataset, SEU Gearbox Dataset. | Single-Column, summarizes experimental data. |
| **Table 3** | Hyperparameter Settings for CMSA-Trans | Phase, Parameter, Value | Rows: Learning Rate (1e-4), Batch Size (64), Optim (Adam), Transformer Layers (4), Attention Heads (8), Latent Dimension (512). | Single-Column, clear technical specification. |
| **Table 4** | **Zero-Shot Diagnosis Performance on Dataset 1 (CWRU)** | Method, Category 1 (Unseen), Category 2 (Unseen), ..., Average Accuracy (%) | Methods: WDCNN (Supervised Baseline), ZSL-GAN, Deep Multi-modal ZSL, **CMSA-Trans (Ours)**. | Double-Column (* ), highlight best results in bold. |
| **Table 5** | **Zero-Shot Diagnosis Performance on Dataset 2 (SEU)** | Method, Category 1 (Unseen), Category 2 (Unseen), ..., Average Accuracy (%) | Similar to Table 4, but for the Southeast University Gearbox dataset. | Double-Column (* ), highlight best results in bold. |
| **Table 6** | Ablation Study of Components | Experiment Configuration, Accuracy (Seen Class), Accuracy (Unseen Class) | Rows: Full CMSA-Trans, w/o TST Signal Encoder (using CNN), w/o LLM Semantics (using Word2Vec), w/o Cross-Attention (Concatenation only). | Single-Column, shows importance of each module. |
| **Table 7** | **Performance Metrics and Multi-modal Similarity Analysis** | **Method, Cosine Similarity, Precision, Recall, F1-score, Harmonic Mean (HM)** | **Rows for CMSA-Trans and comparative baselines. Provides a finer-grained performance breakdown of the cross-modal alignment accuracy.** | **Single-Column, detailed statistical breakdown.** |
