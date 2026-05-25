# PaperGym — 6개월 전/후 비교 문서

> 목적: 6개월 AI 논문 스터디를 끝까지 지속하기 위한 동기부여 문서.  
> 기준: 주 5시간 / 24주 / 기본 논문 60~70% + 최신 자료 30~40%  
> 핵심 목표: AI 연구자가 되는 것이 아니라, **AI 논문과 최신 업데이트를 업무·전략·콘텐츠·에이전트 설계 언어로 번역할 수 있는 사람**이 된다.

---

## 1. 한 줄 Before / After

### Before

AI 뉴스는 많이 보이지만, 무엇이 중요한지 모르고, 논문 제목은 들어봤지만 계보가 연결되지 않는다.

### After

새 모델·논문·AI 제품 업데이트가 나왔을 때, “이건 CoT 계열이다 / ReAct 계열이다 / RAG가 아니라 memory 문제다 / benchmark 점수는 높지만 실무 검증은 별도다”라고 분류할 수 있다.

---

## 2. 6개월 총량

### 기본 시간 계산

| 항목 | 값 |
|---|---:|
| 기간 | 24주 |
| 주간 학습 시간 | 5시간 |
| 총 학습 시간 | 120시간 |
| 기본 논문/기초 개념 | 약 72~78시간 |
| 최신 자료/업데이트 | 약 42~48시간 |
| 월말 리뷰/통합 | 약 12~18시간 포함 |

비율은 고정 60:40이 아니라 단계별로 다르게 운영한다.

| 기간 | 기본 논문 | 최신 자료 | 의미 |
|---|---:|---:|---|
| 1~8주 | 70% | 30% | 기본 자세 만들기 |
| 9~24주 | 60% | 40% | 최신 자료를 계보에 연결 |
| 매월 마지막 주 | 40% | 60% | 월간 업데이트 정리 |

---

## 3. 6개월 동안 실제로 커버하는 양

### 논문/자료 수

| 구분 | 예상 수량 | 깊이 |
|---|---:|---|
| Core paper 깊게 읽기 | 12~15편 | Abstract, Introduction, Figure, 핵심 Section, 질문 답변 |
| Supplemental paper 훑기 | 15~25편 | Abstract, Figure, 핵심 아이디어 중심 |
| 공식 연구/엔지니어링 블로그 | 20~35개 | 최신 흐름과 논문 계보 연결 |
| benchmark / leaderboard 체크 | 12~20회 | SWE-bench, Arena, HELM/MMLU 등 |
| Weekly AI Update | 20~24개 | 매주 1개 |
| Monthly Review | 6개 | 월말 통합 |
| Paper Card | 12~18개 | 핵심 논문별 카드 |
| Korean glossary 누적 용어 | 80~150개 | 영어 원어 + 한국어 설명 |
| 업무 적용 문장/프레임 | 30~50개 | PR, 제안서, Claude Code, agent 설계 연결 |

---

## 4. 읽게 될 핵심 논문 지도

### Month 1 — Claude Code / Agent의 작동 원리

| 논문/자료 | 끝나면 할 수 있는 말 |
|---|---|
| Chain-of-Thought | 좋은 프롬프트는 명령이 아니라 사고 구조다 |
| ReAct | agent는 모델 하나가 아니라 Thought → Action → Observation 루프다 |
| Toolformer | AI의 미래는 모델이 모든 걸 아는 게 아니라 도구를 잘 부르는 것이다 |
| Building Effective Agents | workflow와 agent를 구분할 수 있다 |

### Month 2 — Assistant는 어떻게 만들어지는가

| 논문/자료 | 끝나면 할 수 있는 말 |
|---|---|
| InstructGPT | ChatGPT류 assistant는 base model에 human feedback을 입힌 결과다 |
| Constitutional AI | Claude의 행동은 원칙 기반 alignment와 연결된다 |
| DPO / RLHF 보충 | “좋은 답변”은 prompt만이 아니라 preference data로 학습된다 |
| 최신 모델 release note | 모델 발표를 post-training 관점에서 읽을 수 있다 |

### Month 3 — LLM의 기초 체력

| 논문/자료 | 끝나면 할 수 있는 말 |
|---|---|
| Attention Is All You Need | Transformer가 왜 현대 LLM의 뼈대인지 설명할 수 있다 |
| GPT-3 | few-shot / in-context learning이 왜 전환점이었는지 안다 |
| Scaling Laws | 모델 크기·데이터·컴퓨트의 관계를 감으로라도 읽을 수 있다 |
| Chinchilla | 무조건 큰 모델보다 data/compute balance가 중요하다는 걸 안다 |

### Month 4 — 기억하고 참고하는 AI

| 논문/자료 | 끝나면 할 수 있는 말 |
|---|---|
| RAG | 모델 지식과 외부 문서 참조를 구분할 수 있다 |
| MemGPT | context window와 memory management를 구분할 수 있다 |
| Generative Agents / Graphiti/Zep | 에이전트 기억이 단순 검색과 다르다는 걸 안다 |
| Context engineering 자료 | Claude Memory, Obsidian, Notion을 AI 업무 자산으로 볼 수 있다 |

### Month 5 — Multimodal / Evaluation

| 논문/자료 | 끝나면 할 수 있는 말 |
|---|---|
| CLIP | 텍스트와 이미지가 같은 의미 공간에서 연결되는 방식을 이해한다 |
| Diffusion / Flamingo / GPT-4V 자료 | 콘텐츠 AI와 multimodal assistant 흐름을 이해한다 |
| HELM / MMLU | 벤치마크가 무엇을 측정하고 무엇을 놓치는지 안다 |
| SWE-bench / HumanEval | coding agent 성능 발표를 비판적으로 읽을 수 있다 |

### Month 6 — 통합

| 산출물 | 의미 |
|---|---|
| AI paper lineage map | 논문 계보를 한 장으로 연결 |
| Weekly updates 회고 | 6개월 동안 AI 업계가 어떻게 움직였는지 정리 |
| Ann 업무 적용 map | PR/제안서/agent/콘텐츠에 연결되는 지식 축적 |
| PaperGym graduation note | “이제 AI 뉴스를 어떻게 읽는가” 자기 기준 완성 |

---

## 5. 6개월 후 지식 수준 변화

### 5-1. AI 뉴스 읽는 법

#### Before

- 새 모델 발표를 보면 “좋아졌나 보다” 정도로 받아들임
- benchmark 숫자가 높으면 좋아 보임
- agent, RAG, memory, reasoning이 섞여 보임
- 트렌드가 빠르게 바뀌면 따라가기 버거움

#### After

- 새 모델 발표를 보면 먼저 분류함
  - reasoning 개선인가?
  - tool use 개선인가?
  - post-training 개선인가?
  - memory/context 개선인가?
  - benchmark 최적화인가?
- benchmark 점수와 실제 업무 성능을 구분함
- hype와 실제 진전을 나눠서 본다
- “이건 지금 써볼 것 / 지켜볼 것 / 아카이브만 할 것”으로 분류한다

---

### 5-2. Claude Code / Agent 이해

#### Before

- Claude Code가 파일을 읽고 고치는 것은 알지만, 왜 그런 흐름인지 구조적으로 설명하기 어려움
- subagent, tool use, memory, verification이 감으로만 이해됨

#### After

- Claude Code를 ReAct 계열로 설명할 수 있음
- tool use와 agent loop를 구분할 수 있음
- 어떤 작업은 workflow로 충분하고, 어떤 작업은 agent가 필요한지 판단 가능
- 실패 후 self-reflection / verification 루프를 설계할 수 있음

---

### 5-3. PR / 제안서 / 콘텐츠 업무 적용

#### Before

- AI를 “빠르게 초안 써주는 도구”로 주로 사용
- AI 트렌드를 설명할 때 최신 뉴스 중심으로 말함
- 클라이언트에게 AI를 설명할 때 깊이 있는 구조가 부족할 수 있음

#### After

- AI를 “업무 루프를 설계하는 도구”로 사용
- 제안서에 AI 트렌드를 넣을 때 논문 계보로 뒷받침 가능
- 클라이언트 Q&A에서 과장 없이 설명 가능
- LinkedIn/기고/강의 소재로 바꿀 수 있는 AI 프레임이 생김

예:

```text
요즘 agent가 뜨는 이유는 단순히 모델이 똑똑해져서가 아니라,
ReAct식 reasoning-action loop, Toolformer식 tool use,
그리고 SWE-bench 같은 실제 작업 평가가 결합됐기 때문입니다.
```

---

### 5-4. 한국어로 설명하는 능력

#### Before

- 영어 논문을 읽으면 단어는 이해해도 한국어로 설명하기 어려움
- alignment, RAG, memory, scaling law 같은 용어가 뭉개짐

#### After

- 핵심 용어 80~150개를 영어/한국어로 연결
- 논문을 덮고 3문장 한국어 설명 가능
- 클라이언트/팀원/비개발자에게 난이도를 조절해서 설명 가능

예:

```text
RAG는 모델이 기억한 지식만 믿지 않고,
외부 문서를 검색해서 답변에 붙이는 방식입니다.
하지만 RAG는 기억이라기보다 검색이고,
MemGPT 같은 접근은 무엇을 장기적으로 저장하고 다시 꺼낼지 다루는 memory 문제에 가깝습니다.
```

---

## 6. 6개월 후 만들 수 있는 산출물

| 산출물 | 개수 | 의미 |
|---|---:|---|
| 핵심 논문 카드 | 12~18개 | 논문을 내 언어로 소화한 증거 |
| Weekly AI Update | 20~24개 | 최신 흐름 추적 기록 |
| Monthly Review | 6개 | 한 달 단위 통합 사고 |
| AI 용어 glossary | 80~150개 | 한국어 학습자용 자산 |
| PaperGym workout logs | 80~120개 | 실제 학습 지속성 증거 |
| Mermaid 개념도 | 12~24개 | 시각적 이해 기록 |
| LinkedIn/블로그 초안 | 6~12개 | 외부 공유 가능한 인사이트 |
| 업무 적용 프레임 | 30~50개 | ARK Point 업무에 바로 쓰는 자산 |

---

## 7. 성장 단계별 체감

### 4주 후

- CoT, ReAct, Toolformer의 차이를 말할 수 있음
- Claude Code가 왜 “생각 → 도구 → 관찰”로 움직이는지 감이 잡힘
- 논문을 읽을 때 어디를 봐야 하는지 알기 시작함

### 8주 후

- ChatGPT/Claude가 assistant처럼 행동하는 이유를 설명 가능
- RLHF, Constitutional AI, DPO의 큰 차이를 이해
- AI의 말투/거절/친절함이 훈련과 policy의 결과라는 감각이 생김

### 12주 후

- Transformer, GPT-3, Scaling Laws, Chinchilla를 한 흐름으로 연결
- 모델 발표에서 “크기, 데이터, compute, post-training”을 구분
- 단순 제품 업데이트와 기술 전환점을 구분하기 시작

### 16주 후

- RAG와 memory를 구분
- Obsidian, Notion, Claude Memory를 AI 업무 자산으로 보는 관점 형성
- “지식이 쌓이는 AI 직원” 구조를 설명 가능

### 20주 후

- multimodal, benchmark, coding agent 평가를 읽는 눈이 생김
- SWE-bench나 Chatbot Arena 숫자를 맹신하지 않음
- 콘텐츠 AI와 agent AI를 구분 가능

### 24주 후

- AI 업데이트를 논문 계보 위에 꽂는 능력 확보
- AI 공부가 뉴스 소비에서 구조적 판단으로 바뀜
- 업무/콘텐츠/제안서/agent 설계에 연결되는 자기 언어가 생김

---

## 8. 자기평가 체크리스트

6개월 전과 후에 같은 질문에 답한다.

### AI 구조 이해

- [ ] Transformer가 왜 중요한지 설명할 수 있다.
- [ ] GPT-3가 왜 전환점이었는지 설명할 수 있다.
- [ ] Scaling Laws와 Chinchilla의 차이를 말할 수 있다.

### Assistant / Alignment

- [ ] base model과 assistant model의 차이를 설명할 수 있다.
- [ ] RLHF가 무엇인지 비개발자에게 설명할 수 있다.
- [ ] Constitutional AI가 Claude와 어떻게 연결되는지 설명할 수 있다.

### Prompting / Agent

- [ ] CoT와 ReAct의 차이를 말할 수 있다.
- [ ] Tool use와 agent를 구분할 수 있다.
- [ ] Claude Code의 작업 루프를 논문 계보로 설명할 수 있다.

### RAG / Memory

- [ ] RAG와 memory의 차이를 말할 수 있다.
- [ ] context window의 한계를 설명할 수 있다.
- [ ] 장기 기억을 가진 AI assistant의 구조를 설명할 수 있다.

### Evaluation

- [ ] MMLU, HELM, HumanEval, SWE-bench가 각각 대략 무엇을 평가하는지 안다.
- [ ] leaderboard 점수만 보고 모델을 판단하지 않는다.
- [ ] benchmark와 실제 업무 성능의 차이를 설명할 수 있다.

### 업무 적용

- [ ] AI 업데이트를 PR/제안서 문장으로 바꿀 수 있다.
- [ ] 클라이언트에게 AI 트렌드를 과장 없이 설명할 수 있다.
- [ ] Claude Code에 더 나은 작업 루프를 설계해줄 수 있다.
- [ ] AI agent가 필요한 작업과 단순 workflow로 충분한 작업을 구분할 수 있다.

---

## 9. 전/후 비교표

| 영역 | 6개월 전 | 6개월 후 |
|---|---|---|
| AI 논문 | 제목은 들어봤지만 어디서부터 읽을지 막막함 | 핵심 논문 12~18편을 내 언어로 설명 |
| 최신 뉴스 | 빠르게 변해서 따라가기 어려움 | 매주 1~3개만 골라 논문 계보에 연결 |
| Claude Code | 잘 쓰지만 원리는 감각적 이해 | ReAct/tool use/verification loop로 설명 |
| RAG/Memory | 비슷하게 느껴짐 | 검색, context, memory를 구분 |
| Alignment | AI가 왜 친절하거나 거절하는지 막연함 | InstructGPT/RLHF/Constitutional AI로 설명 |
| Benchmark | 점수가 높으면 좋아 보임 | 무엇을 측정했는지 먼저 확인 |
| 한국어 설명 | 영어 용어가 뭉개짐 | 영어 원어+한국어 개념으로 설명 |
| 업무 적용 | AI를 빠른 초안 도구로 활용 | AI를 업무 시스템/agent 설계 도구로 활용 |
| 콘텐츠화 | 최신 뉴스 기반 단발성 소재 | 논문 계보 기반 깊이 있는 인사이트 |

---

## 10. 동기부여 문장

### 한국어

> 6개월 뒤의 목표는 AI 논문을 다 읽은 사람이 되는 것이 아니다.  
> AI 업데이트가 나올 때마다 “이게 어디서 온 변화인지” 알아보는 사람이 되는 것이다.

> PaperGym은 논문 요약기가 아니다.  
> 6개월 동안 AI 지식 체력을 키우는 운동 기록장이다.

> 매주 하나의 논문과 하나의 최신 업데이트를 연결하면, 24주 뒤에는 뉴스가 아니라 지도가 보인다.

### English

> The goal is not to read every AI paper.  
> The goal is to know where each new AI update belongs.

> PaperGym is not a summarizer.  
> It is a six-month workout log for AI research literacy.

> One paper, one update, one question per week.  
> After 24 weeks, you stop seeing news and start seeing the map.

---

## 11. 제품에 넣을 Progress 카피

```text
Week 1
You are not behind. You are building form.
```

```text
Week 4
You can now explain why Claude Code feels like an agent.
```

```text
Week 8
You now know why assistants are trained, not born.
```

```text
Week 12
Model releases now look less like magic and more like tradeoffs.
```

```text
Week 16
You can separate retrieval, context, and memory.
```

```text
Week 20
You no longer trust benchmarks blindly.
```

```text
Week 24
You have a map. New AI updates now have a place to land.
```

한국어 버전:

```text
1주차
늦은 게 아닙니다. 기본 자세를 만드는 중입니다.
```

```text
4주차
이제 Claude Code가 왜 agent처럼 움직이는지 설명할 수 있습니다.
```

```text
8주차
이제 assistant는 태어나는 게 아니라 훈련된다는 걸 압니다.
```

```text
12주차
모델 발표가 마법이 아니라 tradeoff로 보이기 시작합니다.
```

```text
16주차
retrieval, context, memory를 구분할 수 있습니다.
```

```text
20주차
benchmark 점수를 더 이상 그대로 믿지 않습니다.
```

```text
24주차
이제 지도가 있습니다. 새로운 AI 업데이트가 어디에 꽂히는지 보입니다.
```

---

## 12. 최종 약속

6개월 동안 PaperGym을 수행하면 얻는 것은 “논문 지식”만이 아니다.

얻게 되는 것:

1. AI 업데이트를 분류하는 눈
2. 논문을 겁내지 않는 자세
3. 영어 원문을 한국어 사고로 고정하는 능력
4. Claude/agent/tool use를 구조적으로 쓰는 능력
5. AI 트렌드를 업무 언어로 번역하는 능력
6. 6개월치 학습 로그와 콘텐츠 자산

한 줄로:

> PaperGym 6개월 후, AI 뉴스는 더 이상 소음이 아니라 신호가 된다.
