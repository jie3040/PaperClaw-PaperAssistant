# Figures Plan: CMSA-Trans (Project 8) - v2

| Figure ID | Title | Type | Layout | Description |
|:---|:---|:---|:---|:---|
| **Fig. 1** | Conceptual Framework of Zero-Shot Diagnosis | Conceptual | Double-Column | Illustrates the industrial scenario where a model trained on some faults can recognize new, unseen faults by aligning them with LLM-generated semantic descriptions. Showcases the transition from raw vibration data to semantic mapping. |
| **Fig. 2** | Signal TST Encoder Block | Architecture | Single-Column | Exploded view of the Time-Series Transformer block. Highlights layer normalization, multi-head self-attention, and residual connections adapted for 1D vibration signals. |
| **Fig. 3** | **Overall Architecture of CMSA-Trans** | Architecture | Double-Column | The core technical diagram. Shows the parallel flow: (1) Vibration Signal through TST Encoder, (2) LLM generating fault text, (3) Text to Semantic Prototyping, (4) Cross-Modality Mutual Attention module, and (5) Zero-Shot Decision Head. |
| **Fig. 4** | Confusion Matrix: CWRU Dataset | Data Plot | Single-Column | Displays the accuracy per category for unseen fault types in the Case Western Reserve University (CWRU) benchmark. |
| **Fig. 5** | Confusion Matrix: SEU Dataset | Data Plot | Single-Column | Displays the accuracy per category for unseen faults in the Southeast University (SEU) Gearbox dataset split. |
| **Fig. 6** | Accuracy vs. SNR (Signal-To-Noise Ratio) | Data Plot | Single-Column | Line chart showing how the zero-shot performance holds up as noise levels increase (-4dB to 10dB), comparing CMSA-Trans with SOTA baselines. |
| **Fig. 7** | t-SNE Visualization of Feature Alignment | Visualization | Double-Column | Scatter plots showing: (a) Signal features before alignment (scattered), (b) Signal features after alignment (clustered around LLM-semantic prototypes). Uses different colors for unseen categories. |
| **Fig. 8** | Training Convergence Curves | Data Plot | Single-Column | Plots of Loss and Accuracy over epochs for both seen categories (training) and unseen categories (validation/test). |
| **Fig. 9** | **Experimental Test-bed and Data Acquisition System** | **Setup** | **Single-Column** | **Schematic and photo of the bearing/gearbox test rig, illustrating motor, test bearing, load motor, and the specific locations of accelerometers and the DAQ system.** |
| **Fig. 10** | Parameter Sensitivity: Embedding Dimension | Data Plot | Single-Column | Bar or line chart evaluating how the dimension of the semantic space affects the final diagnosis accuracy. |
