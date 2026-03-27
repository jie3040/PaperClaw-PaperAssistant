# Project 7 Learnings — CAC-CycleGAN-WGP (2026-03-26)

## Category: best_practice

### 1. Leader 直接整合 paper.tex 比 Editor 更可靠
- **背景**：P3/P4/P5 中 Editor 多次失败或产出不正确
- **发现**：P7 直接由 Leader 创建 paper.tex，一次成功
- **规则**：阶段 5 优先 Leader 整合，Editor 仅作备选
- **优先级**：HIGH

### 2. Writer 返工会误改其他 section
- **背景**：让 Writer 扩充 method.tex，结果 experiments.tex 也被修改（5306→2023 词）
- **原因**：Writer 可能重写整个文件而非只修改指定部分
- **解决**：返工后必须 diff 对比所有文件，从原版恢复未修改文件
- **规则**：创建新版本时，只复制 Writer 修改的文件，其余从上一版本复制
- **优先级**：HIGH

### 3. curl message 过长导致 400 错误
- **背景**：将完整 method.tex 内联到 curl message 中，导致 HTTP 400
- **解决**：精简 message，让 Agent 自行读取文件路径
- **规则**：curl message 控制在 5KB 以内，大文件让 Agent 自行读取
- **优先级**：MEDIUM

### 4. Experiments 子节膨胀问题
- **背景**：Writer 产出的 experiments.tex 有 14+ 个 subsection（目标 6 个），大量重复
- **解决**：Leader 用 Python 脚本按 \subsection 切分，提取独特内容合并到 6 个主 section
- **规则**：Writer 产出后立即检查 subsection 数量，超标则 Leader 重构
- **优先级**：MEDIUM

### 5. 方法名拼写错误反复出现
- **背景**：CRC-CycleGAN-WGP 拼写错误在多个版本中反复出现
- **解决**：每次版本变更后 `grep -rn "CRC" *.tex` 全局检查
- **规则**：编译前必须全局搜索方法名变体
- **优先级**：HIGH

### 6. 用户原始表格数据必须完整展示
- **背景**：Mode B 用户提供了 7 张详细表格（含 4 个分类器 × 6 个 BR × 2 种采样方式），论文只用了简化版
- **用户反馈**：REVISE — 表格数据不完整
- **解决**：用 unzip + XML 解析 docx 提取原始数据，替换为完整表格
- **规则**：Mode B 用户提供的数据必须 100% 展示，不可简化或省略
- **优先级**：HIGH

### 7. 引用 key 不匹配
- **背景**：experiments.tex 用 `\cite{smote}` 但 bib 中是 `chawla2002smote`
- **解决**：手动建立映射表修复
- **规则**：编译后检查 bibtex warnings，修复所有 undefined citation
- **优先级**：MEDIUM

### 8. python-docx 安装失败的替代方案
- **背景**：pip 环境问题导致 python-docx 无法安装
- **解决**：`unzip -p file.docx word/document.xml | python3 -c "import re; ..."`
- **规则**：docx 文件优先用 unzip+XML 解析，不依赖第三方库
- **优先级**：LOW

## Category: correction

### 9. 不要重复输出相同内容
- **背景**：汇报状态时输出重复了两遍，用户以为串台
- **规则**：回复前检查是否有重复段落
- **优先级**：MEDIUM

### 10. 串台处理
- **背景**：用户报告"电视艺术"串台，但项目文件中无相关内容
- **解决**：grep 全局搜索确认无污染，向用户说明
- **规则**：遇到串台报告，先搜索确认，再向用户汇报结果
- **优先级**：LOW
