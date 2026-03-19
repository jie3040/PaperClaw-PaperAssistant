# 学习记录：概念图 Prompt 生成规则简化（2026-03-13）

## 问题描述
在 Project 3 中，Leader 生成的概念图 Prompt 过于详细和复杂：
- 文件大小：15KB
- 行数：259 行
- 包含过多精确细节：像素尺寸（300×100px）、RGB 值（RGB: 25,118,210）、箭头粗细（4px）、字体大小（14pt）等

## 根本原因
1. **误解了 "详细" 的含义**：认为越详细越好，导致过度规格化
2. **过度参考 Project 2 的经验**：Project 2 强调 "超详细版（9KB+）"，但那是针对特定问题
3. **没有理解 nana banana 范例的精髓**：范例是 "详细但不过度精确"

## 用户反馈
"生成的概念图 prompt 不需要严格的元素详细度，以后的概念图的 prompt 的生成只需要严格参考 nana banana 标准范例"

## 正确做法

### 参考标准
**唯一参考**：`STANDARD_CONCEPT_PROMPT_EXAMPLE.md`

### 需要的内容
- ✅ 清晰的结构描述（如 "divided into three main steps"）
- ✅ 元素类型（rounded box, cylinder, trapezoid, ellipse, arrow）
- ✅ 相对位置（left, right, top, bottom, center）
- ✅ 颜色主题（blue, green, orange，不需要 Hex 或 RGB）
- ✅ 数学符号（$c_0$, $X_0$, $\epsilon_\theta$）
- ✅ 连接关系（arrows connect, flows from A to B）
- ✅ 文本标签（block names, titles）

### 不需要的内容
- ❌ 精确像素尺寸（如 300×100px）
- ❌ 精确 RGB 值（如 RGB: 25,118,210）
- ❌ 箭头粗细（如 4px solid）
- ❌ 字体大小（如 14pt）
- ❌ 边框宽度（如 2px border）
- ❌ 圆角半径（如 8px corner radius）

### 对比示例

#### ❌ 错误（过度详细）
```
A rounded rectangular box (300×100px, light gray background #F5F5F5, 
2px solid border #757575, corner radius 8px, drop shadow 0 2px 4px rgba(0,0,0,0.1)) 
labeled "Fault Description" in sans-serif font (Arial, 14pt, bold, #424242, 
letter-spacing 0.5px).

Inside this box, sample text is displayed in sans-serif font 
(Arial, 11pt, regular, #424242, line-height 1.5, text-align left, 
padding 10px):
"Bearing outer race fault with high-frequency impacts..."
```

#### ✅ 正确（参考 nana banana）
```
A rounded box labelled 'Fault Description' (light gray background, 
solid border) on the left.

Inside the box, sample text describing the fault characteristics:
"Bearing outer race fault with high-frequency impacts..."
```

## 改进措施
1. **严格参考 nana banana 范例**：不要自己发挥，不要过度详细
2. **描述结构和关系，不描述精确规格**：重点是 "what" 和 "where"，不是 "how many pixels"
3. **颜色用主题词，不用 Hex/RGB**：blue, green, orange 即可
4. **长度控制**：每张图 ~50-100 行描述即可，不要超过 150 行

## 教训
- **详细 ≠ 精确**：详细是指描述清晰完整，不是指规格精确到像素
- **生图模型不需要精确规格**：Gemini/DALL-E 会自己决定具体尺寸和样式
- **简洁清晰更有效**：过度详细反而可能干扰模型理解

## 相关文件
- SOUL.md：已添加 "概念图 Prompt 生成规则"
- MEMORY.md：已记录到 memory/2026-03-13.md
- 本文件：.learnings/concept-prompt-simplification.md
