# Supplemental Papers — 한국어 학습용 초록 번역

> 범위: PaperGym supplemental 논문 16편  
> 주의: 공식 번역이 아니라 학습용 번역이다. 공식 기준은 영어 원문이다.

---

## 14. Self-Consistency Improves Chain of Thought Reasoning in Language Models

### 한국어 학습용 번역

이 논문은 chain-of-thought prompting의 성능을 높이는 단순하지만 강력한 방법으로 self-consistency를 제안한다. 기존 chain-of-thought 방식은 하나의 추론 경로를 샘플링한 뒤 그 결과를 답으로 사용한다. 그러나 복잡한 추론 문제에서는 하나의 경로가 잘못될 수 있다.

Self-consistency는 여러 개의 다양한 추론 경로를 샘플링하고, 그중 가장 일관되게 나타나는 답을 선택한다. 즉 모델에게 여러 방식으로 생각하게 한 뒤 다수결 또는 일관성 기준으로 최종 답을 고르는 방식이다. 저자들은 이 방법이 산술 추론, 상식 추론, 기호 추론 과제에서 chain-of-thought 성능을 크게 향상시킨다는 것을 보인다.

### 3-line Korean Study Hook

- **문제**: 하나의 chain-of-thought 경로만 믿으면 잘못된 추론에 갇힐 수 있다.
- **핵심 아이디어**: 여러 추론 경로를 생성하고 가장 일관된 답을 고른다.
- **PaperGym에서 읽는 이유**: AI에게 “한 번 생각”이 아니라 “여러 번 생각 후 선택”을 시키는 패턴을 배운다.

---

## 15. Training a Helpful and Harmless Assistant with Reinforcement Learning from Human Feedback

### 한국어 학습용 번역

이 논문은 인간 피드백 기반 강화학습(RLHF)을 사용해 도움이 되면서도 해롭지 않은 AI assistant를 훈련하는 방법을 다룬다. 저자들은 assistant가 사용자의 요청에 유용하게 응답해야 하지만, 동시에 유해하거나 부적절한 행동을 피해야 한다는 두 목표가 함께 필요하다고 본다.

연구는 인간이 선호하는 답변 데이터를 수집하고, 이를 바탕으로 reward model을 훈련한 뒤, 강화학습을 통해 assistant 모델의 행동을 조정한다. 이 과정에서 helpfulness와 harmlessness는 때로 긴장 관계에 놓일 수 있으며, 모델이 두 목표를 균형 있게 만족하도록 훈련하는 것이 중요하다.

이 논문은 Claude류 assistant의 초기 alignment 방향을 이해하는 데 중요한 자료다. 특히 “도움성”과 “무해성”이라는 두 축이 assistant 평가와 훈련의 중심이 된다는 점을 보여준다.

### 3-line Korean Study Hook

- **문제**: AI assistant는 유용해야 하지만, 동시에 해롭지 않아야 한다.
- **핵심 아이디어**: 인간 선호 데이터를 바탕으로 helpfulness와 harmlessness를 함께 학습한다.
- **PaperGym에서 읽는 이유**: Claude의 답변 기준과 안전한 assistant 설계를 이해하는 보조 논문이다.

---

## 16. Direct Preference Optimization

### 한국어 학습용 번역

Direct Preference Optimization(DPO)은 인간 선호 데이터를 이용해 언어 모델을 정렬하는 더 단순한 방법을 제안한다. 기존 RLHF는 reward model을 학습하고, 그 reward model을 바탕으로 강화학습(PPO 등)을 수행하는 복잡한 절차가 필요하다. DPO는 이 과정을 단순화해, 선호된 답변과 선호되지 않은 답변의 쌍을 직접 사용해 모델을 최적화한다.

핵심 아이디어는 별도의 reward model과 강화학습 루프 없이도, 선호 데이터가 암시하는 목표를 supervised learning과 유사한 형태로 직접 반영할 수 있다는 것이다. 저자들은 DPO가 구현이 더 단순하고 안정적이면서도 RLHF와 경쟁력 있는 성능을 낼 수 있음을 보인다.

### 3-line Korean Study Hook

- **문제**: 전통적 RLHF는 reward model과 PPO 때문에 복잡하고 불안정할 수 있다.
- **핵심 아이디어**: 선호된 답변/비선호 답변 쌍을 이용해 모델을 직접 최적화한다.
- **PaperGym에서 읽는 이유**: “좋은 답변을 학습시킨다”는 post-training 감각을 잡는 데 유용하다.

---

## 17. MRKL Systems

### 한국어 학습용 번역

MRKL(Modular Reasoning, Knowledge and Language) Systems는 대규모 언어 모델을 여러 전문 모듈과 결합하는 구조를 제안한다. 모든 문제를 하나의 언어 모델이 직접 해결하려고 하기보다, 언어 모델이 라우터 역할을 하며 필요한 경우 계산기, 검색 시스템, 데이터베이스, 심볼릭 추론기 같은 외부 전문가 모듈을 호출하도록 한다.

이 접근은 언어 모델의 유연성과 외부 도구의 정확성을 결합하려는 시도다. 특히 계산, 최신 정보 검색, 구조화된 지식 조회처럼 언어 모델 단독으로는 취약할 수 있는 영역에서 모듈식 시스템이 더 안전하고 정확할 수 있다.

### 3-line Korean Study Hook

- **문제**: 하나의 LLM이 모든 전문 작업을 직접 처리하기에는 한계가 있다.
- **핵심 아이디어**: LLM을 라우터로 쓰고, 필요한 전문 모듈을 호출하게 만든다.
- **PaperGym에서 읽는 이유**: Toolformer, agent, MCP를 이해하는 초기 모듈형 AI 관점이다.

---

## 18. Gorilla: Large Language Model Connected with Massive APIs

### 한국어 학습용 번역

Gorilla는 대규모 언어 모델이 수많은 API와 연결되어 정확한 API 호출을 생성할 수 있도록 하는 연구다. 현대 AI agent는 외부 도구와 API를 호출해야 하는 경우가 많지만, 잘못된 API 이름, 잘못된 인자, outdated documentation 등으로 오류가 발생할 수 있다.

이 논문은 모델이 API 문서와 사용 예시를 바탕으로 적절한 API 호출을 생성하도록 학습시키고 평가한다. Gorilla는 특히 API hallucination, 즉 존재하지 않거나 잘못된 API 호출을 줄이는 데 초점을 둔다. 이는 agent가 실제 소프트웨어 환경에서 도구를 안정적으로 사용하기 위한 중요한 문제다.

### 3-line Korean Study Hook

- **문제**: LLM이 API를 호출할 때 그럴듯하지만 틀린 호출을 만들 수 있다.
- **핵심 아이디어**: API 문서 기반으로 정확한 tool/API 호출 능력을 강화한다.
- **PaperGym에서 읽는 이유**: Claude Code와 agent가 실제 도구를 안정적으로 쓰려면 무엇이 필요한지 보여준다.

---

## 19. Voyager: An Open-Ended Embodied Agent with Large Language Models

### 한국어 학습용 번역

Voyager는 Minecraft 환경에서 대규모 언어 모델을 사용해 지속적으로 탐험하고 기술을 축적하는 open-ended embodied agent를 제안한다. 에이전트는 단일 과제를 푸는 데 그치지 않고, 스스로 목표를 설정하고, 환경을 탐험하고, 새로운 기술을 코드 형태로 저장하며, 이후 더 복잡한 행동에 재사용한다.

Voyager의 핵심 구성요소는 자동 커리큘럼, skill library, iterative prompting mechanism이다. 에이전트는 새로운 목표를 만들고, 해당 목표를 달성하기 위해 코드를 생성·실행하며, 성공한 기술을 라이브러리에 저장한다. 이를 통해 점점 더 넓은 환경을 탐험하고 더 복잡한 작업을 수행할 수 있다.

### 3-line Korean Study Hook

- **문제**: 많은 agent는 정해진 과제만 풀고 장기적으로 기술을 축적하지 못한다.
- **핵심 아이디어**: 목표 설정, 코드 실행, skill library를 통해 열린 환경에서 계속 성장하는 agent를 만든다.
- **PaperGym에서 읽는 이유**: 장기 학습과 skill accumulation이 있는 agent의 모습을 이해하는 데 좋다.

---

## 20. SWE-bench: Can Language Models Resolve Real-World GitHub Issues?

### 한국어 학습용 번역

SWE-bench는 언어 모델이 실제 GitHub issue를 해결할 수 있는지 평가하기 위한 벤치마크다. 기존 코딩 평가가 짧은 함수나 알고리즘 문제에 집중했다면, SWE-bench는 실제 오픈소스 저장소의 issue와 pull request를 기반으로 한다. 모델은 문제 설명을 읽고, 관련 코드를 이해하고, 수정 패치를 만들어 테스트를 통과해야 한다.

이 벤치마크는 coding agent 평가에서 중요한 전환점이다. 단순히 코드를 생성하는 능력이 아니라, 큰 코드베이스 탐색, 버그 이해, 파일 수정, 테스트 통과까지 포함한 실제 소프트웨어 엔지니어링 능력을 평가한다.

### 3-line Korean Study Hook

- **문제**: 기존 coding benchmark는 실제 개발 업무의 복잡성을 충분히 반영하지 못했다.
- **핵심 아이디어**: 실제 GitHub issue를 해결하게 해 coding agent의 실전 능력을 평가한다.
- **PaperGym에서 읽는 이유**: Claude Code/Codex 같은 도구 성능 발표를 비판적으로 읽는 기준이 된다.

---

## 21. RETRO: Improving language models by retrieving from trillions of tokens

### 한국어 학습용 번역

RETRO는 대규모 언어 모델의 성능을 향상시키기 위해 훈련 및 추론 과정에서 대규모 외부 텍스트 데이터베이스를 검색하는 방법을 제안한다. 모델 파라미터 안에 모든 지식을 저장하는 대신, 관련 문서를 검색해 모델이 이를 참고하도록 만든다.

이 접근은 retrieval-augmented language model의 한 형태로, 모델 크기를 무한정 키우지 않고도 외부 지식 저장소를 활용해 성능을 높일 수 있다는 가능성을 보여준다. 특히 trillions of tokens 규모의 데이터베이스에서 관련 정보를 가져와 언어 모델이 더 정확하고 풍부한 생성을 하도록 돕는다.

### 3-line Korean Study Hook

- **문제**: 모든 지식을 모델 파라미터에 넣는 방식은 비효율적이고 최신성에도 한계가 있다.
- **핵심 아이디어**: 거대한 외부 텍스트 저장소에서 관련 정보를 검색해 모델 생성에 활용한다.
- **PaperGym에서 읽는 이유**: RAG와 retrieval-augmented model의 확장된 계보를 이해하는 데 좋다.

---

## 22. Generative Agents: Interactive Simulacra of Human Behavior

### 한국어 학습용 번역

이 논문은 대규모 언어 모델을 사용해 인간과 유사한 행동을 보이는 generative agents를 만드는 방법을 제안한다. 에이전트들은 가상 환경 안에서 일상생활을 하고, 서로 상호작용하며, 기억을 바탕으로 계획을 세우고 행동한다.

핵심은 memory stream, reflection, planning 구조다. 에이전트는 경험을 자연어 memory로 저장하고, 중요한 기억을 반성적으로 요약하며, 이를 바탕으로 미래 행동 계획을 만든다. 이 구조를 통해 단순한 반응형 챗봇이 아니라, 시간에 따라 일관된 행동과 사회적 상호작용을 보이는 에이전트를 만들 수 있다.

### 3-line Korean Study Hook

- **문제**: 에이전트가 장기 기억과 일관된 행동 없이 단기 반응만 하면 인간 같은 상호작용이 어렵다.
- **핵심 아이디어**: memory, reflection, planning을 결합해 시간에 따라 행동하는 generative agent를 만든다.
- **PaperGym에서 읽는 이유**: AI memory와 agent behavior를 제품/커뮤니티 관점에서 이해하는 데 좋다.

---

## 23. CLIP: Learning Transferable Visual Models From Natural Language Supervision

### 한국어 학습용 번역

CLIP은 자연어 supervision을 사용해 전이 가능한 시각 모델을 학습하는 방법을 제안한다. 기존 시각 모델은 보통 고정된 label set으로 학습되어 새로운 분류 과제에 적응하려면 별도의 데이터셋과 fine-tuning이 필요했다. CLIP은 인터넷에서 수집한 이미지-텍스트 쌍을 사용해 이미지와 자연어 설명을 같은 의미 공간에 정렬한다.

이렇게 학습된 모델은 자연어 prompt를 통해 다양한 시각 분류 과제를 zero-shot으로 수행할 수 있다. 즉 “이 이미지는 고양이 사진인가?” 같은 label을 자연어로 주면, 별도 fine-tuning 없이도 이미지와 텍스트의 유사도를 비교해 답할 수 있다. CLIP은 이후 multimodal AI, 이미지 검색, text-to-image generation의 중요한 기반이 되었다.

### 3-line Korean Study Hook

- **문제**: 기존 vision model은 고정된 label과 과제별 데이터에 묶여 있었다.
- **핵심 아이디어**: 이미지와 텍스트를 같은 의미 공간에 정렬해 자연어로 시각 과제를 지정한다.
- **PaperGym에서 읽는 이유**: 멀티모달 AI와 이미지/텍스트 연결의 출발점을 이해한다.

---

## 24. Denoising Diffusion Probabilistic Models

### 한국어 학습용 번역

Denoising Diffusion Probabilistic Models(DDPM)는 이미지 생성 모델의 중요한 계열인 diffusion model을 제안한다. 이 접근은 데이터에 점진적으로 noise를 추가하는 forward process와, noise에서 원래 데이터를 복원하는 reverse denoising process를 학습하는 방식이다.

모델은 완전한 noise에서 시작해 여러 단계에 걸쳐 조금씩 noise를 제거하면서 고품질 이미지를 생성한다. 이 방식은 안정적인 훈련과 높은 샘플 품질을 보여주며, 이후 Stable Diffusion, DALL·E 계열, 다양한 이미지/영상 생성 모델의 핵심 기반이 되었다.

### 3-line Korean Study Hook

- **문제**: 고품질 이미지를 안정적으로 생성하는 모델 구조가 필요했다.
- **핵심 아이디어**: noise를 추가하고 다시 제거하는 과정을 학습해 이미지를 생성한다.
- **PaperGym에서 읽는 이유**: 이미지/영상 생성 AI가 LLM과 다른 원리로 작동한다는 감각을 잡는다.

---

## 25. Flamingo: a Visual Language Model for Few-Shot Learning

### 한국어 학습용 번역

Flamingo는 이미지와 텍스트를 함께 처리할 수 있는 visual language model로, few-shot learning 환경에서 다양한 멀티모달 과제를 수행하도록 설계되었다. 기존 vision-language 모델은 특정 과제에 맞춰 fine-tuning되는 경우가 많았지만, Flamingo는 몇 개의 예시만으로 새로운 이미지-텍스트 과제에 적응할 수 있다.

Flamingo는 사전학습된 vision model과 language model을 연결하고, 이미지/비디오 입력과 텍스트 입력을 함께 처리해 질문응답, captioning, 분류 등 다양한 과제를 수행한다. 이는 multimodal assistant가 텍스트뿐 아니라 이미지와 영상 맥락을 이해하는 방향으로 발전하는 데 중요한 연구다.

### 3-line Korean Study Hook

- **문제**: 멀티모달 모델도 GPT-3처럼 few-shot으로 다양한 과제에 적응할 수 있을까?
- **핵심 아이디어**: 시각 모델과 언어 모델을 결합해 이미지/비디오+텍스트 과제를 few-shot으로 처리한다.
- **PaperGym에서 읽는 이유**: GPT-4V, Gemini, Claude vision 같은 multimodal assistant 흐름을 이해한다.

---

## 26. HELM: Holistic Evaluation of Language Models

### 한국어 학습용 번역

HELM은 언어 모델을 더 포괄적으로 평가하기 위한 프레임워크다. 기존 평가는 특정 과제나 단일 성능 지표에 집중하는 경우가 많았지만, 언어 모델은 정확도뿐 아니라 calibration, robustness, fairness, bias, toxicity, efficiency 등 다양한 측면에서 평가되어야 한다.

HELM은 다양한 시나리오와 지표를 조합해 모델을 체계적으로 평가한다. 이를 통해 어떤 모델이 어떤 과제에서는 강하지만 다른 측면에서는 약할 수 있음을 보여준다. 이 접근은 모델 성능을 단순 leaderboard 점수 하나로 판단하는 위험을 줄이는 데 중요하다.

### 3-line Korean Study Hook

- **문제**: 단일 점수로 언어 모델의 실제 품질을 판단하기 어렵다.
- **핵심 아이디어**: 정확도, 안전성, 공정성, 효율성 등 다양한 지표로 모델을 종합 평가한다.
- **PaperGym에서 읽는 이유**: AI 성능 발표를 비판적으로 읽는 기준을 만든다.

---

## 27. Measuring Massive Multitask Language Understanding

### 한국어 학습용 번역

MMLU는 다양한 분야와 난이도의 문제를 통해 언어 모델의 폭넓은 지식과 문제 해결 능력을 평가하는 벤치마크다. 과제는 STEM, 인문학, 사회과학, 전문 지식 등 여러 영역을 포함하며, 모델이 단순한 언어 패턴을 넘어 폭넓은 지식과 추론 능력을 갖고 있는지 측정하려 한다.

MMLU는 이후 대규모 언어 모델 성능 발표에서 널리 사용되는 대표 지표가 되었다. 그러나 MMLU 점수가 높다고 해서 모든 실제 업무에서 좋은 성능을 보장하는 것은 아니며, benchmark가 측정하는 능력과 실제 사용 맥락을 구분해야 한다.

### 3-line Korean Study Hook

- **문제**: 모델이 여러 지식 영역에서 얼마나 넓게 이해하는지 평가할 기준이 필요했다.
- **핵심 아이디어**: 다양한 분야의 문제로 multitask language understanding을 측정한다.
- **PaperGym에서 읽는 이유**: 모델 발표에서 자주 나오는 MMLU 점수를 해석하는 기본기를 만든다.

---

## 28. Evaluating Large Language Models Trained on Code

### 한국어 학습용 번역

이 논문은 코드로 훈련된 대규모 언어 모델의 성능을 평가한다. 특히 OpenAI Codex와 같은 모델이 자연어 지시를 받아 Python 함수를 생성할 수 있는지 평가하며, HumanEval이라는 벤치마크를 제안한다. HumanEval은 함수 설명과 테스트 케이스를 바탕으로 모델이 올바른 코드를 생성하는지 측정한다.

이 연구는 자연어에서 코드로 이어지는 모델 능력을 체계적으로 평가한 초기 대표 사례다. 이후 코딩 모델과 coding agent의 성능을 논의할 때 HumanEval은 중요한 기준점이 되었다. 다만 HumanEval은 상대적으로 작은 함수 단위 문제이므로, 실제 코드베이스 수정 능력을 평가하는 SWE-bench와는 다르다.

### 3-line Korean Study Hook

- **문제**: 코드 생성 모델이 자연어 지시를 실제 코드로 얼마나 잘 바꾸는지 평가할 기준이 필요했다.
- **핵심 아이디어**: 함수 단위 코딩 문제와 테스트로 모델의 코드 생성 능력을 측정한다.
- **PaperGym에서 읽는 이유**: HumanEval과 SWE-bench의 차이를 이해하고 coding agent 평가를 비판적으로 본다.

---

## 29. LLaMA: Open and Efficient Foundation Language Models

### 한국어 학습용 번역

LLaMA는 Meta AI가 공개한 효율적인 foundation language model 계열이다. 이 논문은 다양한 크기의 모델을 대규모 공개 데이터로 훈련하고, 상대적으로 작은 모델도 충분한 데이터와 적절한 훈련을 통해 큰 모델과 경쟁할 수 있음을 보여준다.

LLaMA는 open model 생태계에서 중요한 전환점이 되었다. 이후 많은 연구자와 개발자가 LLaMA 계열 모델을 fine-tuning하고, instruction-tuning하고, 다양한 응용 모델을 만들었다. 이 논문은 frontier closed model만이 아니라 open foundation model 생태계가 어떻게 확장되는지 이해하는 데 중요하다.

### 3-line Korean Study Hook

- **문제**: 강력한 foundation model이 일부 폐쇄형 모델에만 집중되어 있었다.
- **핵심 아이디어**: 효율적으로 훈련된 open foundation model이 다양한 연구와 응용의 기반이 될 수 있다.
- **PaperGym에서 읽는 이유**: open model 생태계, fine-tuning, 커뮤니티 기반 AI 발전을 이해한다.
