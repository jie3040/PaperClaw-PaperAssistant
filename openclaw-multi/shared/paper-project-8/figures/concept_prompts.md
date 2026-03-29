# Concept Figure Prompts for CMSA-Trans Paper

This document contains detailed English prompts for generating three concept figures for the paper "Cross-Modality Semantic Alignment Transformer (CMSA-Trans): Zero-Shot Fault Diagnosis for Rotating Machinery Using LLM-Generated Fault Semantics."

---

## Fig. 1 (fig:concept) — Concept Overview: Cross-Modality Semantic Alignment

A high-resolution scientific diagram illustrating the overall concept of cross-modality semantic alignment for zero-shot fault diagnosis, presented in a professional academic style with white background.

**Left Section: Physical Signal Domain (Light Blue Background)**

On the left side, a diagram of a rotating machine (a simplified cylindrical rotor with shaft) is shown in gray, labeled "Rotating Machinery" above. Below this, a cyan waveform chart (oscilloscope style) displays a vibration signal with peaks and valleys, labeled "Raw Vibration Signal x(t)". An arrow points from the rotating machine to the waveform chart.

Adjacent to the waveform, a rounded rectangular box in light orange "Signal Encoder (CNN/FFT)" with solid border. From this box, another arrow points to a cluster of feature vectors represented as small blue circles arranged in a 2D space, labeled "Signal Features H_v" with subscript.

A dashed vertical line separates this section from the right section, with a label "Semantic Gap" above in red text.

**Center Section: Semantic Alignment Bridge (Light Yellow Background)**

In the center, a prominent bidirectional arrow connects the signal features to the semantic space, labeled "Cross-Modality Alignment". Inside this bridge region, small icons of alignment symbols (double-headed arrows between matching feature points) are shown.

Above the alignment bridge, a text label "Zero-Shot Transfer" in green, indicating that this alignment enables generalization to unseen fault classes.

**Right Section: Semantic Text Domain (Light Green Background)**

On the right side, at the top, a stylized speech bubble icon in light purple contains fault description text, labeled "LLM-Generated Fault Descriptions". Below this, a series of rounded boxes in different colors (each representing a different fault class) are shown:

- A red rounded box labeled "Imbalance Fault"
- A blue rounded box labeled "Misalignment Fault"
- A green rounded box labeled "Bearing Fault"
- An orange rounded box labeled "Unseen Fault (Zero-Shot)"

Each fault box contains short semantic text (e.g., "vibration amplitude increases", "frequency component at 2x RPM"). These semantic representations are labeled "Semantic Prototypes a_y" with subscript.

**Bottom Section: Diagnosis Output (White Background)**

At the bottom center, a large arrow points downward from the aligned features and semantic prototypes to a diagnosis result box. This box is a trapezoidal shape in yellow, labeled "Zero-Shot Classifier". Inside, a diagram shows nearest-neighbor matching between signal features and semantic prototypes, with dashed lines connecting them.

The output is a diagnosis decision displayed as a circular badge in green, labeled "Fault Type: [Predicted Class]".

**Connecting Arrows:**

- Solid straight arrows connect all components from left to right
- The alignment bridge has curved bidirectional arrows
- The final diagnosis arrow is thicker than others

**Special Requirements:** All colors use light, pastel shades. Font style: clear, professional labels suitable for academic publications.

---

## Fig. 2 (fig:transformer) — Transformer Block Structure

A detailed technical diagram showing the architecture of a standard Transformer encoder block, suitable for single-column figure placement, with white background and professional academic styling.

**Input Section (Left)**

At the left edge, a horizontal stack of small rectangles (patches) in cyan represents "Input Patch Embedding", labeled as "x_p" with subscript. Each patch is a small square (approximately 8 squares shown).

Below the patch embeddings, position indicators are shown as small circles with numbers inside (1, 2, 3, ..., N), labeled "Positional Encoding PE". A curved arrow indicates the addition of patch embeddings with positional encoding.

A large leftward arrow labeled "Input: Sequence of Patches" points to this section.

**Multi-Head Self-Attention Block (Top Branch)**

From the input, an arrow points upward to the first major block:

A large rounded rectangular box in light orange "Multi-Head Self-Attention" with solid border. Inside this box, a sub-diagram shows:

- Three parallel arrows coming in from the left (Query Q, Key K, Value V) in different colors (red, blue, green)
- A central rectangle labeled "Scaled Dot-Product Attention"
- Multiple attention heads shown as overlapping circles or parallel sub-blocks
- Output arrow exiting to the right

Below this block, a text label shows the mathematical operation: "Attention(Q, K, V) = softmax(QK^T / √d_k)V"

From the Multi-Head Self-Attention block, a curved arrow curves downward and leftward, merging with the original input—this is the residual connection, labeled "+".

Immediately after the residual connection, a smaller rounded box in light blue "Add & Norm" (representing Add + Layer Normalization), with a solid border.

**Feed-Forward Network Block (Bottom Branch)**

From the "Add & Norm" block, an arrow points downward to the second major block:

A large rounded rectangular box in light green "Feed-Forward Network (FFN)" with solid border. Inside, two smaller rectangles are shown in sequence:

- First rectangle in yellow "Linear Transformation W_1 + ReLU"
- Second rectangle in purple "Linear Transformation W_2"

From this FFN block, a curved arrow curves downward and leftward—this is another residual connection, merging with the input to the FFN.

After the residual, another smaller rounded box in light blue "Add & Norm" (second Layer Normalization), identical to the first.

**Output Section (Right)**

From the final "Add & Norm" block, a thick arrow points to the right, labeled "Output: Transformer Encoded Features".

The complete block is enclosed in a dashed rounded rectangle labeled "Transformer Encoder Block".

**Visual Details:**

- All arrows are straight with arrowheads
- Residual connections use curved arrows to show the "skip" path
- Color coding: attention block in orange tones, FFN in green tones, normalization in blue
- Mathematical notation is included as text labels

**Special Requirements:** All colors use light, pastel shades. Font style: professional academic labels with mathematical notation where appropriate.

---

## Fig. 3 (fig:framework) — CMSA-Trans Overall Framework (Full Architecture)

A comprehensive, full-width (figure*) diagram showing the complete CMSA-Trans framework, divided into three horizontal regions: Input, Processing, and Output. White background with professional academic styling.

**Top Region: Input Layer (Light Blue Background)**

**Left Sub-section: Signal Input**

At the far left, a cyan waveform chart labeled "Raw Vibration Signal x(t)" showing a time-series waveform with multiple cycles.

An arrow points from the waveform to a yellow rounded rectangular box "Patch Embedding (Conv1D)" with solid border. Below this box, a row of small cyan rectangles represents the patch sequence, labeled "x_p^1, x_p^2, ..., x_p^N".

Another arrow points from the patches to a purple rounded box "Positional Encoding", with plus sign between them shown explicitly.

The combined input is labeled "Patch Embeddings + Positional Encoding".

**Right Sub-section: Language Input**

At the top right, a stylized text icon in light pink represents "LLM (e.g., GPT-4)", with prompt text inside: "Generate fault descriptions for: [fault classes]".

An arrow points from the LLM to a set of text boxes in different colors (red, blue, green, orange), each containing fault semantic text:

- Red box: "Imbalance: vibration amplitude proportional to unbalance mass"
- Blue box: "Misalignment: 2x and 3x shaft frequency components dominate"
- Green box: "Bearing defect: high-frequency envelope peaks"
- Orange box: "Unseen class: description from LLM"

Each text box has an arrow pointing to a shared encoder block: a yellow rounded rectangle "SBERT/BERT Encoder" with solid border.

The output from the encoder is a set of semantic vectors represented as small circles in corresponding colors, labeled "Semantic Prototypes a_y" (where y represents class label).

**Middle Region: Dual-Branch Encoding (Light Yellow Background)**

**Signal Branch (Upper Middle)**

From the patch embeddings, an arrow points to a stack of transformer encoder blocks. A bracket on the right encompasses multiple identical blocks, labeled "Time Series Transformer (TST) Encoder" with "L layers" indicated.

Each TST block is represented as a rounded rectangle showing the internal structure (similar to Fig. 2). The output from this branch is labeled "Signal Features H_v" in cyan.

**Language Branch (Lower Middle)**

From the semantic prototypes, an arrow points to another stack of transformer encoder blocks, similarly bracketed and labeled "Semantic Encoder (BERT/SBERT)" with "L layers".

The output from this branch is labeled "Refined Semantic Embeddings a'_y" in purple.

**Cross-Attention Alignment Module (Center)**

In the center of this region, a special module is shown:

A cyan rounded rectangular box "Cross-Attention Module" with dashed border. Inside:

- Input 1: Signal features H_v from top (arrow pointing down)
- Input 2: Semantic embeddings a'_y from right (arrow pointing left)
- Internal structure showing attention computation between signal and semantic features
- Output: Aligned features with arrows pointing downward

Mathematical notation is included: "H_v_attended = CrossAttn(H_v, a'_y)"

**Bottom Region: Training and Inference (Light Green Background)**

**Training Branch (Left)**

From the aligned features, an arrow splits into two paths:

Path 1 (upper): Arrow to a yellow rounded box "Alignment Loss L_align" with icon showing feature alignment optimization (minimizing distance between matched signal-semantic pairs).

Path 2 (lower): Arrow to a blue rounded box "Classification Loss L_cls" with icon showing cross-entropy computation.

Both losses converge to a combined loss box: a larger orange rounded rectangle "Total Loss L = L_align + λL_cls" with λ symbol.

An arrow from the loss box points back up to indicate backpropagation, with small "⇆" symbols showing gradient flow.

**Inference Branch (Right - Zero-Shot)**

At the far right, a prominent green section for zero-shot inference:

A set of unseen class semantic prototypes (shown in dashed orange boxes) labeled "a_unseen" are input to the system.

The aligned test signal features H_v_test come from the alignment module.

An arrow points to a "Nearest Neighbor Matching" block (cyan rounded box), which computes similarity between test features and unseen class prototypes.

The output goes to a final decision block: a green circle labeled "Predicted Fault Class" with the output label.

**Connecting Flow:**

A dashed arrow from "Training" points to "Zero-Shot Inference", indicating the transfer from trained model to inference mode.

**Labels and Annotations:**

- "Training Phase" label at bottom left
- "Inference Phase (Zero-Shot)" label at bottom right
- "Unseen Classes" highlighted in orange with dashed border
- Mathematical notation throughout: L_align, L_cls, H_v, a_y, etc.

**Special Requirements:** All colors use light, pastel shades. Font style: clear, professional academic labels with mathematical notation. This is a full-width figure (figure*) showing the complete pipeline from input to output.

---