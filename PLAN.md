# PaperGym 🏋️ — 해커톤 PLAN
> "오늘의 논문을 들었다가 놓는다 — AI 빌더를 위한 인지부하 헬스장"
> 2시간 타임박스 · 작성: 2026-05-25 · Ann (이경은) · 모델: `claude-opus-4-7`

---

## 0. 이름 확정: **PaperGym** 🏋️
- 메타포: 헬스장. 논문 = 바벨. 멘토 = PT. 풀사이클 = 1세트.
- 시각 어휘 자산: 무게/세트/트로피/스트릭/워크아웃로그 — 와우 포인트 1개 추가에 활용 (8번 섹션 참고)
- 시스템 프롬프트는 "하드코어 AI 리서치 멘토" 원본 유지 (헬스장 메타포는 UI/카피에만 적용, AI 페르소나는 그대로)

---

## 1. 문제정의 (평가 20%)
> 한 줄: **AI 학습 도구는 넘쳐나지만 "직접 머리에 박히는" 도구는 없다.**

- 사용자 페인 1: 매일 ai 공부하고 싶은데 **논문 찾는 것도 일**이다 (Ann 본인 진술)
- 사용자 페인 2: ai로 요약한 거 봐도 **머리에 안 남는다** (Ann 본인 진술)
- 사용자 페인 3: **시간이 부족하다** — 30분 정도밖에 못 낸다 (Ann 본인 진술)
- 사용자 페인 4: **1차 소스로 공부하고 싶다** — AI 요약 말고 *논문 그 자체*를 (Ann 본인 진술)
- 시장 관찰: ChatPDF, Elicit, Genspark, NotebookLM 모두 **사용자를 화면 안에 더 오래 붙잡아 두려** 함. 디지털 소비 시간 최대화가 목표.
- 본 프로덕트의 역설: **AI 도구가 사용자를 화면 *밖*으로 내보낸다 (=종이 처방전)**. 디지털 디톡스를 AI가 처방.
- 본 프로덕트의 안티테제: **인지부하를 의도적으로 *건다*** (Dwarkesh Patel + John Sweller의 Productive Struggle 가설)
- 진짜 증거: Ann의 `~/HQ/ai-study/` 폴더 = study-handout 4편 + agent-memory 9편 = **이미 손으로 1시간씩 들여 "안 떠먹는" 학습을 하던 사람의 데이터셋**. 페르소나 가설 아님, 사용자 자체가 ground truth.

**왜 지금?** Claude/GPT가 학습을 더 *쉽게* 만드는 동안, 진짜 시니어 빌더는 더 *어렵게* 만드는 도구를 찾는다. 이 비대칭이 이번 분기 기회.

---

## 2. 평가 기준 매칭표 (총 100%)

| 기준 | 가중치 | 본 프로덕트의 무기 |
|---|---|---|
| 문제정의 | 20% | Ann 본인이 사용자 + 13개 핸드아웃이 실제 데이터셋. 시장 안티테제 명확 |
| 창의성 | 20% | "AI 요약 시대에 인지부하를 *건다*"는 역방향 컨셉 + 4단계 강제 워크플로우 |
| 실용성 | 20% | URL 클릭 = 즉시 사용. BYOK라 누구나 자기 키로 즉시 가동 |
| AI활용도 | 20% | Claude API 직접 호출 + 동적 질문 생성 + 답변 비판적 평가 + Mermaid 자동 다이어그램 |
| 와우포인트 | 10% | (a) 본인 study-handout Before/After 시연 (b) 4단계 상태머신 시각화 (c) 30분 카운트다운 + 자동 Mermaid |
| 완성도 | 10% | 단일 HTML, Vercel URL, 한 번에 4단계 풀사이클 자가 데모 통과 |

---

## 3. 4단계 워크플로우 (Ann 1차 브레인스토밍 + 처방전 추가)
1차 프롬프트 그대로 시스템 프롬프트로 주입. 상태머신 4개:

| Stage | 트리거 | 멘토가 하는 일 |
|---|---|---|
| **S1. Prescription** | 논문 제목/링크/abstract 입력 | (a) 3문장 티저 (b) **🖨️ 30분 운동 처방전 JSON 출력** — 읽을 영역 + 가이드 질문 5개 (c) 30분 타이머 시작 선언 |
| **S2. Friction** | "학습 완료" 입력 | 하드코어 주관식 질문 2개 (처방전 가이드 질문과 일치/심화) |
| **S3. Feedback** | 사용자 답변 제출 | 비판적 채점 → 그 후 비로소 심층 요약 |
| **S4. Artifact** | S3 종료 | Mermaid 다이어그램 + 마크다운 블로그 초안 자동 생성 |

> 구현 디테일: 상태는 클라이언트 메모리에 보관. 각 stage 전환 시 시스템 프롬프트에 `<CURRENT_STAGE>S2</CURRENT_STAGE>` 같은 태그 주입해서 멘토가 단계 건너뛰지 못하도록 강제.

### S1 처방전 JSON 스키마
```json
{
  "paper": { "title": "...", "url": "...", "venue": "..." },
  "reading_sections": ["§3.2", "§3.3", "Figure 2"],
  "estimated_minutes": 30,
  "guide_questions": [
    "이 논문이 해결하려는 핵심 병목은?",
    "기존 방법 대비 A의 구조적 차이는?",
    "..."
  ],
  "margin_note_prompt": "각 섹션 옆 여백에 '내 말로 한 문장' 적기"
}
```
클라이언트는 이 JSON을 파싱해서 인쇄용 A4 페이지로 렌더 → 🖨️ 인쇄 버튼이 `window.print()` 호출.

---

## 4. 기술 스택 (잠금 완료)
- **프론트**: 단일 `index.html` + Tailwind CDN + vanilla JS (fast-project-patterns 검증)
- **AI**: `claude-opus-4-7` 또는 `claude-sonnet-4-6` 직접 fetch (브라우저 직접 호출, `anthropic-dangerous-direct-browser-access: true` 헤더)
- **API 키**: BYOK — `localStorage`에만 저장, 외부 전송 0회
- **다이어그램**: mermaid.js CDN (`mermaid.min.js@10`)
- **마크다운**: marked.js CDN
- **호스팅**: Vercel 정적 (또는 GitHub Pages fallback)
- **저장소**: `~/HQ/ai-study/hackathon-mentor/` (현재 폴더)

---

## 5. 폴더 구조
```
~/HQ/ai-study/hackathon-mentor/
├── PLAN.md            ← 지금 이 파일
├── index.html         ← 단일 앱 (UI + JS + 인라인 스타일 + @media print CSS)
├── system-prompt.md   ← 1차 프롬프트 + S1 처방전 JSON 스키마 추가
├── demo/
│   └── react-abstract.txt  ← "데모 시작" 클릭 시 자동 입력
└── README.md          ← 30초 발표 스크립트 + URL
```

---

## 6. 시연 시나리오 (60~90초)
1. **Hook (5초)**: "저는 이미 4월에 ReAct 논문을 *손으로 1시간* 들여 핸드아웃으로 정리했어요" — 화면에 `study-handout.md` 띄움
2. **Before (10초)**: "ChatPDF/NotebookLM에 넣으면 5초만에 요약. 근데 한 달 뒤 머리에 남는 거? 0%. 시간은 없고 1차 소스로 공부하고는 싶고."
3. **After 시연 (60초)**:
   - PaperGym URL 열기 → 상단에 `🏋️ 4편째 · 🔥 5일 연속` 위젯
   - "데모 시작" 클릭 (ReAct abstract 자동 입력)
   - **🖨️ 처방전 등장**: "오늘 §3.2-3.4 + Figure 2만 읽으세요. 가이드 질문 5개. 인쇄 버튼 클릭"
   - 인쇄 미리보기 창 띄움 → "이걸 출근 전 인쇄해서 지하철에서 읽는 거예요"
   - 30분 타이머 카운트다운 시작 (시연용은 30초 모드)
   - "학습 완료" 입력 → S2 하드코어 질문 2개 등장
   - 답변 입력 → S3 비판적 채점 + 심층 요약
   - S4 → Mermaid 아키텍처 다이어그램 등장 + 블로그 초안 + 🏆 "5편째 완주!" 토스트
4. **One-liner (10초)**: "다른 AI 학습 도구가 화면 안에 더 오래 붙잡아둘 때, PaperGym은 *종이로 내보내고* 30분 후 *진짜 시험*을 봅니다."

---

## 7. 2시간 시간 분배 (재조정)
```
0:00–0:15  PLAN 확정 + system-prompt.md 분리 (S1 처방전 스키마 포함)
0:15–0:45  index.html 셸 + Tailwind + BYOK + Workout Log 위젯 + 챗 UI
0:45–1:15  Claude API fetch + 4단계 상태머신 + <CURRENT_STAGE> 태그 주입
1:15–1:35  🖨️ 처방전 파서 + @media print CSS A4 레이아웃 + 인쇄 버튼
1:35–1:50  30분 타이머 + Mermaid 렌더 + 마크다운 블로그 출력
1:50–1:55  ReAct 프리셋 + Vercel 배포
1:55–2:00  자가 풀사이클 + README 30초 발표 스크립트
```

**버퍼**: 처방전 인쇄 CSS가 가장 변동성 큰 신규 작업. 15분 잡았지만 깨지면 "인쇄 미리보기 자체가 와우"이므로 깨끗하지 않아도 print() 호출만 되면 OK로 합격.

---

## 8. 와우 포인트 (10%) — 확정 + Stretch
**확정 (MVP에 박힘)**:
- 4단계 상태머신을 화면 상단 progress bar로 시각화 (Stage 1→2→3→4 점등)
- 30분 카운트다운 (멘토가 "지금부터 30분"이라 말한 게 *진짜로* 동작)
- Mermaid 다이어그램이 *AI가 그 자리에서* 생성
- 본인 study-handout Before/After 슬라이드 1장 (발표용)
- **🖨️ 30분 운동 처방전 (인쇄용 PDF)** ⭐ 결정적 차별점:
  - S1에서 AI가 처방전 JSON 생성 → A4 인쇄 레이아웃 자동 렌더 → 인쇄 버튼 → 종이 들고 출근
  - 시연 임팩트: "AI 도구가 사용자를 화면 *밖*으로 내보낸다"
  - 평가 4축 동시 강타: 문제정의(시간 부족/1차 소스) + 창의성(metamedium 역방향) + 실용성(진짜 출근길) + 와우
- **🏋️ Workout Log + Streak** (Ann 픽한 추가 와우):
  - 화면 상단 고정 위젯: `🏋️ 오늘로 N편째 · 누적 N시간 · 🔥 N일 연속`
  - localStorage 단일 키 `papergym:log` = `[{date, paper, durationMin}]`
  - 풀사이클 4단계 *완주 시에만* +1 (4단계 강제 메커니즘 보강)
  - 시연 시작 시 미리 4~5편 시드 박아둠 → "이거 진짜 쓰던 거구나" 신뢰성 와우
  - 완주 시 토스트: "🏆 오늘의 운동 완료 — N+1편"
- **헬스장 카피 위장 로딩 인디케이터** (1줄 추가, ROI 큼):
  - Opus 4.7 응답 5~15초를 "🏋️ 멘토가 무게를 재고 있어요…" 같은 카피로 위장

**Stretch (1:45~2:00 시간 남으면)**:
- 답변에 "오늘의 부하 78/100" 채점 숫자
- 학습 카드 JSON 다운로드 (Anki/Notion 임포트)
- Before/After 거울 모드 (사용자 첫 답변 vs 채점 후)

---

## 9. 리스크 & 미티게이션
| 리스크 | 확률 | 대응 |
|---|---|---|
| 브라우저 직접 API 호출 CORS 거부 | 중 | `anthropic-dangerous-direct-browser-access: true` 헤더로 해결 (공식 지원). 막히면 Vercel serverless 5분 |
| Mermaid 코드 잘못 생성되어 렌더 실패 | 중 | 시스템 프롬프트에 Mermaid 문법 예시 박아넣기 + try/catch + "다시 생성" 버튼 |
| 멘토가 단계 건너뛰고 요약 떠먹임 | 중 | `<CURRENT_STAGE>` 태그 + 시스템 프롬프트 ABSOLUTE 강조 + 사후 검증 자가 데모 |
| 시연 도중 API 키 노출 | 낮 | BYOK + localStorage only, Ann 키는 시연 후 화면 갈음 |
| 발표자 막힘 | 낮 | README에 30초 스크립트 박아두기, 한 줄씩 외움 |

---

## 10. 최소 합격선 vs 욕심선
- **최소 합격선 (1:35까지 무조건)**: BYOK 입력 → S1 티저+처방전(코드블록만이라도) → S2 질문 → S3 채점 → S4 마크다운 출력. Mermaid·인쇄CSS 깨져도 텍스트는 보임.
- **욕심선 (2:00까지)**: 위 + 인쇄용 A4 미리보기 + Mermaid 실제 렌더 + 타이머 카운트다운 + Workout Log 위젯 + ReAct 프리셋 + Vercel URL

---

## 11. 다음 액션
- [x] 이름 확정 = **PaperGym**
- [x] 모델 확정 = **claude-opus-4-7**
- [x] 와우 추가 = **Workout Log + Streak**
- [ ] system-prompt.md 분리 작성
- [ ] index.html 빌드 (Tailwind + 챗 UI + BYOK + Workout Log 위젯)
- [ ] Claude API 호출 + 4단계 상태머신
- [ ] 30분 타이머 + Mermaid 렌더 + 마크다운 출력
- [ ] ReAct 프리셋 + Vercel 배포
- [ ] 자가 풀사이클 + 발표 30초 스크립트
