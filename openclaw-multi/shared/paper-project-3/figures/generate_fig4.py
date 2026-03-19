import matplotlib.pyplot as plt
import numpy as np

# Data
datasets = ['TPTS', 'TEP', 'Hydraulic']
methods = ['CycleGAN-SD', 'CVAE-GAN', 'Standard DDPM', 'Proposed CDDM']
colors = ['#E41A1C', '#377EB8', '#4DAF4A', '#984EA3']

# Harmonic Mean Accuracy (%)
data = {
    'TPTS': [83.0, 78.5, 84.5, 88.5],
    'TEP': [80.3, 73.2, 81.7, 85.9],
    'Hydraulic': [76.8, 71.4, 78.2, 82.6]
}

# Plot
fig, ax = plt.subplots(figsize=(10, 6))
x = np.arange(len(datasets))
width = 0.2

for i, method in enumerate(methods):
    values = [data[ds][i] for ds in datasets]
    bars = ax.bar(x + i*width, values, width, label=method, 
                   color=colors[i], edgecolor='black', linewidth=1.2)
    
    # Annotate CDDM bars
    if method == 'Proposed CDDM':
        for j, bar in enumerate(bars):
            height = bar.get_height()
            ax.text(bar.get_x() + bar.get_width()/2., height + 0.5,
                    f'{height:.1f}%', ha='center', va='bottom', fontsize=10, fontweight='bold')

ax.set_xlabel('Datasets', fontsize=12, fontweight='bold')
ax.set_ylabel('Harmonic Mean Accuracy (%)', fontsize=12, fontweight='bold')
ax.set_title('Zero-Shot Fault Diagnosis Performance Comparison', fontsize=14, fontweight='bold')
ax.set_xticks(x + width * 1.5)
ax.set_xticklabels(datasets, fontsize=11)
ax.set_ylim(40, 100)
ax.legend(loc='upper left', frameon=False, fontsize=10)
ax.grid(axis='y', linestyle='--', alpha=0.7)

plt.tight_layout()
plt.savefig('/home/liaowenjie/.openclaw-multi/shared/paper-project-3/figures/figure_4.pdf', dpi=300, bbox_inches='tight')
plt.savefig('/home/liaowenjie/.openclaw-multi/shared/paper-project-3/figures/figure_4.png', dpi=300, bbox_inches='tight')
print("Figure 4 saved successfully!")
