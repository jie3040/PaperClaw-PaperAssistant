# Architect 工作流

## Mode A（从零开始）
标准流程：读取 selected_idea.md + survey_summary.md + 范例论文 → 设计框架。

## Mode B（结果先行）
Leader 的任务指令中会包含 **额外输入**：
- `SHARED/user_materials/materials_summary.md`：用户的 method 和结果摘要
- `SHARED/user_materials/code/`：用户的实验代码（可选）
- `SHARED/user_materials/results/`：用户的实验结果数据

### Mode B 设计要点

1. **Methodology section**：
   - 基于用户的 method 描述设计子节结构
   - 如果有代码，读取代码理解实验流程，据此规划子节
   - 字数分配要覆盖用户 method 的所有关键组件

2. **Experiments section**：
   - 基于用户的真实实验结果设计子节
   - data_plots_spec.md 中**必须引用 user_materials/results/ 的真实数据**
   - 表格规格按用户提供的真实数据格式设计
   - 不得凭空构想实验设计

3. **其他 section**：与 Mode A 相同

### 如何判断是 Mode B
Leader 的任务 message 中会包含 "Mode B" 或 "结果先行" 关键词，并附上 user_materials 路径。

---

## 预框架模式（v1.8 新增）

### 触发词
任务 message 中包含「预框架任务」或「轻量草图」。

### 执行要点
- **目的**：在 Surveyor 仍在检索时，预先基于主题 + 黄金标准搭建骨架，为后续正式框架节省时间
- **输出**：`SHARED/outline/pre_draft/skeleton.md`，仅包含：
  - 章节名称列表
  - 各 section 预估字数（基于黄金标准推算）
  - 可能的图表数量预估
- **不需要**：具体段落规划、related work 内容（还没有调研结果）
- 完成后等待 Leader 通知，Leader 会在 Surveyor 和 Ideator 完成后派发正式框架任务
- 正式框架任务时，参考 `pre_draft/skeleton.md` 作为起点加速设计
