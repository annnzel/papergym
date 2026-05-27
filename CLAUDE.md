# PaperGym 🏋️ — 프로젝트 컨텍스트

> **다른 세션에서 이 폴더로 들어오면 이 파일을 먼저 읽고 작업 시작.**
> 풀 디테일은 `HANDOFF.md` 참조.

---

## 한 줄 정의
AI 빌더를 위한 인지부하 헬스장. **16주 13편 정전(canon) 학습 프로그램** + 종이 처방전 + 실시간 멀티유저 리더보드.

---

## 라이브 URL (3개)

| | URL | 역할 |
|---|---|---|
| **메인 앱** | https://papergym.vercel.app | 학습 도구 (16주 진행 추적) |
| **큐레이션 가이드** | https://papergym.vercel.app/curriculum.html | 13편 정전 교과서 (공유용) |
| **발표 덱** | https://papergym.vercel.app/deck.html | 해커톤 16 슬라이드 (발표 끝남) |

GitHub: https://github.com/annnzel/papergym (commit `c13dc45` 까지 push 됨, 이후 commit local에만)

---

## 현재 버전: reboot-v1
**16주 · 13편 Core · 4 Phase · 4명 비개발자 입문 스터디 (리부트)**

- 시작: 2026-06-01 (월) · 종료: 2026-09-20 (일)
- 매일 30~60분 평일 본문 5조각 + 토 퀴즈 + 일 팀 응원
- UI: 5탭 학습 카드 + 가로 행 응원
- 사전 큐레이션 (Claude 초안 + Ann 검수), AI 런타임 호출 X
- 자세한 설계: `docs/superpowers/specs/2026-05-27-papergym-reboot-design.md`
- 구현 plan: `docs/superpowers/plans/2026-05-27-papergym-reboot.md`

### 13편 + 3 Review = 16주

```
Phase 1 Form Building (W1-4)         · amber
  W1 CoT → W2 ReAct → W3 Toolformer → W4 Review

Phase 2 Assistant Training (W5-8)    · rose
  W5 InstructGPT → W6 CAI → W7 Reflexion → W8 Review

Phase 3 LLM Foundation (W9-12)       · emerald
  W9 Attention → W10 GPT-3 → W11 Scaling Laws → W12 Chinchilla

Phase 4 Memory & Synthesis (W13-16)  · violet
  W13 RAG → W14 MemGPT → W15 Tree of Thoughts → W16 Final Synthesis 🏆
```

- `curriculum.html`은 Ann 개인 적용이 아니라 회사 동료와 함께 쓰는 비개발자 AI 빌더/오퍼레이터용 설명으로 일반화됨

---

## ⚠️ 알려진 이슈 (다음 세션이 해결할 후보)

### 1. GitHub Push 막힘 (credential 충돌)
- macOS Keychain의 옛 `eunnlee` credential과 active `annnzel` 충돌
- `gh auth setup-git` 실행해도 동일 문제
- Local에 commit 1개 대기 중 (`c13dc45 v6: 26주 → 29주`)
- *현재 commit 이후* 변경사항도 push 필요:
  - 16주 데이터 구조
  - curriculum.html 신규
  - Phase Progress 큐레이션 링크
  - README 16주 갱신

**해결 방법 후보**:
- (A) PAT 생성 후 keychain credential 삭제 + 재인증
- (B) GUI (VS Code/Cursor) Source Control로 push
- (C) Ann이 다른 머신에서 push

### 2. Supplemental 16편 corpus 미통합
- `handoff/papergym-paper-corpus.json`에 Core 13편만
- Supplemental 16편 (BERT·DPO·LLaMA·CLIP·Diffusion 등)은 corpus에 없음
- 현재는 *옵션 reading list*로 curriculum.html에 표시만
- 진짜 처방전 자동 생성 원하면 corpus 확장 필요

---

## 🔑 보안 정보

### Supabase (멀티유저 - 단일 글로벌 그룹)
- URL: `https://dnyfcamtyszwyqctjois.supabase.co`
- Publishable key: `sb_publishable_P5XMkx7kq2yzvHXp8uTZ2Q_vxqoGWIy` (index.html hardcode)
- 그룹 코드 고정: `PAPERGYM`
- 테이블 3개: `papergym_members` · `papergym_progress` · `papergym_cheers`
- RLS 정책: anon read/write 모두 열림 (그룹 코드 = 비밀번호 패턴)
- **Secret key 사용 X** (코드에서 명시적 거부)

### Anthropic API
- BYOK 패턴 — 사용자가 모달에서 입력
- localStorage에만 저장, hardcode X
- 401/404/429 친절 에러 박힘

---

## 📁 파일 구조

```
~/HQ/ai-study/hackathon-mentor/
├── CLAUDE.md                # 이 파일
├── HANDOFF.md               # 풀 컨텍스트 + history
├── README.md                # GitHub 평가용
├── index.html               # 메인 앱 (~2000줄, 120KB)
├── deck.html                # 발표 덱 16 슬라이드
├── curriculum.html          # 13편 큐레이션 가이드 (NEW)
├── PLAN.md                  # 초기 빌드 계획
├── system-prompt.md         # LLM 시스템 프롬프트
├── demo/
│   └── react-abstract.txt   # LLM 모드 데모 입력
├── handoff/                 # 큐레이션 데이터 (4 JSON)
│   ├── papergym-paper-corpus.json     # 13편 풀 메타
│   ├── prescription-examples.json     # 풀 처방전 3편
│   ├── korean-glossary-core.json      # 30개 영-한 용어
│   ├── korean-abstracts.json          # 13편 한국어 풀 + 3-line hook
│   ├── 8-week-program-map.md
│   └── ...
├── paper-abstracts/         # 영-한 abstract 원본
│   ├── README.md
│   ├── abstracts-en-ko.md
│   └── ko-translations/
│       ├── core-abstracts-ko.md
│       └── supplemental-abstracts-ko.md
└── weekly-update-system/    # Weekly Update 운영 시스템
    ├── README.md
    ├── six-month-before-after.md
    └── ...
```

---

## 🚀 다음 세션 시작 명령

새 세션 열면 다음 한 줄로 시작:

```
~/HQ/ai-study/hackathon-mentor/HANDOFF.md 읽고 PaperGym v6 작업 이어서 해줘
```

또는 진행 중인 작업 명시:

```
PaperGym에 [구체적 작업] 추가하고 싶어. CLAUDE.md + HANDOFF.md 먼저 보고.
```

---

## 🎯 다음 작업 후보 (우선순위순)

### High priority
1. **GitHub Push 해결** — credential 정리 후 v6 전체 push
2. **Supplemental 16편 corpus 확장** — supplemental-abstracts-ko.md 파싱 → JSON
3. **W4·W8·W16 Review 주차 콘텐츠** — Phase 통합 학습 가이드

### Medium priority
4. **Weekly Update System 통합** — sample-next-week-plan.json + Current Update Rep 카드
5. **알림 시스템** — 학습 시간 reminder (브라우저 알림 / 이메일 / Slack)
6. **Workout Log 데이터 정리** — localStorage seed 데이터 (4편 미리)와 *진짜* 진도 충돌 방지

### Low priority (v7+)
7. **USDT Stake-to-Complete** — 경제 레이어 (deck Slide 16 v6 Future 컨셉)
8. **Multi-language support** — 영어 UI 토글
9. **Mobile native app** — PWA → iOS/Android

---

## 📝 Ann의 결정 패턴 (다음 세션 Claude를 위한 가이드)

- **빠른 실행 + 피드백 루프** 선호 (완벽한 계획 X)
- **AskUserQuestion**으로 큰 분기 결정 받기 좋아함
- **Classic 정전 > 최신 유행** (이번 v6에서 명확)
- **Ann 본인이 사용자** — ARK Point Web3 마케팅 + Claude Code 사용
- **팀 5명 이내 스터디** (annnzel + Teo + HS + 동료들)
- **법적 검토 같은 보수적 disclaimer는 빼기** (deck Slide 16에서 확인)

---

마지막 업데이트: 2026-05-26 · v6 (16주 + curriculum)
