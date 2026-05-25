# PaperGym — 8주 MVP 커리큘럼 맵

> 목적: 6개월 전체 로드맵 중 해커톤 데모와 초기 제품에 바로 넣을 수 있는 **첫 8주 프로그램**.  
> 비율: **기본 논문 70% / 최신 자료 30%**  
> 제품 문구: “Form Building Phase — AI 논문 체력의 기본 자세를 만드는 8주”

---

## 프로그램 요약

| 주차 | 이름 | 핵심 논문 | 트랙 | 오늘의 운동 목표 |
|---:|---|---|---|---|
| 1 | Think Step by Step | Chain-of-Thought | Prompting / Reasoning | “AI에게 생각 경로를 주면 무엇이 달라지는가” 이해 |
| 2 | Think, Act, Observe | ReAct | Agent / Reasoning | Claude Code의 작업 루프 이해 |
| 3 | Call the Right Tool | Toolformer | Tool Use | 모델이 도구를 쓴다는 것의 의미 이해 |
| 4 | Agent Form Check | Building Effective Agents + 복습 | Agent Architecture | CoT → ReAct → Tool Use 연결 |
| 5 | From Model to Assistant | InstructGPT | Alignment / RLHF | base model이 assistant가 되는 과정 이해 |
| 6 | Principles as Training Signal | Constitutional AI | Alignment | Claude식 원칙 기반 정렬 이해 |
| 7 | Preference, Not Just Prompt | DPO / RLHF 보충 | Post-training | “좋은 답변”을 학습시키는 방식 이해 |
| 8 | Assistant Training Review | 복습 + 최신 모델 release note | Integration | ChatGPT/Claude가 왜 다르게 행동하는지 정리 |

---

## Week 1 — Chain-of-Thought

**Program Context**
- Phase: Form Building
- Ratio: 70% Foundation / 30% Current Updates
- Track: Prompting / Reasoning
- Paper: `Chain-of-Thought Prompting Elicits Reasoning in Large Language Models`
- Local PDF: `../papers/core/02-chain-of-thought-2201.11903.pdf`
- Source: https://arxiv.org/abs/2201.11903

**Why now**
CoT는 PaperGym의 첫 운동으로 가장 좋다. 사용자가 “AI 요약을 읽는 것”이 아니라 “AI가 왜 생각 과정을 쓰는지”를 직접 이해하게 만든다. 이후 ReAct, Toolformer, Agent 논문을 이해하는 기본 자세다.

**30분 처방 섹션**
1. Abstract
2. §1 Introduction
3. Figure 1
4. §2 Chain-of-thought prompting

**운동 질문**
1. CoT는 단순히 “답을 길게 쓰는 것”과 무엇이 다른가?
2. 왜 중간 추론 단계를 쓰면 성능이 올라갈 수 있는가?
3. 어떤 종류의 업무에서 CoT가 특히 유용한가?
4. Claude Code에게 일을 시킬 때 CoT식 프롬프트는 어떻게 생겼을까?
5. Ann의 PR/제안서 업무에서 “생각 과정을 강제한다”는 건 어떤 의미인가?

**최신 자료 30% 연결**
- 최신 reasoning model 발표 1~2개를 보고 CoT와 연결한다.
- 질문: “이 모델의 개선은 더 긴 생각인가, 더 좋은 search인가, 더 좋은 post-training인가?”

---

## Week 2 — ReAct

**Program Context**
- Phase: Form Building
- Ratio: 70% Foundation / 30% Current Updates
- Track: Agent / Reasoning
- Paper: `ReAct: Synergizing Reasoning and Acting in Language Models`
- Local PDF: `../papers/core/01-react-2210.03629.pdf`
- Source: https://arxiv.org/abs/2210.03629

**Why now**
CoT가 “생각하기”였다면 ReAct는 “생각하고 행동하고 관찰하기”다. Claude Code, Cursor, Codex 같은 coding agent를 이해하는 핵심 루프다.

**30분 처방 섹션**
1. Abstract
2. Figure 1
3. §1 Introduction
4. §3 ReAct Prompting

**운동 질문**
1. ReAct는 Chain-of-Thought와 무엇이 다른가?
2. Thought, Action, Observation 중 하나가 빠지면 어떤 문제가 생기는가?
3. Claude Code가 파일을 읽고 수정하고 다시 확인하는 과정은 ReAct와 어떻게 닮았나?
4. ReAct는 hallucination을 어떻게 줄일 수 있나?
5. 마케팅 리서치 에이전트에 ReAct를 적용하면 Action은 무엇이 될까?

**최신 자료 30% 연결**
- Claude Code, Codex, Cursor, Devin 등 agent 제품 업데이트를 1개 확인한다.
- 질문: “이 제품은 ReAct 루프 중 어느 부분을 강화했나?”

---

## Week 3 — Toolformer

**Program Context**
- Phase: Form Building
- Track: Tool Use
- Paper: `Toolformer: Language Models Can Teach Themselves to Use Tools`
- Local PDF: `../papers/core/04-toolformer-2302.04761.pdf`
- Source: https://arxiv.org/abs/2302.04761

**Why now**
ReAct가 “도구를 쓰는 루프”를 보여줬다면, Toolformer는 “모델이 언제 도구를 써야 하는지 학습할 수 있는가”를 다룬다. Claude Code의 tool use, MCP, API 호출형 agent를 이해하는 다리다.

**30분 처방 섹션**
1. Abstract
2. Figure 1
3. §1 Introduction
4. §2 Approach

**운동 질문**
1. 모델 안에 모든 지식을 넣는 것과 외부 도구를 호출하는 것은 어떻게 다른가?
2. Toolformer는 도구 호출 데이터를 어떻게 만든다고 설명하는가?
3. 언제 도구를 쓰는 게 오히려 해가 될 수 있나?
4. Claude Code가 사용하는 도구들은 Toolformer 관점에서 어떻게 분류될까?
5. PR/제안서 자동화 agent라면 어떤 tool set이 필요한가?

---

## Week 4 — Agent Form Check

**Program Context**
- Phase: Form Building Review
- Track: Agent Architecture
- 자료: Anthropic `Building Effective Agents` + Week 1~3 복습
- Source: https://www.anthropic.com/engineering/building-effective-agents

**Why now**
논문 3편을 읽은 뒤 agent를 제품 구조로 다시 본다. CoT는 reasoning, ReAct는 loop, Toolformer는 tool use다. 이 셋이 합쳐져 PaperGym, Claude Code, coding agent의 기본 뼈대가 된다.

**30분 처방 섹션**
1. Building Effective Agents 핵심 패턴
2. Workflows vs Agents 구분
3. Tool use / routing / evaluator-optimizer 패턴
4. Week 1~3 논문 연결표 작성

**운동 질문**
1. Workflow와 Agent는 무엇이 다른가?
2. ReAct는 agent pattern 중 어디에 들어가는가?
3. Tool use는 언제 필수이고 언제 과한가?
4. PaperGym은 workflow인가 agent인가?
5. Ann 업무에서 agent로 만들 만한 작업과 workflow로 충분한 작업은 무엇인가?

---

## Week 5 — InstructGPT

**Program Context**
- Phase: Assistant Training
- Track: Alignment / RLHF
- Paper: `Training language models to follow instructions with human feedback`
- Local PDF: `../papers/core/03-instructgpt-2203.02155.pdf`
- Source: https://arxiv.org/abs/2203.02155

**Why now**
Agent가 일하려면 먼저 assistant가 되어야 한다. InstructGPT는 base LM이 사람 말을 잘 듣는 assistant로 바뀌는 과정을 보여준다.

**30분 처방 섹션**
1. Abstract
2. Figure 1 또는 Figure 2
3. §1 Introduction
4. §3 Methods

**운동 질문**
1. 큰 모델이 왜 자동으로 instruction-following을 잘하지 않는가?
2. SFT, reward model, PPO는 각각 어떤 역할인가?
3. 사람의 선호는 모델 학습에 어떻게 들어가는가?
4. 왜 작은 InstructGPT가 큰 GPT-3보다 선호될 수 있었나?
5. 이 논문은 ChatGPT/Claude의 말투를 어떻게 설명하나?

---

## Week 6 — Constitutional AI

**Program Context**
- Phase: Assistant Training
- Track: Alignment / Safety
- Paper: `Constitutional AI: Harmlessness from AI Feedback`
- Local PDF: `../papers/core/09-constitutional-ai-2212.08073.pdf`
- Source: https://arxiv.org/abs/2212.08073

**Why now**
InstructGPT가 human feedback 중심이라면, Constitutional AI는 명시적 원칙과 AI feedback을 사용한다. Claude를 이해하는 핵심 논문이다.

**30분 처방 섹션**
1. Abstract
2. §1 Introduction
3. Figure 1
4. §2 Methods

**운동 질문**
1. Constitutional AI에서 constitution은 무엇인가?
2. AI feedback은 human feedback과 어떻게 다른가?
3. helpfulness와 harmlessness는 왜 충돌할 수 있나?
4. Claude의 거절/안전 행동은 이 논문과 어떻게 연결되는가?
5. ARK Point용 AI assistant라면 어떤 constitution이 필요할까?

---

## Week 7 — DPO / Preference Optimization

**Program Context**
- Phase: Assistant Training
- Track: Post-training
- Paper: `Direct Preference Optimization`
- Local PDF: `../papers/supplemental/dpo-2305.18290.pdf`
- Source: https://arxiv.org/abs/2305.18290

**Why now**
RLHF 이후 post-training은 더 단순하고 안정적인 선호 최적화 방법으로 확장됐다. DPO는 “좋은 답변을 고르는 선호 데이터”가 모델을 어떻게 바꾸는지 이해하는 데 좋다.

**30분 처방 섹션**
1. Abstract
2. §1 Introduction
3. Figure 1
4. Method 직관 부분만

**운동 질문**
1. DPO는 RLHF/PPO보다 무엇을 단순화하려고 하나?
2. preference pair는 어떤 데이터를 뜻하나?
3. “좋은 답변”을 학습시킨다는 건 prompt engineering과 어떻게 다른가?
4. 브랜드 톤/에디토리얼 톤을 학습시키는 것과 연결하면?
5. Ann의 글쓰기/PR 스타일 가이드는 preference data가 될 수 있나?

---

## Week 8 — Assistant Training Review

**Program Context**
- Phase: Integration Review
- Track: Alignment / Product Behavior
- 자료: InstructGPT + Constitutional AI + DPO 복습 + 최신 모델 release note 1~2개

**Why now**
Month 2를 끝내기 전에 “왜 AI마다 다르게 행동하는가”를 하나의 설명으로 묶는다. ChatGPT, Claude, Gemini의 차이를 단순 성능이 아니라 post-training과 product policy 관점에서 본다.

**30분 처방 섹션**
1. InstructGPT pipeline 다시 보기
2. Constitutional AI method 다시 보기
3. DPO 직관 다시 보기
4. 최신 모델 release note 1개 분류

**운동 질문**
1. base model, instruction-tuned model, aligned assistant는 어떻게 다른가?
2. Claude와 ChatGPT의 답변 차이는 어디서 생길 수 있나?
3. system prompt와 post-training은 무엇이 다른가?
4. 기업용 AI assistant를 만들 때 policy와 tone은 어디에 들어가야 하나?
5. PaperGym mentor의 “하드코어하지만 도움이 되는” 성격은 어떻게 설계해야 하나?

---

## 제품에 넣을 짧은 문구

```text
Form Building Phase
8 weeks to build your AI research posture.
70% foundational papers, 30% current updates.
No passive summaries. Read, struggle, answer, repeat.
```

한국어:

```text
기본 자세 만들기 8주
AI 논문을 읽는 체력을 먼저 만듭니다.
기본 논문 70%, 최신 업데이트 30%.
요약을 소비하지 말고, 읽고 답하고 다시 듭니다.
```
