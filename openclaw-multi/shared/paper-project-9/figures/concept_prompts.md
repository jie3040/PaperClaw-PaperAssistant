# Detailed Concept Prompts for VibSemAlign Figures

## Fig. 1: VibSemAlign Overall Architecture (Pipeline Overview)

A detailed, high-resolution scientific flowchart illustrating the VibSemAlign overall architecture pipeline, arranged horizontally across double-column width with compact vertical stacking for single-column height.

**Left Section: Input Processing (Light Blue Background, Solid Rounded Boxes)**

Starts with a gray cylinder icon labeled 'Raw Vibration Signal x_vib ∈ ℝ^T (48 kHz, T≈2^16)' on the far left.

A straight rightward arrow leads to a cyan upward-tapering trapezoidal block labeled 'STFT Spectrogram Generation' with formula 'S(ω,t) = ∫ x(τ) w(τ-t) e^{-jωτ} dτ' below, Hann window noted.

From this block, a rightward arrow to an example spectrogram visualization: a 2D heat map with horizontal time axis, vertical frequency axis labeled '0-12 kHz', color bar from blue (low) to yellow (high), showing periodic impacts.

**Middle Section: VLM Encoding and Alignment (Light Green Background, Dashed Rounded Boxes)**

Spectrogram feeds into a yellow rounded rectangular box 'Vision Encoder E_v (CLIP ViT-L/14@336px)' outputting embedding 'z_vib ∈ ℝ^{768}'.

Parallel upper path: white rounded box 'Semantic Prompt t_y' (e.g., 'Bearing outer race defect BPFO impacts, 2 HP load') to light purple box 'Text Encoder E_t' outputting 'z_t ∈ ℝ^{768}'.

Both embeddings converge with curved arrows into an orange dashed rounded box 'Vibration-Semantic Contrastive Loss ℒ_contrast = -log[exp(sim(z_v,z_t^+)/τ) / Σ exp(sim(z_v,z_t^-)/τ)]', τ=0.07.

Below it, a light red box 'Cross-Attention Fusion: Q=z_t, K/V=z_vib, O=softmax(QK^T / √d_k) V'.

Thick horizontal arrow connects sections.

**Right Section: Adaptation and Inference (Light Purple Background)**

Fused embedding 'tilde{z}' to a green dashed box 'MAML Adaptation Loop' with inner loop arrow 'θ' → 'θ' - α ∇ℒ_task' and outer loop 'min_θ E[ℒ_task(θ')]'.

Final rightward arrow to a trapezoid 'Fault Classifier' with output bar 'p(y) = softmax(sim(tilde{z}, z_t^y)/τ)', classes: Normal, Ball, Inner, Outer.

Straight arrows connect all primary blocks; dashed arrows show negative samples and meta-gradients.

## Fig. 2: Dual-Modality Alignment Module

A detailed scientific diagram of the dual-modality alignment module, horizontal layout for double-column width, single-column height.

**Left: Inputs (Light Blue)**

Upper: spectrogram example as in Fig1.

Lower: text prompt box 't_y: Spectrogram of inner race fault BPFI modulation'.

Both arrow to central hub.

**Central: Encoders (Light Green)**

z_vib from vision encoder (yellow box), z_t from text (purple box).

**Alignment (Light Orange Dashed Box)**

Bipartite graph-like: positive pair z_vib -- solid green line sim/τ to z_t^+, negatives dashed red lines to z_t^- (4 shown).

Below: InfoNCE loss formula.

Arrow to aligned space: two overlapping circles 'Embedding Space ℤ', vib points clustered per fault, text points matched.

Arrows show pull positives closer, push negatives apart.

**Right: Outputs**

Fused tilde{z} to probe classifier.

All light pastel colors, Comic Sans MS font.

## Fig. 3: Cross-Attention Decoder

High-resolution diagram of cross-attention decoder, structured as multi-layer stack, double-column wide, single-column tall.

**Inputs (Top, Light Blue)**

Left: z_vib sequence as horizontal ellipses 'vib tokens'.

Right: z_t as Q ellipses 'text tokens'.

**Multi-Head Attention Layer (Light Orange)**

Q from text (purple arrows), K/V from vib (blue).

8 heads shown as parallel small matrices: QK^T / √64 → softmax → * V.

Concat heads, linear proj to O.

Residual: z_vib + LN(O) → tilde{z_vib}.

Visualized attention map heatmap overlay on spectrogram, highlighting fault frequencies.

**Fusion Output (Bottom)**

Enriched vib embedding with text semantics.

Formulas labeled.

Light pastel tones, Comic Sans MS.

## Fig. 4: MAML Meta-Learning Adaptation Loop

Nested loop diagram for MAML adaptation, circular/loop layout fitting double-column width, single-column height.

**Outer Loop (Light Green Background)**

Central meta-θ.

Sample tasks from p(ℳ): boxes 'Task τ ~ Load Shift, Fault Sim'.

**Inner Loop (Light Purple Dashed Boxes, Multiple Iterations)**

Per task: support set S_K → θ' = θ - α ∇ℒ_total(θ; S_K), 5 steps shown as chain.

Query ℒ_task(θ') averaged over tasks.

**Meta Update**

Gradient from query losses back to θ.

Visual: before/after adaptation clusters tightening in t-SNE mini-plot.

Formulas: inner θ', outer min E[ℒ(θ')].

Few-shot K=1,5,10 noted.

Light pastel colors, Comic Sans MS font.

**Special Requirements for All Figures: Use light pastel color schemes throughout (pale blues, greens, oranges, purples), Comic Sans MS font for all text and labels.**
