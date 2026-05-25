# PaperGym Weekly Update — Source Governance

> 목적: 6개월 동안 사람들의 시간을 쓰는 학습 프로그램이므로, 최신 AI 업데이트를 아무 뉴스나 넣지 않기 위한 소스 검증 기준을 둔다.

---

## 1. 결론

현재 소스 리스트는 방향은 좋다. 다만 그대로 쓰기에는 부족하다.

보강해야 할 점:

1. **공식/1차 소스와 해설/큐레이션 소스를 분리**해야 한다.
2. **최소 2-source verification** 규칙이 필요하다.
3. **학습 플랜에 넣는 기준과 탈락 기준**이 명확해야 한다.
4. Chatbot Arena, Hugging Face Trending, Latent Space 같은 소스는 유용하지만 **최종 판단 source가 아니라 signal source**로 써야 한다.

PaperGym의 원칙:

> 주간 업데이트는 뉴스가 아니라, 기본 논문 지도 위에 꽂히는 검증된 학습 세트여야 한다.

---

## 2. Source Tier 체계

### Tier 0 — Program Ground Truth

6개월 커리큘럼의 기준이 되는 내부 자료.

| 소스 | 역할 | 신뢰도 |
|---|---|---|
| `00-ai-paper-archive-index.md` | 6개월 학습 지도 | 매우 높음 |
| `papers/README.md` | 논문 원문/PDF 링크 인덱스 | 매우 높음 |
| `papergym-paper-corpus.json` | 앱용 paper corpus | 매우 높음 |

사용법:
- 최신 업데이트는 반드시 이 지도 중 하나의 계보에 연결되어야 한다.
- 연결되지 않으면 PaperGym 학습 플랜에 넣지 않는다.

---

### Tier 1 — Official Primary Sources

공식 발표, 연구소 블로그, 원문 논문. 가장 우선한다.

| 소스 | 용도 | 검증 메모 |
|---|---|---|
| Anthropic Research | Claude, alignment, interpretability, safety | 공식 연구 허브. Anthropic-specific이므로 broader source와 함께 사용 |
| Anthropic Engineering | Claude Code, agent, tool use, eval, infra | 공식 engineering 허브. PaperGym과 특히 잘 맞음 |
| OpenAI Research / News | 모델, product, multimodal, reasoning 업데이트 | 공식 source지만 WebFetch가 Cloudflare에 막힐 수 있음. 접근 안 되면 다른 공식 채널/보도자료/블로그 링크로 보조 확인 |
| Google DeepMind Blog | Gemini, reasoning, science AI, safety | 공식 source. DeepMind-specific |
| Meta AI Blog | LLaMA, open model, research/product 업데이트 | 공식 source. Meta-specific |
| arXiv / OpenReview / conference paper | 논문 원문 | 최종 paper verification source |
| GitHub official repo | open-source model/tool release | 코드/릴리즈 검증 source |
| SWE-bench official site | coding agent benchmark | benchmark family와 leaderboard 확인 가능 |

규칙:
- PaperGym에 `use_now`로 넣으려면 Tier 1 source가 최소 1개 필요하다.
- Tier 1이 없으면 `watch` 또는 `archive_only`로 낮춘다.

---

### Tier 2 — Evaluation / Benchmark Sources

성능 변화나 leaderboard를 추적하는 source.

| 소스 | 용도 | 주의 |
|---|---|---|
| SWE-bench | coding agent 평가 | 공식 benchmark 사이트. 다만 leaderboard 변화만 보고 제품 품질을 단정하지 않기 |
| Chatbot Arena / Arena AI | 모델 선호도 비교 | weekly trend signal로 유용. 날짜/방법론 변화 확인 필요 |
| HELM / Stanford CRFM | holistic eval | 업데이트 빈도는 낮지만 평가 기준 학습에 좋음 |
| Papers with Code / Hugging Face Papers | 논문/benchmark discovery | community signal. 최종 판단 전 원문 확인 필요 |

규칙:
- benchmark는 항상 “무엇을 측정하는가?”를 함께 적는다.
- leaderboard 상승만으로 `use_now`를 주지 않는다.
- 실제 업무 연결이 불명확하면 `watch`.

---

### Tier 3 — Curated Interpretation Sources

해설/큐레이션/뉴스레터. 맥락 파악에는 좋지만 최종 source는 아니다.

| 소스 | 용도 | 주의 |
|---|---|---|
| AI Frontier | 한국어 맥락, 학습용 해설 | 공식 논문 대체 X. Korean scaffold로 좋음 |
| Latent Space | AI engineer 관점 해설, industry context | 일부 유료/해설형. 원문 확인 필요 |
| The Batch | weekly broad AI digest | 좋은 헤드라인 source. 1차 source 확인 필요 |
| Hugging Face Blog | open-source 튜토리얼/해설 | 공식 HF 글은 유용하나 논문 검증은 원문으로 |
| Ben's Bites | 제품/스타트업 signal | market signal. 학습 source로는 낮은 우선순위 |

규칙:
- Tier 3는 “발견/맥락”용이다.
- Tier 3 단독으로 다음 주 학습 플랜에 넣지 않는다.
- 반드시 Tier 1 또는 원문 링크로 확인한다.

---

## 3. Weekly Update 선정 기준

최신 업데이트가 PaperGym에 들어가려면 아래 5개 중 최소 4개를 만족해야 한다.

| 기준 | 질문 |
|---|---|
| Source quality | 공식/1차 source가 있는가? |
| Lineage fit | 기본 논문 계보와 명확히 연결되는가? |
| Learning value | 사용자가 10~30분 안에 읽고 배울 수 있는가? |
| Practical relevance | Claude/agent/RAG/memory/eval 등 실제 도구 이해에 도움이 되는가? |
| Hype resistance | 진짜 진전과 포장 가능성을 구분할 수 있는가? |

---

## 4. 탈락 기준

아래 중 하나라도 해당하면 다음 주 플랜에서 제외하거나 `archive_only`로 보낸다.

- 공식 source 없음
- 출처가 트윗/요약글뿐임
- 논문 계보와 연결 불가
- 제품 광고성 발표인데 기술적 변화가 불명확
- benchmark 숫자만 있고 방법론/비교 조건이 불명확
- 30분 학습 세트로 만들기 어려움
- 사용자가 배울 개념보다 “신기한 데모”에 가까움

---

## 5. 최소 검증 규칙

### Rule A — 2-source verification

다음 주 플랜에 넣는 업데이트는 아래 중 2개 이상으로 확인한다.

1. 공식 발표 / 공식 블로그
2. 원문 논문 / arXiv / OpenReview
3. 공식 GitHub repo / model card
4. benchmark official site
5. 신뢰 가능한 큐레이션 source 1개

단, 공식 발표 하나만 있는 신제품/모델 release는 가능하되 `unknowns`를 반드시 적는다.

---

### Rule B — Lineage mandatory

모든 업데이트는 최소 1개 이상의 기본 논문 계보에 연결한다.

예:

| 업데이트 유형 | 연결 논문 |
|---|---|
| reasoning model | CoT, Self-Consistency, Tree of Thoughts |
| coding agent | ReAct, Toolformer, SWE-bench |
| memory feature | RAG, MemGPT, Graphiti/Zep |
| safety/policy | InstructGPT, Constitutional AI, DPO |
| multimodal | CLIP, Flamingo, GPT-4V |
| benchmark | HELM, MMLU, HumanEval, SWE-bench |

연결이 안 되면 PaperGym에는 넣지 않는다.

---

### Rule C — Hype Check required

모든 업데이트는 아래 3칸을 반드시 채운다.

```text
진짜 진전:
포장 가능성:
아직 모르는 것:
```

하나라도 비어 있으면 `use_now` 금지.

---

### Rule D — Max 3 updates

한 주에 넣는 최신 업데이트는 최대 3개.

추천:

- 1개: 다음 주 main paper와 직접 연결
- 1개: broader AI ecosystem 신호
- 1개: optional/watch only

---

## 6. Source 평가표

| 소스 | Tier | 신뢰도 | 커버리지 | PaperGym 역할 | 주의 |
|---|---:|---:|---:|---|---|
| Anthropic Research | 1 | 높음 | 중간 | Claude/alignment/agent 공식 source | Anthropic 편향 |
| Anthropic Engineering | 1 | 높음 | 중간 | Claude Code/tool use/agent source | Anthropic 편향 |
| OpenAI Research/News | 1 | 높음 | 중간 | frontier model/product source | 접근/Cloudflare 이슈 가능 |
| Google DeepMind Blog | 1 | 높음 | 중간 | Gemini/research/science AI | DeepMind 편향 |
| Meta AI Blog | 1 | 높음 | 중간 | LLaMA/open model | Meta 편향 |
| arXiv/OpenReview | 1 | 높음 | 넓음 | 논문 원문 확인 | 품질 편차 큼 |
| official GitHub/model card | 1 | 중~높음 | 좁음 | OSS release 검증 | repo hype 주의 |
| SWE-bench | 2 | 높음 | 좁음 | coding agent eval | benchmark overfitting 주의 |
| Arena AI / Chatbot Arena | 2 | 중간 | 중간 | model preference signal | 날짜/방법론 확인 필요 |
| Hugging Face Papers | 2 | 중간 | 넓음 | trending paper discovery | upvote/popularity bias |
| AI Frontier | 3 | 중간 | 중간 | 한국어 해설/학습 보조 | 1차 source 대체 X |
| Latent Space | 3 | 중간 | 넓음 | industry interpretation | 유료/해설 bias |
| The Batch | 3 | 중간 | 넓음 | broad weekly scan | 원문 확인 필요 |
| Ben's Bites | 3 | 낮~중간 | 넓음 | product/market signal | 학습 source로는 보조 |

---

## 7. Sunday Curation Checklist

일요일마다 아래 순서로 확인한다.

1. 다음 주 main paper 확인
2. main paper의 lineage 확인
3. Tier 1 source에서 관련 업데이트 검색
4. Tier 2 source에서 benchmark/leaderboard 변화 확인
5. Tier 3 source에서 놓친 신호 확인
6. 후보 5~8개 작성
7. source quality 점수 부여
8. lineage fit 점수 부여
9. 최종 1~3개만 선택
10. hype check 작성
11. Korean glossary 3개 추가
12. `next-week-plan.json` 생성

---

## 8. Scoring Rubric

각 후보 업데이트는 10점 만점으로 평가한다.

| 항목 | 점수 |
|---|---:|
| Source quality | 0~3 |
| Lineage fit | 0~3 |
| Learning value | 0~2 |
| Practical relevance | 0~1 |
| Hype resistance | 0~1 |

선정 기준:

| 점수 | 처리 |
|---:|---|
| 8~10 | next-week plan 후보 |
| 6~7 | watch 후보 |
| 4~5 | archive only |
| 0~3 | 제외 |

---

## 9. Ann 기준의 최종 판단

PaperGym은 많은 사람의 시간을 6개월 동안 쓸 수 있는 프로그램이므로, 최신 자료는 “재미있는 뉴스”가 아니라 “학습 체력에 기여하는 세트”여야 한다.

최종 질문:

> 이 업데이트를 넣었을 때, 사용자가 다음 주 기본 논문을 더 잘 이해하게 되는가?

답이 아니면 제외한다.
