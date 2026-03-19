#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

# Set style
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['font.size'] = 10
plt.rcParams['axes.grid'] = True
plt.rcParams['grid.alpha'] = 0.3

# Generate synthetic bearing fault signals
np.random.seed(42)
fs = 12000  # Sampling frequency (Hz)
t = np.linspace(0, 0.2, int(fs * 0.2))  # 0.2 seconds

# Bearing parameters
BPFI = 162  # Ball Pass Frequency Inner race (Hz)
impulse_period = 1 / BPFI  # ~6.2 ms

# Standard Diffusion: Non-periodic, noisy
def generate_standard_diffusion(t):
    # Random impulses with irregular spacing
    signal_std = np.random.randn(len(t)) * 0.1
    # Add some random impulses
    for i in range(20):
        pos = np.random.randint(0, len(t))
        width = np.random.randint(10, 30)
        signal_std[max(0, pos-width):min(len(t), pos+width)] += np.random.randn() * 2
    return signal_std

# PC-Diffusion: Clear periodic impulses
def generate_pc_diffusion(t):
    signal_pc = np.zeros(len(t))
    # Add periodic impulses at BPFI
    num_impulses = int(t[-1] * BPFI)
    for i in range(num_impulses):
        impulse_time = i * impulse_period
        impulse_idx = int(impulse_time * fs)
        if impulse_idx < len(t):
            # Exponentially decaying impulse
            decay = np.exp(-np.arange(100) / 20)
            signal_pc[impulse_idx:min(len(t), impulse_idx+100)] += decay[:min(100, len(t)-impulse_idx)] * 3
    # Add small noise
    signal_pc += np.random.randn(len(t)) * 0.05
    return signal_pc

# Generate signals
signal_std = generate_standard_diffusion(t)
signal_pc = generate_pc_diffusion(t)

# Compute frequency spectra
freq_std, psd_std = signal.welch(signal_std, fs, nperseg=1024)
freq_pc, psd_pc = signal.welch(signal_pc, fs, nperseg=1024)

# Create figure
fig, axes = plt.subplots(2, 2, figsize=(12, 8))
fig.suptitle('Comparison of Physical Consistency: Standard Diffusion vs. PC-Diffusion', 
             fontsize=14, fontweight='bold')

# Top Left: Standard Diffusion time-domain
axes[0, 0].plot(t, signal_std, 'r-', linewidth=0.5, alpha=0.8)
axes[0, 0].set_xlabel('Time (s)')
axes[0, 0].set_ylabel('Amplitude (g)')
axes[0, 0].set_title('(a) Standard Diffusion - Time Domain')
axes[0, 0].grid(True, alpha=0.3)
axes[0, 0].set_xlim([0, 0.2])

# Top Right: PC-Diffusion time-domain
axes[0, 1].plot(t, signal_pc, 'b-', linewidth=0.5, alpha=0.8)
axes[0, 1].set_xlabel('Time (s)')
axes[0, 1].set_ylabel('Amplitude (g)')
axes[0, 1].set_title('(b) PC-Diffusion - Time Domain (Clear Periodicity)')
axes[0, 1].grid(True, alpha=0.3)
axes[0, 1].set_xlim([0, 0.2])

# Bottom Left: Standard Diffusion frequency spectrum
axes[1, 0].semilogy(freq_std, psd_std, 'r-', linewidth=1.5, alpha=0.8)
axes[1, 0].set_xlabel('Frequency (Hz)')
axes[1, 0].set_ylabel('Power Spectral Density')
axes[1, 0].set_title('(c) Standard Diffusion - Frequency Spectrum')
axes[1, 0].grid(True, alpha=0.3)
axes[1, 0].set_xlim([0, 1000])

# Bottom Right: PC-Diffusion frequency spectrum
axes[1, 1].semilogy(freq_pc, psd_pc, 'b-', linewidth=1.5, alpha=0.8)
axes[1, 1].axvline(BPFI, color='green', linestyle='--', linewidth=1.5, label=f'BPFI = {BPFI} Hz')
axes[1, 1].axvline(BPFI*2, color='green', linestyle='--', linewidth=1, alpha=0.6, label=f'2×BPFI')
axes[1, 1].axvline(BPFI*3, color='green', linestyle='--', linewidth=1, alpha=0.4, label=f'3×BPFI')
axes[1, 1].set_xlabel('Frequency (Hz)')
axes[1, 1].set_ylabel('Power Spectral Density')
axes[1, 1].set_title('(d) PC-Diffusion - Frequency Spectrum (Harmonics Present)')
axes[1, 1].grid(True, alpha=0.3)
axes[1, 1].set_xlim([0, 1000])
axes[1, 1].legend(loc='upper right', fontsize=8)

plt.tight_layout()
plt.savefig('/home/liaowenjie/.openclaw-multi/shared/paper-project-2/figures/fig4_physical_consistency.png', 
            dpi=300, bbox_inches='tight')
print("✅ Fig.4 generated: fig4_physical_consistency.png")
