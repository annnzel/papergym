# Weekly Update System — Package Index

> 상태: merge-ready  
> 목적: 매주 일요일 지난 7일 AI 업데이트를 검증하고, 다음 주 PaperGym 학습 플랜의 30~40% 최신 자료 영역에 반영한다.

---

## 핵심 파일

| 파일 | 역할 |
|---|---|
| `README.md` | 시스템 개요 |
| `source-governance.md` | 소스 tier, 검증 규칙, 탈락 기준, scoring rubric |
| `sunday-curation-prompt.md` | 매주 일요일 실행할 큐레이션 프롬프트 |
| `weekly-update-template.md` | 사람이 읽는 주간 업데이트 템플릿 |
| `next-week-plan.schema.json` | 앱이 읽을 다음 주 플랜 JSON 스키마 |
| `sample-next-week-plan.json` | 테스트용 샘플 플랜 |
| `integration-notes.md` | PaperGym 앱과 합치는 방법 |
| `six-month-before-after.md` | 6개월 전/후 성장 비교 문서 |

---

## 합칠 때 우선순위

1. `source-governance.md`를 README/운영 문서에 반영한다.
2. `sample-next-week-plan.json`을 앱의 Current Update Rep 카드 테스트 데이터로 붙인다.
3. `next-week-plan.schema.json` 기준으로 앱 데이터 구조를 맞춘다.
4. `sunday-curation-prompt.md`를 일요일 운영 프롬프트로 사용한다.
5. `six-month-before-after.md`는 동기부여/온보딩 페이지에 붙인다.

---

## 운영 원칙

- 최신 업데이트는 최대 3개만 선택한다.
- Tier 3 큐레이션 자료 단독으로는 최종 선정하지 않는다.
- `use_now` 후보는 Tier 1 source 최소 1개가 필요하다.
- 가능하면 2-source verification을 통과시킨다.
- 모든 업데이트는 기본 논문 계보와 연결되어야 한다.
- 모든 업데이트는 `진짜 진전 / 포장 가능성 / 아직 모르는 것`을 포함해야 한다.

---

## 제품 카피

> PaperGym is not a static reading list. Every Sunday, it maps the week's AI updates back to the foundational paper lineage and turns them into next week's accessory sets.

한국어:

> PaperGym은 고정된 읽기 목록이 아닙니다. 매주 일요일, 지난 한 주의 AI 업데이트를 기본 논문 지도 위에 꽂아 다음 주 운동 세트를 새로 짭니다.
