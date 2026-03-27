# Figures Plan: CAC-CycleGAN-WGP Framework

| Figure No. | Section | Title | Description |
|---|---|---|---|
| **Fig 1** | IV | Comparison of original vs. generated spectrum (Case I: Bearing) | Frequency spectrum visualization (FFT) showing Normal vs. Generated Fault samples. |
| **Fig 2** | IV | Comparison of original vs. generated spectrum (Case II: Gearbox) | Spectrum analysis of 8 health patterns (original vs. generated). |
| **Fig 3** | III | Flowchart of the proposed CAC-CycleGAN-WGP method | Multi-stage process: Preprocessing, Generation, Evaluation, and Diagnosis. |
| **Fig 4** | II / III | Architecture of the proposed GAN model | Overall Cycle-consistency and CAC feedback loop. |
| **Fig 5** | III | Detailed Generator and Discriminator Architecture | Layer-by-layer CNN design (convolutional, deconvolutional, filters). |
| **Fig 6** | IV | Experimental platform for Case I: Bearing | CWRU Test Rig setup image. |
| **Fig 7** | IV | Time-domain waveforms of bearing samples | 10 classes of vibration signals. |
| **Fig 8** | IV | Loss curves of the CAC-CycleGAN-WGP model | Discriminator and Generator loss iterations for Bearing dataset. |
| **Fig 9** | IV | Detailed spectrum comparison (10 classes - Case I) | Qualitative evidence of generation quality. |
| **Fig 10** | IV | Accuracy vs. BR curve (Multiclass Case I) | Plotting diagnostic accuracy for SVM, MLP, CNN, etc., as BR improves. |
| **Fig 11** | IV | Confusion matrices (Multiclass Case I) | Comparing BR 1:100, 1:20, 1:5, 1:1. |
| **Fig 12** | IV | Accuracy curve (Single-class Case I) | Accuracy for Class 1, 4, 7 as minority. |
| **Fig 13** | IV | Confusion matrices (Single-class Case I) | Visualizing results for Class 1 as minority. |
| **Fig 14** | IV | Gearbox internal details (Case II) | Gears (32T, 96T, 48T, 80T) and shafts layout. |
| **Fig 15** | IV | Waveforms for 8 gearbox health patterns | Representative time-domain signals. |
| **Fig 16** | IV | Detailed spectrum comparison (8 classes - Case II) | Generation results for gearbox dataset. |
| **Fig 17** | IV | Accuracy vs. BR curve (Multiclass Case II) | Multi-classifier comparison on gearbox data. |
| **Fig 18** | IV | Confusion matrices (Multiclass Case II) | Detailed results at different BRs for gearbox. |
| **Fig 19** | IV | Accuracy curve (Single-class Case II) | Accuracy for Class 3, 4, 5, 6 as minority. |
| **Fig 20** | IV | Confusion matrices (Single-class Case II) | Detailed results for Class 3 as minority. |
| **Fig 21** | IV | Comparison with RO/SMOTE/ADASYN/GAN (Bearing) | Accuracy curves vs. other methods (SVM/CNN). |
| **Fig 22** | IV | Comparison with RO/SMOTE/ADASYN/GAN (Gearbox) | Accuracy curves vs. other methods (SVM/CNN). |
