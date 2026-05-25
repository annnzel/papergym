# PaperGym 논문 초록 아카이브 — English Originals + Korean Study Translation
> 생성일: 2026-05-25  
> 범위: `papers/README.md`에 정리된 core + supplemental arXiv 논문 29편  
> 주의: 한국어는 공식 번역이 아니라 **학습용 번역**이다. 공식 기준은 영어 원문 초록이다.

---
## Index
1. [ReAct: Synergizing Reasoning and Acting in Language Models](#react-2210.03629) — core
2. [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](#cot-2201.11903) — core
3. [Training language models to follow instructions with human feedback](#instructgpt-2203.02155) — core
4. [Toolformer: Language Models Can Teach Themselves to Use Tools](#toolformer-2302.04761) — core
5. [Attention Is All You Need](#attention-1706.03762) — core
6. [Language Models are Few-Shot Learners](#gpt3-2005.14165) — core
7. [Scaling Laws for Neural Language Models](#scaling-laws-2001.08361) — core
8. [Training Compute-Optimal Large Language Models](#chinchilla-2203.15556) — core
9. [Constitutional AI: Harmlessness from AI Feedback](#constitutional-ai-2212.08073) — core
10. [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](#rag-2005.11401) — core
11. [MemGPT: Towards LLMs as Operating Systems](#memgpt-2310.08560) — core
12. [Reflexion: Language Agents with Verbal Reinforcement Learning](#reflexion-2303.11366) — core
13. [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](#tree-of-thoughts-2305.10601) — core
14. [Self-Consistency Improves Chain of Thought Reasoning in Language Models](#self-consistency-2203.11171) — supplemental
15. [Training a Helpful and Harmless Assistant with Reinforcement Learning from Human Feedback](#helpful-harmless-rlhf-2204.05862) — supplemental
16. [Direct Preference Optimization](#dpo-2305.18290) — supplemental
17. [MRKL Systems](#mrkl-2205.00445) — supplemental
18. [Gorilla: Large Language Model Connected with Massive APIs](#gorilla-2305.15334) — supplemental
19. [Voyager: An Open-Ended Embodied Agent with Large Language Models](#voyager-2305.16291) — supplemental
20. [SWE-bench: Can Language Models Resolve Real-World GitHub Issues?](#swe-bench-2310.06770) — supplemental
21. [RETRO: Improving language models by retrieving from trillions of tokens](#retro-2112.04426) — supplemental
22. [Generative Agents: Interactive Simulacra of Human Behavior](#generative-agents-2304.03442) — supplemental
23. [CLIP: Learning Transferable Visual Models From Natural Language Supervision](#clip-2103.00020) — supplemental
24. [Denoising Diffusion Probabilistic Models](#ddpm-diffusion-2006.11239) — supplemental
25. [Flamingo: a Visual Language Model for Few-Shot Learning](#flamingo-2204.14198) — supplemental
26. [HELM: Holistic Evaluation of Language Models](#helm-2211.09110) — supplemental
27. [Measuring Massive Multitask Language Understanding](#mmlu-2009.03300) — supplemental
28. [Evaluating Large Language Models Trained on Code](#humaneval-2107.03374) — supplemental
29. [LLaMA: Open and Efficient Foundation Language Models](#llama-2302.13971) — supplemental

---
## 1. ReAct: Synergizing Reasoning and Acting in Language Models
<a id="react-2210.03629"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2210.03629
- **Authors**: Shunyu Yao, Jeffrey Zhao, Dian Yu, Nan Du, Izhak Shafran, Karthik Narasimhan, Yuan Cao

### English Abstract

While large language models (LLMs) have demonstrated impressive capabilities across tasks in language understanding and interactive decision making, their abilities for reasoning (e.g. chain-of-thought prompting) and acting (e.g. action plan generation) have primarily been studied as separate topics. In this paper, we explore the use of LLMs to generate both reasoning traces and task-specific actions in an interleaved manner, allowing for greater synergy between the two: reasoning traces help the model induce, track, and update action plans as well as handle exceptions, while actions allow it to interface with external sources, such as knowledge bases or environments, to gather additional information. We apply our approach, named ReAct, to a diverse set of language and decision making tasks and demonstrate its effectiveness over state-of-the-art baselines, as well as improved human interpretability and trustworthiness over methods without reasoning or acting components. Concretely, on question answering (HotpotQA) and fact verification (Fever), ReAct overcomes issues of hallucination and error propagation prevalent in chain-of-thought reasoning by interacting with a simple Wikipedia API, and generates human-like task-solving trajectories that are more interpretable than baselines without reasoning traces. On two interactive decision making benchmarks (ALFWorld and WebShop), ReAct outperforms imitation and reinforcement learning methods by an absolute success rate of 34% and 10% respectively, while being prompted with only one or two in-context examples. Project site with code: https://react-lm.github.io

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 2. Chain-of-Thought Prompting Elicits Reasoning in Large Language Models
<a id="cot-2201.11903"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2201.11903
- **Authors**: Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Brian Ichter, Fei Xia, Ed Chi, Quoc Le, et al.

### English Abstract

We explore how generating a chain of thought -- a series of intermediate reasoning steps -- significantly improves the ability of large language models to perform complex reasoning. In particular, we show how such reasoning abilities emerge naturally in sufficiently large language models via a simple method called chain of thought prompting, where a few chain of thought demonstrations are provided as exemplars in prompting. Experiments on three large language models show that chain of thought prompting improves performance on a range of arithmetic, commonsense, and symbolic reasoning tasks. The empirical gains can be striking. For instance, prompting a 540B-parameter language model with just eight chain of thought exemplars achieves state of the art accuracy on the GSM8K benchmark of math word problems, surpassing even finetuned GPT-3 with a verifier.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 3. Training language models to follow instructions with human feedback
<a id="instructgpt-2203.02155"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2203.02155
- **Authors**: Long Ouyang, Jeff Wu, Xu Jiang, Diogo Almeida, Carroll L. Wainwright, Pamela Mishkin, Chong Zhang, Sandhini Agarwal, et al.

### English Abstract

Making language models bigger does not inherently make them better at following a user's intent. For example, large language models can generate outputs that are untruthful, toxic, or simply not helpful to the user. In other words, these models are not aligned with their users. In this paper, we show an avenue for aligning language models with user intent on a wide range of tasks by fine-tuning with human feedback. Starting with a set of labeler-written prompts and prompts submitted through the OpenAI API, we collect a dataset of labeler demonstrations of the desired model behavior, which we use to fine-tune GPT-3 using supervised learning. We then collect a dataset of rankings of model outputs, which we use to further fine-tune this supervised model using reinforcement learning from human feedback. We call the resulting models InstructGPT. In human evaluations on our prompt distribution, outputs from the 1.3B parameter InstructGPT model are preferred to outputs from the 175B GPT-3, despite having 100x fewer parameters. Moreover, InstructGPT models show improvements in truthfulness and reductions in toxic output generation while having minimal performance regressions on public NLP datasets. Even though InstructGPT still makes simple mistakes, our results show that fine-tuning with human feedback is a promising direction for aligning language models with human intent.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 4. Toolformer: Language Models Can Teach Themselves to Use Tools
<a id="toolformer-2302.04761"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2302.04761
- **Authors**: Timo Schick, Jane Dwivedi-Yu, Roberto Dessì, Roberta Raileanu, Maria Lomeli, Luke Zettlemoyer, Nicola Cancedda, Thomas Scialom

### English Abstract

Language models (LMs) exhibit remarkable abilities to solve new tasks from just a few examples or textual instructions, especially at scale. They also, paradoxically, struggle with basic functionality, such as arithmetic or factual lookup, where much simpler and smaller models excel. In this paper, we show that LMs can teach themselves to use external tools via simple APIs and achieve the best of both worlds. We introduce Toolformer, a model trained to decide which APIs to call, when to call them, what arguments to pass, and how to best incorporate the results into future token prediction. This is done in a self-supervised way, requiring nothing more than a handful of demonstrations for each API. We incorporate a range of tools, including a calculator, a Q\&A system, two different search engines, a translation system, and a calendar. Toolformer achieves substantially improved zero-shot performance across a variety of downstream tasks, often competitive with much larger models, without sacrificing its core language modeling abilities.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 5. Attention Is All You Need
<a id="attention-1706.03762"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/1706.03762
- **Authors**: Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, Illia Polosukhin

### English Abstract

The dominant sequence transduction models are based on complex recurrent or convolutional neural networks in an encoder-decoder configuration. The best performing models also connect the encoder and decoder through an attention mechanism. We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely. Experiments on two machine translation tasks show these models to be superior in quality while being more parallelizable and requiring significantly less time to train. Our model achieves 28.4 BLEU on the WMT 2014 English-to-German translation task, improving over the existing best results, including ensembles by over 2 BLEU. On the WMT 2014 English-to-French translation task, our model establishes a new single-model state-of-the-art BLEU score of 41.8 after training for 3.5 days on eight GPUs, a small fraction of the training costs of the best models from the literature. We show that the Transformer generalizes well to other tasks by applying it successfully to English constituency parsing both with large and limited training data.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 6. Language Models are Few-Shot Learners
<a id="gpt3-2005.14165"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2005.14165
- **Authors**: Tom B. Brown, Benjamin Mann, Nick Ryder, Melanie Subbiah, Jared Kaplan, Prafulla Dhariwal, Arvind Neelakantan, Pranav Shyam, et al.

### English Abstract

Recent work has demonstrated substantial gains on many NLP tasks and benchmarks by pre-training on a large corpus of text followed by fine-tuning on a specific task. While typically task-agnostic in architecture, this method still requires task-specific fine-tuning datasets of thousands or tens of thousands of examples. By contrast, humans can generally perform a new language task from only a few examples or from simple instructions - something which current NLP systems still largely struggle to do. Here we show that scaling up language models greatly improves task-agnostic, few-shot performance, sometimes even reaching competitiveness with prior state-of-the-art fine-tuning approaches. Specifically, we train GPT-3, an autoregressive language model with 175 billion parameters, 10x more than any previous non-sparse language model, and test its performance in the few-shot setting. For all tasks, GPT-3 is applied without any gradient updates or fine-tuning, with tasks and few-shot demonstrations specified purely via text interaction with the model. GPT-3 achieves strong performance on many NLP datasets, including translation, question-answering, and cloze tasks, as well as several tasks that require on-the-fly reasoning or domain adaptation, such as unscrambling words, using a novel word in a sentence, or performing 3-digit arithmetic. At the same time, we also identify some datasets where GPT-3's few-shot learning still struggles, as well as some datasets where GPT-3 faces methodological issues related to training on large web corpora. Finally, we find that GPT-3 can generate samples of news articles which human evaluators have difficulty distinguishing from articles written by humans. We discuss broader societal impacts of this finding and of GPT-3 in general.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 7. Scaling Laws for Neural Language Models
<a id="scaling-laws-2001.08361"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2001.08361
- **Authors**: Jared Kaplan, Sam McCandlish, Tom Henighan, Tom B. Brown, Benjamin Chess, Rewon Child, Scott Gray, Alec Radford, et al.

### English Abstract

We study empirical scaling laws for language model performance on the cross-entropy loss. The loss scales as a power-law with model size, dataset size, and the amount of compute used for training, with some trends spanning more than seven orders of magnitude. Other architectural details such as network width or depth have minimal effects within a wide range. Simple equations govern the dependence of overfitting on model/dataset size and the dependence of training speed on model size. These relationships allow us to determine the optimal allocation of a fixed compute budget. Larger models are significantly more sample-efficient, such that optimally compute-efficient training involves training very large models on a relatively modest amount of data and stopping significantly before convergence.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 8. Training Compute-Optimal Large Language Models
<a id="chinchilla-2203.15556"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2203.15556
- **Authors**: Jordan Hoffmann, Sebastian Borgeaud, Arthur Mensch, Elena Buchatskaya, Trevor Cai, Eliza Rutherford, Diego de Las Casas, Lisa Anne Hendricks, et al.

### English Abstract

We investigate the optimal model size and number of tokens for training a transformer language model under a given compute budget. We find that current large language models are significantly undertrained, a consequence of the recent focus on scaling language models whilst keeping the amount of training data constant. By training over 400 language models ranging from 70 million to over 16 billion parameters on 5 to 500 billion tokens, we find that for compute-optimal training, the model size and the number of training tokens should be scaled equally: for every doubling of model size the number of training tokens should also be doubled. We test this hypothesis by training a predicted compute-optimal model, Chinchilla, that uses the same compute budget as Gopher but with 70B parameters and 4$\times$ more more data. Chinchilla uniformly and significantly outperforms Gopher (280B), GPT-3 (175B), Jurassic-1 (178B), and Megatron-Turing NLG (530B) on a large range of downstream evaluation tasks. This also means that Chinchilla uses substantially less compute for fine-tuning and inference, greatly facilitating downstream usage. As a highlight, Chinchilla reaches a state-of-the-art average accuracy of 67.5% on the MMLU benchmark, greater than a 7% improvement over Gopher.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 9. Constitutional AI: Harmlessness from AI Feedback
<a id="constitutional-ai-2212.08073"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2212.08073
- **Authors**: Yuntao Bai, Saurav Kadavath, Sandipan Kundu, Amanda Askell, Jackson Kernion, Andy Jones, Anna Chen, Anna Goldie, et al.

### English Abstract

As AI systems become more capable, we would like to enlist their help to supervise other AIs. We experiment with methods for training a harmless AI assistant through self-improvement, without any human labels identifying harmful outputs. The only human oversight is provided through a list of rules or principles, and so we refer to the method as 'Constitutional AI'. The process involves both a supervised learning and a reinforcement learning phase. In the supervised phase we sample from an initial model, then generate self-critiques and revisions, and then finetune the original model on revised responses. In the RL phase, we sample from the finetuned model, use a model to evaluate which of the two samples is better, and then train a preference model from this dataset of AI preferences. We then train with RL using the preference model as the reward signal, i.e. we use 'RL from AI Feedback' (RLAIF). As a result we are able to train a harmless but non-evasive AI assistant that engages with harmful queries by explaining its objections to them. Both the SL and RL methods can leverage chain-of-thought style reasoning to improve the human-judged performance and transparency of AI decision making. These methods make it possible to control AI behavior more precisely and with far fewer human labels.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 10. Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks
<a id="rag-2005.11401"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2005.11401
- **Authors**: Patrick Lewis, Ethan Perez, Aleksandra Piktus, Fabio Petroni, Vladimir Karpukhin, Naman Goyal, Heinrich Küttler, Mike Lewis, et al.

### English Abstract

Large pre-trained language models have been shown to store factual knowledge in their parameters, and achieve state-of-the-art results when fine-tuned on downstream NLP tasks. However, their ability to access and precisely manipulate knowledge is still limited, and hence on knowledge-intensive tasks, their performance lags behind task-specific architectures. Additionally, providing provenance for their decisions and updating their world knowledge remain open research problems. Pre-trained models with a differentiable access mechanism to explicit non-parametric memory can overcome this issue, but have so far been only investigated for extractive downstream tasks. We explore a general-purpose fine-tuning recipe for retrieval-augmented generation (RAG) -- models which combine pre-trained parametric and non-parametric memory for language generation. We introduce RAG models where the parametric memory is a pre-trained seq2seq model and the non-parametric memory is a dense vector index of Wikipedia, accessed with a pre-trained neural retriever. We compare two RAG formulations, one which conditions on the same retrieved passages across the whole generated sequence, the other can use different passages per token. We fine-tune and evaluate our models on a wide range of knowledge-intensive NLP tasks and set the state-of-the-art on three open domain QA tasks, outperforming parametric seq2seq models and task-specific retrieve-and-extract architectures. For language generation tasks, we find that RAG models generate more specific, diverse and factual language than a state-of-the-art parametric-only seq2seq baseline.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 11. MemGPT: Towards LLMs as Operating Systems
<a id="memgpt-2310.08560"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2310.08560
- **Authors**: Charles Packer, Sarah Wooders, Kevin Lin, Vivian Fang, Shishir G. Patil, Ion Stoica, Joseph E. Gonzalez

### English Abstract

Large language models (LLMs) have revolutionized AI, but are constrained by limited context windows, hindering their utility in tasks like extended conversations and document analysis. To enable using context beyond limited context windows, we propose virtual context management, a technique drawing inspiration from hierarchical memory systems in traditional operating systems that provide the appearance of large memory resources through data movement between fast and slow memory. Using this technique, we introduce MemGPT (Memory-GPT), a system that intelligently manages different memory tiers in order to effectively provide extended context within the LLM's limited context window, and utilizes interrupts to manage control flow between itself and the user. We evaluate our OS-inspired design in two domains where the limited context windows of modern LLMs severely handicaps their performance: document analysis, where MemGPT is able to analyze large documents that far exceed the underlying LLM's context window, and multi-session chat, where MemGPT can create conversational agents that remember, reflect, and evolve dynamically through long-term interactions with their users. We release MemGPT code and data for our experiments at https://memgpt.ai.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 12. Reflexion: Language Agents with Verbal Reinforcement Learning
<a id="reflexion-2303.11366"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2303.11366
- **Authors**: Noah Shinn, Federico Cassano, Edward Berman, Ashwin Gopinath, Karthik Narasimhan, Shunyu Yao

### English Abstract

Large language models (LLMs) have been increasingly used to interact with external environments (e.g., games, compilers, APIs) as goal-driven agents. However, it remains challenging for these language agents to quickly and efficiently learn from trial-and-error as traditional reinforcement learning methods require extensive training samples and expensive model fine-tuning. We propose Reflexion, a novel framework to reinforce language agents not by updating weights, but instead through linguistic feedback. Concretely, Reflexion agents verbally reflect on task feedback signals, then maintain their own reflective text in an episodic memory buffer to induce better decision-making in subsequent trials. Reflexion is flexible enough to incorporate various types (scalar values or free-form language) and sources (external or internally simulated) of feedback signals, and obtains significant improvements over a baseline agent across diverse tasks (sequential decision-making, coding, language reasoning). For example, Reflexion achieves a 91% pass@1 accuracy on the HumanEval coding benchmark, surpassing the previous state-of-the-art GPT-4 that achieves 80%. We also conduct ablation and analysis studies using different feedback signals, feedback incorporation methods, and agent types, and provide insights into how they affect performance.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 13. Tree of Thoughts: Deliberate Problem Solving with Large Language Models
<a id="tree-of-thoughts-2305.10601"></a>

- **Type**: core
- **arXiv**: https://arxiv.org/abs/2305.10601
- **Authors**: Shunyu Yao, Dian Yu, Jeffrey Zhao, Izhak Shafran, Thomas L. Griffiths, Yuan Cao, Karthik Narasimhan

### English Abstract

Language models are increasingly being deployed for general problem solving across a wide range of tasks, but are still confined to token-level, left-to-right decision-making processes during inference. This means they can fall short in tasks that require exploration, strategic lookahead, or where initial decisions play a pivotal role. To surmount these challenges, we introduce a new framework for language model inference, Tree of Thoughts (ToT), which generalizes over the popular Chain of Thought approach to prompting language models, and enables exploration over coherent units of text (thoughts) that serve as intermediate steps toward problem solving. ToT allows LMs to perform deliberate decision making by considering multiple different reasoning paths and self-evaluating choices to decide the next course of action, as well as looking ahead or backtracking when necessary to make global choices. Our experiments show that ToT significantly enhances language models' problem-solving abilities on three novel tasks requiring non-trivial planning or search: Game of 24, Creative Writing, and Mini Crosswords. For instance, in Game of 24, while GPT-4 with chain-of-thought prompting only solved 4% of tasks, our method achieved a success rate of 74%. Code repo with all prompts: https://github.com/princeton-nlp/tree-of-thought-llm.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 14. Self-Consistency Improves Chain of Thought Reasoning in Language Models
<a id="self-consistency-2203.11171"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2203.11171
- **Authors**: Xuezhi Wang, Jason Wei, Dale Schuurmans, Quoc Le, Ed Chi, Sharan Narang, Aakanksha Chowdhery, Denny Zhou

### English Abstract

Chain-of-thought prompting combined with pre-trained large language models has achieved encouraging results on complex reasoning tasks. In this paper, we propose a new decoding strategy, self-consistency, to replace the naive greedy decoding used in chain-of-thought prompting. It first samples a diverse set of reasoning paths instead of only taking the greedy one, and then selects the most consistent answer by marginalizing out the sampled reasoning paths. Self-consistency leverages the intuition that a complex reasoning problem typically admits multiple different ways of thinking leading to its unique correct answer. Our extensive empirical evaluation shows that self-consistency boosts the performance of chain-of-thought prompting with a striking margin on a range of popular arithmetic and commonsense reasoning benchmarks, including GSM8K (+17.9%), SVAMP (+11.0%), AQuA (+12.2%), StrategyQA (+6.4%) and ARC-challenge (+3.9%).

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 15. Training a Helpful and Harmless Assistant with Reinforcement Learning from Human Feedback
<a id="helpful-harmless-rlhf-2204.05862"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2204.05862
- **Authors**: Yuntao Bai, Andy Jones, Kamal Ndousse, Amanda Askell, Anna Chen, Nova DasSarma, Dawn Drain, Stanislav Fort, et al.

### English Abstract

We apply preference modeling and reinforcement learning from human feedback (RLHF) to finetune language models to act as helpful and harmless assistants. We find this alignment training improves performance on almost all NLP evaluations, and is fully compatible with training for specialized skills such as python coding and summarization. We explore an iterated online mode of training, where preference models and RL policies are updated on a weekly cadence with fresh human feedback data, efficiently improving our datasets and models. Finally, we investigate the robustness of RLHF training, and identify a roughly linear relation between the RL reward and the square root of the KL divergence between the policy and its initialization. Alongside our main results, we perform peripheral analyses on calibration, competing objectives, and the use of OOD detection, compare our models with human writers, and provide samples from our models using prompts appearing in recent related work.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 16. Direct Preference Optimization
<a id="dpo-2305.18290"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2305.18290
- **Authors**: Rafael Rafailov, Archit Sharma, Eric Mitchell, Stefano Ermon, Christopher D. Manning, Chelsea Finn

### English Abstract

While large-scale unsupervised language models (LMs) learn broad world knowledge and some reasoning skills, achieving precise control of their behavior is difficult due to the completely unsupervised nature of their training. Existing methods for gaining such steerability collect human labels of the relative quality of model generations and fine-tune the unsupervised LM to align with these preferences, often with reinforcement learning from human feedback (RLHF). However, RLHF is a complex and often unstable procedure, first fitting a reward model that reflects the human preferences, and then fine-tuning the large unsupervised LM using reinforcement learning to maximize this estimated reward without drifting too far from the original model. In this paper we introduce a new parameterization of the reward model in RLHF that enables extraction of the corresponding optimal policy in closed form, allowing us to solve the standard RLHF problem with only a simple classification loss. The resulting algorithm, which we call Direct Preference Optimization (DPO), is stable, performant, and computationally lightweight, eliminating the need for sampling from the LM during fine-tuning or performing significant hyperparameter tuning. Our experiments show that DPO can fine-tune LMs to align with human preferences as well as or better than existing methods. Notably, fine-tuning with DPO exceeds PPO-based RLHF in ability to control sentiment of generations, and matches or improves response quality in summarization and single-turn dialogue while being substantially simpler to implement and train.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 17. MRKL Systems
<a id="mrkl-2205.00445"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2205.00445
- **Authors**: Ehud Karpas, Omri Abend, Yonatan Belinkov, Barak Lenz, Opher Lieber, Nir Ratner, Yoav Shoham, Hofit Bata, et al.

### English Abstract

Huge language models (LMs) have ushered in a new era for AI, serving as a gateway to natural-language-based knowledge tasks. Although an essential element of modern AI, LMs are also inherently limited in a number of ways. We discuss these limitations and how they can be avoided by adopting a systems approach. Conceptualizing the challenge as one that involves knowledge and reasoning in addition to linguistic processing, we define a flexible architecture with multiple neural models, complemented by discrete knowledge and reasoning modules. We describe this neuro-symbolic architecture, dubbed the Modular Reasoning, Knowledge and Language (MRKL, pronounced "miracle") system, some of the technical challenges in implementing it, and Jurassic-X, AI21 Labs' MRKL system implementation.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 18. Gorilla: Large Language Model Connected with Massive APIs
<a id="gorilla-2305.15334"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2305.15334
- **Authors**: Shishir G. Patil, Tianjun Zhang, Xin Wang, Joseph E. Gonzalez

### English Abstract

Large Language Models (LLMs) have seen an impressive wave of advances recently, with models now excelling in a variety of tasks, such as mathematical reasoning and program synthesis. However, their potential to effectively use tools via API calls remains unfulfilled. This is a challenging task even for today's state-of-the-art LLMs such as GPT-4, largely due to their inability to generate accurate input arguments and their tendency to hallucinate the wrong usage of an API call. We release Gorilla, a finetuned LLaMA-based model that surpasses the performance of GPT-4 on writing API calls. When combined with a document retriever, Gorilla demonstrates a strong capability to adapt to test-time document changes, enabling flexible user updates or version changes. It also substantially mitigates the issue of hallucination, commonly encountered when prompting LLMs directly. To evaluate the model's ability, we introduce APIBench, a comprehensive dataset consisting of HuggingFace, TorchHub, and TensorHub APIs. The successful integration of the retrieval system with Gorilla demonstrates the potential for LLMs to use tools more accurately, keep up with frequently updated documentation, and consequently increase the reliability and applicability of their outputs. Gorilla's code, model, data, and demo are available at https://gorilla.cs.berkeley.edu

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 19. Voyager: An Open-Ended Embodied Agent with Large Language Models
<a id="voyager-2305.16291"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2305.16291
- **Authors**: Guanzhi Wang, Yuqi Xie, Yunfan Jiang, Ajay Mandlekar, Chaowei Xiao, Yuke Zhu, Linxi Fan, Anima Anandkumar

### English Abstract

We introduce Voyager, the first LLM-powered embodied lifelong learning agent in Minecraft that continuously explores the world, acquires diverse skills, and makes novel discoveries without human intervention. Voyager consists of three key components: 1) an automatic curriculum that maximizes exploration, 2) an ever-growing skill library of executable code for storing and retrieving complex behaviors, and 3) a new iterative prompting mechanism that incorporates environment feedback, execution errors, and self-verification for program improvement. Voyager interacts with GPT-4 via blackbox queries, which bypasses the need for model parameter fine-tuning. The skills developed by Voyager are temporally extended, interpretable, and compositional, which compounds the agent's abilities rapidly and alleviates catastrophic forgetting. Empirically, Voyager shows strong in-context lifelong learning capability and exhibits exceptional proficiency in playing Minecraft. It obtains 3.3x more unique items, travels 2.3x longer distances, and unlocks key tech tree milestones up to 15.3x faster than prior SOTA. Voyager is able to utilize the learned skill library in a new Minecraft world to solve novel tasks from scratch, while other techniques struggle to generalize. We open-source our full codebase and prompts at https://voyager.minedojo.org/.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 20. SWE-bench: Can Language Models Resolve Real-World GitHub Issues?
<a id="swe-bench-2310.06770"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2310.06770
- **Authors**: Carlos E. Jimenez, John Yang, Alexander Wettig, Shunyu Yao, Kexin Pei, Ofir Press, Karthik Narasimhan

### English Abstract

Language models have outpaced our ability to evaluate them effectively, but for their future development it is essential to study the frontier of their capabilities. We find real-world software engineering to be a rich, sustainable, and challenging testbed for evaluating the next generation of language models. To this end, we introduce SWE-bench, an evaluation framework consisting of $2,294$ software engineering problems drawn from real GitHub issues and corresponding pull requests across $12$ popular Python repositories. Given a codebase along with a description of an issue to be resolved, a language model is tasked with editing the codebase to address the issue. Resolving issues in SWE-bench frequently requires understanding and coordinating changes across multiple functions, classes, and even files simultaneously, calling for models to interact with execution environments, process extremely long contexts and perform complex reasoning that goes far beyond traditional code generation tasks. Our evaluations show that both state-of-the-art proprietary models and our fine-tuned model SWE-Llama can resolve only the simplest issues. The best-performing model, Claude 2, is able to solve a mere $1.96$% of the issues. Advances on SWE-bench represent steps towards LMs that are more practical, intelligent, and autonomous.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 21. RETRO: Improving language models by retrieving from trillions of tokens
<a id="retro-2112.04426"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2112.04426
- **Authors**: Sebastian Borgeaud, Arthur Mensch, Jordan Hoffmann, Trevor Cai, Eliza Rutherford, Katie Millican, George van den Driessche, Jean-Baptiste Lespiau, et al.

### English Abstract

We enhance auto-regressive language models by conditioning on document chunks retrieved from a large corpus, based on local similarity with preceding tokens. With a $2$ trillion token database, our Retrieval-Enhanced Transformer (RETRO) obtains comparable performance to GPT-3 and Jurassic-1 on the Pile, despite using 25$\times$ fewer parameters. After fine-tuning, RETRO performance translates to downstream knowledge-intensive tasks such as question answering. RETRO combines a frozen Bert retriever, a differentiable encoder and a chunked cross-attention mechanism to predict tokens based on an order of magnitude more data than what is typically consumed during training. We typically train RETRO from scratch, yet can also rapidly RETROfit pre-trained transformers with retrieval and still achieve good performance. Our work opens up new avenues for improving language models through explicit memory at unprecedented scale.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 22. Generative Agents: Interactive Simulacra of Human Behavior
<a id="generative-agents-2304.03442"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2304.03442
- **Authors**: Joon Sung Park, Joseph C. O'Brien, Carrie J. Cai, Meredith Ringel Morris, Percy Liang, Michael S. Bernstein

### English Abstract

Believable proxies of human behavior can empower interactive applications ranging from immersive environments to rehearsal spaces for interpersonal communication to prototyping tools. In this paper, we introduce generative agents--computational software agents that simulate believable human behavior. Generative agents wake up, cook breakfast, and head to work; artists paint, while authors write; they form opinions, notice each other, and initiate conversations; they remember and reflect on days past as they plan the next day. To enable generative agents, we describe an architecture that extends a large language model to store a complete record of the agent's experiences using natural language, synthesize those memories over time into higher-level reflections, and retrieve them dynamically to plan behavior. We instantiate generative agents to populate an interactive sandbox environment inspired by The Sims, where end users can interact with a small town of twenty five agents using natural language. In an evaluation, these generative agents produce believable individual and emergent social behaviors: for example, starting with only a single user-specified notion that one agent wants to throw a Valentine's Day party, the agents autonomously spread invitations to the party over the next two days, make new acquaintances, ask each other out on dates to the party, and coordinate to show up for the party together at the right time. We demonstrate through ablation that the components of our agent architecture--observation, planning, and reflection--each contribute critically to the believability of agent behavior. By fusing large language models with computational, interactive agents, this work introduces architectural and interaction patterns for enabling believable simulations of human behavior.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 23. CLIP: Learning Transferable Visual Models From Natural Language Supervision
<a id="clip-2103.00020"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2103.00020
- **Authors**: Alec Radford, Jong Wook Kim, Chris Hallacy, Aditya Ramesh, Gabriel Goh, Sandhini Agarwal, Girish Sastry, Amanda Askell, et al.

### English Abstract

State-of-the-art computer vision systems are trained to predict a fixed set of predetermined object categories. This restricted form of supervision limits their generality and usability since additional labeled data is needed to specify any other visual concept. Learning directly from raw text about images is a promising alternative which leverages a much broader source of supervision. We demonstrate that the simple pre-training task of predicting which caption goes with which image is an efficient and scalable way to learn SOTA image representations from scratch on a dataset of 400 million (image, text) pairs collected from the internet. After pre-training, natural language is used to reference learned visual concepts (or describe new ones) enabling zero-shot transfer of the model to downstream tasks. We study the performance of this approach by benchmarking on over 30 different existing computer vision datasets, spanning tasks such as OCR, action recognition in videos, geo-localization, and many types of fine-grained object classification. The model transfers non-trivially to most tasks and is often competitive with a fully supervised baseline without the need for any dataset specific training. For instance, we match the accuracy of the original ResNet-50 on ImageNet zero-shot without needing to use any of the 1.28 million training examples it was trained on. We release our code and pre-trained model weights at https://github.com/OpenAI/CLIP.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 24. Denoising Diffusion Probabilistic Models
<a id="ddpm-diffusion-2006.11239"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2006.11239
- **Authors**: Jonathan Ho, Ajay Jain, Pieter Abbeel

### English Abstract

We present high quality image synthesis results using diffusion probabilistic models, a class of latent variable models inspired by considerations from nonequilibrium thermodynamics. Our best results are obtained by training on a weighted variational bound designed according to a novel connection between diffusion probabilistic models and denoising score matching with Langevin dynamics, and our models naturally admit a progressive lossy decompression scheme that can be interpreted as a generalization of autoregressive decoding. On the unconditional CIFAR10 dataset, we obtain an Inception score of 9.46 and a state-of-the-art FID score of 3.17. On 256x256 LSUN, we obtain sample quality similar to ProgressiveGAN. Our implementation is available at https://github.com/hojonathanho/diffusion

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 25. Flamingo: a Visual Language Model for Few-Shot Learning
<a id="flamingo-2204.14198"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2204.14198
- **Authors**: Jean-Baptiste Alayrac, Jeff Donahue, Pauline Luc, Antoine Miech, Iain Barr, Yana Hasson, Karel Lenc, Arthur Mensch, et al.

### English Abstract

Building models that can be rapidly adapted to novel tasks using only a handful of annotated examples is an open challenge for multimodal machine learning research. We introduce Flamingo, a family of Visual Language Models (VLM) with this ability. We propose key architectural innovations to: (i) bridge powerful pretrained vision-only and language-only models, (ii) handle sequences of arbitrarily interleaved visual and textual data, and (iii) seamlessly ingest images or videos as inputs. Thanks to their flexibility, Flamingo models can be trained on large-scale multimodal web corpora containing arbitrarily interleaved text and images, which is key to endow them with in-context few-shot learning capabilities. We perform a thorough evaluation of our models, exploring and measuring their ability to rapidly adapt to a variety of image and video tasks. These include open-ended tasks such as visual question-answering, where the model is prompted with a question which it has to answer; captioning tasks, which evaluate the ability to describe a scene or an event; and close-ended tasks such as multiple-choice visual question-answering. For tasks lying anywhere on this spectrum, a single Flamingo model can achieve a new state of the art with few-shot learning, simply by prompting the model with task-specific examples. On numerous benchmarks, Flamingo outperforms models fine-tuned on thousands of times more task-specific data.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 26. HELM: Holistic Evaluation of Language Models
<a id="helm-2211.09110"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2211.09110
- **Authors**: Percy Liang, Rishi Bommasani, Tony Lee, Dimitris Tsipras, Dilara Soylu, Michihiro Yasunaga, Yian Zhang, Deepak Narayanan, et al.

### English Abstract

Language models (LMs) are becoming the foundation for almost all major language technologies, but their capabilities, limitations, and risks are not well understood. We present Holistic Evaluation of Language Models (HELM) to improve the transparency of language models. First, we taxonomize the vast space of potential scenarios (i.e. use cases) and metrics (i.e. desiderata) that are of interest for LMs. Then we select a broad subset based on coverage and feasibility, noting what's missing or underrepresented (e.g. question answering for neglected English dialects, metrics for trustworthiness). Second, we adopt a multi-metric approach: We measure 7 metrics (accuracy, calibration, robustness, fairness, bias, toxicity, and efficiency) for each of 16 core scenarios when possible (87.5% of the time). This ensures metrics beyond accuracy don't fall to the wayside, and that trade-offs are clearly exposed. We also perform 7 targeted evaluations, based on 26 targeted scenarios, to analyze specific aspects (e.g. reasoning, disinformation). Third, we conduct a large-scale evaluation of 30 prominent language models (spanning open, limited-access, and closed models) on all 42 scenarios, 21 of which were not previously used in mainstream LM evaluation. Prior to HELM, models on average were evaluated on just 17.9% of the core HELM scenarios, with some prominent models not sharing a single scenario in common. We improve this to 96.0%: now all 30 models have been densely benchmarked on the same core scenarios and metrics under standardized conditions. Our evaluation surfaces 25 top-level findings. For full transparency, we release all raw model prompts and completions publicly for further analysis, as well as a general modular toolkit. We intend for HELM to be a living benchmark for the community, continuously updated with new scenarios, metrics, and models.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 27. Measuring Massive Multitask Language Understanding
<a id="mmlu-2009.03300"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2009.03300
- **Authors**: Dan Hendrycks, Collin Burns, Steven Basart, Andy Zou, Mantas Mazeika, Dawn Song, Jacob Steinhardt

### English Abstract

We propose a new test to measure a text model's multitask accuracy. The test covers 57 tasks including elementary mathematics, US history, computer science, law, and more. To attain high accuracy on this test, models must possess extensive world knowledge and problem solving ability. We find that while most recent models have near random-chance accuracy, the very largest GPT-3 model improves over random chance by almost 20 percentage points on average. However, on every one of the 57 tasks, the best models still need substantial improvements before they can reach expert-level accuracy. Models also have lopsided performance and frequently do not know when they are wrong. Worse, they still have near-random accuracy on some socially important subjects such as morality and law. By comprehensively evaluating the breadth and depth of a model's academic and professional understanding, our test can be used to analyze models across many tasks and to identify important shortcomings.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 28. Evaluating Large Language Models Trained on Code
<a id="humaneval-2107.03374"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2107.03374
- **Authors**: Mark Chen, Jerry Tworek, Heewoo Jun, Qiming Yuan, Henrique Ponde de Oliveira Pinto, Jared Kaplan, Harri Edwards, Yuri Burda, et al.

### English Abstract

We introduce Codex, a GPT language model fine-tuned on publicly available code from GitHub, and study its Python code-writing capabilities. A distinct production version of Codex powers GitHub Copilot. On HumanEval, a new evaluation set we release to measure functional correctness for synthesizing programs from docstrings, our model solves 28.8% of the problems, while GPT-3 solves 0% and GPT-J solves 11.4%. Furthermore, we find that repeated sampling from the model is a surprisingly effective strategy for producing working solutions to difficult prompts. Using this method, we solve 70.2% of our problems with 100 samples per problem. Careful investigation of our model reveals its limitations, including difficulty with docstrings describing long chains of operations and with binding operations to variables. Finally, we discuss the potential broader impacts of deploying powerful code generation technologies, covering safety, security, and economics.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
## 29. LLaMA: Open and Efficient Foundation Language Models
<a id="llama-2302.13971"></a>

- **Type**: supplemental
- **arXiv**: https://arxiv.org/abs/2302.13971
- **Authors**: Hugo Touvron, Thibaut Lavril, Gautier Izacard, Xavier Martinet, Marie-Anne Lachaux, Timothée Lacroix, Baptiste Rozière, Naman Goyal, et al.

### English Abstract

We introduce LLaMA, a collection of foundation language models ranging from 7B to 65B parameters. We train our models on trillions of tokens, and show that it is possible to train state-of-the-art models using publicly available datasets exclusively, without resorting to proprietary and inaccessible datasets. In particular, LLaMA-13B outperforms GPT-3 (175B) on most benchmarks, and LLaMA-65B is competitive with the best models, Chinchilla-70B and PaLM-540B. We release all our models to the research community.

### 한국어 학습용 번역

> TODO: 아래 영어 초록을 학습용 한국어로 번역한다. 공식 번역이 아니므로 원문과 함께 보관한다.

### 3-line Korean Study Hook

- TODO: 이 논문이 다루는 문제
- TODO: 핵심 아이디어
- TODO: PaperGym에서 읽는 이유

---
