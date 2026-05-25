# PaperGym Weekly Update System

> 목적: 매주 일요일, 지난 7일간의 주요 AI 업데이트를 수집해 PaperGym의 다음 주 학습 플랜 중 **30~40% 최신 자료 영역**에 자동 반영한다.

---

## 1. 한 줄 정의

PaperGym의 기본 논문이 **main lift**라면, Weekly Update System은 매주 바뀌는 **accessory set**이다.

```text
Main Lift: foundational paper
Accessory Set: current AI update
Sunday Review: choose next week's accessory set
```

한국어:

```text
메인 운동: 기본 논문
보조 세트: 최신 AI 업데이트
일요일 리뷰: 다음 주 보조 세트 선정
```

---

## 2. 운영 주기

| 시점 | 작업 | 산출물 |
|---|---|---|
| 매주 일요일 | 지난 7일 AI 업데이트 수집 | `weekly-update-YYYY-MM-DD.md` |
| 같은 날 | 기본 논문 계보와 연결 | `next-week-plan-YYYY-MM-DD.json` |
| 다음 주 월~금 | PaperGym에 최신 자료 workout으로 노출 | 앱의 Program Context / Current Update Rep |

---

## 3. 왜 필요한가

6개월 로드맵은 기본 논문 중심이다. 하지만 AI 분야는 매주 모델 발표, agent 제품 업데이트, benchmark 변화가 나온다.

따라서 PaperGym은 두 층으로 운영한다.

1. **Stable Layer** — 바뀌지 않는 기본 논문 지도
   - CoT
   - ReAct
   - InstructGPT
   - Toolformer
   - RAG
   - MemGPT

2. **Live Layer** — 매주 바뀌는 최신 업데이트
   - Claude / OpenAI / DeepMind / Meta 발표
   - AI Frontier 에피소드
   - Chatbot Arena / SWE-bench 변화
   - 주요 open-source 모델/agent repo

Weekly Update System은 Live Layer를 관리한다.

---

## 4. 주간 비율 반영

| 기간 | 기본 논문 | 최신 자료 | Weekly Update 역할 |
|---|---:|---:|---|
| 1~8주 | 70% | 30% | 최신 자료 1~2개만 가볍게 연결 |
| 9~24주 | 60% | 40% | 최신 자료 2~3개를 논문 계보에 연결 |
| 매월 마지막 주 | 40% | 60% | 월간 업데이트 리뷰 중심으로 운영 |

---

## 5. 시스템 입력

Weekly Update System은 아래 정보를 기준으로 작동한다.

### 고정 입력

- `../../00-ai-paper-archive-index.md`
- `../../papers/README.md`
- `../handoff/papergym-paper-corpus.json` 또는 앱 내부 paper corpus
- `source-governance.md` — source tier, 검증 규칙, 탈락 기준

### 매주 새로 확인할 소스

소스는 `source-governance.md`의 Tier 체계를 따른다.

**Tier 1 — 공식/1차 소스**
- Anthropic Research / Engineering
- OpenAI Research / News
- Google DeepMind Blog
- Meta AI Blog
- arXiv / OpenReview / conference paper
- 공식 GitHub repo / model card

**Tier 2 — 평가/발견 소스**
- SWE-bench
- Chatbot Arena / Arena AI
- Hugging Face Papers / Papers with Code
- HELM / MMLU 등 benchmark source

**Tier 3 — 해설/큐레이션 소스**
- AI Frontier
- Latent Space
- The Batch
- Hugging Face Blog
- Ben's Bites

중요: Tier 3는 발견과 맥락용이다. Tier 3 단독으로 다음 주 플랜에 넣지 않는다.

---

## 6. 시스템 출력

매주 2개 파일을 만든다.

```text
weekly-update-YYYY-MM-DD.md
next-week-plan-YYYY-MM-DD.json
```

### `weekly-update-YYYY-MM-DD.md`

사람이 읽는 주간 요약.

- 이번 주 중요한 업데이트 3~5개
- 각 업데이트의 source link
- 연결되는 기본 논문
- 진짜 진전 vs 마케팅 포장
- PaperGym에 넣을 질문

### `next-week-plan-YYYY-MM-DD.json`

앱이 읽을 수 있는 다음 주 계획.

- week number
- main paper
- current update reps
- 질문
- source URL
- actionability

---

## 7. MVP 구현 방식

해커톤/초기 버전에서는 완전 자동 크롤러를 만들 필요 없다.

추천 MVP:

1. 일요일에 Claude에게 `sunday-curation-prompt.md` 실행
2. Claude가 웹 검색/소스 확인 후 `weekly-update.md` 작성
3. Claude가 `next-week-plan.json` 생성
4. PaperGym 앱은 JSON을 수동 복사하거나 파일로 읽음

이 방식이 빠르고 안전하다.

---

## 8. 추후 자동화 방식

나중에 더 자동화하려면:

1. GitHub Actions cron으로 매주 일요일 실행
2. RSS/API/Web search로 소스 수집
3. Claude API로 요약/분류
4. PR 또는 commit으로 `weekly-updates/`에 저장
5. PaperGym이 최신 JSON을 fetch

하지만 MVP에서는 Claude Code 세션 기반 수동 실행이 충분하다.

---

## 9. 앱에 붙이는 문구

```text
Sunday Review complete.
Next week's accessory set is ready.
```

한국어:

```text
일요일 리뷰 완료.
다음 주 보조 세트가 준비되었습니다.
```

```text
This week's current update is linked to ReAct.
Question: Which part of the agent loop did this update improve?
```

한국어:

```text
이번 주 최신 업데이트는 ReAct와 연결됩니다.
질문: 이 업데이트는 agent loop 중 어떤 부분을 강화했나요?
```
