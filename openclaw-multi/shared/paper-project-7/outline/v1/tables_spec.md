# Tables Spec: CAC-CycleGAN-WGP Framework

| Table No. | Section | Title | Columns | Description |
|---|---|---|---|---|
| **Table I** | IV | Details of the Bearing Data Set | Class label, Load (hp), Damage Diameters (in), Sample Length, Training set, Testing set. | Source: Case Western Reserve University (CWRU) details (Normal + 9 fault classes). |
| **Table II** | IV | PCC and CS (Case I: Bearing) | Sample class (0-9), Pearson Correlation Coefficient (PCC), Cosine Similarity (CS). | Quantitative similarity evaluation of generated vs. real bearing signals. |
| **Table III** | IV | Bearing samples for Multiclass Diagnosis | Sample class (0-9), Training set (count), Testing set (count). | Specific count breakdown (Normal: 1000, Fault classes: 100). |
| **Table IV** | IV | Way to Augment Training Set | No. added generated samples, Minority class samples after augmentation, Balance Ratio (BR). | Logic from BR 1:100 to 1:1. |
| **Table V** | IV | Setup for Single-class Diagnosis (Bearing) | Case 1, Case 2, Case 3, Sample Class (0-9), Training sets, Testing sets. | For Class 1, 4, 7 as minority (500:5 setup). |
| **Table VI** | IV | Details: Gearbox Health Patterns | Gear (32T, 96T, 48T, 80T), Bearing (IS:IS, ID:IS...etc), Shaft (Input/Output). | 8 distinct patterns including chipped, eccentric, broken, ball, inner/outer race, imbalance. |
| **Table VII** | IV | Details of Gearbox Data Set | Majority class, Minority classes (1-7), Shaft speed (Hz), Sample length, Training, Testing. | Gearbox dataset sampling (Normal: 1000, Fault classes: 100). |
| **Table VIII**| IV | PCC and CS (Case II: Gearbox) | Sample class (0-7), PCC, CS. | Similarity analysis for 8 patterns of gearbox signals. |
| **Table IX** | IV | Gearbox Samples for Multiclass Diagnosis | Sample class (0-7), Training, Testing counts. | Setup: 1000 Normal vs. 10 per Fault Class. |
| **Table X** | IV | Setup for Single-class Diagnosis (Gearbox) | Case 1 to 4, Sample Class (0-7), Training sets, Testing set. | For Class 3, 4, 5, 6 as minority (1000:10 setup). |
| **Table XI** | IV | Way to Augment Gearbox Minority Classes | No. added, Samples after aug, Majority samples, Balance Ratio (BR). | Detailed steps from 10/1000 to 1000/1000. |
| **Table XII** | IV | PPC Comparison (Bearing) | Class 1-9, ACWGAN-GP, GAN, SMOTE, ADASYN. | Comparative quality of generation vs. real bearing data. |
| **Table XIII**| IV | PCC Comparison (Gearbox) | Class 1-7, ACWGAN-GP, GAN, SMOTE, ADASYN. | Comparative quality of generation vs. real gearbox data. |
| **Table XIV** | IV | Multiclass Diagnosis Accuracy (Bearing) | BR (1:100 to 1:1), SVM, Boosting, MLP, CNN. | Final diagnostic accuracy across classifiers for Case I. |
| **Table XV** | IV | Multiclass Diagnosis Accuracy (Gearbox) | BR (1:100 to 1:1), SVM, Boosting, RF, MLP, CNN. | Final diagnostic accuracy across classifiers for Case II. |
