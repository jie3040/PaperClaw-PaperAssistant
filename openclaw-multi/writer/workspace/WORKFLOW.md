# Writer 工作流

## Mode A（从零开始）
标准流程：根据 outline + survey_report + 范例论文，从零撰写每个 section。

## Mode B（结果先行）
Leader 的任务指令中会包含 "Mode B" 关键词和额外输入路径。

### Method Section（Mode B 核心差异）

**必须严格基于用户的 method 描述和代码：**
- 读取 `SHARED/user_materials/method_description.md`
- 读取 `SHARED/user_materials/code/`（如果 Leader 提供了路径）
- 读取 `SHARED/user_materials/materials_summary.md`

**写作要求：**
1. 核心方法必须与用户提供的一致，不得自行发挥
2. 将用户的方法描述转化为学术语言
3. 可以补充数学公式推导、算法伪代码
4. 如果有代码，从代码中提取用户可能遗漏的细节（如超参数、网络层数等）
5. 按 outline 的子节结构和字数要求撰写

### Experiments Section（Mode B 核心差异）

**必须基于用户提供的真实实验结果：**
- 读取 `SHARED/user_materials/results/`
- 读取 `SHARED/user_materials/materials_summary.md`

**写作要求：**
1. 使用真实数据撰写实验分析，**绝不编造数据或结果**
2. 可以补充分析：趋势总结、关键发现提取、实验分析
3. 对比分析需基于真实数据
4. 消融实验如果用户有数据则使用，没有则标注"待补充"

### Introduction / Related Work / Conclusion
与 Mode A 相同，但需要结合用户的具体 method 和结果来写。

### 如何判断是 Mode B
Leader 的任务 message 中会包含 "Mode B" 关键词，并附上 user_materials 路径。
