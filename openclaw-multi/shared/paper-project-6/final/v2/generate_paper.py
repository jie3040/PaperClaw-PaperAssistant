import os, re

BASE = "/home/liaowenjie/.openclaw-multi/shared/paper-project-6"
DRAFTS = os.path.join(BASE, "drafts/v2")
FINAL = os.path.join(BASE, "final/v1")

sections = ["abstract_intro.tex","related_work.tex","methodology_p1.tex","methodology_p2.tex","experiments_p1.tex","experiments_p2.tex","conclusion.tex"]
content = {}
for s in sections:
    with open(os.path.join(DRAFTS, s), 'r', encoding='utf-8') as f:
        content[s] = f.read()

table_map = {
    "tab:hyperparams": r"""\begin{table}[htbp]
\centering
\caption{NETWORK HYPERPARAMETERS}
\label{tab:hyperparams}
\begin{tabular}{ccc}
\hline
Component & Parameter & Value \\
\hline
Generator & Learning Rate & 0.0001 \\
 & Optimizer & Adam ($\beta_1$=0.5, $\beta_2$=0.999) \\
 & Layers & 5 FC layers \\
Discriminator & Learning Rate & 0.0001 \\
 & Optimizer & Adam ($\beta_1$=0.5, $\beta_2$=0.999) \\
 & Critic updates & 5 per generator update \\
 & Gradient penalty & $\lambda=10$ \\
SAE & Hidden units & [512, 256, 128] \\
 & Activation & ReLU \\
 & Optimizer & Adam \\
 & Batch size & 64 \\
\hline
\end{tabular}
\end{table}""",
    "tab:dataset_caseI": open(os.path.join(FINAL, "table1.tex")).read().strip(),
    "tab:dataset_caseII": open(os.path.join(FINAL, "table2.tex")).read().strip(),
    "tab:similarity": open(os.path.join(FINAL, "table3.tex")).read().strip(),
    "tab:baselines": open(os.path.join(FINAL, "table_baselines.tex")).read().strip(),
    "tab:accuracy_caseI": open(os.path.join(FINAL, "table5.tex")).read().strip(),
    "tab:accuracy_caseII": open(os.path.join(FINAL, "table6.tex")).read().strip(),
    "tab:ablation": open(os.path.join(FINAL, "table_ablation.tex")).read().strip(),
    "tab:robustness": open(os.path.join(FINAL, "table_robustness.tex")).read().strip(),
}

fig_map = {
    "fig:architecture": "fig2.png",
    "fig:sae": "fig3.png",
    "fig:spectrum_caseI": "fig4.png",
    "fig:spectrum_caseII": "fig5.png",
    "fig:confusion_caseI": "fig6.png",
    "fig:confusion_caseII": "fig7.png",
    "fig:tsne": "fig8.png",
    "fig:loss_curves": "fig9.png",
    "fig:sensitivity": "fig10_part1.png",
    "fig:sae_error": "fig10_part2.png",
}

pattern = re.compile(r'(?:(Table|Fig\.?|Figure)\s+)?(\\ref\{([^}]+)\})')

def repl(match):
    prefix = match.group(1)
    full_ref = match.group(2)
    label = match.group(3)
    if label.startswith("tab:"):
        return table_map.get(label, f"\\begin{{table}}[htbp]\n\\centering\n\\caption{{[Missing {label}]}}\n\\label{{{label}}}\n\\end{{table}}")
    elif label.startswith("fig:"):
        fname = fig_map.get(label, "placeholder.png")
        is_double = label in ["fig:architecture","fig:sae","fig:spectrum_caseI","fig:spectrum_caseII","fig:confusion_caseI","fig:confusion_caseII"]
        env = "figure*" if is_double else "figure"
        caption_text = label.replace('fig:', 'Figure ').replace('_', ' ').title()
        return f"\\begin{{{env}}}\n\\centering\n\\includegraphics[width=\\columnwidth]{{{fname}}}\n\\caption{{{caption_text}}}\n\\label{{{label}}}\n\\end{{{env}}}"
    else:
        return match.group(0)

final_sections = [pattern.sub(repl, content[s]) for s in sections]

# 组装
paper = r"""\documentclass[twocolumn]{IEEEtran}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{booktabs}
\usepackage{multirow}
\usepackage{caption}
\usepackage{natbib}
\setcitestyle{square}

\begin{document}

\title{CAC-CycleGAN-WGP: Imbalanced Bearing Fault Diagnosis via Cross-Domain Signal Translation with Wasserstein Gradient Penalty}
\author{Anonymous Author(s)}
\maketitle

"""
absintro = final_sections[0]
if r'\section{Introduction}' in absintro:
    abstract = absintro.split(r'\section{Introduction}')[0].strip()
    intro = r'\section{Introduction}' + absintro.split(r'\section{Introduction}')[1]
else:
    abstract = absintro
    intro = ""
paper += abstract + "\n\n" + intro + "\n\n"
for sec in final_sections[1:]:
    paper += sec + "\n\n"
paper += r"\bibliographystyle{plain}" + "\n"
paper += r"\bibliography{references}" + "\n"
paper += r"\end{document}"

out = os.path.join(FINAL, "paper.tex")
with open(out, 'w', encoding='utf-8') as f:
    f.write(paper)

print("✅ paper.tex final version generated")
print("Size:", len(paper))
print("Tables:", paper.count('\\begin{table}'))
print("Figures*:", paper.count('\\begin{figure*}'))
print("Figures:", paper.count('\\begin{figure}'))
PYEOF
