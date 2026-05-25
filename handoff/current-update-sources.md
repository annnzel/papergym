# PaperGym — 최신 자료 30~40% 소스 보강

> 목적: PaperGym의 “최신 자료” 영역을 아무 뉴스나 보는 것이 아니라, 기본 논문 계보에 연결되는 신뢰 가능한 업데이트 루틴으로 만든다.

---

## 1. 고정 소스 3개

### 1) Anthropic Research / Engineering

- Research: https://www.anthropic.com/research
- Engineering: https://www.anthropic.com/engineering
- 특히 볼 것: Claude, Claude Code, tool use, agents, evals, safety, context engineering

**PaperGym 연결**
- ReAct → Claude Code agent loop
- Toolformer → tool use / MCP
- Constitutional AI → Claude safety/alignment
- Evaluation → model behavior and product reliability

**읽는 질문**
1. 이 업데이트는 Claude의 어떤 능력을 강화했나?
2. 논문 계보로 보면 ReAct, Toolformer, RAG, Constitutional AI 중 어디에 가까운가?
3. Ann 업무에 바로 적용 가능한 변화인가?

---

### 2) OpenAI Research / News

- Research: https://openai.com/research
- News: https://openai.com/news
- 특히 볼 것: new model release, multimodal, reasoning, agents, product updates

**PaperGym 연결**
- GPT-3 → general-purpose language model
- InstructGPT → assistant behavior
- CoT/ToT → reasoning model
- CLIP / multimodal → image/video expansion

**읽는 질문**
1. 이 발표는 모델 자체 개선인가, 제품 포장인가?
2. reasoning, multimodal, memory, tool use 중 어느 축인가?
3. 기존 Claude/ChatGPT 사용 방식과 무엇이 달라지는가?

---

### 3) AI Frontier / 해설형 콘텐츠

- Website: https://aifrontier.kr
- 역할: 논문 원문 전후 맥락을 한국어/업계 언어로 빠르게 잡기

**PaperGym 연결**
- 논문 전 워밍업 또는 논문 후 쿨다운 자료
- 단, 1차 소스 대체재가 아니라 보조 해설로만 사용

**읽는 질문**
1. 이 에피소드는 어떤 논문/개념과 연결되는가?
2. 클라이언트에게 설명한다면 3문장으로 어떻게 말할까?
3. 제안서/PR/LinkedIn 소재로 쓸 수 있는가?

---

## 2. 회전 소스

매주 아래 중 2개만 선택한다. 전부 보려고 하지 않는다.

| 소스 | 링크 | 주로 볼 축 |
|---|---|---|
| Google DeepMind Blog | https://deepmind.google/discover/blog/ | foundation, reasoning, science AI, multimodal |
| Meta AI Blog | https://ai.meta.com/blog/ | open models, LLaMA, infra |
| Hugging Face Blog | https://huggingface.co/blog | open source, RAG, agent tutorials |
| Latent Space | https://www.latent.space/ | developer AI, agents, infra |
| The Batch | https://www.deeplearning.ai/the-batch/ | broad AI weekly signal |
| Ben's Bites | https://www.bensbites.com/ | product/startup trend signal |
| Chatbot Arena | https://lmarena.ai/ | model comparison / leaderboard |
| SWE-bench | https://www.swebench.com/ | coding agent evaluation |
| Papers with Code | https://paperswithcode.com/ | benchmark and paper discovery |

---

## 3. 최신 자료 분류 태그

PaperGym에서 최신 업데이트를 넣을 때 아래 태그 중 하나를 붙인다.

```json
{
  "update_type": "model_release | research_blog | benchmark | product_update | open_source | market_signal",
  "paper_lineage": "CoT | ReAct | Toolformer | InstructGPT | ConstitutionalAI | RAG | MemGPT | CLIP | SWE-bench",
  "actionability": "use_now | watch | archive_only"
}
```

---

## 4. Weekly Update 카드 템플릿

```md
# Weekly AI Update — YYYY-MM-DD

## 이번 주 가장 중요한 업데이트 3개

1. 
2. 
3. 

## 논문 계보 연결

| 업데이트 | 연결 논문 | 이유 |
|---|---|---|
|  |  |  |

## 진짜 진전 vs 포장

### 진짜 진전
- 

### 포장 가능성
- 

### 아직 모르는 것
- 

## Ann 업무 연결

### 바로 써먹을 것
- 

### 지켜볼 것
- 

### 아카이브만
- 
```

---

## 5. PaperGym 앱에서의 표현

### 최신 자료 카피

```text
Current Update Rep
Connect one live AI update to today's foundational paper.
```

한국어:

```text
최신 업데이트 1세트
오늘의 기본 논문과 이번 주 AI 업데이트 하나를 연결하세요.
```

### 예시

```text
Today's Paper: ReAct
Current Update Rep: Claude Code feature update
Question: Which part of the ReAct loop did this update improve — Thought, Action, or Observation?
```

한국어:

```text
오늘의 논문: ReAct
최신 업데이트 세트: Claude Code 기능 업데이트
질문: 이 업데이트는 ReAct 루프 중 Thought, Action, Observation 중 무엇을 강화했나요?
```

---

## 6. 최신 자료는 “뉴스”가 아니라 “세트”다

PaperGym 메타포에 맞춰 최신 자료는 cardio가 아니라 accessory set이다.

- 기본 논문 = main lift
- 최신 자료 = accessory set
- Weekly Update = workout log review

짧은 제품 문구:

```text
Main Lift: foundational paper
Accessory Set: current AI update
Workout Log: what changed in your understanding
```

한국어:

```text
메인 운동: 기본 논문
보조 세트: 최신 AI 업데이트
운동 기록: 내 이해가 어떻게 바뀌었는지
```
