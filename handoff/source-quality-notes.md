# PaperGym Source Quality Notes

> 목적: PaperGym이 “AI가 아무 논문이나 추천하는 앱”이 아니라, 신뢰 가능한 1차 소스 기반 학습 도구라는 점을 보여주기 위한 자료.

---

## 1. 소스 원칙

PaperGym의 기본 자료는 아래 우선순위를 따른다.

1. **Primary paper** — arXiv, conference paper, 연구기관 원문
2. **Official research/engineering blog** — Anthropic, OpenAI, DeepMind, Meta AI 등
3. **Benchmark/leaderboard 원문** — SWE-bench, Chatbot Arena, HELM 등
4. **해설 자료** — AI Frontier, Latent Space, Hugging Face Blog 등
5. **일반 뉴스/트위터/요약글** — 최신 신호 감지용. 핵심 학습 소스로는 사용하지 않음

---

## 2. PaperGym이 피하는 것

PaperGym은 다음을 기본 학습 소스로 삼지 않는다.

- 출처 없는 AI 요약
- 링크가 죽은 큐레이션 글
- 논문 원문 없이 제목만 모은 리스트
- “Top 10 AI papers”류의 맥락 없는 콘텐츠
- 벤치마크 숫자만 가져온 홍보성 자료

이유:

> PaperGym의 핵심은 요약 소비가 아니라 1차 소스를 직접 들어 올리는 것이다.

---

## 3. 논문 선정 기준

각 논문은 아래 기준 중 최소 2개 이상을 만족해야 한다.

| 기준 | 설명 |
|---|---|
| 계보성 | 이후 연구/제품의 기반이 되었는가? |
| 실무 연결성 | Claude, ChatGPT, Claude Code, RAG, agent 등 실제 도구와 연결되는가? |
| 설명력 | 최신 AI 뉴스를 해석하는 데 도움이 되는가? |
| 학습 효율 | 30분 안에 Abstract/Figure/핵심 Section으로 핵심을 잡을 수 있는가? |
| 반복 가치 | 1회 읽고 끝나는 자료가 아니라 이후에도 다시 참조할 가치가 있는가? |

---

## 4. Core Corpus의 신뢰 포인트

| 논문 | 신뢰 포인트 |
|---|---|
| Attention Is All You Need | Transformer 원 논문. 현대 LLM 구조의 출발점 |
| GPT-3 / Few-Shot Learners | large-scale language model과 in-context learning의 대표 사례 |
| Scaling Laws | compute/data/parameter scaling 담론의 핵심 원문 |
| Chinchilla | compute-optimal training과 data balance 논의의 핵심 전환점 |
| InstructGPT | RLHF와 instruction-following assistant의 대표 원문 |
| Constitutional AI | Anthropic/Claude alignment 철학을 이해하는 핵심 자료 |
| Chain-of-Thought | reasoning prompt 계열의 대표 원문 |
| ReAct | agent loop와 tool use reasoning의 핵심 원문 |
| Toolformer | model-driven tool use 학습의 대표 원문 |
| RAG | retrieval-augmented generation의 원조격 논문 |
| MemGPT | LLM memory/context management를 OS 관점으로 설명 |
| Reflexion / Tree of Thoughts | agent self-improvement와 deliberative reasoning의 대표 패턴 |

---

## 5. 최신 자료 30~40%의 역할

최신 자료는 “학습의 중심”이 아니라 “지도 위에 새 점을 찍는 작업”이다.

예시:

| 최신 업데이트 | 연결할 기본 논문 |
|---|---|
| reasoning model release | CoT, Self-Consistency, Tree of Thoughts |
| Claude Code update | ReAct, Toolformer, Building Effective Agents |
| memory feature launch | RAG, MemGPT, Graphiti/Zep, LLM Wiki |
| new multimodal model | CLIP, Flamingo, GPT-4V |
| coding agent leaderboard | HumanEval, SWE-bench |
| model safety/policy update | InstructGPT, Constitutional AI, DPO |

---

## 6. PaperGym 데모에서 강조할 소스 차별점

짧은 버전:

> PaperGym starts from the original paper, not from a summary of a summary.

한국어:

> PaperGym은 요약의 요약이 아니라, 원문 논문에서 시작합니다.

조금 긴 버전:

> Most AI study tools make papers easier to consume. PaperGym makes them easier to train with. It picks a primary source, prescribes only the sections worth lifting today, sends you offline, and tests whether the idea actually stuck.

한국어:

> 대부분의 AI 학습 도구는 논문을 더 쉽게 소비하게 만듭니다. PaperGym은 논문으로 훈련하게 만듭니다. 1차 소스를 고르고, 오늘 들어야 할 섹션만 처방하고, 화면 밖에서 읽게 한 뒤, 진짜 머리에 남았는지 확인합니다.

---

## 7. 앱 내 Source Badge 제안

각 논문 카드에 아래 badge를 붙이면 신뢰감이 올라간다.

```text
PRIMARY SOURCE
arXiv · ICLR 2023 · Agent/Reasoning
```

또는 한국어:

```text
1차 소스
arXiv · ICLR 2023 · Agent/Reasoning
```

Badge 필드 예시:

```json
{
  "source_type": "primary_paper",
  "source_badge": "PRIMARY SOURCE",
  "venue_badge": "ICLR 2023",
  "track_badge": "Agent / Reasoning"
}
```

---

## 8. 논문 난이도 표기

PaperGym에서는 논문 난이도를 학술 난이도가 아니라 “30분 운동 부하”로 표시한다.

| 부하 | 의미 | 예시 |
|---|---|---|
| Light | Abstract + Figure만 봐도 핵심 감 잡힘 | Chain-of-Thought, ReAct |
| Medium | Method를 조금 봐야 함 | InstructGPT, Toolformer, RAG |
| Heavy | 구조/수식/실험표가 복잡함 | Attention, Scaling Laws, Chinchilla |
| Max | 30분 1회로는 무리. 반복 운동용 | HELM, GPT-3 전체, Flamingo |

앱 문구:

```text
Today's Load: Medium
Goal: Understand the loop, not every experiment.
```

한국어:

```text
오늘의 부하: Medium
목표: 모든 실험표가 아니라 핵심 루프를 이해하기.
```
