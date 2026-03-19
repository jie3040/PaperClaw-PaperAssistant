# 修改任务清单 Round 3

## 总体评价：Minor Revision

## 任务分配

| 序号 | 问题描述 | 修改内容 | 负责 Agent | 涉及文件 | 优先级 |
|------|---------|---------|-----------|---------|--------|
| 1 | 模型名称不一致 CESM-Diff vs CSMD | 全文搜索替换 CSMD → CESM-Diff（约15处） | Writer | drafts/v5/section_*.tex | 🔴 高 |
| 2 | 性能数值不一致 92.4% vs 91.3% | Conclusion 中 92.4% → 91.3% | Writer | drafts/v5/section_conclusion.tex | 🔴 高 |
| 3 | 图3无正文引用 | 在 Method Section 3.6 或 3.7 添加 Fig.3 引用 | Writer | drafts/v5/section_method.tex | 🔴 高 |
| 4 | Pre-Pretraining 拼写不统一 | 统一为 "pretraining"（全小写无连字符） | Writer | drafts/v5/section_*.tex | 🔴 高 |
| 5 | 28条注释参考文献 | 删除注释的 bib 条目，只保留有效的 ~22 条 | Writer | drafts/v5/references.bib | 🟡 中 |
| 6 | 子章节数量不足 | 在 Method/Related Work 细分6个子节 | Writer | drafts/v5/section_*.tex | 🟡 中 |
| 7 | 缺少1个Table | 添加符号/变量定义表 | Artist/Leader | figures/ | 🟡 中 |

## 预计新版本号
- final: v3 → v4
- 整合后重新编译 PDF