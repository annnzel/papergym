# PaperGym Demo Source Cards

> 앱 데모 화면, 처방전, 발표 보조자료에 바로 붙일 수 있는 논문 소스 카드.

---

## Card 1 — Chain-of-Thought

**Title**  
Chain-of-Thought Prompting Elicits Reasoning in Large Language Models

**Short Title**  
Chain-of-Thought

**Source**  
https://arxiv.org/abs/2201.11903

**Local PDF**  
`../papers/core/02-chain-of-thought-2201.11903.pdf`

**Track**  
Prompting / Reasoning

**Why this paper matters**  
This paper made “show your reasoning steps” a concrete prompting pattern. It explains why a prompt can be more than an instruction: it can shape the model’s reasoning path.

**Plain Korean translation**  
이 논문은 “AI에게 그냥 답을 묻지 말고, 생각 과정을 쓰게 하면 더 어려운 문제를 잘 푼다”는 것을 보여준다. Claude Code에게 일을 시킬 때도 단순히 “해줘”보다 “어떤 순서로 판단하고 실행할지”를 주는 게 중요한 이유다.

**PaperGym 30-minute target**
- Abstract
- Introduction
- Figure 1
- Chain-of-thought prompting examples

**Workout Questions**
1. CoT는 단순히 답을 길게 쓰는 것과 무엇이 다른가?
2. 왜 중간 추론 과정이 성능을 올릴 수 있나?
3. 어떤 업무에서 CoT가 특히 유용한가?
4. Claude Code에게 일을 시킬 때 이 논문을 어떻게 적용할 수 있나?
5. CoT의 한계는 무엇인가?

**Ann 업무 연결**
- PR 기사: “먼저 핵심 메시지 → 한국 독자 맥락 → 인용구 → 제목” 순서로 사고 구조를 강제
- 제안서: “문제 → 병목 → 대안 → 추천안”을 먼저 생각하게 만들기
- Claude Code: 구현 전에 plan / verify 루프를 만들기

---

## Card 2 — ReAct

**Title**  
ReAct: Synergizing Reasoning and Acting in Language Models

**Short Title**  
ReAct

**Source**  
https://arxiv.org/abs/2210.03629

**Local PDF**  
`../papers/core/01-react-2210.03629.pdf`

**Track**  
Agent / Reasoning

**Why this paper matters**  
ReAct combines reasoning and acting. It is the clearest paper for understanding why Claude Code reads files, runs tools, observes results, and then decides the next step.

**Plain Korean translation**  
이 논문은 AI가 머릿속으로만 생각하는 게 아니라, 생각하고 → 행동하고 → 결과를 보고 → 다시 생각하는 루프를 제안한다. 우리가 Claude Code에서 보는 “파일 읽기 → 수정 → 테스트 → 다시 판단”이 바로 이 계보 위에 있다.

**PaperGym 30-minute target**
- Abstract
- Figure 1
- Introduction
- ReAct Prompting section

**Workout Questions**
1. ReAct는 CoT와 무엇이 다른가?
2. Action 없이 Thought만 있으면 어떤 문제가 생기나?
3. Observation은 왜 중요한가?
4. Claude Code의 어느 행동이 ReAct와 닮았나?
5. 마케팅 리서치 agent에 ReAct를 적용하면 Action은 무엇인가?

**Ann 업무 연결**
- 리서치: 생각 → 검색/문서 읽기 → 결과 관찰 → 다음 질문
- PR 작성: 원문 읽기 → 한국 맥락 확인 → 초안 작성 → 톤 검토
- 제안서: 클라이언트 자료 읽기 → 시장 자료 확인 → 구조화 → 검증

---

## Card 3 — InstructGPT

**Title**  
Training language models to follow instructions with human feedback

**Short Title**  
InstructGPT / RLHF

**Source**  
https://arxiv.org/abs/2203.02155

**Local PDF**  
`../papers/core/03-instructgpt-2203.02155.pdf`

**Track**  
Alignment / Assistant Training

**Why this paper matters**  
This is the bridge from raw language model to useful assistant. It explains why models need human feedback to become helpful, honest, and aligned with user intent.

**Plain Korean translation**  
큰 언어모델이라고 해서 자동으로 사람 말을 잘 듣는 건 아니다. 이 논문은 사람의 데모와 선호 평가를 이용해 모델을 “말 잘 듣는 assistant”로 바꾸는 과정을 보여준다.

**PaperGym 30-minute target**
- Abstract
- Introduction
- Training pipeline figure
- Methods overview

**Workout Questions**
1. 왜 더 큰 모델이 항상 더 도움이 되는 답을 주지는 않나?
2. SFT, Reward Model, PPO는 각각 무엇을 하나?
3. 사람의 선호 데이터는 모델 행동을 어떻게 바꾸나?
4. ChatGPT/Claude의 친절한 말투는 어디서 생기나?
5. PaperGym mentor의 성격도 이런 방식으로 설계한다면 어떤 feedback이 필요할까?

**Ann 업무 연결**
- 브랜드 AI assistant를 만들 때 tone/policy/선호 답변 예시가 중요
- “AI가 왜 이렇게 답하는가”를 클라이언트에게 설명할 수 있음
- PR 스타일 가이드도 일종의 preference data로 볼 수 있음

---

## Card 4 — Toolformer

**Title**  
Toolformer: Language Models Can Teach Themselves to Use Tools

**Short Title**  
Toolformer

**Source**  
https://arxiv.org/abs/2302.04761

**Local PDF**  
`../papers/core/04-toolformer-2302.04761.pdf`

**Track**  
Tool Use

**Why this paper matters**  
It asks a key question for agentic AI: can a model learn when a tool call is useful? This connects directly to API-calling agents, Claude Code tools, and MCP.

**Plain Korean translation**  
모델이 모든 걸 머릿속에서 맞히려고 하지 않고, 필요할 때 계산기·검색·API 같은 도구를 부를 수 있다면 훨씬 강해진다. Toolformer는 “언제 도구를 써야 하는가”를 모델이 배울 수 있는지 다룬다.

**PaperGym 30-minute target**
- Abstract
- Introduction
- Figure 1
- Approach overview

**Workout Questions**
1. 모델 내부 지식과 외부 도구 호출은 무엇이 다른가?
2. 어떤 업무는 왜 도구가 필수인가?
3. 잘못된 tool use는 어떤 문제를 만들 수 있나?
4. Claude Code의 Read/Edit/Bash 도구는 Toolformer 관점에서 어떻게 보이나?
5. ARK Point 업무 agent라면 어떤 도구가 필요할까?

**Ann 업무 연결**
- PR 작성 agent: Google Docs, Drive, web search, style guide 읽기
- 제안서 agent: Notion, PDF, 과거 제안서, 사례 DB 연결
- 리서치 agent: 최신 자료 검색 + 원문 검증 + 요약

---

## Card 5 — Constitutional AI

**Title**  
Constitutional AI: Harmlessness from AI Feedback

**Short Title**  
Constitutional AI

**Source**  
https://arxiv.org/abs/2212.08073

**Local PDF**  
`../papers/core/09-constitutional-ai-2212.08073.pdf`

**Track**  
Alignment / Safety

**Why this paper matters**  
It is central to understanding Anthropic and Claude. It shows how explicit principles can shape assistant behavior.

**Plain Korean translation**  
Claude가 그냥 “착한 말투”를 가진 게 아니라, 어떤 원칙을 기준으로 도움이 되면서도 해롭지 않게 답하도록 훈련된다는 관점이다. 기업용 AI에도 “우리만의 constitution”이 필요하다는 힌트를 준다.

**PaperGym 30-minute target**
- Abstract
- Introduction
- Method overview
- Example principles

**Workout Questions**
1. constitution은 무엇인가?
2. human feedback과 AI feedback은 어떻게 다른가?
3. harmlessness와 helpfulness는 언제 충돌하나?
4. Claude의 답변 스타일은 이 논문과 어떻게 연결되나?
5. PaperGym mentor에게 필요한 constitution은 무엇인가?

**Ann 업무 연결**
- PR assistant constitution: 과장 금지, 출처 우선, 한국 미디어 톤
- 제안서 assistant constitution: 고객사 사실 추측 금지, 수치 명시, 액션 중심
- PaperGym mentor constitution: 쉽게 떠먹이지 말고, 필요한 인지부하를 걸 것
