#!/usr/bin/env python3
"""
Leader数据图绘制模板
使用matplotlib生成学术论文图表
"""
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')  # 无GUI后端
import json
import os
from datetime import datetime
import numpy as np

# 配置
OUTPUT_DIR = "/home/liaowenjie/.openclaw-multi/shared/paper-project/figures"
MANIFEST_PATH = os.path.join(OUTPUT_DIR, "figures_manifest.json")

# 设置样式
plt.style.use('seaborn-v0_8-paper')  # 学术风格
plt.rcParams['font.size'] = 11
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['axes.titlesize'] = 14
plt.rcParams['xtick.labelsize'] = 10
plt.rcParams['ytick.labelsize'] = 10
plt.rcParams['legend.fontsize'] = 10
plt.rcParams['figure.titlesize'] = 14

def save_figure(fig, fig_id, description, fig_type="data_plot"):
    """保存图片并更新manifest"""
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    filename = f"{fig_id}_{description}.png"
    output_path = os.path.join(OUTPUT_DIR, filename)
    
    # 保存高分辨率图片
    fig.savefig(output_path, dpi=300, bbox_inches='tight', facecolor='white')
    plt.close(fig)
    
    print(f"✅ 图片已保存: {output_path}")
    
    # 更新manifest
    if os.path.exists(MANIFEST_PATH):
        with open(MANIFEST_PATH) as f:
            manifest = json.load(f)
    else:
        manifest = {"figures": []}
    
    # 检查是否已存在
    existing_idx = None
    for i, fig_entry in enumerate(manifest["figures"]):
        if fig_entry["id"] == fig_id:
            existing_idx = i
            break
    
    entry = {
        "id": fig_id,
        "filename": filename,
        "description": description,
        "type": fig_type,
        "created_at": datetime.now().isoformat(),
        "path": output_path,
        "size_bytes": os.path.getsize(output_path)
    }
    
    if existing_idx is not None:
        manifest["figures"][existing_idx] = entry
        print(f"✅ Manifest已更新 (覆盖)")
    else:
        manifest["figures"].append(entry)
        print(f"✅ Manifest已更新 (新增)")
    
    with open(MANIFEST_PATH, "w") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    
    return output_path

# ============ 示例1：折线图 ============
def example_line_plot():
    """性能对比折线图"""
    fig, ax = plt.subplots(figsize=(10, 6))
    
    # 数据
    x = np.array([1, 2, 3, 4, 5])
    y1 = np.array([10, 15, 13, 17, 20])
    y2 = np.array([8, 12, 14, 16, 18])
    y3 = np.array([12, 14, 15, 19, 22])
    
    # 绘图
    ax.plot(x, y1, marker='o', linewidth=2, markersize=8, label='Method A')
    ax.plot(x, y2, marker='s', linewidth=2, markersize=8, label='Method B')
    ax.plot(x, y3, marker='^', linewidth=2, markersize=8, label='Method C')
    
    ax.set_xlabel('Epoch', fontsize=12)
    ax.set_ylabel('Accuracy (%)', fontsize=12)
    ax.set_title('Performance Comparison', fontsize=14, fontweight='bold')
    ax.legend(loc='best', frameon=True)
    ax.grid(True, alpha=0.3, linestyle='--')
    
    return save_figure(fig, "fig2", "performance_comparison", "data_plot")

# ============ 示例2：柱状图 ============
def example_bar_plot():
    """方法对比柱状图"""
    fig, ax = plt.subplots(figsize=(10, 6))
    
    # 数据
    methods = ['Method A', 'Method B', 'Method C', 'Method D']
    accuracy = [85.2, 88.5, 91.3, 89.7]
    
    # 绘图
    bars = ax.bar(methods, accuracy, width=0.6, color=['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728'])
    
    # 添加数值标签
    for bar in bars:
        height = bar.get_height()
        ax.text(bar.get_x() + bar.get_width()/2., height,
                f'{height:.1f}%',
                ha='center', va='bottom', fontsize=10)
    
    ax.set_ylabel('Accuracy (%)', fontsize=12)
    ax.set_title('Method Comparison', fontsize=14, fontweight='bold')
    ax.set_ylim(0, 100)
    ax.grid(True, axis='y', alpha=0.3, linestyle='--')
    
    return save_figure(fig, "fig3", "method_comparison", "data_plot")

# ============ 示例3：散点图 ============
def example_scatter_plot():
    """相关性散点图"""
    fig, ax = plt.subplots(figsize=(10, 6))
    
    # 数据
    np.random.seed(42)
    x = np.random.randn(100)
    y = 2 * x + np.random.randn(100) * 0.5
    
    # 绘图
    ax.scatter(x, y, s=50, alpha=0.6, edgecolors='black', linewidth=0.5)
    
    # 添加趋势线
    z = np.polyfit(x, y, 1)
    p = np.poly1d(z)
    ax.plot(x, p(x), "r--", alpha=0.8, linewidth=2, label=f'y={z[0]:.2f}x+{z[1]:.2f}')
    
    ax.set_xlabel('Feature X', fontsize=12)
    ax.set_ylabel('Feature Y', fontsize=12)
    ax.set_title('Correlation Analysis', fontsize=14, fontweight='bold')
    ax.legend(loc='best')
    ax.grid(True, alpha=0.3, linestyle='--')
    
    return save_figure(fig, "fig4", "correlation_analysis", "data_plot")

# ============ 示例4：多子图 ============
def example_subplots():
    """多子图布局"""
    fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(12, 10))
    
    # 子图1：折线图
    x = np.linspace(0, 10, 100)
    ax1.plot(x, np.sin(x), label='sin(x)')
    ax1.plot(x, np.cos(x), label='cos(x)')
    ax1.set_title('Trigonometric Functions')
    ax1.legend()
    ax1.grid(True, alpha=0.3)
    
    # 子图2：柱状图
    categories = ['A', 'B', 'C', 'D']
    values = [23, 45, 56, 78]
    ax2.bar(categories, values)
    ax2.set_title('Category Distribution')
    ax2.grid(True, axis='y', alpha=0.3)
    
    # 子图3：散点图
    x = np.random.randn(50)
    y = np.random.randn(50)
    ax3.scatter(x, y, alpha=0.6)
    ax3.set_title('Random Distribution')
    ax3.grid(True, alpha=0.3)
    
    # 子图4：箱线图
    data = [np.random.normal(0, std, 100) for std in range(1, 4)]
    ax4.boxplot(data, labels=['Group 1', 'Group 2', 'Group 3'])
    ax4.set_title('Box Plot Comparison')
    ax4.grid(True, axis='y', alpha=0.3)
    
    plt.tight_layout()
    
    return save_figure(fig, "fig5", "multi_panel", "data_plot")

if __name__ == "__main__":
    print("📊 matplotlib绘图模板示例\n")
    
    # 取消注释以运行示例
    # example_line_plot()
    # example_bar_plot()
    # example_scatter_plot()
    # example_subplots()
    
    print("\n使用方法：")
    print("1. 导入此模块：from plot_template import save_figure")
    print("2. 创建matplotlib图表")
    print("3. 调用save_figure(fig, 'fig_id', 'description', 'type')")
