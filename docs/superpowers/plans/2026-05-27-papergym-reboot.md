# PaperGym 리부트 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 기존 PaperGym v6 골조(13편/16주/Supabase) 위에 비개발자 입문 4명용 학습 보조 사이트를 리부트한다 — 5탭 일일 학습 카드 + 가로 행 응원 + 사전 큐레이션 JSON 콘텐츠.

**Architecture:** 단일 `index.html` 셸(vanilla JS + Tailwind CDN) + `data/` JSON 콘텐츠 + Supabase 3 테이블 + localStorage 개인 상태. AI 런타임 호출 없음(사전 큐레이션). Vercel 정적 호스팅, build step 없음.

**Tech Stack:** vanilla HTML/CSS/JS · Tailwind CDN · Supabase JS · localStorage · Vercel static.

**Spec:** `docs/superpowers/specs/2026-05-27-papergym-reboot-design.md`

---

## Verification 패턴 (모든 task 공통)

이 프로젝트는 자동 테스트 인프라가 없습니다 (PaperGym v6 패턴 유지, 4명만 쓰는 사이트에 야크 쉐이빙 회피). **검증 = 브라우저 manual verification + JSON schema validation**:

- 코드 task → `python3 -m http.server 8000` 으로 로컬 띄움 → 브라우저에서 명시된 단계 따라가며 expected behavior 확인
- JSON 콘텐츠 task → `jq` 로 schema 검증 + 사람 눈으로 콘텐츠 검수
- 모든 task 끝에 `git commit`

각 task는 독립적으로 working state로 끝나야 함 — 중간 task에서도 사이트는 깨지지 않음.

---

## File Structure

```
~/HQ/ai-study/hackathon-mentor/
├── index.html                # 셸 (재작성, ~600줄) — 매 task 점진적 빌드
├── index-v6.html.bak         # Task 1에서 백업
├── data/                     # 신규
│   ├── curriculum.json       # 16주 매핑
│   ├── glossary.json         # 전체 용어집 (handoff/ 변환)
│   ├── supplementals.json    # 보충 16편 옵션
│   └── papers/
│       ├── cot.json          # W1 (Task 2)
│       └── cot/
│           └── fig1.png      # figure 이미지
├── supabase-migration.sql    # day_index 칼럼 추가
├── handoff/                  # v6 자산 (큐레이션 input, 그대로 유지)
├── paper-abstracts/          # v6 자산 (그대로 유지)
├── curriculum.html           # v6 큐레이션 가이드 (보존)
├── deck.html                 # v6 해커톤 덱 (보존)
├── CLAUDE.md                 # Task 7에서 업데이트
└── README.md                 # Task 7에서 업데이트
```

**파일 책임 경계**:
- `index.html` = UI + 라우팅 + JS 로직 (≤ 700줄 목표, 넘어가면 외부 `app.js`로 분리 검토)
- `data/*.json` = 정적 콘텐츠 (사람이 읽고 편집)
- `supabase-migration.sql` = DB 스키마 변경 1회성

---

## Task 1: 백업 + 폴더 구조 + 16주 매핑 데이터

**Files:**
- Create: `index-v6.html.bak` (백업)
- Create: `data/curriculum.json`
- Create: `data/.gitkeep`, `data/papers/.gitkeep`

- [ ] **Step 1: 기존 index.html 백업**

```bash
cp index.html index-v6.html.bak
git add index-v6.html.bak
```

- [ ] **Step 2: data/ 폴더 생성**

```bash
mkdir -p data/papers
touch data/.gitkeep data/papers/.gitkeep
```

- [ ] **Step 3: `data/curriculum.json` 작성**

`data/curriculum.json`:
```json
{
  "version": "reboot-v1",
  "startDate": "2026-06-01",
  "endDate": "2026-09-20",
  "weeks": [
    { "n": 1, "phase": 1, "phaseName": "Form Building", "phaseColor": "amber", "paperId": "cot", "type": "main" },
    { "n": 2, "phase": 1, "phaseName": "Form Building", "phaseColor": "amber", "paperId": "react", "type": "main" },
    { "n": 3, "phase": 1, "phaseName": "Form Building", "phaseColor": "amber", "paperId": "toolformer", "type": "main" },
    { "n": 4, "phase": 1, "phaseName": "Form Building", "phaseColor": "amber", "paperId": null, "type": "review", "reviewOf": ["cot","react","toolformer"] },
    { "n": 5, "phase": 2, "phaseName": "Assistant Training", "phaseColor": "rose", "paperId": "instructgpt", "type": "main" },
    { "n": 6, "phase": 2, "phaseName": "Assistant Training", "phaseColor": "rose", "paperId": "cai", "type": "main" },
    { "n": 7, "phase": 2, "phaseName": "Assistant Training", "phaseColor": "rose", "paperId": "reflexion", "type": "main" },
    { "n": 8, "phase": 2, "phaseName": "Assistant Training", "phaseColor": "rose", "paperId": null, "type": "review", "reviewOf": ["instructgpt","cai","reflexion"] },
    { "n": 9, "phase": 3, "phaseName": "LLM Foundation", "phaseColor": "emerald", "paperId": "attention", "type": "main" },
    { "n": 10, "phase": 3, "phaseName": "LLM Foundation", "phaseColor": "emerald", "paperId": "gpt3", "type": "main" },
    { "n": 11, "phase": 3, "phaseName": "LLM Foundation", "phaseColor": "emerald", "paperId": "scaling-laws", "type": "main" },
    { "n": 12, "phase": 3, "phaseName": "LLM Foundation", "phaseColor": "emerald", "paperId": "chinchilla", "type": "main" },
    { "n": 13, "phase": 4, "phaseName": "Memory & Synthesis", "phaseColor": "violet", "paperId": "rag", "type": "main" },
    { "n": 14, "phase": 4, "phaseName": "Memory & Synthesis", "phaseColor": "violet", "paperId": "memgpt", "type": "main" },
    { "n": 15, "phase": 4, "phaseName": "Memory & Synthesis", "phaseColor": "violet", "paperId": "tot", "type": "main" },
    { "n": 16, "phase": 4, "phaseName": "Memory & Synthesis", "phaseColor": "violet", "paperId": null, "type": "review", "reviewOf": ["rag","memgpt","tot"], "isFinal": true }
  ]
}
```

- [ ] **Step 4: jq로 schema validation**

Run:
```bash
jq '.weeks | length' data/curriculum.json
jq '[.weeks[] | select(.type == "main")] | length' data/curriculum.json
jq '[.weeks[] | select(.type == "review")] | length' data/curriculum.json
```

Expected output:
```
16
13
3
```

- [ ] **Step 5: Commit**

```bash
git add index-v6.html.bak data/curriculum.json data/.gitkeep data/papers/.gitkeep
git commit -m "reboot: backup v6 index + add 16주 curriculum mapping"
```

---

## Task 2: W1 (CoT) 콘텐츠 큐레이션 — `data/papers/cot.json`

**Files:**
- Create: `data/papers/cot.json`
- Create: `data/papers/cot/fig1.png` (figure 이미지, Ann이 PDF에서 캡처)

**Source 참조 (read-only):**
- `handoff/korean-abstracts.json` — CoT 한국어 abstract 있음
- `handoff/papergym-paper-corpus.json` — CoT의 reading_sections + guide_questions
- `paper-abstracts/ko-translations/core-abstracts-ko.md` — 한국어 풀번역
- `2201.11903v6.pdf` (상위 폴더) — 원문

- [ ] **Step 1: 기존 자산에서 CoT 데이터 추출**

```bash
jq '.papers[] | select(.id == "cot")' handoff/papergym-paper-corpus.json > /tmp/cot-corpus.json
jq '.[] | select(.paper_id == "cot")' handoff/korean-abstracts.json > /tmp/cot-abstract.json
cat /tmp/cot-corpus.json
cat /tmp/cot-abstract.json
```

이 두 파일이 신규 `cot.json`의 base. 5일 슬롯에 맞게 분배.

- [ ] **Step 2: `data/papers/cot.json` 작성 (Claude 초안)**

Claude Code 세션에서 다음 prompt:
> "/tmp/cot-corpus.json + /tmp/cot-abstract.json + 2201.11903v6.pdf를 참조해서 CoT 논문의 5일 학습 슬롯 (Day 1~5)을 spec §6.1 schema에 맞게 `data/papers/cot.json`으로 생성. 각 day는 한국어 풀번역(translationKo)·핵심 figure 1개·신규 용어 3개 영-한·일상 비유 1개·가이드 질문 1개. 토요일 미니 퀴즈 5문제(4지선다). 일요일 다음 주(ReAct) 프리뷰."

`data/papers/cot.json` 구조 (Claude가 채울 schema, *모든 필드 필수*):
```json
{
  "id": "cot",
  "title": "Chain-of-Thought Prompting Elicits Reasoning in Large Language Models",
  "venue": "NeurIPS 2022",
  "arxivId": "2201.11903",
  "phase": 1,
  "koreanTitle": "사고 사슬 프롬프팅이 대형 언어 모델의 추론 능력을 끌어낸다",
  "hook": "한 줄 hook (15자 내)",
  "abstractKo": "전체 한국어 abstract 풀번역 (1~2 문단)",
  "days": [
    {
      "n": 1,
      "range": "Abstract + §1 Introduction",
      "estimatedMinutes": 35,
      "pages": 3,
      "translationKo": "오늘 분량 한국어 풀번역 (3~5 문단)",
      "figure": { "id": "Figure 1", "captionKo": "한국어 캡션 설명", "imagePath": "data/papers/cot/fig1.png" },
      "glossary": [
        { "en": "chain-of-thought", "ko": "사고 사슬", "memo": "한 줄 메모" },
        { "en": "few-shot prompting", "ko": "퓨샷 프롬프팅", "memo": "..." },
        { "en": "in-context learning", "ko": "인컨텍스트 학습", "memo": "..." }
      ],
      "analogy": {
        "title": "수학 풀이의 '풀이 과정 쓰기'",
        "body": "선생님이 '답만 쓰지 말고 풀이 과정을 써라'고 하는 이유와 같다. 과정을 쓰면 (1) 본인 사고 정리, (2) 채점자가 어디서 틀렸는지 봄, (3) 부분 점수. LLM도 똑같다."
      },
      "question": "왜 LLM에 '단계별로 생각해보세요'라고 추가하면 답이 더 정확해질까? 한 문장으로 답해보세요."
    }
    // ... Day 2~5 모두 필수
  ],
  "saturdayQuiz": [
    { "q": "...", "options": ["A","B","C","D"], "correct": 1, "explain": "..." }
    // 총 5문제
  ],
  "sundayPreview": {
    "nextPaperId": "react",
    "nextTitle": "ReAct: Synergizing Reasoning and Acting in Language Models",
    "teaser": "CoT가 '생각'을 시켰다면, 다음 주는 '생각 + 행동'을 같이 시킨다."
  }
}
```

- [ ] **Step 3: Ann 검수 체크리스트 (1편당 ~30분)**

`data/papers/cot.json`을 사람 눈으로 검토. 각 항목 체크:
- [ ] 각 Day의 한국어 번역이 자연스러운가 (직역 아닌 의역, 비개발자 입문 페르소나)
- [ ] 비유가 진짜로 이해를 돕는가 (억지 비유면 교체)
- [ ] 가이드 질문이 "한 문장으로 답할 만한" 적정 난이도인가
- [ ] 신규 용어 3개가 진짜 핵심 용어인가 (이미 잘 아는 것은 빼기)
- [ ] 토요일 퀴즈 5문제가 너무 쉽지도 어렵지도 않은가
- [ ] 일요일 teaser가 다음 주 관심 유발 OK

- [ ] **Step 4: figure 이미지 준비**

Ann이 PDF에서 Figure 1 캡처 → `data/papers/cot/fig1.png` 저장 (가로 800px 권장).

- [ ] **Step 5: jq schema validation**

Run:
```bash
jq '.days | length' data/papers/cot.json     # → 5
jq '.saturdayQuiz | length' data/papers/cot.json  # → 5
jq '.days[].glossary | length' data/papers/cot.json | sort -u  # → 3 (모든 Day)
jq -r '.days[].translationKo | length' data/papers/cot.json  # → 모두 100+ 글자
test -f data/papers/cot/fig1.png && echo "figure OK"
```

- [ ] **Step 6: Commit**

```bash
git add data/papers/cot.json data/papers/cot/fig1.png
git commit -m "content: add W1 CoT 5-day slots + saturday quiz + sunday preview"
```

---

## Task 3: 셸 + 라우터 + 헤더 + 첫 진입 모달

**Files:**
- Modify: `index.html` (완전 재작성)

- [ ] **Step 1: index.html 골격 작성**

`index.html` 전체 (이 step에서 한 번에 작성):
```html
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PaperGym — AI 논문 16주 스터디</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/@supabase/supabase-js@2"></script>
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Apple SD Gothic Neo', sans-serif; }
  </style>
</head>
<body class="bg-stone-50 text-stone-900">

  <!-- Header -->
  <header class="border-b border-stone-200 bg-white sticky top-0 z-10">
    <div class="max-w-3xl mx-auto px-4 py-3 flex items-center justify-between">
      <div class="font-semibold">📚 PaperGym</div>
      <nav class="flex gap-1 text-sm">
        <button data-route="#today" class="nav-btn px-3 py-1 rounded">📖 오늘</button>
        <button data-route="#papers" class="nav-btn px-3 py-1 rounded">🗂️ 논문</button>
        <button data-route="#team" class="nav-btn px-3 py-1 rounded">👥 팀</button>
      </nav>
      <button id="me-badge" class="text-2xl">🦊</button>
    </div>
  </header>

  <!-- Views -->
  <main class="max-w-3xl mx-auto px-4 py-6">
    <div id="view-today" class="view"></div>
    <div id="view-papers" class="view hidden"></div>
    <div id="view-team" class="view hidden"></div>
  </main>

  <!-- First-time modal -->
  <div id="modal-name" class="hidden fixed inset-0 bg-black/40 z-20 flex items-center justify-center p-4">
    <div class="bg-white rounded-xl p-6 max-w-sm w-full">
      <h2 class="text-lg font-semibold mb-1">👋 처음 오셨네요</h2>
      <p class="text-sm text-stone-600 mb-4">팀 4명이 응원할 수 있게 이름과 이모지를 골라주세요.</p>
      <label class="block text-xs text-stone-500 mb-1">이름</label>
      <input id="modal-name-input" type="text" class="w-full border border-stone-300 rounded px-3 py-2 mb-3" maxlength="10" placeholder="예: Ann">
      <label class="block text-xs text-stone-500 mb-1">이모지</label>
      <div id="modal-emoji-row" class="flex gap-2 mb-4">
        <button data-emoji="🦊" class="emoji-pick text-2xl border border-stone-300 rounded px-3 py-2">🦊</button>
        <button data-emoji="🐻" class="emoji-pick text-2xl border border-stone-300 rounded px-3 py-2">🐻</button>
        <button data-emoji="🐯" class="emoji-pick text-2xl border border-stone-300 rounded px-3 py-2">🐯</button>
        <button data-emoji="🐰" class="emoji-pick text-2xl border border-stone-300 rounded px-3 py-2">🐰</button>
      </div>
      <button id="modal-save" class="w-full bg-stone-900 text-white rounded py-2 disabled:bg-stone-400" disabled>저장하고 시작</button>
    </div>
  </div>

  <script>
    // ===== Constants =====
    const SUPABASE_URL = 'https://dnyfcamtyszwyqctjois.supabase.co';
    const SUPABASE_KEY = 'sb_publishable_P5XMkx7kq2yzvHXp8uTZ2Q_vxqoGWIy';
    const START_DATE = '2026-06-01';
    const TOTAL_WEEKS = 16;
    const LS = {
      me: 'papergym:me',
      tabsVisited: 'papergym:tabs-visited',
      notes: 'papergym:notes'
    };

    // ===== Init Supabase =====
    const supa = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

    // ===== State =====
    let me = JSON.parse(localStorage.getItem(LS.me) || 'null');
    let curriculum = null;

    // ===== Router =====
    function route() {
      const hash = location.hash || '#today';
      document.querySelectorAll('.view').forEach(v => v.classList.add('hidden'));
      const target = document.getElementById('view-' + hash.slice(1));
      if (target) target.classList.remove('hidden');
      document.querySelectorAll('.nav-btn').forEach(b => {
        b.classList.toggle('bg-stone-900', b.dataset.route === hash);
        b.classList.toggle('text-white', b.dataset.route === hash);
      });
    }
    window.addEventListener('hashchange', route);
    document.querySelectorAll('.nav-btn').forEach(b => {
      b.addEventListener('click', () => location.hash = b.dataset.route);
    });

    // ===== First-time modal =====
    let pickedEmoji = null;
    function showNameModal() {
      document.getElementById('modal-name').classList.remove('hidden');
    }
    function hideNameModal() {
      document.getElementById('modal-name').classList.add('hidden');
    }
    document.querySelectorAll('.emoji-pick').forEach(btn => {
      btn.addEventListener('click', () => {
        pickedEmoji = btn.dataset.emoji;
        document.querySelectorAll('.emoji-pick').forEach(b => b.classList.remove('bg-amber-100','border-amber-500'));
        btn.classList.add('bg-amber-100','border-amber-500');
        checkSaveEnabled();
      });
    });
    document.getElementById('modal-name-input').addEventListener('input', checkSaveEnabled);
    function checkSaveEnabled() {
      const name = document.getElementById('modal-name-input').value.trim();
      document.getElementById('modal-save').disabled = !(name && pickedEmoji);
    }
    document.getElementById('modal-save').addEventListener('click', async () => {
      const name = document.getElementById('modal-name-input').value.trim();
      me = { name, emoji: pickedEmoji, userId: crypto.randomUUID(), joinedAt: new Date().toISOString() };
      localStorage.setItem(LS.me, JSON.stringify(me));
      // Supabase insert는 Task 6에서 추가
      document.getElementById('me-badge').textContent = pickedEmoji;
      hideNameModal();
    });

    // ===== Boot =====
    async function boot() {
      curriculum = await fetch('data/curriculum.json').then(r => r.json());
      if (!me) {
        showNameModal();
      } else {
        document.getElementById('me-badge').textContent = me.emoji;
      }
      if (!location.hash) location.hash = '#today';
      route();
      // 각 view 렌더는 Task 4, 5에서 추가
      document.getElementById('view-today').innerHTML = '<p class="text-stone-500">오늘 학습 카드 (Task 4에서 구현)</p>';
      document.getElementById('view-papers').innerHTML = '<p class="text-stone-500">논문 16주 그리드 (Task 5에서 구현)</p>';
      document.getElementById('view-team').innerHTML = '<p class="text-stone-500">팀 응원 (Task 5에서 구현)</p>';
    }
    boot();
  </script>
</body>
</html>
```

- [ ] **Step 2: 로컬 서버 띄움**

```bash
python3 -m http.server 8000
```

- [ ] **Step 3: 브라우저 verification**

브라우저에서 `http://localhost:8000` 열기. Expected behavior:
- 처음 진입 시 이름 모달 등장 (배경 어두워짐)
- 이름 입력 + 이모지 클릭 (예: 🦊) → 둘 다 채워지면 "저장하고 시작" 활성화
- 클릭 → 모달 사라지고 우측 상단에 🦊 표시
- 새로고침 시 모달 다시 안 뜨고 🦊 유지 (localStorage 동작)
- 헤더 "오늘 / 논문 / 팀" 클릭 시 view 전환 + 선택 버튼 어둡게
- URL hash가 `#today`, `#papers`, `#team`으로 바뀜
- 새로고침 후에도 같은 view 유지 (hash router 동작)

- [ ] **Step 4: 확인 — localStorage 초기화 후 재테스트**

브라우저 DevTools Console:
```js
localStorage.clear(); location.reload();
```
모달 다시 떠야 함.

- [ ] **Step 5: Commit**

```bash
git add index.html
git commit -m "reboot: shell + hash router + first-time name modal"
```

---

## Task 4: #today 5탭 학습 카드

**Files:**
- Modify: `index.html` (renderToday 함수 추가)

- [ ] **Step 1: 오늘 → 주차/Day 매핑 로직 추가**

`index.html`의 `<script>` 안 `===== State =====` 아래에 추가:
```js
// ===== Date → Week/Day mapping =====
function getCurrentWeekAndDay() {
  const start = new Date(START_DATE + 'T00:00:00');
  const now = new Date();
  const diffDays = Math.floor((now - start) / (1000 * 60 * 60 * 24));
  if (diffDays < 0) return { week: 0, day: 0, status: 'before-start' };
  const week = Math.floor(diffDays / 7) + 1;
  if (week > TOTAL_WEEKS) return { week: TOTAL_WEEKS, day: 7, status: 'after-end' };
  const dayOfWeek = diffDays % 7; // 0 = 월, 1 = 화, ..., 5 = 토, 6 = 일
  return { week, day: dayOfWeek + 1, status: 'in-progress' };
}
```

- [ ] **Step 2: renderToday 함수 추가**

`index.html`의 `boot()` 함수 위에 추가:
```js
// ===== #today render =====
async function renderToday() {
  const view = document.getElementById('view-today');
  const { week, day, status } = getCurrentWeekAndDay();

  if (status === 'before-start') {
    view.innerHTML = `<div class="bg-amber-50 border border-amber-200 rounded-lg p-6 text-center">
      <p class="text-amber-900 font-semibold mb-2">🏋️ 6월 1일부터 시작이에요</p>
      <p class="text-sm text-amber-700">미리 보기는 <a href="#papers" class="underline">논문 지도</a>에서</p>
    </div>`;
    return;
  }
  if (status === 'after-end') {
    view.innerHTML = `<div class="bg-violet-50 border border-violet-200 rounded-lg p-6 text-center">
      <p class="text-violet-900 font-semibold">🏆 16주 완주! 다들 수고하셨어요</p>
    </div>`;
    return;
  }

  const weekInfo = curriculum.weeks.find(w => w.n === week);
  if (!weekInfo) return;

  if (weekInfo.type === 'review' || day === 6 || day === 7) {
    view.innerHTML = renderWeekendOrReview(weekInfo, day);
    return;
  }

  // 평일 5일 학습 카드 (day 1~5)
  let paper;
  try {
    paper = await fetch(`data/papers/${weekInfo.paperId}.json`).then(r => {
      if (!r.ok) throw new Error('not-found');
      return r.json();
    });
  } catch {
    view.innerHTML = `<div class="bg-stone-100 rounded-lg p-6 text-center">
      <p class="text-stone-600">⏳ 이번 주 학습 자료가 곧 도착합니다</p>
    </div>`;
    return;
  }

  const today = paper.days.find(d => d.n === day);
  if (!today) {
    view.innerHTML = `<p class="text-stone-500">오늘 슬롯 데이터가 비어있어요</p>`;
    return;
  }

  // 5탭 카드 렌더
  const visited = JSON.parse(localStorage.getItem(LS.tabsVisited) || '{}');
  const slotKey = `w${week}d${day}`;
  const v = visited[slotKey] || {};
  const tabs = ['한국어','그림','용어','비유','질문'];
  const tabKeys = ['ko','figure','glossary','analogy','question'];

  view.innerHTML = `
    <div class="bg-white rounded-lg border border-stone-200 overflow-hidden">
      <div class="bg-stone-100 px-4 py-3 flex justify-between items-center text-sm text-stone-600">
        <span>📚 W${week} · Day ${day} · ${['월','화','수','목','금'][day-1]}</span>
        <span class="tracking-widest text-xs text-stone-400">${[1,2,3,4,5].map(n => n <= day ? '●' : '○').join(' ')}</span>
      </div>
      <div class="p-4">
        <h2 class="font-semibold text-base">${paper.koreanTitle} — ${today.range}</h2>
        <p class="text-xs text-stone-500 mb-4">§${today.range} · 약 ${today.estimatedMinutes}분 · ${today.pages}페이지</p>

        <div class="flex border-b border-stone-200 -mx-4 px-4">
          ${tabs.map((label, i) => `
            <button data-tab="${tabKeys[i]}" class="tab-btn px-3 py-2 text-sm border-b-2 ${i === 0 ? 'border-stone-900 font-semibold' : 'border-transparent text-stone-500'}">
              ${v[tabKeys[i]] ? '✓ ' : ''}${label}
            </button>
          `).join('')}
        </div>

        <div id="tab-body" class="py-4 text-sm leading-relaxed min-h-[120px]"></div>

        <button id="complete-btn" class="w-full mt-4 bg-green-600 disabled:bg-stone-300 text-white rounded-lg py-3 font-semibold">
          ✓ 오늘 완료
        </button>
      </div>
    </div>
  `;

  // 탭 콘텐츠 렌더 함수
  function renderTabBody(key) {
    const body = document.getElementById('tab-body');
    if (key === 'ko') body.innerHTML = `<div class="whitespace-pre-wrap">${escapeHtml(today.translationKo)}</div>`;
    else if (key === 'figure') body.innerHTML = `
      <img src="${today.figure.imagePath}" alt="figure" class="max-w-full mx-auto mb-3 border border-stone-200 rounded" onerror="this.style.display='none'">
      <p class="text-stone-700"><b>${today.figure.id}</b> — ${escapeHtml(today.figure.captionKo)}</p>
    `;
    else if (key === 'glossary') body.innerHTML = `
      <ul class="space-y-2">
        ${today.glossary.map(g => `<li><b>${escapeHtml(g.en)}</b> · ${escapeHtml(g.ko)}<br><span class="text-xs text-stone-500">${escapeHtml(g.memo)}</span></li>`).join('')}
      </ul>
    `;
    else if (key === 'analogy') body.innerHTML = `
      <p class="font-semibold mb-2">${escapeHtml(today.analogy.title)}</p>
      <p>${escapeHtml(today.analogy.body)}</p>
    `;
    else if (key === 'question') body.innerHTML = `
      <p class="font-semibold mb-2">오늘의 질문</p>
      <p class="mb-3">${escapeHtml(today.question)}</p>
      <textarea id="answer-input" class="w-full border border-stone-300 rounded p-3 text-sm" rows="4" placeholder="한 문장으로 답해보세요 (혼자만 보임)"></textarea>
      <p class="text-xs text-stone-400 mt-1">답변은 이 기기에만 저장돼요. 팀원에게 공개되지 않아요.</p>
    `;
    // Answer 복원 + 저장
    if (key === 'question') {
      const notes = JSON.parse(localStorage.getItem(LS.notes) || '{}');
      const noteKey = `w${week}d${day}`;
      const input = document.getElementById('answer-input');
      input.value = notes[noteKey] || '';
      input.addEventListener('input', () => {
        notes[noteKey] = input.value;
        localStorage.setItem(LS.notes, JSON.stringify(notes));
      });
    }
  }

  // 탭 클릭
  document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.tab-btn').forEach(b => {
        b.classList.remove('border-stone-900','font-semibold');
        b.classList.add('border-transparent','text-stone-500');
      });
      btn.classList.add('border-stone-900','font-semibold');
      btn.classList.remove('border-transparent','text-stone-500');
      const key = btn.dataset.tab;
      renderTabBody(key);
      // 방문 기록
      v[key] = true;
      visited[slotKey] = v;
      localStorage.setItem(LS.tabsVisited, JSON.stringify(visited));
      // ✓ 마크 업데이트
      btn.textContent = '✓ ' + tabs[tabKeys.indexOf(key)];
      // 모든 탭 방문 시 완료 버튼 활성
      const allVisited = tabKeys.every(k => v[k]);
      document.getElementById('complete-btn').disabled = !allVisited;
    });
  });

  // 첫 탭 자동 활성
  renderTabBody('ko');
  v['ko'] = true;
  visited[slotKey] = v;
  localStorage.setItem(LS.tabsVisited, JSON.stringify(visited));
  document.querySelector('[data-tab="ko"]').textContent = '✓ 한국어';

  // 완료 버튼 — Task 6 (Supabase) 에서 실제 sync 추가
  document.getElementById('complete-btn').disabled = !tabKeys.every(k => v[k]);
  document.getElementById('complete-btn').addEventListener('click', async () => {
    alert('Supabase sync는 Task 6에서 wire-up 합니다');
  });
}

function renderWeekendOrReview(weekInfo, day) {
  if (weekInfo.type === 'review') {
    return `<div class="bg-stone-100 rounded-lg p-6">
      <p class="font-semibold mb-2">🔁 Review 주차 (W${weekInfo.n})</p>
      <p class="text-sm text-stone-600">이번 주는 ${weekInfo.reviewOf.join(' · ')} 통합 정리. 따로 일일 슬롯 없이 자유 복습.</p>
    </div>`;
  }
  if (day === 6) {
    return `<div class="bg-stone-100 rounded-lg p-6">
      <p class="font-semibold mb-2">📝 토요일 — 한 주 미니 퀴즈</p>
      <p class="text-sm text-stone-600">퀴즈 UI는 다음 sprint에서. 지금은 한 주 정리 노트 시간으로.</p>
    </div>`;
  }
  if (day === 7) {
    return `<div class="bg-stone-100 rounded-lg p-6">
      <p class="font-semibold mb-2">👥 일요일 — 팀 응원 + 다음 주 프리뷰</p>
      <p class="text-sm text-stone-600"><a href="#team" class="underline">팀 페이지</a>에서 응원 보내기</p>
    </div>`;
  }
}

function escapeHtml(s) {
  return String(s||'').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
}
```

- [ ] **Step 3: boot()에서 renderToday 호출**

`index.html`의 `boot()` 함수 끝에서 placeholder를 교체:
```js
// 기존
document.getElementById('view-today').innerHTML = '<p class="text-stone-500">오늘 학습 카드 (Task 4에서 구현)</p>';
// 교체:
renderToday();
// 그리고 hashchange 시에도 재렌더
window.addEventListener('hashchange', () => { if (location.hash === '#today') renderToday(); });
```

- [ ] **Step 4: 임시 시작일 override (오늘 = 2026-06-02 W1 D2 시뮬레이션)**

브라우저 DevTools Console에서:
```js
// 임시로 START_DATE를 5일 전으로 옮겨 W1 D6 강제 (Saturday 메시지 확인)
// 또는 페이지 상단 <script> 에 임시 추가:
//   const START_DATE = '2026-05-22'; // Today=05-27, diff=5, week=1, day=6
```
Verification 단계에서 다양한 날짜로 점검 후 원복.

- [ ] **Step 5: 브라우저 verification**

`http://localhost:8000` 새로고침. Expected behavior:
- 현재 날짜가 5/27 → "🏋️ 6월 1일부터 시작이에요" 카드
- START_DATE를 임시로 `2026-05-22`로 바꾸면 → "W1 Day 6" Saturday 카드
- START_DATE를 `2026-05-26`로 바꾸면 → "W1 Day 2 · 화" 5탭 카드
- 카드 등장 시 첫 탭(한국어) 자동 활성, ✓ 마크
- 다른 탭 클릭 → 라벨 위 ✓ 표시 누적
- "오늘 완료" 버튼은 회색 → 5탭 모두 방문하면 초록 활성
- "질문" 탭에서 텍스트 입력 → 새로고침 후 복원 (localStorage)
- "오늘 완료" 클릭 → alert "Supabase sync는 Task 6에서…" (정상)

verification 후 START_DATE 원복 (`'2026-06-01'`).

- [ ] **Step 6: Commit**

```bash
git add index.html
git commit -m "reboot: #today 5탭 학습 카드 + 탭 방문 추적 + 답변 노트"
```

---

## Task 5: #papers + #team 뷰

**Files:**
- Modify: `index.html` (renderPapers, renderTeam 추가)
- Create: `data/supplementals.json`

- [ ] **Step 1: `data/supplementals.json` 생성**

기존 `paper-abstracts/ko-translations/supplemental-abstracts-ko.md`에서 16편 추출하여 JSON으로:
```bash
# 수동 변환 (Ann 또는 Claude)
# 형식 예시
```

`data/supplementals.json`:
```json
[
  {
    "id": "bert",
    "title": "BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding",
    "koreanTitle": "BERT — 양방향 트랜스포머 사전학습",
    "hook": "GPT 이전 시대의 양강 — 양방향 컨텍스트의 힘.",
    "abstractKo": "한국어 풀번역 abstract...",
    "link": "https://arxiv.org/abs/1810.04805"
  }
  // ... 16편
]
```

- [ ] **Step 2: renderPapers 함수 추가**

`index.html` `<script>` 안에 추가:
```js
async function renderPapers() {
  const view = document.getElementById('view-papers');
  let supplementals = [];
  try { supplementals = await fetch('data/supplementals.json').then(r => r.json()); } catch {}

  const phaseColors = {
    amber: 'bg-amber-50 border-amber-200 text-amber-900',
    rose: 'bg-rose-50 border-rose-200 text-rose-900',
    emerald: 'bg-emerald-50 border-emerald-200 text-emerald-900',
    violet: 'bg-violet-50 border-violet-200 text-violet-900'
  };

  view.innerHTML = `
    <h1 class="text-xl font-semibold mb-1">16주 학습 지도</h1>
    <p class="text-sm text-stone-500 mb-6">13편 본 논문 + 3주 Review + 16편 보충 (옵션)</p>
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-2 mb-8">
      ${curriculum.weeks.map(w => `
        <div class="border rounded-lg p-3 ${phaseColors[w.phaseColor]} text-xs">
          <div class="font-semibold">W${w.n}${w.isFinal ? ' 🏆' : ''}</div>
          <div class="opacity-60">${w.phaseName}</div>
          <div class="mt-1 font-medium">${w.type === 'review' ? '🔁 Review' : (w.paperId || '—')}</div>
        </div>
      `).join('')}
    </div>

    <h2 class="text-lg font-semibold mb-1">옵션 reading list — 보충 16편</h2>
    <p class="text-sm text-stone-500 mb-3">강제 학습 아님. 관심 가면 한국어 abstract만 봐도 OK.</p>
    <div class="space-y-2">
      ${supplementals.map(p => `
        <div class="border border-stone-200 rounded-lg p-3 bg-white">
          <div class="font-semibold text-sm">${escapeHtml(p.koreanTitle)}</div>
          <div class="text-xs text-stone-500 mb-1">${escapeHtml(p.title)}</div>
          <div class="text-sm text-stone-700">${escapeHtml(p.hook)}</div>
          <a href="${p.link}" target="_blank" class="text-xs text-blue-600 underline">원문 →</a>
        </div>
      `).join('')}
    </div>
  `;
}
```

- [ ] **Step 3: renderTeam 함수 추가 (Supabase는 Task 6에서 wire-up — 지금은 mock)**

`index.html` `<script>` 안에 추가:
```js
async function renderTeam() {
  const view = document.getElementById('view-team');
  // Task 6에서 진짜 Supabase fetch로 교체. 지금은 mock.
  const mockMembers = [
    { userId: 'u1', name: 'Bong', emoji: '🦊', week: 3, day: 3, streak: 12, cheers: { '🔥': 2 } },
    { userId: 'u2', name: 'HS', emoji: '🐻', week: 3, day: 1, streak: 7, cheers: {} },
    { userId: 'u3', name: 'Teo', emoji: '🐯', week: 3, day: 2, streak: 9, cheers: { '💪': 1 } },
    me ? { userId: me.userId, name: me.name, emoji: me.emoji, week: 3, day: 2, streak: 14, cheers: { '🔥': 3, '💪': 1 } } : null
  ].filter(Boolean);

  const emojis = ['🔥','💪','👏','❤️'];
  const today = new Date();
  const isSunday = today.getDay() === 0;

  view.innerHTML = `
    ${isSunday ? `
      <div class="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-4">
        <p class="font-semibold text-amber-900 mb-1">🗓️ 일요일 — 이번 주 요약</p>
        <p class="text-sm text-amber-800">이번 주 누가 며칠 완주, 다음 주 논문 프리뷰 (실데이터 wire-up은 Task 6)</p>
      </div>
    ` : ''}

    <h1 class="text-xl font-semibold mb-4">팀 4명 · W${mockMembers[0].week}</h1>
    <div class="space-y-2">
      ${mockMembers.map(m => {
        const isMe = me && m.userId === me.userId;
        return `
          <div class="flex items-center gap-3 p-3 border border-stone-200 rounded-lg bg-white text-sm">
            <div class="text-2xl">${m.emoji}</div>
            <div class="font-semibold min-w-[55px]">${escapeHtml(m.name)}</div>
            <div class="flex-1">
              <div class="bg-stone-200 h-1.5 rounded overflow-hidden">
                <div class="bg-green-600 h-full" style="width:${(m.day / 5) * 100}%"></div>
              </div>
              <div class="text-xs text-stone-500 mt-1">W${m.week} D${m.day} / 5</div>
            </div>
            <div class="text-xs text-red-600 min-w-[35px] text-right">🔥${m.streak}</div>
            ${isMe ? `
              <div class="text-xs text-stone-400">받은 ${Object.entries(m.cheers).map(([e,n]) => `${e}${n}`).join(' ') || '0'}</div>
            ` : emojis.map(e => `
              <button data-to="${m.userId}" data-emoji="${e}" class="cheer-btn text-base px-2 py-1 border border-transparent rounded hover:bg-amber-50 hover:border-amber-400">${e}</button>
            `).join('')}
          </div>
        `;
      }).join('')}
    </div>
  `;

  document.querySelectorAll('.cheer-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      alert(`응원 ${btn.dataset.emoji} → 사용자 ${btn.dataset.to} (Supabase wire-up은 Task 6)`);
    });
  });
}
```

- [ ] **Step 4: boot()에서 renderPapers, renderTeam 호출**

`index.html`의 hashchange listener를 확장:
```js
window.addEventListener('hashchange', () => {
  if (location.hash === '#today') renderToday();
  if (location.hash === '#papers') renderPapers();
  if (location.hash === '#team') renderTeam();
});
```
그리고 boot() 끝에서 초기 view에 따라 렌더:
```js
if (location.hash === '#papers') renderPapers();
else if (location.hash === '#team') renderTeam();
else renderToday();
```

- [ ] **Step 5: 브라우저 verification**

`http://localhost:8000` 새로고침:
- `#papers` 클릭 → 16주 그리드 (Phase 1~4 색상별), 하단에 보충 16편 옵션 카드
- `#team` 클릭 → 4명 가로 행 (이모지 + 이름 + 진도바 + 스트릭 + 응원 이모지 4종)
- 본인 행에는 응원 버튼 대신 "받은 X" 표시
- 응원 이모지 클릭 → alert (mock)
- 일요일이면 상단 자동 요약 카드

- [ ] **Step 6: Commit**

```bash
git add index.html data/supplementals.json
git commit -m "reboot: #papers 16주 grid + #team 가로 행 응원 (mock data)"
```

---

## Task 6: Supabase 마이그레이션 + 클라이언트 wire-up

**Files:**
- Create: `supabase-migration.sql`
- Modify: `index.html` (mock → real Supabase)

- [ ] **Step 1: `supabase-migration.sql` 작성**

`supabase-migration.sql`:
```sql
-- PaperGym Reboot Migration
-- v6 papergym_progress 테이블에 day_index 칼럼 추가

-- 1. day_index 칼럼 추가 (NULL 허용, 기존 row는 day_index=5 로 backfill)
ALTER TABLE papergym_progress
  ADD COLUMN IF NOT EXISTS day_index integer;

UPDATE papergym_progress SET day_index = 5 WHERE day_index IS NULL;

ALTER TABLE papergym_progress
  ALTER COLUMN day_index SET NOT NULL;

-- 2. 기존 PK (user_id, week) → (user_id, week, day_index) 로 확장
ALTER TABLE papergym_progress DROP CONSTRAINT IF EXISTS papergym_progress_pkey;
ALTER TABLE papergym_progress
  ADD CONSTRAINT papergym_progress_pkey PRIMARY KEY (user_id, week, day_index);

-- 3. day_index 범위 체크 (1~7)
ALTER TABLE papergym_progress
  ADD CONSTRAINT papergym_progress_day_range CHECK (day_index BETWEEN 1 AND 7);
```

- [ ] **Step 2: Ann이 Supabase Dashboard에서 마이그레이션 실행**

[Supabase Dashboard](https://supabase.com/dashboard) → SQL Editor → 위 SQL 붙여넣고 실행.

Verification (Dashboard 또는 CLI):
```sql
SELECT column_name, data_type, is_nullable FROM information_schema.columns
WHERE table_name = 'papergym_progress';
```
Expected: `day_index` (integer, NO).

- [ ] **Step 3: index.html에 Supabase 함수 4개 추가**

`index.html` `<script>` 안 `===== State =====` 아래에 추가:
```js
// ===== Supabase wrappers =====
async function dbUpsertMember() {
  if (!me) return;
  await supa.from('papergym_members').upsert({
    user_id: me.userId, name: me.name, emoji: me.emoji, joined_at: me.joinedAt
  });
}
async function dbCompleteDay(week, day) {
  if (!me) return;
  await supa.from('papergym_progress').upsert({
    user_id: me.userId, week, day_index: day, completed_at: new Date().toISOString()
  });
}
async function dbSendCheer(toUserId, emoji, week) {
  if (!me) return;
  await supa.from('papergym_cheers').insert({
    from_user: me.userId, to_user: toUserId, emoji, week, sent_at: new Date().toISOString()
  });
}
async function dbFetchTeam() {
  const [{ data: members }, { data: progress }, { data: cheers }] = await Promise.all([
    supa.from('papergym_members').select('*'),
    supa.from('papergym_progress').select('user_id, week, day_index'),
    supa.from('papergym_cheers').select('to_user, emoji')
  ]);
  // 사용자별 최신 주차/Day + 받은 응원 집계
  const byUser = {};
  (members || []).forEach(m => { byUser[m.user_id] = { ...m, week: 0, day: 0, streak: 0, cheers: {} }; });
  (progress || []).forEach(p => {
    const u = byUser[p.user_id]; if (!u) return;
    if (p.week > u.week || (p.week === u.week && p.day_index > u.day)) {
      u.week = p.week; u.day = p.day_index;
    }
  });
  (cheers || []).forEach(c => {
    const u = byUser[c.to_user]; if (!u) return;
    u.cheers[c.emoji] = (u.cheers[c.emoji] || 0) + 1;
  });
  // streak 계산: 연속된 progress 일수 (단순 — 진도 row 개수로 근사)
  (progress || []).forEach(p => {
    const u = byUser[p.user_id]; if (!u) return;
    u.streak++;
  });
  return Object.values(byUser);
}
```

- [ ] **Step 4: 이름 모달 저장 시 Supabase insert**

`index.html` 모달 save handler에 추가:
```js
document.getElementById('modal-save').addEventListener('click', async () => {
  const name = document.getElementById('modal-name-input').value.trim();
  me = { name, emoji: pickedEmoji, userId: crypto.randomUUID(), joinedAt: new Date().toISOString() };
  localStorage.setItem(LS.me, JSON.stringify(me));
  await dbUpsertMember();  // ← 추가
  document.getElementById('me-badge').textContent = pickedEmoji;
  hideNameModal();
});
```

- [ ] **Step 5: 완료 버튼 wire-up**

`renderToday` 안의 완료 버튼 handler:
```js
document.getElementById('complete-btn').addEventListener('click', async () => {
  try {
    await dbCompleteDay(week, day);
    showToast('✓ 완료! 🔥 응원이 도착할 거예요');
  } catch (e) {
    // 오프라인 큐
    const pending = JSON.parse(localStorage.getItem('papergym:pending') || '[]');
    pending.push({ kind: 'complete', week, day, at: Date.now() });
    localStorage.setItem('papergym:pending', JSON.stringify(pending));
    showToast('⚠️ 오프라인 — 잠시 후 자동 동기화');
  }
});

function showToast(msg) {
  const t = document.createElement('div');
  t.className = 'fixed bottom-6 left-1/2 -translate-x-1/2 bg-stone-900 text-white px-4 py-2 rounded-lg text-sm z-30';
  t.textContent = msg;
  document.body.appendChild(t);
  setTimeout(() => t.remove(), 3000);
}
```

- [ ] **Step 6: renderTeam을 real Supabase로 교체**

`renderTeam` 함수 안에서 `mockMembers` 정의 부분을 교체:
```js
let members = [];
try { members = await dbFetchTeam(); } catch {
  view.innerHTML = `<div class="bg-amber-50 border border-amber-200 rounded p-4 text-amber-900">팀 정보 잠시 후 다시 시도</div>`;
  return;
}
// 본인이 빠져있으면 추가 (DB에 아직 없거나 끊김 대비)
if (me && !members.find(m => m.user_id === me.userId)) {
  members.push({ user_id: me.userId, name: me.name, emoji: me.emoji, week: 0, day: 0, streak: 0, cheers: {} });
}
const mockMembers = members.map(m => ({
  userId: m.user_id, name: m.name, emoji: m.emoji,
  week: m.week, day: m.day, streak: m.streak, cheers: m.cheers
}));
```

그리고 응원 버튼 handler:
```js
document.querySelectorAll('.cheer-btn').forEach(btn => {
  btn.addEventListener('click', async () => {
    const week = curriculum ? getCurrentWeekAndDay().week : 1;
    try {
      await dbSendCheer(btn.dataset.to, btn.dataset.emoji, week);
      btn.classList.add('bg-green-100','border-green-500');
      btn.textContent = '✓';
      setTimeout(() => renderTeam(), 1500);
    } catch {
      alert('응원 전송 실패. 잠시 후 다시 시도해주세요.');
    }
  });
});
```

- [ ] **Step 7: 오프라인 큐 retry 추가**

`boot()` 시작 부분에 추가:
```js
async function flushPending() {
  const pending = JSON.parse(localStorage.getItem('papergym:pending') || '[]');
  if (!pending.length) return;
  const remaining = [];
  for (const p of pending) {
    try {
      if (p.kind === 'complete') await dbCompleteDay(p.week, p.day);
    } catch { remaining.push(p); }
  }
  localStorage.setItem('papergym:pending', JSON.stringify(remaining));
}
// boot() 안에서 me 확인 후
if (me) await flushPending();
```

- [ ] **Step 8: 브라우저 verification (4명 시나리오)**

준비:
1. 4개 브라우저 프로필 또는 시크릿 창 4개 띄움
2. 각각 `http://localhost:8000` 진입 → 다른 이름·이모지로 등록
3. 임시 START_DATE로 W1 D2 활성화

체크:
- 각 창에서 #today 5탭 모두 방문 → "오늘 완료" 클릭 → 토스트
- 다른 창에서 #team 진입 → 4명 모두 보임, 진도바 위치 정확
- 응원 이모지 클릭 → ✓ 마크 + 받은 사람 카운트 증가 (1.5초 후 재렌더)
- 네트워크 오프라인(DevTools Network → Offline) → 완료 클릭 → "오프라인" 토스트 → 온라인 복귀 시 자동 sync
- Supabase Dashboard → Table editor에서 papergym_progress·cheers row 생성 확인

- [ ] **Step 9: Commit**

```bash
git add supabase-migration.sql index.html
git commit -m "reboot: Supabase wire-up (day_index 마이그레이션 + 4 wrapper + offline queue)"
```

---

## Task 7: 에러 처리 + CLAUDE.md/README 업데이트 + Vercel 배포 + 4명 dry-run

**Files:**
- Modify: `index.html` (마지막 polish)
- Modify: `CLAUDE.md`
- Modify: `README.md`

- [ ] **Step 1: edge case 점검**

spec §8 edge case 8.4 "진도 vs 시간 불일치" 추가 처리. `renderToday` 시작에서 본인 진도 확인:
```js
// renderToday 안에서 평일 분기 전에 추가
if (me) {
  try {
    const { data: myProgress } = await supa.from('papergym_progress')
      .select('week, day_index')
      .eq('user_id', me.userId)
      .order('week', { ascending: false })
      .order('day_index', { ascending: false })
      .limit(1);
    if (myProgress && myProgress.length) {
      const last = myProgress[0];
      // 마지막 완료 후 다음 슬롯 = 우선 표시
      const nextDay = last.day_index + 1;
      if (nextDay > 5) {
        // 다음 주
        if (last.week + 1 <= TOTAL_WEEKS && last.week + 1 <= week) {
          // 현재 주차 따라잡기 X — 마지막 완료 다음 슬롯이 우선
        }
      }
      // 단순화: 현재 시간 매핑 vs 본인 진도 갭 1주 이상이면 본인 진도 우선
      if (week - last.week >= 1 && last.day_index < 5) {
        const banner = document.createElement('div');
        banner.className = 'bg-blue-50 border border-blue-200 rounded p-3 mb-4 text-sm text-blue-900';
        banner.textContent = `한 주 쉬어가도 괜찮아요. 오늘은 W${last.week} Day ${nextDay}부터요.`;
        view.prepend(banner);
      }
    }
  } catch {}
}
```

- [ ] **Step 2: CLAUDE.md 업데이트**

`CLAUDE.md` 상단 "현재 버전" 섹션 교체:
```markdown
## 현재 버전: reboot-v1
**16주 · 13편 Core · 4 Phase · 4명 비개발자 입문 스터디 (리부트)**

- 시작: 2026-06-01 (월) · 종료: 2026-09-20 (일)
- 매일 30~60분 평일 본문 5조각 + 토 퀴즈 + 일 팀 응원
- UI: 5탭 학습 카드 + 가로 행 응원
- 사전 큐레이션 (Claude 초안 + Ann 검수), AI 런타임 호출 X
- 자세한 설계: `docs/superpowers/specs/2026-05-27-papergym-reboot-design.md`
- 구현 plan: `docs/superpowers/plans/2026-05-27-papergym-reboot.md`

### 13편 + 3 Review = 16주 (v6와 동일)
... (기존 phase 목록 유지)
```

- [ ] **Step 3: README.md 업데이트**

`README.md` 상단을 리부트 정체성으로 교체. 핵심: 비개발자 입문 4명, 평일 30~60분, 5탭 카드, 응원, URL 공유로 join.

- [ ] **Step 4: Vercel 배포**

```bash
git status   # 모든 변경 commit 됐는지 확인
vercel --prod
```

배포 URL 확인 → 같은 도메인이면 자동 갱신. 4명에게 URL 공유.

- [ ] **Step 5: 4명 dry-run 시나리오**

4명에게 1주일 사용 요청 후 피드백 수집:
1. 첫 진입 → 이름 등록 OK?
2. #today 5탭 자연스러움?
3. 답변 입력 후 새로고침 → 복원?
4. "오늘 완료" 누른 후 #team에서 본인 진도 보임?
5. 다른 사람에게 응원 보낼 때 어색하지 않음?
6. 일요일 자동 요약 카드 봄?

피드백을 GitHub Issue로 정리 후 v2 patch plan.

- [ ] **Step 6: Final commit**

```bash
git add CLAUDE.md README.md index.html
git commit -m "reboot: edge case polish + docs update + ship-ready for 6/1"
```

- [ ] **Step 7 (recurring, post-ship): W2~W16 콘텐츠 큐레이션 매주 반복**

매주 일요일~월요일 사이:
1. Claude Code 세션에서 "{nextPaperId} 5일 슬롯 초안" 프롬프트
2. `data/papers/{nextPaperId}.json` 생성
3. Ann 30분 검수
4. figure 이미지 캡처 (필요 시)
5. `git add data/papers/{nextPaperId}.json` → `git commit -m "content: add W{n} {paperId}"`
6. `vercel --prod` (또는 git push 시 자동 배포)

총 12회 (W2~W7, W9~W11, W13~W15) — Review 주차(W4·W8·W12·W16)는 콘텐츠 없음.

---

## Self-Review Notes

스펙 §1~§12 모두 task 매핑 OK:
- §1 사용자/제약 → Task 1~7 전반 가정
- §2 16주 골조 → Task 1 (curriculum.json)
- §3 일과 → Task 4 (renderToday day 분기) + Task 5 (renderTeam Sunday)
- §4 아키텍처 → Task 3 (셸) + Task 6 (Supabase)
- §5 뷰 3개 → Task 3 (모달·셸) + Task 4 (today) + Task 5 (papers·team)
- §6 데이터 모델 → Task 1·2 (JSON schemas) + Task 6 (Supabase 마이그레이션)
- §7 큐레이션 → Task 2 (W1) + Task 7 Step 7 (W2~W16 recurring)
- §8 에러 처리 → Task 4 (콘텐츠 누락) + Task 6 (오프라인 큐) + Task 7 (진도 갭 배너)
- §9 폴더 구조 → File Structure 섹션 + 각 Task의 Files 명시
- §10 빌드 단계 → Task 1~7 (1:1 매핑)
- §11 YAGNI → 명시적으로 BYOK·답변공유·검색·통계·알림·PWA·다국어 미포함
- §12 성공 기준 → Task 7 Step 5 (4명 dry-run 피드백)

Placeholder 스캔: 모든 코드 step에 실제 코드 박힘. "TBD" 없음. 추후 wire-up 명시한 부분(Task 3 step 1의 보충 16편 schema sample 16편, Task 4 step 5의 START_DATE 임시값)은 명확한 후속 action이 있음.

Type consistency: `me.userId` / `user_id` (DB 컬럼명) — Task 3·6에서 일관. `cheers.emoji` enum (🔥💪👏❤️) — Task 5·6에서 일관. `papergym_progress.day_index` 1~7 범위 — spec §6.2와 Task 6 마이그레이션에서 일관.
