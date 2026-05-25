# PaperGym Source Pack — Merge Notes

> 이 폴더는 저쪽 세션의 앱 구현과 충돌하지 않도록 만든 자료 보강 패키지다.  
> `index.html`, `system-prompt.md`, `README.md`를 직접 수정하지 않았다.

---

## 생성한 파일

| 파일 | 용도 | 합치는 위치 |
|---|---|---|
| `papergym-paper-corpus.json` | 핵심 논문 corpus. 앱의 paper preset/data source로 사용 | `index.html` 내부 JS 객체 또는 별도 fetch 데이터 |
| `8-week-program-map.md` | 첫 8주 커리큘럼. PaperGym의 프로그램 컨셉 강화 | README, PLAN, 앱 Program View |
| `demo-source-cards.md` | 데모 화면/처방전/발표에 붙일 논문 카드 | 앱 paper detail, README |
| `source-quality-notes.md` | 1차 소스 기반 학습 도구라는 신뢰 포인트 | README, 발표 보조자료, 앱 source badge |
| `prescription-examples.json` | Claude API 실패 대비 샘플 S1 처방전 | 앱 fallback/demo preset |
| `current-update-sources.md` | 최신 자료 30~40%를 어디서 어떻게 볼지 | README, 앱 Weekly Update 섹션 |

---

## 가장 먼저 합칠 것 3개

### 1. `papergym-paper-corpus.json`

앱에서 바로 쓸 수 있는 핵심 corpus다.

추천 사용:

```js
const PAPER_CORPUS = /* papergym-paper-corpus.json 내용 */
```

MVP에서는 전체 fetch 구조를 만들지 말고, JSON에서 Week 1 paper만 하드코딩해도 충분하다.

---

### 2. `prescription-examples.json`

API가 느리거나 출력이 깨질 때 fallback으로 쓸 수 있다.

추천 사용:

```js
const DEMO_PRESCRIPTION = examples[1] // ReAct
```

S1 처방전 UI와 print view 테스트에 특히 유용하다.

---

### 3. `source-quality-notes.md`

README/발표에서 PaperGym의 차별점을 강화한다.

핵심 문구:

> PaperGym starts from the original paper, not from a summary of a summary.

한국어:

> PaperGym은 요약의 요약이 아니라, 원문 논문에서 시작합니다.

---

## 앱에 넣기 좋은 데이터 필드

각 paper card에서 특히 유용한 필드:

```json
{
  "short_title": "ReAct",
  "track": "Agent / Reasoning",
  "difficulty": "beginner-medium",
  "program_fit": "Month 1 / Claude Code agent loop",
  "arxiv_abs": "https://arxiv.org/abs/2210.03629",
  "pdf": "../papers/core/01-react-2210.03629.pdf",
  "why_it_matters": "...",
  "best_30min_sections": ["Abstract", "Figure 1", "§1 Introduction"],
  "guide_questions": ["..."],
  "business_translation": "..."
}
```

---

## PaperGym 제품 서사 보강

기존:

> 논문 요약기가 아니라, 30분 종이 처방전과 시험으로 인지부하를 건다.

보강:

> PaperGym은 6개월 AI 논문 로드맵을 실행하는 PT다.  
> 기본 논문은 main lift, 최신 업데이트는 accessory set, workout log는 이해의 변화를 기록한다.

---

## 충돌 주의

이 handoff pack은 아래 파일을 건드리지 않았다.

- `../index.html`
- `../system-prompt.md`
- `../README.md`
- `../PLAN.md`
- `../demo/*`

저쪽 세션이 빌드 중이어도 안전하게 합칠 수 있다.

---

## 합칠 때 추천 순서

1. `prescription-examples.json`에서 ReAct 예시를 앱 demo fallback으로 붙인다.
2. `papergym-paper-corpus.json`의 ReAct/CoT 카드만 앱에 넣는다.
3. 화면에 `Program Context` 카드 추가:
   - Week 1 / 24
   - Phase: Form Building
   - Ratio: 70% Foundation / 30% Current Updates
   - Track: Agent / Reasoning
4. README에 `source-quality-notes.md`의 source principle을 3줄만 붙인다.
5. 시간이 남으면 8-week program map을 앱 Program View로 확장한다.
