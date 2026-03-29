# 4.5a R1 修改任务清单

## P0（必须修复）

### 1. experiments.tex 扩充（1698→2300+ 词）
- 4.1 添加 Table 2（数据集描述）和 Fig.9（实验平台）的引用和描述（+200词）
- 4.2 添加 Table 3（超参数）引用（+100词）
- 4.3 添加 Table 4, 5（对比结果）、Table 7（多指标）、Fig.4, 5（混淆矩阵）引用和分析（+400词）
- 4.5 添加 Fig.8（训练曲线）分析（+100词）
- 添加 8+ 篇引用（数据集论文、基线方法论文、评估指标）

### 2. 图表引用补全（11个缺失）
- introduction.tex: 添加 \ref{fig:concept} (Fig.1)
- background.tex: 添加 \ref{fig:transformer} (Fig.2)
- method.tex: 添加 \ref{fig:framework} (Fig.3), \ref{tab:llm_semantics} (Table 1)
- experiments.tex: 添加 Table 2-5,7 和 Fig.4,5,8,9 引用

### 3. 引用补全
- method.tex: 添加 4+ 篇引用（CLIP/SBERT、Transformer、对比损失）
- experiments.tex: 添加 8+ 篇引用

## P1（强烈建议）

### 4. background.tex 补充至 1050+ 词（当前 993）
### 5. 全文统一命名为 CMSA-Trans（替换所有 CMSAT）
### 6. experiments.tex 中 Harmonic Mean 公式编号为 Eq.(8)
### 7. background → method 过渡句
### 8. 基线方法引用（WDCNN, ZSL-GAN, DM-ZSL, RN-ZSL, ALSE 原始论文）
