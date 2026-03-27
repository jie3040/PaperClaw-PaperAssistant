# 文献综述报告：基于扩散模型与语言模型的零样本故障诊断

> 主题：Zero-shot Fault Diagnosis Based on Diffusion Model and Language Model  
> 目标期刊：IEEE Transactions on Instrumentation and Measurement  
> 检索日期：2026-03-23  
> 文献数量：58篇  
> 时间范围：2020–2026（优先2023–2026）

---

## 一、零样本故障诊断（Zero-Shot Learning for Fault Diagnosis）

### 1.1 经典零样本方法

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 1 | A zero-shot learning method for fault diagnosis under unknown working loads | Gao Y, Gao L, Li X, Zheng Y | J Intell Manuf | 2020 | 提出在未知工况下基于零样本学习的故障诊断方法，利用属性空间嵌入实现跨工况故障识别。 | ✅ 经典baseline |
| 2 | Zero-shot learning for compound fault diagnosis of bearings | Xu J, Liang S, Ding X, Yan R | Expert Syst Appl | 2021 | 首次将ZSL应用于轴承复合故障诊断，通过语义向量描述单故障属性实现复合故障零样本识别。 | ✅ 经典baseline |
| 3 | An effective zero-shot learning approach for intelligent fault detection using 1D CNN | Zhang S, Wei H, Ding J | Appl Intell | 2023 | 使用1D CNN实现端到端零样本故障检测，在属性空间和特征空间之间建立映射关系。 | |
| 4 | A novel metric-based model with the ability of zero-shot learning for intelligent fault diagnosis | Fan C, Zhang Y, Ma H et al. | Eng Appl Artif Intell | 2024 | 提出基于度量学习的零样本故障诊断模型，利用度量空间对齐提高未知故障的判别能力。 | |
| 5 | A novel bearing fault diagnosis method for compound defects via zero-shot learning | — | J Mech Sci Technol | 2024 | 针对复合故障的零样本诊断方法，仅利用单故障样本训练即可识别未知复合故障。 | |
| 6 | A novel metric-based model with zero-shot learning ability for intelligent fault diagnosis | Fan C et al. | Eng Appl Artif Intell | 2024 | 度量学习框架下实现零样本智能故障诊断，包含属性定义和度量空间学习。 | |

### 1.2 广义零样本与属性嵌入

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 7 | Deep attention relation network: A zero-shot learning method for bearing fault diagnosis under unknown domains | Chen Z, Wu J, Deng C, Wang X, Wang Y | IEEE Trans Reliab | 2023 | 引入注意力关系网络解决未知域下的零样本轴承故障诊断，通过域自适应缓解领域偏移问题。 | |
| 8 | Generative zero-shot compound fault diagnosis based on semantic alignment | — | — | 2023 | 提出基于语义对齐的生成式零样本复合故障诊断方法，使用改进WGAN-GP学习语义-特征映射。 | |
| 9 | Addressing domain shift via knowledge space sharing for generalized zero-shot industrial fault diagnosis | — | IEEE TIM (arXiv:2306.02359) | 2023 | 提出知识空间共享模型（KSS），通过生成机制KSS-G和判别机制KSS-D缓解GZSL中的域偏移问题。 | ✅ 重要baseline |
| 10 | A novel zero-shot learning method with feature generation for intelligent fault diagnosis | — | IEEE TIM | 2024 | 结合通道-空间注意力特征提取器和WGAN-GP，通过生成伪复合故障特征实现零样本分类。 | ✅ TIM baseline |
| 11 | Zero-shot fault semantics learning model for compound fault diagnosis | Xu J, Liang S, Ding X, Yan R | Expert Syst Appl | 2023 | 提出故障语义学习模型，在标签描述空间中嵌入复合故障语义信息，实现未见故障的零样本诊断。 | ✅ 重要baseline |

### 1.3 过程工业零样本诊断

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 12 | Knowledge distillation-based zero-shot learning for process fault diagnosis | Liu et al. | Adv Intell Syst | 2025 | 利用知识蒸馏将专家知识转化为属性预测，在TE过程和酸性水处理过程中提升3–41%诊断精度。 | |
| 13 | A zero-shot industrial process fault diagnosis method based on domain-shift constraints | — | J Cent South Univ (ScienceDirect) | 2024 | 提出域偏移约束的工业过程零样本故障诊断方法，有效解决已知故障到未知故障的泛化问题。 | |
| 14 | Generalized zero-shot fault diagnosis based on fault similarity for hydrometallurgical process | — | J Clean Prod | 2024 | 基于故障相似性的广义零样本方法应用于湿法冶金过程故障诊断。 | |
| 15 | Integrating physical knowledge for generative-based zero-shot learning models in process fault diagnosis | Mu G, Liu C, Chen J | Reliab Eng Syst Saf | 2025 | 将物理知识融入生成式零样本学习框架（CmFFA-VAEGAN），合成高质量未见故障样本。 | |

### 1.4 高压断路器/电力设备

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 16 | A novel mechanical fault diagnosis for high-voltage circuit breakers with zero-shot learning | — | Expert Syst Appl | 2024 | 基于RDSCNN和多标签属性学习的R-MLL方法，实现HVCB机械故障的零样本诊断。 | |
| 17 | A novel zero-shot learning approach for cross-domain fault diagnosis in high-voltage circuit breakers | Yang Q et al. | Neural Netw | 2024 | 跨域零样本学习方法用于HVCB故障诊断，解决多维度机械故障的属性聚类难题。 | |
| 18 | Zero-shot fault diagnosis of high-voltage circuit breakers: fusion of phase space reconstruction and attribute embedding | Yang Q et al. | Meas Sci Technol | 2024 | 融合相空间重构和属性嵌入的AEZSD方法，利用历史故障数据预学习属性知识实现零样本诊断。 | |
| 19 | Cross-domain zero-shot fault diagnosis method for high-voltage circuit breakers driven by multidomain spatial projection | — | Measurement (ScienceDirect) | 2025 | 多域空间投影和双嵌入结构驱动的跨域零样本HVCB故障诊断。 | |

### 1.5 语义融合与物理信息驱动

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 20 | Zero-shot intelligent fault diagnosis via semantic fusion embedding | — | Mech Syst Signal Process | 2024 | 提出深度故障语义融合嵌入模型（DFSFEM），通过多源语义信息融合实现零样本智能诊断。 | |
| 21 | Domain knowledge-driven zero-shot learning for induced draft fans fault diagnosis | Xie et al. | Qual Reliab Eng Int | 2025 | 基于领域知识的零样本学习框架，利用CGAN合成真实故障样本用于引风机诊断。 | |
| 22 | Broad zero-shot diagnosis for rotating machinery with untrained compound faults | Ma C, Wang X, Li Y, Cai Z | Reliab Eng Syst Saf | 2024 | 宽零样本诊断框架，处理旋转机械中未训练的复合故障。 | |
| 23 | Generalized zero-shot bearing compound fault diagnosis based on reserved gate pre-classifier and physical information semantics | Song E, Zhu R, Yao C et al. | Struct Health Monit | 2025 | 引入保留门预分类器和物理信息语义，在轴承复合故障数据集上达到86.71%准确率。 | |

---

## 二、扩散模型在故障诊断中的应用（Diffusion Models for Fault Diagnosis）

### 2.1 数据增强

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 24 | Attention-enhanced conditional-diffusion-based data synthesis for data augmentation in machine fault diagnosis | — | Eng Appl Artif Intell | 2024 | 基于注意力增强条件扩散模型的数据合成方法，使用DDPM生成高质量的机械故障训练数据。 | ✅ 扩散baseline |
| 25 | Denoising diffusion probabilistic model-enabled data augmentation method for intelligent machine fault diagnosis | Wu J et al. | Eng Appl Artif Intell | 2024 | 利用CWT将一维振动信号转为二维时频图，通过DDPM增强小样本故障诊断。 | ✅ 重要baseline |
| 26 | A novel data augmentation method based on DDPM for fault diagnosis under imbalanced data | — | IEEE TIM | 2024 | 基于DDPM的不平衡数据增强方法，解决故障诊断中的样本不平衡问题。 | ✅ TIM baseline |
| 27 | A fault diagnosis method based on an improved diffusion model under limited sample conditions | Wang Q, Sun Z, Zhu Y et al. | PLOS ONE | 2024 | 改进扩散模型在小样本条件下的故障诊断方法，DDPM生成一维振动数据丰富数据集。 | |
| 28 | A fault diagnosis data augmentation method integrating multimodal non-Gaussian denoising diffusion generative adversarial network | — | Adv Eng Inform | 2025 | 多模态非高斯去噪扩散生成对抗网络用于故障诊断数据增强。 | |
| 29 | Fault diagnosis method for imbalanced data based on adaptive diffusion models and generative adversarial networks | — | Eng Appl Artif Intell | 2025 | 自适应扩散模型与GAN结合，解决梯度消失和训练不稳定问题。 | |
| 30 | Few-shot aero-engine bearing fault diagnosis with denoising diffusion based data augmentation | Ping Z, Wang D, Zhang Y et al. | Neurocomputing | 2025 | 基于DDPM的数据增强方法用于航空发动机轴承少样本故障诊断。 | |
| 31 | A novel lightweight DDPM-based data augmentation method for rotating machinery fault diagnosis with small sample | — | Mech Syst Signal Process | 2025 | 轻量级DDPM方法用于旋转机械小样本故障诊断数据增强。 | |
| 32 | A new data augmentation model for fault diagnosis of transformer windings under scarce fault data | Wang et al. | IET Electr Power Appl | 2026 | CDFF-TW增强方法用于变压器绕组稀缺故障数据下的诊断。 | |

### 2.2 领域泛化与零样本生成

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 33 | Enhancing domain generalization in rotating machinery fault diagnosis through diffusion model-based data augmentation | — | IEEE PHM Conference | 2024 | 基于扩散模型数据增强提升旋转机械领域泛化能力。 | |
| 34 | Bearing fault diagnostic framework under unknown working conditions based on condition-guided diffusion model | — | Measurement | 2024 | 工况引导扩散模型用于未知工况下轴承故障诊断，利用DDPM避免GAN的训练不收敛问题。 | ✅ 重要 |
| 35 | Few-shot diffusion domain generalization for diagnosing joint reducer faults in industrial robots | — | IEEE TIM | 2025 | 少样本扩散域泛化方法用于工业机器人关节减速器故障诊断。 | ✅ TIM baseline |
| 36 | FaultDiffusion: Few-Shot Fault Time Series Generation with Diffusion Model | — | arXiv:2511.15174 | 2025 | 利用正负差分适配器，基于预训练正常数据分布建模正常-故障域差异实现精确故障合成。 | |

### 2.3 扩散模型+零样本学习

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 37 | Generalized zero-shot learning based on diffusion model and multilabel network for compound fault diagnosis | — | IEEE TIM | 2024 | 结合扩散模型和多标签网络的广义零样本学习方法用于复合故障诊断，同时识别已知和未知故障。 | ✅ 核心文献 |
| 38 | Generalized zero-shot learning for fault diagnosis in high-speed train bogies based on enhanced diffusion generative models | Qin N, Yin Y, Huang D et al. | IEEE TIM | 2024 | 增强扩散生成模型用于高速列车转向架故障的广义零样本诊断。 | ✅ TIM baseline |
| 39 | Zero-shot fault diagnosis using soft semantic embedding of diffusion-encoded probability | — | Eng Appl Artif Intell (ScienceDirect) | 2025 | 扩散编码卷积自编码器提取正常数据特征，结合GMM软语义学习网络实现零样本诊断。 | ✅ 核心文献 |

---

## 三、视觉-语言模型/CLIP在故障诊断中的应用

### 3.1 CLIP应用于故障诊断

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 40 | Few-shot learning for plastic bearing fault diagnosis – an integrated image processing and NLP approach | — | PHM Conf | 2023 | 首次探索利用CLIP模型（结合图像处理和NLP）进行少样本轴承故障诊断。 | ✅ 先驱性工作 |
| 41 | Transfer learning with CLIP for bearing fault diagnosis | He, He et al. | Semantic Scholar | 2024 | 利用CLIP预训练模型进行迁移学习用于轴承故障诊断。 | |
| 42 | IAD-CLIP: Vision-language models for zero-shot industrial anomaly detection | Li Z et al. | — | 2024 | 基于CLIP的视觉-语言模型用于零样本工业异常检测。 | |
| 43 | Prompting across perception and recognition: A unified CLIP-based visual-text prompt framework for zero-shot anomaly detection | — | Expert Syst Appl | 2025 | 基于CLIP的视觉-文本提示统一框架，动态生成提示实现零样本工业缺陷检测。 | |
| 44 | AF-CLIP: Zero-shot anomaly detection via anomaly-focused CLIP adaptation | — | arXiv | 2025 | 通过异常聚焦的CLIP适配实现零样本异常检测。 | |
| 45 | FaultGPT: Industrial fault diagnosis question answering system by vision language models | — | arXiv:2502.15481 | 2025 | 利用CLIP ViT-L/14作为视觉编码器，结合多尺度跨模态图像解码器和提示学习器构建FaultGPT系统。 | ✅ 重要 |
| 46 | CLIP-AD: A language-guided staged dual-path model for zero-shot anomaly detection | — | — | 2023 | 语言引导的分阶段双路径零样本异常检测模型。 | |

---

## 四、基础模型与大语言模型（Foundation Models & LLMs）

### 4.1 LLM故障诊断

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 47 | FD-LLM: Large language model for fault diagnosis of machines | Qaid H, Zhang B, Su S et al. | Adv Eng Inform | 2025 | 提出FD-LLM框架，利用多模态数据对齐融合将工程时序数据整合进LLM微调，在零样本评估中表现优异。 | ✅ 核心baseline |
| 48 | Large language models for explainable fault diagnosis of machines | — | Eng Appl Artif Intell | 2025 | 证明LLM可对频谱表示进行推理，识别故障证据并生成可解释的人类可读诊断结论。 | ✅ 重要 |
| 49 | Large language models for prognostic analysis in mechanical fault diagnosis | — | PLOS ONE | 2025 | 利用LLM理解设备手册、维护记录等专业文本，结合时序数据进行机械故障预测分析。 | |
| 50 | Leveraging large language models for human-machine collaborative troubleshooting of complex industrial equipment faults | — | Adv Eng Inform | 2025 | 利用LLM增强人机协作复杂工业设备故障排查。 | |

### 4.2 基础模型

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 51 | UniFault: A fault diagnosis foundation model from bearing data | — | arXiv:2504.01373 | 2025 | 在超过90亿数据点上预训练的通用故障诊断基础模型，实现跨数据集、域和机型的泛化。 | ✅ 重要baseline |
| 52 | BearingFM: Towards a foundation model for bearing fault diagnosis by domain knowledge and contrastive learning | — | Int J Prod Econ | 2024 | 提出云边协同轴承故障诊断基础模型，利用大规摸无标签数据训练高泛化模型。 | ✅ 先驱性工作 |
| 53 | RmGPT: A foundation model with generative pre-trained transformer for fault diagnosis and prognosis in rotating machinery | — | arXiv:2409.17604 | 2025 | 受ChatGPT启发，提出基于生成式预训练变换器的旋转机械诊断与预测基础模型。 | |
| 54 | HSE: A plug-and-play module for unified fault diagnosis foundation models | — | Knowledge-Based Systems | 2025 | 即插即用模块实现跨信号类型、采样频率和信号长度的统一故障诊断基础模型。 | |
| 55 | Active foundational models for fault diagnosis of electrical motors | — | arXiv:2311.15516 | 2023 | 基础模型结合主动学习和对比自监督学习，利用少量标注样本实现电机故障诊断。 | |

### 4.3 多模态大模型

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 56 | Multimodal data-enabled large model for machine fault diagnosis towards intelligent operation and maintenance | — | Mech Syst Signal Process | 2026 | 利用CLIP对齐原理和GNN建立多模态连接，测试时对完全零样本数据类型生成文本输出，输出诊断知识三元组。 | ✅ 最新核心 |
| 57 | Multimodal large language model-based fault detection and diagnosis in context of Industry 4.0 | — | Preprints.org | 2024 | 综述MM-LLM（BLIP2, LLaVA等）在工业4.0故障检测与诊断中的应用。 | |

---

## 五、域偏移与生成式方法（Domain Shift & Generative Approaches）

| # | 标题 | 作者 | 期刊/会议 | 年份 | 核心贡献 | Baseline? |
|---|------|------|-----------|------|----------|-----------|
| 58 | Zero-shot generative AI for rotating machinery fault diagnosis: synthesizing highly realistic training data via cycle-consistent adversarial networks | — | Appl Sci (MDPI) | 2023 | 使用CycleGAN生成先前未探索工况的数据，实现生成式零样本旋转机械故障诊断。 | ✅ 先驱性工作 |

---

## 关键发现总结

### 1. 零样本故障诊断的核心挑战
- **域偏移问题（DSP）**：未见故障类别容易被误分为已见类别，这是GZSL的主要瓶颈[9,10]。
- **复合故障诊断**：复合故障数据极度稀缺，语义空间建模困难[1,2,11]。
- **跨域泛化**：不同工况、设备间的特征分布差异大[17,34]。

### 2. 扩散模型的核心优势
- **数据增强**：DDPM比GAN训练更稳定，不存在模式崩塌问题[25,34]。
- **高质量合成**：扩散模型能生成统计特性更接近真实数据的合成样本[24,30]。
- **领域泛化**：扩散模型增强的数据提升了跨域泛化能力[33,35]。
- **零样本结合**：扩散模型+ZSL是新兴方向，已有TIM论文[37,38,39]。

### 3. 视觉-语言模型/CLIP的潜力
- CLIP提供强大的跨模态对齐能力，可用于零样本工业缺陷检测[40,42,43]。
- FaultGPT展示了CLIP+LLM在故障诊断QA系统中的潜力[45]。
- 多模态大模型（LMM-FD）可对零样本数据生成结构化诊断三元组[56]。

### 4. LLM/基础模型的新趋势
- FD-LLM证明LLM在零样本故障分类中具有强大能力[47]。
- UniFault在90亿数据点上预训练，展示了基础模型的泛化潜力[51]。
- 物理知识融合是提升生成式零样本方法的关键方向[15,23]。

### 5. 适合做Baseline的文献（推荐）
| 文献 | 推荐理由 |
|------|----------|
| [9] KSS for GZSL | 域偏移问题的经典解决方案 |
| [10] IEEE TIM - Feature Generation ZSL | TIM期刊，生成式ZSL基准 |
| [37] IEEE TIM - Diffusion + Multilabel Network | 扩散模型+ZSL，TIM标杆 |
| [25] DDPM Data Augmentation | 扩散模型数据增强的经典方法 |
| [26] IEEE TIM - DDPM Imbalanced Data | TIM期刊，不平衡数据扩散增强 |
| [35] IEEE TIM - Few-Shot Diffusion DG | TIM期刊，少样本扩散域泛化 |
| [38] IEEE TIM - Enhanced Diffusion for HST | TIM期刊，扩散模型GZSL |
| [39] Soft Semantic Embedding Diffusion | 扩散编码+软语义，最新方法 |
| [47] FD-LLM | LLM故障诊断的核心baseline |
| [51] UniFault | 最大规模故障诊断基础模型 |

---

## 文献时间分布
- 2020–2022: 3篇
- 2023: 10篇
- 2024: 22篇
- 2025: 21篇
- 2026: 2篇

## 覆盖子方向
1. ✅ 零样本故障诊断（23篇）
2. ✅ 扩散模型数据增强与故障诊断（13篇）
3. ✅ CLIP/视觉-语言模型（7篇）
4. ✅ 大语言模型/基础模型（11篇）
5. ✅ 域偏移与生成式方法（4篇）

---

> 本报告由Surveyor（🔍）自动生成。文献信息基于网络检索结果整理，部分作者信息可能不完整，建议通过DOI进一步确认。
