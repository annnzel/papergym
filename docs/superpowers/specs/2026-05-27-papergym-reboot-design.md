# PaperGym 리부트 — 16주 4명 스터디 보조 사이트 설계

> **상태**: 디자인 (리뷰 대기)
> **작성**: 2026-05-27, Ann (이경은) + Claude
> **출범 목표**: 2026-06-01 (월) W1 (CoT) ship
> **상위 컨텍스트**: 기존 `~/HQ/ai-study/hackathon-mentor/` PaperGym v6 (16주 골조 유지, UI/일과/DB/페이지 재설계)

---

## 0. 한 줄 정의

비개발자 입문 4명이 AI 논문 13편을 **매일 30~60분**씩 16주 동안 *완주*하도록 돕는, **사전 큐레이션 + 4명 응원** 학습 보조 웹사이트.

---

## 1. 사용자 + 제약

- **사용자**: 4명 (Ann + 동료 3명). 대부분 비개발자 입문 — 영문 abstract 직접 읽으면 명함, AI 논문 처음.
- **시간 예산**: 평일 30~60분 × 5일 + 주말 1시간(합) = **주 3.5~6시간**.
- **목표**: 일주일에 논문 1편 *완독 + 이해* (요약 ≠ 이해).
- **출범**: 2026-06-01 (월). 종료: 2026-09-20 (일). 112일 / 16주.

---

## 2. 16주 골조 (v6에서 유지)

| Phase | 주차 | 논문 | 색 |
|---|---|---|---|
| 1. Form Building | W1~W4 | CoT → ReAct → Toolformer → **Review** | amber |
| 2. Assistant Training | W5~W8 | InstructGPT → CAI → Reflexion → **Review** | rose |
| 3. LLM Foundation | W9~W12 | Attention → GPT-3 → Scaling Laws → Chinchilla | emerald |
| 4. Memory & Synthesis | W13~W16 | RAG → MemGPT → ToT → **Final Synthesis** 🏆 | violet |

- **본 논문 = 13편 (Core)**. W4·W8·W16 = Review 주차 (새 논문 없음).
- **보충 논문 = 16편**. `#papers` 옵션 reading list에 한국어 abstract + 3줄 hook만 노출. **강제 학습 X**.

---

## 3. 주간 일과 (5일 평일 집중 + 주말 가벼움)

```
월~금  본문 1/5 (각 30~60분)     ← 메인 학습일
토     한 주 복습 / 미니 퀴즈 (30분)  ← 혼자 복습
일     팀 응원 / 다음 주 프리뷰 (30분)  ← 팀 의식
```

**일일 슬롯 5개 의미 단위 분배 (논문마다 조정)**:
- Day 1 (월): Abstract + Intro 요약
- Day 2 (화): 핵심 figure + 문제 정의
- Day 3 (수): Method 전반
- Day 4 (목): Method 후반 + Results
- Day 5 (금): Discussion + 한계 + 한 줄 요약

**주말 슬롯**:
- 토: 5문 미니 퀴즈 (4지선다) + 한 주 핵심 1문장
- 일: 팀 진도 보기 + 응원 + 다음 주 논문 프리뷰 카드

---

## 4. 시스템 아키텍처

```
┌────────────────────────────────────────────────┐
│  Browser                                       │
│  ┌──────────────────────────────────────────┐  │
│  │ index.html (Shell, ~600줄)               │  │
│  │ - Tailwind CDN, vanilla JS               │  │
│  │ - Hash router: #today / #papers / #team  │  │
│  └──┬─────────────────┬─────────────────────┘  │
│     │ fetch JSON      │ Supabase JS            │
│  ┌──▼─────────┐    ┌──▼──────────────┐         │
│  │ data/      │    │ localStorage    │         │
│  │ - curriculum.json                          │
│  │ - papers/*.json (13편)                     │
│  │ - glossary.json                            │
│  │ - supplementals.json (16편)                │
│  │                  │ - 내 이름·이모지       │
│  │                  │ - 진도 캐시            │
│  │                  │ - 탭 방문 기록         │
│  │                  │ - 답변 노트 (비공개)   │
│  └────────────┘    └────────────────────────┘ │
└────────┬─────────────────────┬────────────────┘
         │ static              │ HTTPS
         ▼                     ▼
   ┌──────────────┐    ┌──────────────────┐
   │ Vercel       │    │ Supabase         │
   │ (정적 호스팅) │   │ - members        │
   │              │    │ - progress        │
   │              │    │ - cheers          │
   └──────────────┘    └──────────────────┘
```

**기술 결정**:
- 단일 `index.html` 셸 + Tailwind CDN + vanilla JS (PaperGym v6의 fast-project-patterns 유지)
- 콘텐츠 = `data/` JSON (편집 안전, 4명 협업 가능)
- 개인 상태 = localStorage (오프라인 OK, 답변 노트 비공개 보장)
- 공유 상태 = Supabase (v6 스키마 재사용 + `day_index` 칼럼 1개 추가 — 마이그레이션 최소)
- Hash router (Vercel SPA fallback 설정 불필요)
- API 키 / AI 호출 / BYOK = **전부 제거** (사전 큐레이션이라 런타임 AI 불필요)

---

## 5. 뷰 3개

### #today (기본 진입)
- 오늘 날짜 → 자동으로 (현재 주차, 현재 Day) 매핑
- **5탭 학습 카드** (한국어 / 그림 / 용어 / 비유 / 질문)
  - 탭 라벨 위 ✓ 표시 = 방문 완료
  - 모든 탭 방문해야 "✓ 오늘 완료" 버튼 활성화
- 답변 노트 = localStorage only (팀원에게 공개되지 않음)
- 완료 시 → Supabase progress upsert + 토스트 "🔥 응원 도착할 거예요"

### #papers
- 16주 × 13편 그리드 (Phase 1~4 색상)
- 각 카드 = 논문 제목 + 한국어 hook 1줄 + 진도 상태
- 카드 클릭 → 상세 패널 (한국어 abstract + 5일 슬롯 미리보기)
- **하단**: "옵션 reading list — 보충 16편" 섹션 (한국어 abstract + hook 1줄, 진도 추적 X)

### #team
- **가로 행 4개** (이모지 + 이름 + 주차 진도바 + 스트릭 🔥일수 + 이모지 4종 응원 버튼)
- 응원 = 클릭 한 번 → Supabase cheers insert → 받은 사람 행에 카운트 증가
- 이모지 4종: 🔥 화이팅 / 💪 같이 가자 / 👏 멋져 / ❤️ 응원
- **일요일 자동 활성화 카드**: 상단에 "이번 주 요약" — 누가 며칠 완주, 어떤 논문이었는지, 다음 주 프리뷰

### 첫 진입 모달
- 이름 + 이모지 (4종 선택: 🦊 🐻 🐯 🐰) → localStorage 저장 + Supabase members insert
- 이름 변경 가능 (헤더 우측 이모지 클릭 → 모달)

---

## 6. 데이터 모델

### 6.1 콘텐츠 JSON

**`data/curriculum.json`** — 16주 → 13편 매핑
```json
{
  "version": "reboot-v1",
  "startDate": "2026-06-01",
  "endDate": "2026-09-20",
  "weeks": [
    { "n": 1, "phase": 1, "paperId": "cot", "type": "main" },
    { "n": 2, "phase": 1, "paperId": "react", "type": "main" },
    { "n": 4, "phase": 1, "paperId": null, "type": "review", "reviewOf": ["cot","react","toolformer"] },
    ...
  ]
}
```

**`data/papers/{paperId}.json`** — 논문 1편 풀데이터 (예: `cot.json`)
```json
{
  "id": "cot",
  "title": "Chain-of-Thought Prompting Elicits Reasoning in LLMs",
  "venue": "NeurIPS 2022",
  "arxivId": "2201.11903",
  "phase": 1,
  "koreanTitle": "사고 사슬 프롬프팅이 LLM의 추론 능력을 끌어낸다",
  "hook": "생각 과정을 쓰게 하면 성능이 오른다. 단순한데 강력한 발견.",
  "abstractKo": "전체 한국어 풀번역 abstract...",
  "days": [
    {
      "n": 1, "range": "Abstract + §1 Introduction",
      "estimatedMinutes": 35, "pages": 3,
      "translationKo": "오늘 분량 한국어 풀번역 본문...",
      "figure": { "id": "Figure 1", "captionKo": "...", "imagePath": "data/papers/cot/fig1.png" },
      "glossary": [{ "en": "chain-of-thought", "ko": "사고 사슬", "memo": "..." }],
      "analogy": { "title": "수학 풀이의 '풀이 과정 쓰기'", "body": "..." },
      "question": "왜 LLM에 '단계별로 생각해보세요'라고 하면 답이 더 정확해질까요?"
    },
    { "n": 2, ... },
    ...
  ],
  "saturdayQuiz": [
    { "q": "...", "options": ["A","B","C","D"], "correct": 1, "explain": "..." },
    ...
  ],
  "sundayPreview": { "nextPaperId": "react", "teaser": "..." }
}
```

**`data/supplementals.json`** — 16편 옵션 reading list
```json
[
  { "id": "bert", "title": "BERT", "koreanTitle": "...", "hook": "...", "abstractKo": "...", "link": "..." },
  ...
]
```

### 6.2 Supabase 스키마 (v6 재사용 + 1 칼럼 추가)

```sql
papergym_members
  user_id (uuid, PK)
  name (text)
  emoji (text)
  joined_at (timestamptz)

papergym_progress  -- day_index 칼럼 신규
  user_id (uuid)
  week (int)
  day_index (int)   -- 1~5 (평일), 6 (토 퀴즈), 7 (일 팀)
  completed_at (timestamptz)
  PRIMARY KEY (user_id, week, day_index)

papergym_cheers
  id (uuid, PK)
  from_user (uuid)
  to_user (uuid)
  emoji (text)      -- '🔥'|'💪'|'👏'|'❤️'
  week (int)
  sent_at (timestamptz)
```

**RLS 정책**: v6와 동일 — anon read/insert 열림, 그룹 코드 X (4명 URL 공유).

---

## 7. 콘텐츠 큐레이션 운영

### 7.1 누가
**Claude + Ann 협업** — Ann이 Claude Code 세션에서 "{paperId} 5일 슬롯 초안" 프롬프트 → Claude가 v6 기존 자산(`handoff/*.json`, `paper-abstracts/ko-translations/`) 참조해 초안 JSON 생성 → Ann이 어색한 비유 교체·페르소나 톤 조정·진짜 핵심 강조.
- Claude 초안 ~30분/편 + Ann 검수 ~30분/편 = **약 1시간/편 → 13편 ≈ 13시간**

### 7.2 언제
**점진적 큐레이션**:
- 5/27~5/31 (4일): W1 (CoT) 5일 슬롯 + 토 퀴즈 + 일 프리뷰 완성 = ship 가능 상태
- 6/1 출범 시점에 W1만 채워짐. W2~W16은 매주 일요일~월요일 사이 다음 주 분량 미리 큐레이션
- 사용자 측면에선 "차이 모름" — 항상 이번 주는 채워져 있음

### 7.3 자산 출처
이미 PaperGym v6에 70% 깔려 있음:
- `handoff/korean-abstracts.json` — 13편 한국어 abstract + 3-line hook ✅
- `handoff/korean-glossary-core.json` — 30 영-한 용어집 ✅
- `handoff/papergym-paper-corpus.json` — reading_sections + guide_questions ✅
- `paper-abstracts/ko-translations/supplemental-abstracts-ko.md` — 보충 16편 한국어 ✅

**신규 생성 필요**: 일일 한국어 풀번역 발췌, figure 이미지+캡션, 일상 비유, 미니 퀴즈, 주말 카드. 13편 × ~7 자산 = ~91 신규 자산.

---

## 8. 에러 처리 + edge case

### 8.1 콘텐츠 누락
- W2~W16 데이터 없음 → 카드: "다음 주 학습 자료 곧 도착합니다 ⏳"
- `papers/{id}.json` 404 → 메시지: "이 논문은 다음 주에 열려요" + #papers 링크

### 8.2 Supabase 끊김
- members fetch 실패 → 본인 정보만 localStorage로 표시, 팀 영역은 "팀 정보 잠시 후 다시 시도" 배너
- progress upsert 실패 → localStorage에 pending 큐 박고 다음 진입 시 retry (오프라인 학습 지원)
- cheers insert 실패 → 즉시 retry 1회 → 실패 시 토스트 "응원이 잠시 후 전송됩니다"

### 8.3 첫 진입
- localStorage 없음 → 이름 등록 모달 강제 노출. 닫기 X.
- 시작일 (6/1) 전 진입 → "🏋️ 6월 1일부터 시작이에요! 미리 보기는 #papers" 안내

### 8.4 진도 vs 시간 불일치
- 이번 주가 W3인데 본인이 W1까지만 완료 → #today 자동 매핑 = W1 다음 미완료 Day (밀린 곳부터 잡음)
- 1주일 이상 갭 → 토스트 "한 주 쉬어가도 괜찮아요. 오늘은 §X.X부터요"

### 8.5 같은 기기 공유
- 4명이 한 기기 공유 시나리오는 비상정 (각자 본인 기기 가정)
- 헤더 우측 이모지 → 클릭 시 "이름 변경" 모달 → 다른 사람으로 전환 가능

---

## 9. 폴더 구조

```
~/HQ/ai-study/hackathon-mentor/
├── index.html                # 셸 (재작성, ~600줄)
├── data/
│   ├── curriculum.json
│   ├── glossary.json
│   ├── supplementals.json
│   └── papers/
│       ├── cot.json
│       ├── react.json
│       └── ...               # 13편
│       └── cot/              # figure 이미지
│           └── fig1.png
├── handoff/                  # v6 자산 (큐레이션 input source)
├── paper-abstracts/          # v6 자산
├── curriculum.html           # v6 유지 (16주 큐레이션 가이드, 공유용)
├── docs/
│   └── superpowers/
│       └── specs/
│           └── 2026-05-27-papergym-reboot-design.md   # 이 문서
├── CLAUDE.md                 # 업데이트 (리부트 반영)
└── README.md                 # 업데이트
```

**v6에서 제거**: `deck.html` (해커톤 종료, 보존만), `system-prompt.md` (AI 호출 X)

---

## 10. 빌드 단계 (구현 plan 입력용 — 디테일은 plan에서)

1. **W1 콘텐츠 큐레이션** (5/27~5/31): `data/papers/cot.json` 완성 + `data/curriculum.json` 16주 골조
2. **셸 골격** (5/28~5/29): index.html 셸, 라우터, 헤더, 첫 진입 모달
3. **#today 5탭 카드** (5/29~5/30): 탭 컴포넌트, 방문 추적, 완료 활성 로직
4. **#papers + #team** (5/30~5/31): 그리드, 가로 행 응원, 일요일 카드
5. **Supabase 통합** (5/31): `day_index` 칼럼 추가 마이그레이션, members/progress/cheers wire up
6. **Vercel 배포 + 4명 dry-run** (5/31): URL 공유, 4명 첫 진입 확인
7. **W2~W16 콘텐츠 큐레이션** (매주 반복): 매주 일요일~월요일 사이 다음 주 분량 큐레이션 (Claude 초안 30분 + Ann 검수 30분)

---

## 11. 명시적으로 안 하는 것 (YAGNI)

- **사용자 사이트 내 AI 런타임 호출** (BYOK Claude API) — 사전 큐레이션이라 불필요. (큐레이션 시 Ann이 Claude Code 쓰는 것과는 별개)
- **답변 공유 / 댓글** — "내 답변 별로일까봐" 부담 트리거. 응원만.
- **검색 / 필터 / 정렬** — 4명 × 13편이면 스크롤이 빠름
- **통계 대시보드** — 진도바와 스트릭으로 충분, 별도 통계 페이지 X
- **이메일 / Slack 알림** — 출범 후 1~2주 사용 데이터 보고 필요시
- **PWA / 모바일 앱** — 모바일 웹 반응형으로 충분
- **다국어 (영어 UI)** — 4명 한국어 사용자

---

## 12. 성공 기준 (16주 후)

- [ ] 4명 중 3명+ W16까지 60%+ 완주
- [ ] 평균 주 응원 ≥ 10개 (4명이 서로 부담 없이)
- [ ] 16주 종료 시 "내가 정말 13편을 알게 됐나?" Yes 응답 3명+
- [ ] 출범 후 콘텐츠 큐레이션이 매주 출범 전 도착 (병목 X)
