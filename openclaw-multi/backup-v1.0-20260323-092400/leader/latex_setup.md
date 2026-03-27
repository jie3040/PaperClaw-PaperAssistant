# PDF编译环境配置

## 系统要求

编译LaTeX论文需要安装TeX Live：

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install texlive-latex-base texlive-latex-extra texlive-fonts-recommended

# 完整安装（推荐，包含所有包）
sudo apt-get install texlive-full

# 中文支持
sudo apt-get install texlive-lang-chinese
```

## 验证安装

```bash
pdflatex --version
bibtex --version
```

## 编译论文

```bash
# 使用编译脚本
bash /home/liaowenjie/.openclaw-multi/leader/workspace/scripts/compile_pdf.sh paper /path/to/paper/dir

# 或手动编译
cd /path/to/paper/dir
pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
```

## 常见问题

### 缺少LaTeX包

如果编译时提示缺少某个包（如`\usepackage{xxx}`），安装对应的包：

```bash
# 搜索包
apt-cache search texlive | grep xxx

# 安装
sudo apt-get install texlive-xxx
```

### 中文显示问题

使用XeLaTeX代替pdflatex：

```bash
xelatex paper.tex
```

在LaTeX文档中添加：

```latex
\usepackage{xeCJK}
\setCJKmainfont{SimSun}  % 或其他中文字体
```

### 编译超时

大型论文可能需要较长编译时间，增加超时限制或分段编译。

## 当前状态

- ❌ pdflatex: 未安装
- ❌ bibtex: 未安装

需要安装后才能编译PDF。
