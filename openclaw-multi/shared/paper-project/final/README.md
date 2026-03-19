# Paper Final Compilation - README

## Overview

This directory contains the final compiled paper for submission to IEEE Transactions on Instrumentation and Measurement (TIM).

**Title:** Causal Disentangled Latent Diffusion Model for Cross-Equipment Few-Shot Fault Diagnosis

**Status:** LaTeX source complete, PDF compilation pending (requires LaTeX installation)

## Files

- `paper_final.tex` - Main LaTeX source file (22.6 KB)
- `references.bib` - BibTeX bibliography (8.6 KB, 30+ references)
- `changelog.md` - Detailed change log addressing review comments
- `README.md` - This file
- `*.png` - Figure files (copied from figures/ directory)

## Compilation Instructions

### Prerequisites

Install LaTeX (if not already installed):

```bash
# Full installation (recommended, ~4GB)
sudo apt-get update
sudo apt-get install -y texlive-full

# Or minimal installation (~500MB)
sudo apt-get install -y texlive-latex-base texlive-latex-extra texlive-publishers texlive-bibtex-extra
```

### Compile PDF

```bash
cd /home/liaowenjie/.openclaw-multi/shared/paper-project/final

# First pass - generate auxiliary files
pdflatex -interaction=nonstopmode paper_final.tex

# Generate bibliography
bibtex paper_final

# Second pass - resolve citations
pdflatex -interaction=nonstopmode paper_final.tex

# Third pass - resolve cross-references
pdflatex -interaction=nonstopmode paper_final.tex
```

The final PDF will be: `paper_final.pdf`

### Quick Compilation Script

```bash
#!/bin/bash
cd /home/liaowenjie/.openclaw-multi/shared/paper-project/final
pdflatex -interaction=nonstopmode paper_final.tex
bibtex paper_final
pdflatex -interaction=nonstopmode paper_final.tex
pdflatex -interaction=nonstopmode paper_final.tex
echo "Compilation complete: paper_final.pdf"
```

## Document Structure

- **Abstract** (250 words)
- **Section I: Introduction** (~3 pages)
  - Background and motivation
  - Related work (5 subsections)
  - Contributions
- **Section II: Preliminaries** (~2 pages)
  - Problem formulation
  - Latent diffusion models
  - Causal representation learning
- **Section III: Proposed Method** (~4 pages)
  - Overall architecture
  - Causal disentanglement module
  - Latent space diffusion process
  - Cross-equipment transfer strategy
  - Few-shot adaptation via meta-learning
- **Section IV: Experiments** (~3 pages)
  - Datasets and experimental setup
  - Comparison with baselines
  - Ablation studies
  - Cross-domain generalization
- **Section V: Discussion** (~2 pages)
  - Key findings
  - Advantages and limitations
  - Practical implications
  - Future directions
- **Section VI: Conclusion** (~1.5 pages)
- **References** (30+ citations)

**Estimated total length:** 12-14 pages

## Key Results

- **92.3% accuracy** with only K=5 samples per class
- **18.7% improvement** over best baseline
- **3-5× reduction** in data collection requirements
- **10× computational efficiency** vs. pixel-space diffusion

## Review Compliance

All Priority 1 issues from the review report have been addressed:
- ✅ Notation consistency
- ✅ Figure references corrected
- ✅ Mathematical formulations clarified
- ✅ Experimental details completed

See `changelog.md` for detailed list of changes.

## Figures

The following figures are referenced in the paper:
- Fig. 1: Architecture diagram
- Fig. 3: Workflow and causal graph
- Fig. 6a/6b: Causal/spurious subspace clustering
- Fig. 11-16: Experimental results

Figures are copied from: `/home/liaowenjie/.openclaw-multi/shared/paper-project/figures/`

## Next Steps

1. Install LaTeX (if needed)
2. Compile PDF using instructions above
3. Review PDF for formatting issues
4. Verify all figures are properly placed
5. Final proofreading
6. Submit to journal

## Troubleshooting

### Missing IEEEtran.cls

If you get "IEEEtran.cls not found":
```bash
sudo apt-get install texlive-publishers
```

### Missing packages

If compilation fails due to missing packages:
```bash
sudo apt-get install texlive-latex-extra texlive-fonts-extra
```

### Bibliography not appearing

Make sure to run bibtex between pdflatex runs:
```bash
pdflatex paper_final.tex
bibtex paper_final    # Note: no .tex extension
pdflatex paper_final.tex
pdflatex paper_final.tex
```

## Contact

For questions about the paper content or compilation, refer to:
- Review report: `/home/liaowenjie/.openclaw-multi/shared/paper-project/reviews/review_report.md`
- Source sections: `/home/liaowenjie/.openclaw-multi/shared/paper-project/drafts/`
