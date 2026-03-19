import matplotlib.pyplot as plt
import numpy as np

# Data
lambda_values = [0.01, 0.1, 0.5, 1.0, 2.0, 5.0]
accuracy_mean = [72.5, 78.3, 83.7, 85.9, 84.2, 79.8]
accuracy_std = [2.1, 1.8, 1.5, 1.2, 1.6, 2.3]

# Plot
fig, ax = plt.subplots(figsize=(8, 6))

# Line with error bars
ax.plot(lambda_values, accuracy_mean, 'o-', linewidth=2.5, markersize=8, 
        color='#1976D2', label='Unseen Class Accuracy')
ax.fill_between(lambda_values, 
                np.array(accuracy_mean) - np.array(accuracy_std),
                np.array(accuracy_mean) + np.array(accuracy_std),
                alpha=0.3, color='#1976D2')

# Mark optimal lambda
optimal_lambda = 1.0
optimal_idx = lambda_values.index(optimal_lambda)
ax.axvline(x=optimal_lambda, color='red', linestyle='--', linewidth=2, 
           label=f'Optimal λ = {optimal_lambda}')
ax.plot(optimal_lambda, accuracy_mean[optimal_idx], 'r*', markersize=15)

ax.set_xlabel('Contrastive Consistency Loss Weight (λ)', fontsize=12, fontweight='bold')
ax.set_ylabel('Unseen Class Accuracy (%)', fontsize=12, fontweight='bold')
ax.set_title('Impact of λ on Zero-Shot Performance', fontsize=14, fontweight='bold')
ax.set_xscale('log')
ax.grid(True, linestyle='--', alpha=0.7)
ax.legend(loc='lower left', frameon=True, fontsize=10)
ax.set_ylim(65, 90)

plt.tight_layout()
plt.savefig('/home/liaowenjie/.openclaw-multi/shared/paper-project-3/figures/figure_6.pdf', dpi=300, bbox_inches='tight')
plt.savefig('/home/liaowenjie/.openclaw-multi/shared/paper-project-3/figures/figure_6.png', dpi=300, bbox_inches='tight')
print("Figure 6 saved successfully!")
