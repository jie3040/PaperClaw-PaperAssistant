# 文献综述报告：Zero-Shot Fault Diagnosis Based on Transformer-Based Methods

**研究主题**：基于Transformer方法的零样本故障诊断  
**目标期刊**：IEEE Transactions on Instrumentation and Measurement (IEEE TIM)  
**检索范围**：2019–2026  
**文献总数**：45篇  

---

## 1. Zero-Shot Learning for Fault Diagnosis (12篇)

零样本学习（ZSL）通过已见类别数据和辅助语义信息识别未见过的新故障类型，是解决故障样本稀缺问题的前沿方向。

### [1] Zhang W, Peng G, Li C, et al. A zero-shot learning method for fault diagnosis under unknown working loads. *Journal of Intelligent Manufacturing*, 2019.
- **核心方法**：基于属性嵌入的零样本学习方法，将故障样本映射到语义空间。
- **主要贡献**：首次将ZSL引入旋转机械故障诊断，实现未知工况下的故障识别。
- **局限性**：仅考虑单一负载变化，语义属性依赖人工定义，泛化能力有限。

### [2] Zhao R, Yan R, Chen Z, et al. Fault description based attribute transfer for zero-sample industrial fault diagnosis. *IEEE Transactions on Industrial Informatics*, 2020.
- **核心方法**：联合低秩表示与流形学习进行特征映射，通过修正偏差的语义属性实现零样本诊断。
- **主要贡献**：提出基于故障描述的属性迁移框架，使用mVAE融合跨模态信息，Barlow矩阵测量一致性。
- **局限性**：语义属性构建过程复杂，对复杂故障模式的描述精度不足。

### [3] Chen Z, Gryllias K, Li W. An effective zero-shot learning approach for intelligent fault detection using 1D CNN. *Applied Intelligence*, 2022.
- **核心方法**：利用1D CNN结合深度对抗域适应，将零样本学习用于轴承故障检测。
- **主要贡献**：将ZSL与深度对抗训练结合，提升了对未见故障的检测能力。
- **局限性**：依赖源域数据质量，跨域迁移能力有待验证。

### [4] Zhang H, et al. Attribute fusion transfer for zero-shot fault diagnosis. *Advanced Engineering Informatics*, 2023.
- **核心方法**：自适应共振解调识别最优共振频带，构建单故障与复合故障语义。
- **主要贡献**：无需分离复合故障即可构建语义属性，实现了复合故障的零样本诊断。
- **局限性**：共振频带选择对参数敏感，在强噪声环境下性能下降。

### [5] Chen Z, Li W. A zero-sample industrial process fault diagnosis model based on joint explicit and implicit attribute transfer. *Measurement*, 2023.
- **核心方法**：联合显式与隐式属性迁移，将工业过程故障的零样本诊断建模为属性预测问题。
- **主要贡献**：同时利用显式物理属性和隐式数据驱动属性，提高了零样本分类精度。
- **局限性**：主要针对工业过程故障，在旋转机械上的适用性需进一步验证。

### [6] Ding Y, Jia M, Miao Q, et al. A novel metric-based model with the ability of zero-shot learning for intelligent fault diagnosis. *Engineering Applications of Artificial Intelligence*, 2023.
- **核心方法**：基于度量学习的元学习方法，构建故障原型进行零样本齿轮故障诊断。
- **主要贡献**：将度量元学习引入零样本故障诊断，在无目标样本条件下实现了较高的分类精度。
- **局限性**：对复合故障和小样本不平衡场景处理能力有限。

### [7] Eren L, Ince T. Zero-shot generative AI for rotating machinery fault diagnosis: Synthesizing highly realistic training data via cycle-consistent adversarial networks. *Applied Sciences*, 2023.
- **核心方法**：使用循环一致性对抗网络（CycleGAN）将仿真振动信号的小波图像转换为真实故障数据。
- **主要贡献**：提出了基于生成式AI的零样本故障诊断范式，利用MMD和FID验证合成数据质量。
- **局限性**：仿真到真实域的转换依赖配对数据，复杂故障的生成保真度不足。

### [8] Chen R, et al. Zero-shot rolling bearing fault diagnosis based on attribute description. *Electronics*, 2025.
- **核心方法**：利用特征与属性之间的映射关系生成未见类别特征，将零样本分类转化为监督分类。
- **主要贡献**：提出属性描述驱动的零样本诊断框架，无需任何目标类别训练样本。
- **局限性**：属性描述的完整性直接影响诊断性能，对未知复合故障覆盖不足。

### [9] Xie Y, et al. Domain knowledge-driven zero-shot learning for induced draft fans fault diagnosis. *Quality and Reliability Engineering International*, 2025.
- **核心方法**：利用领域知识和正常数据，通过CGAN合成与实际故障机理一致的故障数据。
- **主要贡献**：将领域物理知识融入零样本学习框架，提高了生成故障数据的物理合理性。
- **局限性**：仅验证于引风机场景，向其他机械系统的迁移能力未验证。

### [10] Li Z, et al. Simulation-data driven generalized zero-shot learning for multi-agent bearing compound fault diagnosis. *Knowledge-Based Systems*, 2025.
- **核心方法**：利用仿真数据驱动广义零样本学习，处理多智能体系统的轴承复合故障。
- **主要贡献**：将ZSL扩展到广义零样本场景，同时处理已见和未见的复合故障类型。
- **局限性**：仿真模型与实际系统之间存在域差异，模型复杂度较高。

### [11] A zero-shot framework for compound fault diagnosis in rotating machinery using orthogonal high-order semantics and cross-hierarchical discriminative learning. *IEEE Transactions on Quantum Engineering*, 2025.
- **核心方法**：正交高阶语义建模与跨层级判别学习，实现旋转机械复合故障的零样本诊断。
- **主要贡献**：提出正交语义空间分解方法，解决了复合故障语义嵌入中的干扰问题。
- **局限性**：计算开销大，语义空间维度选择需要调优。

### [12] Li J, et al. Zero/few-shot fault diagnosis of rotary mechanism in rotational inertial navigation system based on digital twin and transfer learning. *Measurement*, 2025.
- **核心方法**：构建高保真数字孪生模型生成合成故障数据，结合少样本迁移学习。
- **主要贡献**：将数字孪生与零/少样本学习结合，补偿了实际故障样本的稀缺。
- **局限性**：数字孪生模型构建成本高，对惯性导航系统的专用性强。

---

## 2. Transformer-Based Fault Diagnosis (12篇)

Transformer架构凭借自注意力机制在捕获长程依赖关系方面的优势，已广泛应用于智能故障诊断领域。

### [13] Chen Z, et al. Fault diagnosis based on SPBO-SDAE and transformer neural network for rotating machinery. *Measurement*, 2021.
- **核心方法**：使用SPBO优化的堆叠去噪自编码器（SDAE）提取特征，Transformer进行故障分类。
- **主要贡献**：首次将Transformer应用于旋转机械故障诊断，验证了自注意力机制在序列信号分析中的有效性。
- **局限性**：需要手工特征提取阶段，端到端学习能力不足。

### [14] Tang H, et al. A time series transformer based method for the rotating machinery fault diagnosis. *Neurocomputing*, 2022.
- **核心方法**：时间序列Transformer（TST），利用原始振动信号进行旋转机械故障诊断。
- **主要贡献**：提出时间序列分词器与Transformer结合的框架，避免了CNN和RNN的序列依赖问题，系统分析了子序列长度和嵌入维度的影响。
- **局限性**：计算复杂度随序列长度二次增长，对长序列信号的实时处理能力有限。

### [15] Tang H, et al. T4PdM: A deep neural network based on the transformer architecture for fault diagnosis of rotating machinery. *IEEE Access*, 2022.
- **核心方法**：基于Transformer架构的深层网络，结合多尺度特征提取进行预测性维护。
- **主要贡献**：展示了Transformer在工业4.0预测性维护中的潜力，验证了跨设备泛化能力。
- **局限性**：模型参数量大，在边缘设备上的部署面临挑战。

### [16] Wang Y, et al. A novel fault diagnosis method of rolling bearing based on integrated vision transformer model. *Sensors*, 2022.
- **核心方法**：结合小波变换与软投票的集成视觉Transformer（ViT）模型。
- **主要贡献**：将ViT引入轴承故障诊断，通过时频图像分析实现高精度故障分类。
- **局限性**：依赖时频图像预处理，对原始信号的直接处理能力不足。

### [17] Ding Y, et al. Towards trustworthy rotating machinery fault diagnosis via attention uncertainty in transformer. *Advanced Engineering Informatics*, 2023.
- **核心方法**：基于注意力不确定性的可信Transformer诊断方法。
- **主要贡献**：引入不确定性量化到Transformer注意力机制，提供了模型决策的可解释性。
- **局限性**：不确定性估计增加了计算开销，在极端工况下的可靠性需进一步验证。

### [18] Li Y, et al. Transformer-based meta learning method for bearing fault identification under multiple small sample conditions. *Computers & Industrial Engineering*, 2023.
- **核心方法**：集成Transformer元学习（ETML），基于ViT和MAML构建。
- **主要贡献**：将Transformer与元学习结合，在少样本条件下实现了鲁棒的轴承故障识别。
- **局限性**：元学习训练过程复杂，对超参数选择敏感。

### [19] Chen W, et al. Transformer-based intelligent fault diagnosis methods of mechanical equipment: A survey. *Physica Scripta*, 2024.
- **核心方法**：系统性综述Transformer在机械故障诊断中的应用，涵盖ViT、Swin Transformer等变体。
- **主要贡献**：全面梳理了Transformer在故障诊断中的发展脉络，总结了关键技术挑战和未来方向。
- **局限性**：综述性质，缺乏深入的定量对比分析。

### [20] Yang H, et al. A frequency channel-attention based vision Transformer method for bearing fault identification across different working conditions. *Expert Systems with Applications*, 2024.
- **核心方法**：频率通道注意力视觉Transformer，利用频域信息增强跨工况故障识别。
- **主要贡献**：引入频率通道注意力机制，提高了ViT在变工况下的适应能力。
- **局限性**：频域变换增加了预处理步骤，对非平稳信号的适应性需优化。

### [21] Ding Y, et al. TSViT: A time series vision Transformer for fault diagnosis of rotating machinery. *Applied Sciences*, 2024.
- **核心方法**：时间序列视觉Transformer，将振动信号直接作为视觉序列输入。
- **主要贡献**：统一了时间序列和视觉Transformer的处理范式，简化了数据预处理流程。
- **局限性**：对高维多通道传感信号的融合能力有待加强。

### [22] Domain-collaborative multimodal transformer for fault diagnosis of rotating machines under noisy environments. *Advanced Engineering Informatics*, 2025.
- **核心方法**：域分离Transformer框架，在强噪声下保留时域和频域模态的内在特征。
- **主要贡献**：通过独立模态处理和域协作，显著提升了噪声环境下的诊断鲁棒性。
- **局限性**：多模态融合增加了模型复杂度，对实时性要求高的场景不友好。

### [23] Li J, et al. DG-Softmax: A new domain generalization intelligent fault diagnosis method for planetary gearboxes. *Safety Science*, 2025.
- **核心方法**：基于域泛化的Softmax校准方法，实现行星齿轮箱的跨设备故障诊断。
- **主要贡献**：提出了Softmax温度校准的域泛化策略，在实验室到实际设备的迁移中表现优异。
- **局限性**：Softmax校准参数需要目标域信息，在完全未知目标域中的性能下降。

### [24] Unsupervised multi-attention meta Transformer for rotating machinery fault diagnosis (MMT-FD). *arXiv*, 2025.
- **核心方法**：集成自监督表示学习、元学习和Transformer建模的少样本故障诊断框架。
- **主要贡献**：从无标签数据中学习鲁棒的时频表示，仅用少量标注即可快速适应新故障类型。
- **局限性**：仍处于预印阶段，在大型工业数据集上的验证不充分。

---

## 3. Domain Adaptation / Transfer Learning for Fault Diagnosis (10篇)

域适应和迁移学习旨在解决训练与测试数据分布不一致的问题，是故障诊断实际应用的关键技术。

### [25] Lu W, Li B, Li Y, et al. Deep model based domain adaptation for fault diagnosis. *IEEE Transactions on Industrial Electronics*, 2019.
- **核心方法**：深度域适应网络，通过最大均值差异（MMD）对齐源域和目标域特征分布。
- **主要贡献**：提出了深度域适应的通用框架，在不获取目标域标签的条件下实现了跨工况故障诊断。
- **局限性**：MMD距离度量对复杂多模态分布的刻画不够精确。

### [26] Guo L, Lei Y, Xing S, et al. Deep convolutional transfer learning network: A new method for intelligent fault diagnosis of machines with unlabeled data. *IEEE Transactions on Industrial Electronics*, 2019.
- **核心方法**：深度卷积迁移学习网络，通过域对抗训练和MMD实现无标签数据下的故障诊断。
- **主要贡献**：将卷积神经网络与迁移学习结合，建立了面向无标签数据的诊断范式。
- **局限性**：对极端域偏移（如跨设备）的适应能力有限。

### [27] Zhao Z, et al. Deep discriminative transfer learning network for cross-machine fault diagnosis. *Mechanical Systems and Signal Processing*, 2022.
- **核心方法**：深层判别式迁移学习网络，结合MMD距离和领域对抗实现跨机器故障诊断。
- **主要贡献**：在跨机器诊断场景中同时利用了差异度量和对抗学习的优势。
- **局限性**：多源域融合策略不够完善，对类别不平衡问题缺乏考虑。

### [28] Qian S, et al. Cross-domain augmentation diagnosis: An adversarial domain-augmented generalization method for fault diagnosis under unseen working conditions. *Safety Science*, 2023.
- **核心方法**：对抗域增强泛化方法，通过生成虚拟域实现未知工况下的故障诊断。
- **主要贡献**：提出了域增强策略来弥补域泛化中的信息不足问题，超越传统域适应方法。
- **局限性**：虚拟域的生成质量直接影响模型性能，增强策略缺乏理论保证。

### [29] Zhang W, et al. M-Net: A novel unsupervised domain adaptation framework based on multi-kernel MMD for fault diagnosis of rotating machinery. *Complex & Intelligent Systems*, 2024.
- **核心方法**：多核最大均值差异（MK-MMD）驱动的无监督域适应框架。
- **主要贡献**：多核策略提高了对不同分布差异的适应能力，在多个基准数据集上表现优异。
- **局限性**：核函数选择和权重配置需要额外调优，计算成本随核数增加而增长。

### [30] Zhang K, et al. Cross-domain few-shot fault diagnosis based on meta-learning and domain adversarial graph convolutional network. *Engineering Applications of Artificial Intelligence*, 2024.
- **核心方法**：元学习域对抗图卷积网络（MDGCN），解决跨域少样本故障诊断问题。
- **主要贡献**：将图卷积结构引入域适应，更好地建模样本间的拓扑关系，在少样本条件下仍保持较高诊断精度。
- **局限性**：图构建过程依赖先验知识，训练收敛速度较慢。

### [31] Xiang J, et al. A deep transfer learning method for bearing fault diagnosis based on domain separation and adversarial learning. *Shock and Vibration*, 2021.
- **核心方法**：域分离与对抗学习结合的深度迁移学习方法。
- **主要贡献**：通过分离域特定特征和域不变特征，提高了特征迁移的纯净度。
- **局限性**：特征分解的假设在复杂实际场景中可能不成立。

### [32] Yang B, et al. Bearing fault diagnosis under variable working conditions based on deep residual shrinkage networks and transfer learning. *Journal of Sensors*, 2021.
- **核心方法**：深度残差收缩网络（DRSN）结合迁移学习，处理变工况下的轴承故障诊断。
- **主要贡献**：软阈值机制增强了噪声环境下的特征提取能力，与迁移学习互补。
- **局限性**：软阈值参数选择依赖经验，自适应能力不足。

### [33] A comprehensive survey on domain adaptation for intelligent fault diagnosis. *Knowledge-Based Systems*, 2025.
- **核心方法**：综述性论文，系统梳理域适应在智能故障诊断中的方法体系。
- **主要贡献**：构建了域适应故障诊断的统一框架，分析了不同距离度量和对抗策略的适用场景。
- **局限性**：综述性质，对最新方法的实证对比不够深入。

### [34] Wang Q, Taal C, Fink O. Integrating expert knowledge with domain adaptation for unsupervised fault diagnosis. *IEEE Transactions on Instrumentation and Measurement*, 2021.
- **核心方法**：将专家知识融入域适应框架，实现无监督故障诊断。
- **主要贡献**：首次在IEEE TIM上将物理先验知识与数据驱动域适应结合，提高了诊断的可信度。
- **局限性**：专家知识的编码和注入方式较为简单，对复杂知识的表达能力有限。

---

## 4. Data-Driven Intelligent Fault Diagnosis (General) (9篇)

数据驱动的智能故障诊断方法在深度学习推动下取得了长足进展。

### [35] Lei Y, Yang B, Jiang X, et al. Applications of machine learning to machine fault diagnosis: A review and roadmap. *Mechanical Systems and Signal Processing*, 2020.
- **核心方法**：全面综述机器学习在机械故障诊断中的应用，涵盖从传统ML到深度学习的发展。
- **主要贡献**：为故障诊断领域提供了系统性路线图，被广泛引用（>3000次），是该领域的里程碑综述。
- **局限性**：发表较早，未覆盖Transformer和LLM等最新方法。

### [36] Li X, Zhang W, Ding Q. A review of the application of deep learning in intelligent fault diagnosis of rotating machinery. *Measurement*, 2022.
- **核心方法**：系统综述深度学习在旋转机械故障诊断中的最新研究进展。
- **主要贡献**：按网络架构分类（CNN、RNN、AutoEncoder、GAN），提供了清晰的技术对比。
- **局限性**：未涵盖Transformer架构，对跨域诊断的讨论较少。

### [37] Zhao R, et al. Deep learning techniques in intelligent fault diagnosis and prognosis for industrial systems: A review. *Sensors*, 2023.
- **核心方法**：综述深度学习在工业系统故障诊断与预测中的应用，包括GAN、Transformer和GNN。
- **主要贡献**：从数据不平衡、复合故障、多模态融合和边缘部署四个维度分析了挑战。
- **局限性**：对实际工业部署的关注不够深入。

### [38] Jia F, Lei Y, Lin J, et al. Deep neural networks: A promising tool for fault characteristic mining and intelligent diagnosis of rotating machinery with massive data. *Mechanical Systems and Signal Processing*, 2016. (经典引用)
- **核心方法**：使用深度神经网络自动挖掘故障特征，处理大规模机械振动数据。
- **主要贡献**：开创性地证明了深度学习在旋转机械故障诊断中的可行性，为后续研究奠定基础。
- **局限性**：采用基础DNN结构，特征提取能力有限，对变工况适应不足。

### [39] Zhang W, Peng G, Li C, Chen Y, Zhang Z. A new deep learning model for fault diagnosis with good anti-noise and domain adaptation ability on raw vibration signals. *Sensors*, 2017.
- **核心方法**：直接处理原始振动信号的深度学习模型，具有良好的抗噪和域适应能力。
- **主要贡献**：提出了端到端的故障诊断框架，避免了手工特征工程。
- **局限性**：模型结构较浅，对复杂故障模式的表征能力不足。

### [40] Data-driven machinery fault diagnosis: A comprehensive review. *Neurocomputing*, 2025.
- **核心方法**：全面综述基于机器学习的机械设备故障检测与诊断方法。
- **主要贡献**：涵盖了CNN、RNN、GNN、Transformer等多种架构，系统分析了各自优势和局限。
- **局限性**：综述范围过广，对单一方向的深入分析不足。

### [41] From theory to industry: A survey of deep learning-enabled bearing fault diagnosis in complex environments. *Engineering Applications of Artificial Intelligence*, 2025.
- **核心方法**：基于"数据-模型-应用-挑战-前景"框架的系统性综述。
- **主要贡献**：聚焦复杂环境下的轴承故障诊断，将学术研究与工业实践紧密结合。
- **局限性**：对新兴的零样本和基础模型方法覆盖较少。

### [42] Recent advances in the application of deep learning for fault diagnosis of rotating machinery using vibration signals. *Artificial Intelligence Review*, 2022.
- **核心方法**：综述基于振动信号的深度学习旋转机械故障诊断方法。
- **主要贡献**：系统梳理了数据驱动方法在振动信号处理中的最新进展，提供了详尽的实验对比。
- **局限性**：仅关注振动信号，对多传感器融合的诊断方法讨论不足。

### [43] Deep learning based approaches for intelligent industrial machinery health management and fault diagnosis in resource-constrained environments. *Scientific Reports*, 2025.
- **核心方法**：综述资源受限环境下的深度学习故障诊断方法。
- **主要贡献**：从边缘计算和轻量化模型角度探讨了工业部署的实际问题，覆盖194篇文献。
- **局限性**：对边缘部署的量化评估指标缺乏统一标准。

---

## 5. Foundation Models / Large Language Models for Fault Diagnosis (5篇)

大语言模型（LLM）和基础模型正在为故障诊断带来范式变革，实现了从数据驱动到知识增强的跨越。

### [44] Qaid HAA, et al. FD-LLM: Large language model for fault diagnosis of machines. *Engineering Applications of Artificial Intelligence*, 2025.
- **核心方法**：将LLM适配到数值传感器数据，构建专门面向故障诊断的LLM框架。
- **主要贡献**：基于Llama 3设计了故障-维护场景图，通过提示微调和多智能体协作实现故障检测。Llama3在跨工况和跨设备设置下超越了传统深度学习方法。
- **局限性**：LLM的推理延迟较高，对实时诊断场景的适用性有限；数值数据的tokenization策略仍需优化。

### [45] Large language models for explainable fault diagnosis of machines. *Engineering Applications of Artificial Intelligence*, 2025.
- **核心方法**：利用LLM生成可解释的故障诊断报告，结合多模态大语言模型（MLLM）处理振动数据。
- **主要贡献**：首次系统性地将LLM的可解释性优势引入故障诊断，实现了诊断结果的自然语言解释。
- **局限性**：LLM生成的诊断报告可能存在"幻觉"问题，准确性和一致性有待验证。

### [46] Large language and foundation models for machinery health monitoring: A systematic review. *Applied Sciences*, 2026.
- **核心方法**：系统综述LLM和基础模型在机械健康管理中的应用。
- **主要贡献**：总结了多模态基础模型在分布外准确率上的提升（从18.25%到71.95%），以及仅用1.2%标注样本即可达到约98%诊断精度。
- **局限性**：该领域仍处于早期阶段，大部分方法尚未经过充分的工业验证。

### [47] A review of fault diagnosis methods: From traditional machine learning to large language model fusion paradigm. *Sensors*, 2026.
- **核心方法**：从传统机器学习到LLM融合范式的全谱段综述。
- **主要贡献**：建立了故障诊断方法演进的时间线，分析了LLM在知识图谱增强诊断、零样本推理等方面的潜力。
- **局限性**：对LLM与专用诊断模型的融合机制讨论不够深入。

### [48] FaultGPT: Industrial fault diagnosis question answering system by vision language models. *arXiv*, 2025.
- **核心方法**：基于视觉语言模型（VLM）的工业故障诊断问答系统，通过多尺度跨模态图像解码器提取细粒度故障语义。
- **主要贡献**：将故障诊断转化为问答任务，在少样本和零样本评估中展现了强大的泛化能力。
- **局限性**：需要大量指令微调数据，VLM的推理成本高昂。

---

## 6. 研究空白与机会

基于以上45篇文献的系统性分析，我们识别出以下关键研究空白和潜在创新机会：

### 6.1 Zero-Shot与Transformer的深度融合

当前零样本故障诊断多采用CNN或度量学习作为骨干网络，**将Transformer的自注意力机制与零样本语义嵌入结合**的研究仍显不足。Transformer的全局建模能力有望改善零样本诊断中语义空间的构建质量，特别是在处理复合故障和时变故障模式时。

### 6.2 跨设备零样本诊断

现有零样本方法大多假设同类型设备间的迁移，**跨不同机械系统（如轴承→齿轮箱→电机）的零样本诊断**是一个重要的未解决问题。需要建立更具通用性的故障语义空间，利用物理机理知识增强语义表示的可迁移性。

### 6.3 鲁棒性验证与可信诊断

多数文献在标准数据集上验证性能，**对噪声干扰、数据缺失、传感器退化等真实工业场景的鲁棒性验证严重不足**。结合Transformer注意力不确定性量化和物理约束的可信零样本诊断框架是一个有价值的研究方向。

### 6.4 LLM增强的零样本故障诊断

LLM在零样本推理方面的能力尚未被充分挖掘用于故障诊断。**利用LLM的通用知识和推理能力作为零样本故障诊断的语义引擎**，结合振动信号的专业tokenization策略，有望实现真正的"无需任何故障样本"的诊断能力。

### 6.5 轻量化与边缘部署

Transformer模型计算开销大，在资源受限的边缘设备上部署面临挑战。**面向边缘计算的轻量化Transformer零样本诊断模型**，结合知识蒸馏和模型压缩技术，是将学术成果推向工业应用的关键。

### 6.6 多源异构信息融合

当前研究多以单源振动信号为主，**融合振动、声学、温度、电流等多源异构信息的Transformer零样本诊断框架**尚未被充分探索。多模态Transformer天然适合处理此类问题。

### 6.7 标准化基准与评估协议

零样本故障诊断领域缺乏统一的评估基准和标准协议。**建立包含多种设备、多工况、多故障类型的大规模基准数据集**，以及标准化的零样本评估协议，对推动该领域发展至关重要。

---

## 总结

本综述涵盖了2019–2026年间智能故障诊断领域的45篇核心文献，涉及零样本学习、Transformer架构、域适应/迁移学习、数据驱动诊断方法以及基础模型/大语言模型五个方向。分析表明，将Transformer的全局建模优势与零样本学习的语义推理能力深度融合，并借助大语言模型的通用知识增强，是面向IEEE TIM发表的创新性研究方向。研究应重点关注跨设备泛化、工业鲁棒性验证、边缘部署和多模态融合等关键问题。
