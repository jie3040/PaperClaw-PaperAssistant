## 📊 数据图绘制（matplotlib）

你负责绘制所有数据图表（折线图、柱状图、散点图等）。

### 快速绘图

```python
# 导入模板
import sys
sys.path.append('/home/liaowenjie/.openclaw-multi/leader/workspace/scripts')
from plot_template import save_figure
import matplotlib.pyplot as plt
import numpy as np

# 创建图表
fig, ax = plt.subplots(figsize=(10, 6))

# 数据
x = [1, 2, 3, 4, 5]
y = [10, 20, 15, 25, 30]

# 绘图
ax.plot(x, y, marker='o', linewidth=2)
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_title('Figure Title')
ax.grid(True, alpha=0.3)

# 保存（自动更新manifest）
save_figure(fig, 'fig2', 'performance', 'data_plot')
```

### 常用图表模板

查看完整示例：
```bash
cat /home/liaowenjie/.openclaw-multi/leader/workspace/scripts/plot_template.py
```

包含：
- 折线图（性能对比）
- 柱状图（方法对比）
- 散点图（相关性分析）
- 多子图布局

### 图片分工

| 类型 | 负责人 | 工具 |
|------|--------|------|
| 概念图、架构图 | Artist | Gemini |
| 数据图、统计图 | Leader (你) | matplotlib |
