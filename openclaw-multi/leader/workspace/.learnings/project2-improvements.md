# Project 2 改进记录（2026-03-13）

## 背景
Project 1（CD-LDM）全流程跑通但质量不达标。Project 2（PC-Diffusion）通过多项改进，最终通过专家三轮审稿。

## 核心改进

### 1. 范例论文参考机制（阶段 0）
**问题**：Project 1 无范例导致写作风格偏离期刊标准
**解决方案**：
- 要求用户提供 2 篇范例论文 PDF
- 用 MinerU 解析为 Markdown
- 每次给 Agent 发任务时附上范例路径
**效果**：写作风格、公式格式、图表排版显著改善

### 2. 上下文精简机制（阶段 1.5）
**问题**：31KB 调研报告 + 两篇范例论文 → Ideator 每次 API 调用超时（耗费 3+ 小时排查）
**解决方案**：
- Leader 先精简为 survey_summary.md（<5KB）
- 给 Ideator/Architect 发任务时只附精简版
- Writer 可以附完整报告（上下文承受力强）
**效果**：Ideator 不再因上下文过大而 terminated

### 3. 文献引用由 Leader 负责（阶段 5.5）
**问题**：Writer 处理引用任务容易超时/卡住
**解决方案**：
- Writer 完成所有 section 后，Leader 接管引用生成
- 使用 web_search 验证文献真实性
- 生成 references.bib + 在 .tex 中插入 \cite{key}
**效果**：引用完整、真实可靠

### 4. 概念图 Prompt 详细扩充机制
**问题**：Architect 的 prompt 太简略（"蓝色框"、"绿色 U-Net"）→ Artist 生成质量差
**解决方案**：
- Leader 必须扩充为超详细版（9KB+）
- 包含：精确像素、Hex+RGB 颜色、part 位置/尺寸、物理细节、排版规范
- 全英文，越详细越好
- 在 prompt 中多次重复 `**Important**: do not write any width scale (px)`
**效果**：生成的概念图质量显著提升

### 5. 多轮专家审稿机制
**问题**：Project 1 直接产出 PDF，无质量控制
**解决方案**：
- 第一轮：基本完整性
- 第二轮：引用完整性、Introduction 篇幅、Figure 位置
- 第三轮：Methodology 深度（对比范例论文字数）
**效果**：论文质量逐步提升，最终通过专家评审

### 6. Agent 任务发送铁律
**问题**：重复发送任务 → 积压 → 全部 terminated → 恶性循环
**解决方案**：
- 每个任务只发一次！
- 发送前必须确认 Agent 无积压
- 如果 Agent 出现 terminated，先清理积压再重发
- Leader 不接管 Agent 工作（会导致心跳打断）
**效果**：避免了 Agent 积压导致的连锁失败

### 7. 积压清理流程
**问题**：Agent 积压会话导致新任务无法执行
**解决方案**：
1. 停止 Agent gateway（kill 进程）
2. 删除所有 .jsonl 会话文件
3. 从 sessions.json 中移除所有 hook: 条目
4. 重启 Agent gateway（需设置环境变量）
5. 确认干净后再发新任务
**效果**：成功清理了 Writer 的多次积压

### 8. Leader 应急接管机制
**问题**：Editor 和 Writer 的 API（gemini-3.1-pro-high）令牌池耗尽，长时间无法恢复
**解决方案**：
- Leader（Alex，claude-opus）直接接管
- Editor 503 → Leader 整合 Introduction + Related Work + 调整 Figure 位置
- Writer 三次失败 → Leader 直接按 Architect 框架重写 Methodology（3225 词）
**效果**：绕过了 Agent API 故障，保证项目按时完成

## 最终成果
- 12 页 IEEE TIM 格式论文
- 45 条完整引用（全部真实可靠）
- Methodology 3225 词（扩充 3.5 倍）
- 6 个高质量 Figure + 3 个 Table
- 通过专家三轮审稿

## 关键成功因素
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
