# 选定 Idea

**项目**：Project 4 - CLIP-Guided Dual-Path Diffusion Model for Zero-Shot Fault Diagnosis

**选定 Idea**：Idea-1: CLIP-Enhanced Semantic Manifold Diffusion (CESM-Diff)

**研究问题**
如何利用 CLIP 的多模态语义能力，将静态属性表升级为连续语义流形，解决传统 ZSFD 中属性定义过于僵硬、无法处理中间态故障的问题？

**核心方法**
- 利用 CLIP Text Encoder 将故障描述文本编码为连续语义向量
- 在 Diffusion 条件注入阶段，用语义流形替代离散二值属性
- 引入语义流形插值机制，支持未见故障的平滑过渡

**创新点**
1. 首次将 CLIP 语义流形引入 Diffusion 条件生成
2. 自然语言驱动的故障描述替代人工定义属性
3. 支持零样本/少样本故障的语义扩展

**选定时间**：2026-03-16 19:18
