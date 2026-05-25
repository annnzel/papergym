# Weekly Update System — Integration Notes

> 기존 `handoff/`와 분리된 새 패키지.  
> 위치: `hackathon-mentor/weekly-update-system/`

---

## 1. 합칠 때 가장 먼저 볼 파일

1. `README.md` — 시스템 전체 설명
2. `source-governance.md` — 소스 tier, 검증 규칙, 탈락 기준
3. `sunday-curation-prompt.md` — 매주 일요일 실행할 프롬프트
4. `next-week-plan.schema.json` — 앱이 읽을 JSON 구조
5. `sample-next-week-plan.json` — 앱 테스트용 샘플
6. `weekly-update-template.md` — 사람이 읽는 주간 요약 템플릿

---

## 2. PaperGym 앱에 붙이는 최소 구현

앱에는 일단 아래 2개만 붙이면 된다.

### A. Current Update Rep 카드

```text
Current Update Rep
이번 주 최신 업데이트를 오늘의 기본 논문과 연결하세요.
```

필드:

- title
- source
- lineage_connection
- question
- actionability

### B. next-week-plan JSON 읽기

MVP에서는 fetch 없이 JS 객체로 붙여도 된다.

```js
const NEXT_WEEK_PLAN = /* sample-next-week-plan.json */
```

이후 앱에서:

```text
Main Lift: Chain-of-Thought
Accessory Set: Reasoning model update
Question: 이 업데이트는 CoT와 어떻게 연결되나요?
```

---

## 3. 일요일 운영 방식

### 수동 MVP

매주 일요일 Claude Code에서:

```text
weekly-update-system/sunday-curation-prompt.md를 실행해서 지난 7일 주요 AI 업데이트를 정리하고, next-week-plan-YYYY-MM-DD.json을 만들어줘.
```

산출물 저장 위치 추천:

```text
weekly-update-system/outputs/
  weekly-update-YYYY-MM-DD.md
  next-week-plan-YYYY-MM-DD.json
```

### 반자동

OpenClaude CronCreate로 매주 일요일 오전에 reminder를 건다.  
단, 자동 웹검색/파일작성은 세션이 열려 있어야 안정적이므로 MVP에서는 reminder 성격으로 시작한다.

### 완전 자동화 추후

- GitHub Actions cron
- RSS/API 수집
- Claude API 분류
- JSON commit
- 앱에서 fetch

---

## 4. 앱 카피

```text
Sunday Review
Your next week's accessory set is ready.
```

한국어:

```text
일요일 리뷰
다음 주 보조 세트가 준비되었습니다.
```

```text
Main Lift: foundational paper
Accessory Set: current AI update
```

한국어:

```text
메인 운동: 기본 논문
보조 세트: 최신 AI 업데이트
```

---

## 5. 주의점

- 최신 업데이트는 최대 3개만 넣는다.
- `source-governance.md`의 Tier 체계를 따른다.
- `use_now` 후보는 Tier 1 source 최소 1개가 있어야 한다.
- 가능하면 2-source verification을 통과해야 한다.
- Tier 3 해설/큐레이션 소스 단독으로는 최종 선정하지 않는다.
- 출처 없는 요약글은 제외한다.
- 다음 주 기본 논문과 연결되지 않는 뉴스는 과감히 버린다.
- “진짜 진전 / 포장 가능성 / 아직 모르는 것”을 반드시 남긴다.
- 한국어 학습자용 용어 3개 이상을 같이 넣는다.

---

## 6. PaperGym 제품 서사에 추가할 문장

> PaperGym은 6개월 커리큘럼을 고정된 교재로만 운영하지 않습니다.  
> 매주 일요일, 지난 한 주의 AI 업데이트를 기본 논문 지도 위에 꽂아 다음 주 운동 세트를 새로 짭니다.

영문:

> PaperGym is not a static reading list.  
> Every Sunday, it maps the week's AI updates back to the foundational paper lineage and turns them into next week's accessory sets.
