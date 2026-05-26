# PaperGym 🏋️

> **AI 빌더를 위한 인지부하 헬스장** — 다른 AI 학습 도구가 사용자를 화면 안에 더 오래 붙잡아둘 때, PaperGym은 *종이 처방전*을 발행하고 30분 후 *진짜 시험*을 봅니다.

[![Live](https://img.shields.io/badge/Live-papergym.vercel.app-amber)](https://papergym.vercel.app)
[![Deck](https://img.shields.io/badge/Deck-papergym.vercel.app/deck.html-blue)](https://papergym.vercel.app/deck.html)
[![Stack](https://img.shields.io/badge/Stack-Single%20HTML%20%2B%20Tailwind-stone)]()
[![AI](https://img.shields.io/badge/AI-Claude%20Opus%204.7-orange)]()
[![DB](https://img.shields.io/badge/Realtime-Supabase-emerald)]()
[![Hackathon](https://img.shields.io/badge/Built-2h%20Hackathon%20%2B%20Iterate-red)]()

---

## 🔗 Live Links

| | URL |
|---|---|
| **앱** | https://papergym.vercel.app |
| **발표 덱 (14 슬라이드)** | https://papergym.vercel.app/deck.html |

---

## 🎯 한 줄 정의

매일 60분 · 29주 · 종이 처방전 + 진짜 시험 + 실시간 동료 리더보드.
**자기 의지가 아니라, 시스템과 동료가 완주시킵니다.**

---

## ⭐ 와우 포인트 4개

### #1 🖨️ AI가 종이로 내보낸다
디지털 디톡스를 AI가 처방. A4 1장에 다섯 가지 통합:
- ⏱️ 30분 안에 읽을 영역 (§3.2~3.4 + Figure 2)
- 🔑 영-한 핵심 용어집 (팀 영어 진입 장벽 ↓)
- 📑 핵심 원문 발췌 (영-한 병기 + 위치 안내)
- 🎯 여백 메모 가이드 질문 (📍 §X.X 좌표)
- 📥 본문 PDF 직접 다운로드 링크

### #2 🗓️ 29주 완주 시스템 (5중 하네스)
2026-06-01 ~ 2026-12-20 · 203일 · 매일 60분
1. **자동 진입** — URL 열면 *오늘 = 무엇* 0초에 보임
2. **일별 체크** — localStorage + Supabase 영구
3. **시각적 6 슬롯** — 🟩 완료 / 🟨 오늘 / 🟥 놓친 (회복)
4. **3축 카운터** — 🔥 스트릭 / 📅 N/6 / 📈 N/203
5. **놓친 날 회복** — Atomic Habits 원칙

### #3 👥 실시간 멀티유저 리더보드
- URL 한 줄 공유 = 초대
- 10초 폴링 → 동료 체크가 자동 반영
- 👏 응원 시스템 (체크 안 한 동료에게 격려 전송)
- Supabase Postgres + RLS

### #4 ⚡ 큐레이션 0초 + LLM 하이브리드
- 사전 큐레이션 (29개 자료, 한국어 용어집 30개, 풀 처방전 3편)
- S1 처방전 / S2 질문 = **0초** (큐레이션)
- S3 채점 / S4 결과물 = Claude Opus 4.7 (사용자 답변 personalized)
- LLM 호출 **3회 → 1회** · BYOK 옵션

---

## 📊 평가 기준 매칭 (총 100%)

| 기준 | 가중치 | 본 프로덕트의 무기 |
|---|---|---|
| **문제정의** | 20% | Ann 본인이 사용자 + 13편 핸드아웃 ground truth · 4중 페인 (시간·논문 찾기·요약 안 박힘·팀 영어) |
| **창의성** | 20% | "AI 도구가 사용자를 종이로 내보낸다" metamedium 역방향 · 헬스장 메타포 · 통합 학습 키트 |
| **실용성** | 20% | URL 클릭 즉시 사용 · 영-한 용어집으로 팀 도입 가능 · 실제 인쇄 + 출근 활용 · 29주 진짜 운영 |
| **AI 활용도** | 20% | Claude Opus 4.7 직접 호출 · 단계 강제 태그 · 동적 JSON 처방전 · Mermaid 즉석 · 큐레이션+LLM 하이브리드 |
| **와우 포인트** | 10% | WOW#1 종이 처방전 / WOW#2 29주 완주 / WOW#3 실시간 멀티유저 / WOW#4 0초 큐레이션 |
| **완성도** | 10% | 단일 HTML 117KB · 백엔드 0 · 라이브 URL · 9회 배포 디벨롭 · 모바일·발표·인쇄 모두 대응 |

---

## 🛠️ 기술 스택

| 영역 | 구성 |
|---|---|
| **프론트** | 단일 `index.html` (~117KB) + Tailwind CDN + Vanilla JS |
| **렌더** | Mermaid 10 · Marked · Pretendard |
| **AI** | Claude Opus 4.7 직접 fetch (`anthropic-dangerous-direct-browser-access`) · BYOK · 401/404/429 친절 에러 |
| **멀티유저** | Supabase (Postgres + RLS) · REST API 직접 호출 · 10초 폴링 |
| **데이터** | `handoff/*.json` 4개 (corpus 13편 · 풀 처방전 3편 · 한국어 용어집 30개) |
| **호스팅** | Vercel 정적 (URL alias `papergym.vercel.app`) · 6초 배포 · 0.6초 응답 |
| **인쇄** | `@media print` A4 CSS · `window.print()` → PDF 저장 |

---

## 🏗️ 빌드 메타

- **시작**: 2026-05-25 (해커톤 자리)
- **초기 빌드**: 2시간 (단일 HTML 4단계 워크플로우)
- **디벨롭 라운드**: 9회 (사용자 피드백 즉시 반영)
- **총 line 수**: index.html ~2000줄 / deck.html ~600줄
- **Vercel 배포 횟수**: 14회
- **빌드 도구**: Claude Code (Opus 4.7) + Ann (방향·검증)

진화 단계:
- v1 — LLM 기본 (4단계 워크플로우)
- v2 — 큐레이션 (8주 그리드)
- v3 — 29주 + 완주 시스템 (스트릭 + 6슬롯 + Phase)
- v4 — 멀티유저 (Supabase + 리더보드 + 응원)
- v5 — 동기부여 통합 (발표 덱)

---

## 🚀 사용법

### 일반 사용자
1. https://papergym.vercel.app 접속
2. 우상단 **`👥 이름 등록`** → 이름·이모지 입력 → 참여
3. **`🖨️ 오늘의 처방전`** → 모달 → 인쇄 (Cmd+P → PDF)
4. 종이로 30분 읽기
5. 돌아와서 **`✅ 오늘 완료 체크`**
6. 🔥 스트릭 시작

### 멀티유저 스터디 그룹
- Ann이 첫 등록 → 친구에게 URL만 공유
- 친구도 같은 URL에서 이름 등록 → 자동 같은 리더보드
- 10초 안에 서로의 진도 + 응원 가능

### LLM 모드 (옵션)
- 우상단 Claude API 키 (sk-ant-...) 입력
- 페이지 맨 아래 **`🤖 다른 논문 자유 분석`** details
- 29주 큐레이션 외 새 논문도 Opus 4.7로 즉석 분석

### 발표 모드
- https://papergym.vercel.app/deck.html
- 키보드 ↓↑/←→/Space로 슬라이드 이동
- 14 슬라이드 · 약 160초

---

## 📁 폴더 구조

```
papergym/
├── README.md                  # 이 파일
├── index.html                 # 단일 앱 (~2000줄)
├── deck.html                  # 발표 덱 (14 슬라이드)
├── PLAN.md                    # 빌드 계획
├── system-prompt.md           # LLM 시스템 프롬프트 원본
├── demo/
│   └── react-abstract.txt     # LLM 모드 데모 입력
├── handoff/                   # 사전 큐레이션 데이터
│   ├── papergym-paper-corpus.json     # 13편 풀 메타
│   ├── prescription-examples.json     # 풀 처방전 3편 (CoT·ReAct·InstructGPT)
│   ├── korean-prescription-examples.json
│   ├── korean-glossary-core.json      # 30개 영-한 용어집
│   ├── 8-week-program-map.md          # 8주 MVP 커리큘럼
│   ├── demo-source-cards.md
│   ├── current-update-sources.md
│   ├── source-quality-notes.md
│   └── source-pack-merge-notes.md
└── weekly-update-system/      # 주간 업데이트 운영 시스템
    ├── README.md
    ├── six-month-before-after.md      # 6개월 동기부여 문서
    ├── sunday-curation-prompt.md
    ├── next-week-plan.schema.json
    ├── sample-next-week-plan.json
    ├── weekly-update-template.md
    ├── source-governance.md
    └── integration-notes.md
```

---

## 🔒 보안 노트

| 키 | 위치 | 안전성 |
|---|---|---|
| **Anthropic API key** (sk-ant-) | BYOK · localStorage only | 외부 전송 0, 사용자 디바이스에만 |
| **Supabase Publishable key** | `index.html` hardcode | RLS 보호 — 누가 알아도 3개 테이블 외 접근 0 |
| **Supabase Secret key** | 사용 안 함 | 명시적으로 거부 (코드에서 sb_secret_ 차단) |

---

## 🧠 학습 철학

- 드와케시 파텔(Dwarkesh Patel)의 **인지적 부하** 학습관
- John Sweller의 **Cognitive Load Theory** (1988)
- **Productive Struggle** > 수동적 요약 소비
- *내용*이 아니라 *형식*을 바꾼다 (Alan Kay의 metamedium)

---

## 📖 29주 약속

**Before**: 새 모델 발표 = "좋아졌나 보다" · benchmark 숫자 = 높으면 좋아 보임 · agent·RAG·memory가 섞여 보임

**After (29주 후)**: 새 모델 발표 = 먼저 분류 (reasoning/tool/post-training) · benchmark = 무엇을 측정·놓치는지 본다 · "이건 ReAct 계열, 이건 memory 문제"

손에 남는 자산: 12~18편 논문 카드 · 80~150개 용어집 · 80~120 학습 로그 · 30~50개 업무 적용 프레임

> "29주 뒤, 뉴스가 아니라 **지도가** 보입니다."

---

## 👤 Built by

**Ann** — 해커톤 2026-05-25 · ARK Point
- 진짜 사용자가 본인이 만든 사용자 자신
- 매일 60분 학습 + 종이로 출근하는 진짜 유즈케이스

**페어 프로그래밍** with Claude Code (Opus 4.7, 1M context)
- 방향 설정 + 즉시 검증 + 9회 디벨롭

---

## 📄 License

해커톤 평가 제출용. 상업적 사용 별도 협의.

🏋️ **PaperGym** — 자기 의지가 아니라, 시스템과 동료가 완주시킵니다.
