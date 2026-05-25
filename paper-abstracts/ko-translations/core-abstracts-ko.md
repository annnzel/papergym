# Core Papers — 한국어 학습용 초록 번역

> 범위: PaperGym core 논문 13편  
> 주의: 공식 번역이 아니라 학습용 번역이다. 공식 기준은 영어 원문이다.

---

## 1. ReAct: Synergizing Reasoning and Acting in Language Models

### 한국어 학습용 번역

대규모 언어 모델(LLM)은 언어 이해와 상호작용적 의사결정 과제에서 인상적인 능력을 보여주었지만, 추론 능력(예: chain-of-thought prompting)과 행동 능력(예: 행동 계획 생성)은 주로 별개의 주제로 연구되어 왔다. 이 논문은 LLM이 추론 과정과 과제별 행동을 번갈아 생성하도록 하는 방법을 탐구한다. 이를 통해 두 능력 사이의 시너지를 높일 수 있다. 추론 과정은 모델이 행동 계획을 유도하고, 추적하고, 업데이트하며, 예외 상황을 처리하는 데 도움을 준다. 반대로 행동은 모델이 지식 베이스나 환경 같은 외부 소스와 상호작용해 추가 정보를 수집하게 해준다.

저자들은 이 접근법을 ReAct라고 부르며, 다양한 언어 과제와 의사결정 과제에 적용해 기존 최고 수준의 기준선보다 효과적임을 보인다. 또한 추론이나 행동 구성요소가 없는 방법보다 사람이 해석하기 쉽고 신뢰하기 쉬운 결과를 생성한다. 구체적으로 질문응답(HotpotQA)과 사실검증(Fever)에서는 간단한 Wikipedia API와 상호작용함으로써 chain-of-thought 추론에서 흔한 환각과 오류 전파 문제를 극복한다. 또한 추론 과정이 없는 기준선보다 사람이 이해하기 쉬운 과제 해결 궤적을 만든다. 두 개의 상호작용적 의사결정 벤치마크(ALFWorld, WebShop)에서는 단 1~2개의 in-context 예시만으로도 imitation learning과 reinforcement learning 방법보다 각각 34%, 10%p 높은 성공률을 달성한다.

### 3-line Korean Study Hook

- **문제**: LLM의 “생각하기”와 “행동하기”가 따로 연구되어 agent적 작업을 설명하기 어려웠다.
- **핵심 아이디어**: Thought → Action → Observation을 번갈아 수행하면 추론과 외부 정보 활용이 결합된다.
- **PaperGym에서 읽는 이유**: Claude Code가 파일을 읽고, 도구를 쓰고, 결과를 보고 다시 판단하는 루프를 이해하는 핵심 논문이다.

---

## 2. Chain-of-Thought Prompting Elicits Reasoning in Large Language Models

### 한국어 학습용 번역

이 논문은 “사고의 연쇄(chain of thought)”를 생성하는 것, 즉 일련의 중간 추론 단계를 만드는 것이 대규모 언어 모델의 복잡한 추론 능력을 크게 향상시키는 방식을 탐구한다. 특히 충분히 큰 언어 모델에서는 chain-of-thought prompting이라는 단순한 방법을 통해 이러한 추론 능력이 자연스럽게 나타날 수 있음을 보인다. 이 방법은 프롬프트 안에 몇 개의 chain-of-thought 예시를 제공하는 방식이다.

세 개의 대규모 언어 모델을 대상으로 한 실험에서, chain-of-thought prompting은 산술, 상식, 기호 추론 과제 전반에서 성능을 향상시켰다. 경험적 성능 향상은 매우 클 수 있다. 예를 들어 540B 파라미터 언어 모델에 단 8개의 chain-of-thought 예시만 제공했을 때, 수학 문장제 문제 벤치마크인 GSM8K에서 당시 최고 수준의 정확도를 달성했으며, verifier가 붙은 fine-tuned GPT-3보다도 높은 성능을 보였다.

### 3-line Korean Study Hook

- **문제**: 모델에게 바로 답만 요구하면 복잡한 추론 과제에서 성능이 제한된다.
- **핵심 아이디어**: 답으로 가는 중간 생각 과정을 예시로 보여주면 큰 모델의 추론 능력이 더 잘 드러난다.
- **PaperGym에서 읽는 이유**: “좋은 프롬프트는 명령문이 아니라 사고 구조”라는 감각을 만드는 첫 논문이다.

---

## 3. Training language models to follow instructions with human feedback

### 한국어 학습용 번역

언어 모델을 더 크게 만든다고 해서 자동으로 사용자의 의도를 더 잘 따르게 되는 것은 아니다. 예를 들어 대규모 언어 모델은 사실이 아닌 내용, 유해한 내용, 또는 사용자에게 도움이 되지 않는 출력을 생성할 수 있다. 다시 말해 이런 모델은 사용자와 정렬되어 있지 않다. 이 논문은 인간 피드백을 이용한 fine-tuning을 통해 다양한 과제에서 언어 모델을 사용자 의도에 맞게 정렬하는 방법을 보여준다.

저자들은 라벨러가 작성한 프롬프트와 OpenAI API를 통해 제출된 프롬프트를 바탕으로, 원하는 모델 행동을 보여주는 라벨러 시연 데이터셋을 수집한다. 이를 사용해 지도학습 방식으로 GPT-3를 fine-tuning한다. 그런 다음 여러 모델 출력에 대한 순위 데이터셋을 수집하고, 이 데이터를 사용해 인간 피드백 기반 강화학습(RLHF)으로 지도학습 모델을 추가 fine-tuning한다. 이렇게 만들어진 모델을 InstructGPT라고 부른다.

인간 평가에서 1.3B 파라미터 InstructGPT의 출력은 175B GPT-3의 출력보다 선호되었으며, 이는 파라미터 수가 100배 적음에도 나타난 결과다. 또한 InstructGPT 모델은 진실성에서 개선을 보이고 유해한 출력 생성을 줄였으며, 공개 NLP 데이터셋에서는 성능 저하가 크지 않았다. InstructGPT도 여전히 단순한 실수를 하지만, 이 결과는 인간 피드백을 통한 fine-tuning이 언어 모델을 인간 의도와 정렬하는 유망한 방향임을 보여준다.

### 3-line Korean Study Hook

- **문제**: 큰 모델이 곧바로 “사용자 말을 잘 듣는 assistant”가 되는 것은 아니다.
- **핵심 아이디어**: 사람의 시연과 선호 평가를 이용해 base model을 instruction-following assistant로 바꾼다.
- **PaperGym에서 읽는 이유**: ChatGPT/Claude가 왜 친절하고 지시를 따르는지 이해하는 출발점이다.

---

## 4. Toolformer: Language Models Can Teach Themselves to Use Tools

### 한국어 학습용 번역

언어 모델은 특히 규모가 커질수록 몇 개의 예시나 텍스트 지시만으로도 새로운 과제를 해결하는 놀라운 능력을 보인다. 그러나 역설적으로 산술 계산이나 사실 검색처럼 훨씬 단순하고 작은 모델도 잘하는 기본 기능에서는 어려움을 겪는다. 이 논문은 언어 모델이 간단한 API를 통해 외부 도구 사용법을 스스로 학습할 수 있으며, 이를 통해 두 세계의 장점을 모두 얻을 수 있음을 보인다.

저자들은 Toolformer를 제안한다. Toolformer는 어떤 API를 호출할지, 언제 호출할지, 어떤 인자를 넘길지, 그리고 그 결과를 이후 토큰 예측에 어떻게 반영할지를 결정하도록 훈련된 모델이다. 이 과정은 자기지도 방식으로 이루어지며, 각 API에 대해 소수의 시연만 필요하다. 저자들은 계산기, Q&A 시스템, 두 종류의 검색엔진, 번역 시스템, 달력 등 다양한 도구를 포함한다. Toolformer는 핵심 언어 모델링 능력을 희생하지 않으면서도 여러 downstream task에서 훨씬 큰 모델과 경쟁할 정도의 zero-shot 성능 향상을 보인다.

### 3-line Korean Study Hook

- **문제**: LLM은 복잡한 언어 과제는 잘하지만 계산·검색 같은 기본 기능에서 약할 수 있다.
- **핵심 아이디어**: 모델이 언제 어떤 외부 도구를 호출해야 하는지 학습하게 만든다.
- **PaperGym에서 읽는 이유**: Claude Code, MCP, API-calling agent를 이해하는 핵심 다리다.

---

## 5. Attention Is All You Need

### 한국어 학습용 번역

기존의 주요 sequence transduction 모델은 encoder-decoder 구조의 복잡한 recurrent neural network나 convolutional neural network에 기반해 있었다. 가장 성능이 좋은 모델들은 encoder와 decoder를 attention mechanism으로 연결하기도 했다. 이 논문은 recurrence와 convolution을 완전히 제거하고 attention mechanism만으로 구성된 단순한 새 네트워크 구조인 Transformer를 제안한다.

두 개의 기계번역 과제에서 실험한 결과, Transformer는 품질 면에서 더 우수하면서도 병렬화가 더 잘 되고 훈련 시간이 훨씬 적게 든다는 것을 보였다. WMT 2014 영어-독일어 번역 과제에서 28.4 BLEU를 달성해 기존 최고 결과보다 2 BLEU 이상 향상되었다. WMT 2014 영어-프랑스어 번역 과제에서는 8개 GPU로 3.5일 훈련한 뒤 41.8 BLEU라는 새로운 single-model 최고 성능을 달성했으며, 이는 문헌상 최고 모델들보다 훨씬 적은 훈련 비용으로 얻은 결과다. 또한 영어 constituency parsing에 적용해 Transformer가 다른 과제에도 잘 일반화됨을 보였다.

### 3-line Korean Study Hook

- **문제**: 기존 sequence 모델은 RNN/CNN 기반이라 훈련과 병렬화에 한계가 있었다.
- **핵심 아이디어**: attention만으로 sequence를 처리하는 Transformer 구조를 제안했다.
- **PaperGym에서 읽는 이유**: 현대 LLM의 구조적 뼈대가 어디서 왔는지 이해하는 필수 논문이다.

---

## 6. Language Models are Few-Shot Learners

### 한국어 학습용 번역

최근 연구는 대규모 텍스트 코퍼스로 사전학습한 뒤 특정 과제에 fine-tuning하는 방식이 많은 NLP 과제와 벤치마크에서 큰 성능 향상을 가져온다는 것을 보여주었다. 그러나 이 방식은 모델 구조가 과제에 특화되어 있지 않더라도, 여전히 수천~수만 개의 과제별 fine-tuning 데이터셋을 필요로 한다. 반면 인간은 보통 몇 개의 예시나 간단한 지시만으로 새로운 언어 과제를 수행할 수 있다. 현재 NLP 시스템은 이 능력에서 아직 크게 부족하다.

이 논문은 언어 모델을 크게 scale up하면 task-agnostic few-shot 성능이 크게 향상되며, 때로는 기존 fine-tuning 기반 최고 성능과 경쟁할 수 있음을 보인다. 구체적으로 저자들은 1,750억 개 파라미터를 가진 autoregressive language model인 GPT-3를 훈련하고 few-shot 환경에서 성능을 평가한다. 모든 과제에서 GPT-3는 gradient update나 fine-tuning 없이, 텍스트 상호작용을 통해 과제와 few-shot 예시를 지정받아 사용된다.

GPT-3는 번역, 질문응답, cloze task 등 많은 NLP 데이터셋에서 강한 성능을 보였고, 단어 재배열, 새로운 단어를 문장에 사용하기, 세 자리 산술 계산처럼 즉석 추론이나 domain adaptation이 필요한 과제에서도 성능을 보였다. 동시에 GPT-3가 few-shot learning에서 어려움을 겪는 데이터셋과, 대규모 웹 코퍼스로 학습한 데 따른 방법론적 문제가 있는 데이터셋도 확인했다. 마지막으로 GPT-3가 생성한 뉴스 기사 샘플을 인간 평가자가 인간이 쓴 기사와 구별하기 어려워하는 경우도 발견했고, 이에 따른 사회적 영향도 논의한다.

### 3-line Korean Study Hook

- **문제**: 기존 NLP 모델은 과제마다 많은 fine-tuning 데이터가 필요했다.
- **핵심 아이디어**: 충분히 큰 언어 모델은 몇 개의 예시만으로도 다양한 과제를 수행할 수 있다.
- **PaperGym에서 읽는 이유**: “하나의 범용 모델을 프롬프트로 조종한다”는 현대 AI 사용법의 전환점이다.

---

## 7. Scaling Laws for Neural Language Models

### 한국어 학습용 번역

이 논문은 language model 성능을 cross-entropy loss 기준으로 경험적 scaling law 관점에서 연구한다. 손실은 모델 크기, 데이터셋 크기, 훈련에 사용된 compute 양에 대해 power-law 형태로 scale하며, 일부 경향은 7자릿수 이상의 범위에 걸쳐 나타난다. 네트워크의 width나 depth 같은 다른 구조적 세부사항은 넓은 범위 안에서는 상대적으로 작은 영향을 보였다.

저자들은 overfitting이 모델/데이터셋 크기에 어떻게 의존하는지, 훈련 속도가 모델 크기에 어떻게 의존하는지를 단순한 방정식으로 설명한다. 이러한 관계는 고정된 compute budget을 어떻게 최적으로 배분할지 결정할 수 있게 해준다. 더 큰 모델은 sample-efficient하기 때문에, compute-efficient한 최적 훈련은 매우 큰 모델을 비교적 적은 데이터로 훈련하고, 수렴하기 훨씬 전에 멈추는 방식이 된다고 주장한다.

### 3-line Korean Study Hook

- **문제**: 모델 크기, 데이터, compute가 성능에 어떤 관계를 갖는지 정량적으로 알고 싶었다.
- **핵심 아이디어**: 언어 모델 성능은 scale에 따라 예측 가능한 power-law 패턴을 보인다.
- **PaperGym에서 읽는 이유**: “왜 모두가 큰 모델을 만들기 시작했는가”를 이해하는 배경이다.

---

## 8. Training Compute-Optimal Large Language Models

### 한국어 학습용 번역

이 논문은 주어진 compute budget 아래에서 Transformer language model을 훈련할 때 최적의 모델 크기와 훈련 토큰 수가 무엇인지 조사한다. 저자들은 현재의 대규모 언어 모델들이 상당히 undertrained되어 있다고 보며, 이는 언어 모델 scale을 키우면서 훈련 데이터 양은 일정하게 유지하려는 최근 경향의 결과라고 설명한다.

저자들은 7천만~160억 개 이상의 파라미터를 가진 400개 이상의 언어 모델을 50억~5,000억 토큰으로 훈련한 결과, compute-optimal training에서는 모델 크기와 훈련 토큰 수를 같은 비율로 scale해야 한다는 결론을 얻었다. 즉 모델 크기를 두 배로 늘릴 때마다 훈련 토큰 수도 두 배로 늘려야 한다. 이 가설을 검증하기 위해 Gopher와 같은 compute budget을 쓰지만 70B 파라미터와 4배 더 많은 데이터를 사용하는 compute-optimal 모델 Chinchilla를 훈련했다.

Chinchilla는 Gopher(280B), GPT-3(175B), Jurassic-1(178B), Megatron-Turing NLG(530B)를 다양한 downstream evaluation task에서 일관되게 크게 능가했다. 이는 Chinchilla가 fine-tuning과 inference에서도 훨씬 적은 compute를 사용한다는 뜻이며, downstream 사용을 크게 쉽게 만든다. 특히 Chinchilla는 MMLU 벤치마크에서 67.5% 평균 정확도를 기록해 Gopher보다 7%p 이상 높은 state-of-the-art 성능을 달성했다.

### 3-line Korean Study Hook

- **문제**: 큰 모델을 만들 때 파라미터와 데이터의 비율이 정말 최적인가?
- **핵심 아이디어**: 모델만 키우지 말고, 모델 크기에 맞춰 훈련 데이터도 같이 늘려야 한다.
- **PaperGym에서 읽는 이유**: “더 큰 모델”보다 “compute-optimal model”이 중요하다는 감각을 만든다.

---

## 9. Constitutional AI: Harmlessness from AI Feedback

### 한국어 학습용 번역

이 논문은 해롭지 않은 AI assistant를 훈련하는 방법으로 Constitutional AI(CAI)를 제안한다. 이 방법은 지도학습과 강화학습 단계를 모두 포함한다. 지도학습 단계에서는 모델이 처음에는 유해한 질문에 응답하도록 한 뒤, 원칙 목록, 즉 “constitution”을 바탕으로 자신의 응답을 비판하고 수정하게 한다. 그런 다음 이렇게 수정된 응답으로 모델을 fine-tuning한다.

강화학습 단계에서는 사람의 선호 평가 대신 AI가 생성한 선호 평가를 사용한다. 모델은 constitution의 원칙을 기준으로 두 응답 중 어느 쪽이 더 나은지 판단하고, 이 데이터를 사용해 preference model을 훈련한다. 이후 이 preference model로 assistant를 강화학습한다. 저자들은 이 방법을 통해 사람 피드백을 덜 사용하면서도 도움이 되고 harmless한 assistant를 만들 수 있음을 보인다.

이 접근은 특히 Anthropic과 Claude의 alignment 철학을 이해하는 데 중요하다. 핵심은 모델 행동을 단순히 예시로만 가르치는 것이 아니라, 명시적 원칙을 기준으로 스스로 비판하고 수정하도록 만드는 데 있다.

### 3-line Korean Study Hook

- **문제**: 인간 피드백만으로 안전하고 도움이 되는 assistant를 훈련하는 데는 비용과 한계가 있다.
- **핵심 아이디어**: 명시적 원칙(constitution)을 기준으로 AI가 자신의 답변을 비판·수정하고, AI feedback으로 선호를 학습한다.
- **PaperGym에서 읽는 이유**: Claude의 답변 스타일과 안전성, 기업용 AI constitution 설계를 이해하는 핵심 논문이다.

---

## 10. Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks

### 한국어 학습용 번역

대규모 사전학습 언어 모델은 파라미터 안에 저장된 지식을 갖고 있으며, fine-tuning을 통해 downstream NLP 과제에서 좋은 성능을 낼 수 있다. 그러나 그 지식에 정확히 접근하거나 조작하는 능력은 여전히 제한적이다. 특히 지식 집약적인 과제에서는 모델이 외부 지식을 직접 참조할 수 있는 방식이 필요하다.

이 논문은 pre-trained parametric memory와 non-parametric memory를 결합한 Retrieval-Augmented Generation(RAG)을 제안한다. parametric memory는 사전학습된 seq2seq 모델이고, non-parametric memory는 Wikipedia의 dense vector index이며, neural retriever를 통해 접근된다. 저자들은 이 두 구성요소를 end-to-end로 fine-tuning한다.

RAG 모델은 다양한 지식 집약적 NLP 과제에서 기존 parametric-only seq2seq 모델과 retrieval-and-extract 방식 모델보다 높은 성능을 보인다. 또한 생성된 답변은 더 구체적이고, 다양하며, 사실에 기반한 경향을 보인다.

### 3-line Korean Study Hook

- **문제**: 모델이 학습 중 기억한 지식만으로는 최신성·정확성·출처성에 한계가 있다.
- **핵심 아이디어**: 모델 내부 지식과 외부 문서 검색을 결합해 답변을 생성한다.
- **PaperGym에서 읽는 이유**: RAG, long context, memory의 차이를 구분하는 출발점이다.

---

## 11. MemGPT: Towards LLMs as Operating Systems

### 한국어 학습용 번역

대규모 언어 모델은 강력하지만, 고정된 context window 안에서만 정보를 처리할 수 있다는 한계가 있다. 긴 대화, 장기 기억, 대규모 문서 분석처럼 context window를 넘는 작업에서는 무엇을 현재 context에 둘지, 무엇을 외부 저장소에 둘지, 언제 다시 불러올지를 관리해야 한다.

MemGPT는 LLM을 운영체제처럼 바라보는 접근을 제안한다. 운영체제가 제한된 main memory와 더 큰 storage를 관리하듯, MemGPT는 제한된 context window와 외부 memory 사이에서 정보를 옮기고 관리한다. 모델은 스스로 memory read/write를 수행하고, 오래된 정보와 현재 필요한 정보를 구분하며, 장기 대화와 문서 분석 작업에서 더 효과적으로 동작할 수 있다.

이 논문은 LLM memory를 단순히 더 긴 context나 검색으로만 보는 것이 아니라, memory management 문제로 바라보게 만든다.

### 3-line Korean Study Hook

- **문제**: LLM은 context window가 제한되어 장기 기억과 긴 작업에서 한계가 있다.
- **핵심 아이디어**: LLM이 운영체제처럼 현재 context와 외부 memory를 관리하게 한다.
- **PaperGym에서 읽는 이유**: Claude Memory, Obsidian, Notion을 “AI 업무 기억”으로 설계하는 관점을 준다.

---

## 12. Reflexion: Language Agents with Verbal Reinforcement Learning

### 한국어 학습용 번역

이 논문은 언어 에이전트가 실패 경험을 언어적 피드백으로 저장하고, 이후 시도에서 그 피드백을 활용해 성능을 개선하는 Reflexion 프레임워크를 제안한다. 기존 강화학습은 모델 파라미터를 업데이트해야 하는 경우가 많지만, Reflexion은 verbal reinforcement, 즉 자연어 형태의 반성 기록을 memory에 저장해 다음 행동을 조정한다.

에이전트는 과제를 수행한 뒤 성공 여부나 외부 피드백을 바탕으로 자신의 행동을 돌아보고, 무엇이 잘못되었는지와 다음번에 어떻게 해야 하는지를 언어로 기록한다. 이후 같은 과제나 유사한 과제를 수행할 때 이 reflection을 context로 사용한다. 저자들은 이 방식이 코딩, 의사결정, 추론 과제에서 에이전트 성능을 향상시킬 수 있음을 보인다.

핵심은 모델을 다시 훈련하지 않고도, 실패를 언어적 기억으로 바꿔 다음 시도를 개선할 수 있다는 점이다.

### 3-line Korean Study Hook

- **문제**: 에이전트가 실패해도 그 실패를 다음 시도에 활용하지 못하면 같은 실수를 반복한다.
- **핵심 아이디어**: 실패를 자연어 reflection으로 저장하고 다음 행동에 반영한다.
- **PaperGym에서 읽는 이유**: PaperGym의 오답 피드백과 Claude Code의 검증 루프를 설계하는 데 직접 연결된다.

---

## 13. Tree of Thoughts: Deliberate Problem Solving with Large Language Models

### 한국어 학습용 번역

이 논문은 대규모 언어 모델의 문제 해결을 단일 chain-of-thought 경로가 아니라, 여러 가능한 thought 경로를 탐색하는 tree 구조로 확장한다. 기존 chain-of-thought prompting은 하나의 중간 추론 경로를 생성하지만, 복잡한 문제에서는 여러 후보 경로를 만들고 평가하고 되돌아가는 탐색 과정이 필요할 수 있다.

Tree of Thoughts(ToT)는 중간 thought들을 문제 해결의 상태로 보고, 모델이 여러 thought 후보를 생성하고, 각 후보의 유망성을 평가하며, search algorithm을 통해 더 나은 해결 경로를 찾도록 한다. 이를 통해 퍼즐, 창의적 글쓰기, 계획 수립처럼 탐색과 되돌아가기가 중요한 과제에서 더 나은 성능을 낼 수 있다.

핵심은 LLM을 단순히 다음 토큰을 생성하는 모델이 아니라, 후보 사고 경로를 생성하고 평가하는 문제 해결 엔진으로 사용하는 것이다.

### 3-line Korean Study Hook

- **문제**: 하나의 사고 경로만 생성하면 복잡한 문제에서 잘못된 방향으로 가도 되돌아오기 어렵다.
- **핵심 아이디어**: 여러 thought 후보를 tree처럼 탐색하고 평가해 더 나은 경로를 고른다.
- **PaperGym에서 읽는 이유**: 전략, 제안서, 문제 해결에서 AI에게 여러 선택지를 탐색하게 만드는 법을 배운다.
