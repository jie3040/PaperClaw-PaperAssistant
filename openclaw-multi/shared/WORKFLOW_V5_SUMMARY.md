# 论文写作工作流 v5 总结（2026-03-13）

## 概述
基于 Project 1（CD-LDM）和 Project 2（PC-Diffusion）的经验，总结出的最终工作流版本。

## 核心改进（相比 v1）

### 1. 范例论文参考机制（阶段 0）
- **必须**要求用户提供 2 篇范例论文 PDF
- 用 MinerU 解析为 Markdown
- 每次给 Agent 发任务时附上范例路径
- **效果**：写作风格、公式格式、图表排版显著改善

### 2. 上下文精简机制（阶段 1.5）
- Surveyor 完成后，Leader 生成 `survey_summary.md`（<5KB）
- 给 Ideator/Architect 发任务时只附精简版
- Writer 可以附完整报告（上下文承受力强）
- **铁律**：大文件（>10KB）必须由 Leader 精简后再发给 Agent

### 3. 文献引用由 Leader 负责（阶段 5.5）
- Writer 完成所有 section 后，Leader 接管引用生成
- 使用 web_search 验证文献真实性
- 生成 references.bib + 在 .tex 中插入 \cite{key}

### 4. 概念图 Prompt 详细扩充机制
- Architect 的 artist_prompts.md 只是简略版
- Leader 必须扩充为超详细版（9KB+）
- 包含：精确像素、Hex+RGB 颜色、part 位置/尺寸、物理细节、排版规范
- 在 prompt 中多次重复 `**Important**: do not write any width scale (px)`

### 5. 多轮专家审稿机制
- 第一轮：基本完整性
- 第二轮：引用完整性、Introduction 篇幅、Figure 位置
- 第三轮：Methodology 深度（对比范例论文字数）

### 6. Agent 任务发送铁律
- 每个任务只发一次！
- 发送前必须确认 Agent 无积压
- 如果 Agent 出现 terminated，先清理积压再重发
- Leader 不接管 Agent 工作（会导致心跳打断）

### 7. 积压清理流程
1. 停止 Agent gateway（kill 进程）
2. 删除所有 .jsonl 会话文件
3. 从 sessions.json 中移除所有 hook: 条目
4. 重启 Agent gateway（需设置环境变量）
5. 确认干净后再发新任务

### 8. Leader 应急接管机制
- 当 Editor/Writer 的 API 长时间故障（>30 分钟）时
- Leader（Alex，claude-opus）直接接管
- Editor 503 → Leader 整合 sections + 调整 Figure 位置
- Writer 三次失败 → Leader 直接重写 Methodology

## 完整流程

### 阶段 0：启动前准备（Leader 主导）
1. 询问用户：Research Topic、目标期刊/会议名称
2. 要求用户提供：LaTeX 模板、2 篇范例论文 PDF
3. 用 MinerU 解析范例论文
4. 写入 project_config.md
5. 给所有 Agent 的任务都附上范例路径

### 阶段 1：文献调研
1. curl :18810 → Surveyor 检索文献
2. 审查 → ACCEPT/REVISE

### 阶段 1.5：调研报告精简（Leader）
1. Leader 读取 `survey_report.md`（完整版，30KB+）
2. Leader 生成 `survey_summary.md`（精简版，<5KB）
3. 保存到 `references/survey_summary.md`

### 阶段 2：创意生成
1. curl :18820 → Ideator 生成 idea（附精简版摘要路径）
2. 用户选定 → selected_idea.md

### 阶段 3：框架设计
1. curl :18830 → Architect 设计框架（附精简版摘要）
2. 审查 → ACCEPT/REVISE
3. Architect 额外输出：artist_prompts.md, tables_spec.md, data_plots_spec.md

### 阶段 4：内容撰写（并行）
1. curl :18840 → Writer 写各 section（可附完整调研报告）
2. Leader 读取 artist_prompts.md，扩充为超详细版
3. Leader 逐张 curl :18860 → Artist 按 prompt 生成概念图
4. Leader 读取 tables_spec.md 生成 LaTeX 表格
5. Leader 读取 data_plots_spec.md 用 matplotlib 生成数据图

### 阶段 5.5：文献引用（Leader）
1. Leader 读取已完成的论文内容（drafts/*.tex）
2. Leader 基于调研报告提取相关文献
3. Leader 使用 web_search 验证文献真实性
4. Leader 生成 references.bib
5. Leader 在 .tex 文件中插入 \cite{key}

### 阶段 6：质量审查
1. curl :18850 → Reviewer 全文审查（附精简版摘要）
2. 审查 → ACCEPT/REVISE

### 阶段 7：整合定稿
1. curl :18870 → Editor 整合 LaTeX（附精简版摘要）
2. Leader 编译 PDF
3. 通知用户

### 阶段 8：多轮专家审稿
1. 用户提出审稿意见
2. Leader 分析问题，制定修改计划
3. Leader 派发任务给相应 Agent（或自己接管）
4. 修改完成后重新编译 PDF
5. 通知用户查看，等待下一轮审稿

## 关键教训

### 上下文管理
- 31KB 调研报告 + 两篇范例论文 → Ideator 每次 API 调用超时
- 解决方案：Leader 先精简为 2.5KB 摘要再发给 Agent
- **铁律**：大文件（>10KB）必须由 Leader 精简后再发给 Agent

### 任务纪律
- 任务绝不重复发送：多次发送 → 积压 → 全部 terminated → 恶性循环
- 积压会话是隐形杀手：gateway restart 不清除 sessions，必须手动删 .jsonl + 清理 sessions.json
- Leader 不能接管 Agent 工作：心跳消息会不断打断，导致任务无法完成

### Prompt 工程
- 概念图 Prompt 简略版无法生成高质量图片
- 必须扩充为超详细版：精确像素、RGB 值、part 布局、物理细节、排版规范
- 参考 Writer 文本内容，提取图像相关描述进行扩充
- 全英文，越详细越好（9KB+ 的详细 prompt 才能生成学术级图表）

### 质量控制
- 无范例参考导致写作风格/排版不达标（Project 1 教训）
- 解决方案：阶段 0 收集 2 篇范例论文 PDF → MinerU 解析 → 全 agent 参考
- 多轮专家审稿 + 范例论文参考 = 高质量产出

### 应急预案
- Editor 和 Writer 的 API（gemini-3.1-pro-high）令牌池耗尽，长时间无法恢复
- 解决方案：Leader（Alex，claude-opus）直接接管，绕过 Agent API 故障
- Leader 必须具备接管能力，当 Agent API 故障时直接执行

## 成功案例：Project 2（PC-Diffusion）

### 最终成果
- 12 页 IEEE TIM 格式论文
- 45 条完整引用（全部真实可靠）
- Methodology 3225 词（扩充 3.5 倍）
- 6 个高质量 Figure + 3 个 Table
- 通过专家三轮审稿

### 关键成功因素
1. 范例论文参考机制
2. 上下文精简策略
3. 多轮审稿质量控制
4. Leader 应急接管能力
5. 详细 Prompt 工程

## 下一步改进方向
1. 自动化积压检测和清理
2. Agent API 健康监控
3. 更智能的上下文管理（自动判断是否需要精简）
4. 更完善的审稿标准（自动对比范例论文）
5. 更高效的 Agent 协调机制

## 配置文件更新记录
- Leader MEMORY.md：已更新（2026-03-13）
- Leader SOUL.md：已更新（2026-03-13）
- Architect SOUL.md：已更新（2026-03-13）
- Writer SOUL.md：已更新（2026-03-13）
- Artist SOUL.md：已更新（2026-03-13）
- self-improvement 记录：已创建（2026-03-13）

## 参考文档
- Project 1 总结：`/home/liaowenjie/.openclaw-multi/shared/paper-project/`
- Project 2 总结：`/home/liaowenjie/.openclaw-multi/shared/paper-project-2/`
- 详细 Prompt 示例：`/home/liaowenjie/.openclaw-multi/shared/paper-project-2/outline/detailed_concept_prompts_v2.md`
- Methodology 扩展框架示例：`/home/liaowenjie/.openclaw-multi/shared/paper-project-2/outline/methodology_expanded_outline.md`

---

## 📐 标准科研图 Prompt 范例（2026-03-13 新增）

### nana banana 风格范例
- **路径**：`/home/liaowenjie/.openclaw-multi/shared/STANDARD_CONCEPT_PROMPT_EXAMPLE.md`
- **用途**：生成概念图 Prompt 时必须参考此范例的描述风格

### 关键特征
1. **结构清晰**：分步骤（Step 1, Step 2, ...）、背景色、边框样式
2. **元素详细**：形状（rounded box, cylinder, trapezoid, ellipse）、颜色（Hex + RGB）、位置、标签、公式
3. **连接明确**：箭头类型（straight, curved, thick, dashed）、方向、分支
4. **细节丰富**：图表类型（bar chart, scatter plot, matrix）、标签、数学公式、文本说明
5. **专业术语**：学术术语、数学符号、技术名词

### 使用流程
1. **读取标准范例**：`STANDARD_CONCEPT_PROMPT_EXAMPLE.md`
2. **读取 Architect 简略版**：`outline/artist_prompts.md`
3. **读取 Writer 文本**：提取图像相关描述
4. **参考标准范例风格**：详细、逻辑清晰、术语专业
5. **扩充为超详细版**：9KB+，包含所有关键信息
6. **保存为独立文件**：`detailed_concept_prompts_english.md`
7. **逐张发给 Artist**：每张图的完整 prompt 从头到尾一次性发送

### 示例对比

❌ **简略版（Architect）**：
```
Fig.1 - Overall Architecture
- Stage 1: PINN Pre-training (blue boxes)
- Stage 2: PC-Diffusion Training (green U-Net)
- Stage 3: Bayesian Inference (purple boxes)
```

✅ **详细版（Leader 扩充后，参考 nana banana 风格）**：
```
A detailed, high-resolution scientific flowchart illustrating the PC-Diffusion framework, divided into three horizontally-arranged main stages.

Stage 1: PINN Pre-training (Left section, ~500px width, Light Blue Background, Rounded Box)

The process begins with a 'Vibration Signals (Seen Faults)' rounded box (dashed border, deep blue #1976D2, RGB: 25,118,210) at the top left, containing a waveform icon (sinusoidal pattern).

A straight arrow (2px solid, deep blue) points downward to a neural network diagram labeled 'PINN' showing 3 hidden layers with interconnected nodes (gray #757575, RGB: 117,117,117, 2px solid lines).

Below the PINN, a rounded box 'Learned Dynamics Model' (dashed border, deep blue, 8px corner radius) contains a mathematical equation in LaTeX style: "mẍ + cẋ + kx = F(t)" in serif font (Times New Roman, 14pt).

To the right of the PINN, a text box displays 'Physical Parameters: M, C, K' and 'Fault Frequencies: ω₁, ω₂, ..., ωₖ' (gray background #F5F5F5, 1px solid border).

All boxes have rounded corners (8px radius) with 2px solid borders.

[... 继续详细描述 Stage 2, Stage 3, 连接箭头、字体、间距等 ...]

Overall style: Clean academic diagram, IEEE publication quality, 1800×1000 pixels, 300 DPI, PNG format with transparent background option.

**Important**: do not put any width scale (px) and font size in the figure (pt), and do not write any label
**Important**: do not write any width scale (px)
**Important**: do not write any width scale (px)
**Important**: do not write any width scale (px)
```

### 注意事项
- **必须参考标准范例的描述风格**
- **必须包含所有关键信息**（形状、颜色、位置、连接、标签、公式）
- **必须使用全英文描述**（学术术语、专业名词、数学符号）
- **必须遵守格式铁律**（不要在 prompt 中写尺寸标注）
- **必须保存为独立文件**（便于用户手动生成）

### 参考文件
- 标准范例：`/home/liaowenjie/.openclaw-multi/shared/STANDARD_CONCEPT_PROMPT_EXAMPLE.md`
- Project 2 详细 Prompt：`/home/liaowenjie/.openclaw-multi/shared/paper-project-2/outline/detailed_concept_prompts_v2.md`
