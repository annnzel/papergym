# Daily Study Dashboard Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert PaperGym's first screen from the 4-stage conversation flow into a daily study dashboard that shows today's material/tip/assignment and lets each participant save personal notes in localStorage.

**Architecture:** Modify only `index.html`. Keep existing prescription/chat/Supabase code intact but move it under a collapsed advanced section. Add new data tables (study material per day type, study tips per day type, note field schema per day) and three new render functions (`renderStudyMaterial`, `renderStudyTip`, `renderDailyNote`). Persist notes in `localStorage["papergym:study-notes"]` keyed by ISO date.

**Tech Stack:** Single static `index.html`, Tailwind CDN, Vanilla JS, localStorage. No Supabase schema changes.

---

## File Structure

**Modify:**
- `index.html` — add new dashboard sections, demote chat/prescription, add render functions, wire to existing `refreshAll`.

**Do not modify:**
- `curriculum.html`
- `handoff/*.json`
- `weekly-update-system/*`

---

### Task 1: Reorganize hero and demote 4-stage bar

**Files:**
- Modify: `index.html:111-131` (4-stage bar), `index.html:137-191` (hero)

- [ ] **Step 1: Hide the 4-stage progress bar by default**

Wrap the 4-stage progress bar with a `<details>` block so it does not appear as the primary header element.

Replace lines 111-131 with:

```html
    <!-- 4-Stage Progress Bar (advanced AI mentor mode) -->
    <details id="stage-bar-wrap" class="max-w-5xl mx-auto px-4 pb-3">
      <summary class="text-xs text-stone-500 cursor-pointer hover:text-stone-900 select-none">고급 멘토 모드 진행 단계 보기</summary>
      <div class="flex items-center gap-2 mt-2">
        <div id="stage-1" class="stage-pending flex-1 rounded-md px-3 py-2 text-center text-xs font-bold transition-all">
          <div class="opacity-60">STAGE 1</div>
          <div>처방전 🖨️</div>
        </div>
        <div class="text-stone-300">→</div>
        <div id="stage-2" class="stage-pending flex-1 rounded-md px-3 py-2 text-center text-xs font-bold transition-all">
          <div class="opacity-60">STAGE 2</div>
          <div>마찰 🎯</div>
        </div>
        <div class="text-stone-300">→</div>
        <div id="stage-3" class="stage-pending flex-1 rounded-md px-3 py-2 text-center text-xs font-bold transition-all">
          <div class="opacity-60">STAGE 3</div>
          <div>채점 ⚖️</div>
        </div>
        <div class="text-stone-300">→</div>
        <div id="stage-4" class="stage-pending flex-1 rounded-md px-3 py-2 text-center text-xs font-bold transition-all">
          <div class="opacity-60">STAGE 4</div>
          <div>결과물 🏆</div>
        </div>
      </div>
    </details>
```

- [ ] **Step 2: Verify the page still loads**

Open `index.html` in a browser via `python3 -m http.server 8080`. Confirm no JS errors in console.

---

### Task 2: Add Study Material card section

**Files:**
- Modify: `index.html` (insert new section between `#hero` and `#group-section`)

- [ ] **Step 1: Insert the Study Material section HTML**

After the closing `</section>` of `#hero` (around line 191), insert:

```html
    <!-- Daily Study Material -->
    <section id="study-material-section" class="bg-white border-2 border-stone-900 rounded-xl p-5 mb-4 shadow-[6px_6px_0_0_rgba(0,0,0,1)]">
      <div class="flex items-center justify-between mb-3 flex-wrap gap-2">
        <h2 class="font-black text-base">📚 오늘 읽을 자료</h2>
        <span id="study-material-day-label" class="text-xs text-stone-500"></span>
      </div>
      <div id="study-material-body" class="text-sm text-stone-700 leading-relaxed">
        <div class="text-stone-400">로드 중…</div>
      </div>
    </section>

    <!-- Daily Study Tip -->
    <section id="study-tip-section" class="bg-amber-50 border-2 border-amber-300 rounded-xl p-5 mb-4">
      <div class="text-xs uppercase tracking-widest text-amber-700 font-black mb-2">💡 오늘의 공부 팁</div>
      <div id="study-tip-body" class="text-sm text-stone-800 leading-relaxed">로드 중…</div>
    </section>

    <!-- Daily Assignment / Note -->
    <section id="daily-note-section" class="bg-white border-2 border-stone-900 rounded-xl p-5 mb-4 shadow-[6px_6px_0_0_rgba(0,0,0,1)]">
      <div class="flex items-center justify-between mb-3 flex-wrap gap-2">
        <h2 class="font-black text-base">🧾 오늘의 노트</h2>
        <span id="daily-note-status" class="text-xs text-stone-500">저장 전</span>
      </div>
      <div id="daily-note-body" class="space-y-3"></div>
      <div class="mt-3 flex items-center gap-2 flex-wrap">
        <button id="daily-note-save" class="bg-stone-900 hover:bg-stone-700 text-white font-bold px-4 py-2 rounded-md text-sm">💾 노트 저장</button>
        <button id="daily-note-clear" class="text-xs text-stone-500 hover:text-red-600 underline">초기화</button>
        <span class="text-xs text-stone-400">개인 기록 · 이 브라우저에만 저장됩니다</span>
      </div>
    </section>
```

- [ ] **Step 2: Verify sections render as empty placeholders**

Reload the page. Confirm three new sections appear (자료/팁/노트) with placeholder text.

---

### Task 3: Add per-day study material and tip data

**Files:**
- Modify: `index.html` (script section, near `DAILY_TEMPLATE`)

- [ ] **Step 1: Add WEEK_SUPPLEMENT table**

After the `DAILY_TEMPLATE` const, insert this constant:

```js
    // 16주 지정 보강 자료 (curriculum.html 표와 동일)
    const WEEK_SUPPLEMENT = {
      1:  { title: 'Self-Consistency',                                    note: '여러 추론 경로를 만들고 가장 일관된 답을 선택하는 방법.' },
      2:  { title: 'Anthropic — Building Effective Agents',               note: 'workflow와 agent를 구분하는 실용 가이드.' },
      3:  { title: 'Model Context Protocol (MCP) 개념 소개',              note: 'AI가 외부 도구·시스템을 부르는 표준 인터페이스.' },
      4:  { title: 'Claude Code / coding agent 사용 사례',                note: 'CoT·ReAct·Toolformer가 실제 도구에서 어떻게 살아 있는지.' },
      5:  { title: 'Helpful & Harmless RLHF',                             note: '좋은 assistant는 유용함과 안전함을 함께 본다.' },
      6:  { title: 'Claude 원칙 / Model Behavior 공식 자료',              note: 'AI에게 원칙을 주는 것의 의미.' },
      7:  { title: 'SWE-bench',                                           note: '실제 GitHub issue를 푸는 능력을 보는 코딩 agent 평가.' },
      8:  { title: 'Direct Preference Optimization (DPO)',                note: '말로 지시하지 않고 선호쌍으로 학습시키는 방식.' },
      9:  { title: 'The Illustrated Transformer',                         note: '토큰 사이 관계 계산을 시각으로 잡기.' },
      10: { title: 'In-context learning / Few-shot prompting 해설',       note: '좋은 예시 3개가 결과를 바꾸는 이유.' },
      11: { title: 'AI compute / capex 자료',                             note: 'scale·data·compute의 균형 감각.' },
      12: { title: 'LLaMA: Open and Efficient Foundation Models',         note: 'open model이 중요한 진짜 이유.' },
      13: { title: 'RETRO',                                               note: '모델 안 지식과 외부 검색의 차이.' },
      14: { title: 'Generative Agents',                                   note: '기억은 저장이 아니라 reflection과 planning까지 포함한다.' },
      15: { title: 'DeepSeek R1 / OpenAI o1 기술 자료',                   note: 'test-time compute가 만드는 reasoning model.' },
      16: { title: 'HELM / MMLU / SWE-bench Evaluation 자료',             note: 'benchmark는 무엇을 보여주고 무엇을 숨기는가.' },
    };
```

- [ ] **Step 2: Add STUDY_TIPS table**

Immediately after `WEEK_SUPPLEMENT`, insert:

```js
    // Day type별 공부 팁 (요일 기반 — 1:월 ~ 5:금, weekend)
    const STUDY_TIPS = {
      1:       '논문 전체를 이해하려 하지 마세요. Abstract와 Figure 1로 지도부터 잡으세요.',
      2:       'Method를 완벽히 이해하려 하지 말고, 기존 방식과 무엇이 달라졌는지만 보세요.',
      3:       '내 말로 5문장 요약이 안 되면 아직 이해한 게 아닙니다. 팀원에게 말하듯 써보세요.',
      4:       '지정 보강 자료는 새 내용을 외우는 게 아니라, 이번 주 논문이 지금 어디에 살아 있는지 확인하는 용도입니다.',
      5:       '팀 산출물은 정답지가 아닙니다. 다음 주에 다시 볼 공통 언어를 만드는 일입니다.',
      weekend: '회복도 학습입니다. 이번 주에 가장 인상 깊었던 한 줄만 다시 보세요.',
      warmup:  '시작 전 부담을 줄이세요. 처방전 한 장 인쇄해 보는 것만으로 충분합니다.',
      rest:    '내일 본 프로그램이 시작됩니다. Day 1 처방전을 미리 한 번 훑어두세요.',
      pre:     '시작 전입니다. 데모 점프 버튼으로 어떤 화면이 기다리는지 미리 봐도 좋습니다.',
      completed: '완주했습니다. 이제 새 AI 뉴스를 13편 지도 위에 직접 분류해보세요.',
    };
```

- [ ] **Step 3: Add NOTE_FIELDS schema**

Immediately after `STUDY_TIPS`, insert:

```js
    // Day type별 노트 필드 (id, label, placeholder, rows)
    const NOTE_FIELDS = {
      1: [
        { id: 'readSection',  label: '오늘 읽은 위치',         placeholder: '예: Abstract + §1 + Figure 1', rows: 2 },
        { id: 'hardPart',     label: '어려웠던 부분 1개',      placeholder: '한 문장으로',                   rows: 2 },
      ],
      2: [
        { id: 'keyConcepts',  label: '핵심 개념 3개',          placeholder: '1) ...\n2) ...\n3) ...',       rows: 4 },
        { id: 'stillUnclear', label: '아직 모르겠는 것 1개',   placeholder: '구체적으로',                   rows: 2 },
      ],
      3: [
        { id: 'fiveSentenceSummary', label: '5문장 요약', placeholder: '내 말로',                          rows: 5 },
        { id: 'terms',               label: '용어 5개',  placeholder: '용어 — 한 줄 설명',                 rows: 5 },
        { id: 'question',            label: '질문 1개',  placeholder: '다음 주에 확인할 질문',             rows: 2 },
      ],
      4: [
        { id: 'supplementPoint', label: '보강 자료에서 본 핵심 1개',           placeholder: '한 줄로',         rows: 2 },
        { id: 'connection',      label: 'Core paper와 연결되는 지점',          placeholder: '한 줄로',         rows: 2 },
        { id: 'todayMeaning',    label: '2026 AI 흐름에서의 의미',             placeholder: '한 줄로',         rows: 2 },
      ],
      5: [
        { id: 'teamPoint',          label: '팀 노트에 넣고 싶은 포인트',       placeholder: '핵심만',          rows: 3 },
        { id: 'nonExpertExplain',   label: '비전문가에게 설명하는 3문장',      placeholder: '쉽게',            rows: 4 },
        { id: 'nextWeekQuestion',   label: '다음 주로 넘길 질문',              placeholder: '한 줄로',         rows: 2 },
      ],
      weekend: [
        { id: 'weeklyReflection', label: '이번 주 한 줄 회고', placeholder: '느낀 점 한 줄',                   rows: 2 },
        { id: 'revisitConcept',   label: '다시 볼 개념 1개',   placeholder: '용어/개념 하나',                  rows: 2 },
      ],
      warmup: [
        { id: 'goalNote', label: '내 학습 목표', placeholder: '한 줄로', rows: 2 },
      ],
    };
```

- [ ] **Step 4: Verify no syntax errors**

Open `index.html` in a browser and check console. No errors expected.

---

### Task 4: Add note storage helpers and render functions

**Files:**
- Modify: `index.html` (script section, after `COMPLETION LEDGER` block)

- [ ] **Step 1: Add note storage helpers**

After the `getOverallCompletion()` function block, insert:

```js
    /* ============================================================
       PERSONAL STUDY NOTES — localStorage 기반
       ============================================================ */
    const NOTES_KEY = 'papergym:study-notes';

    function getAllNotes() {
      try { return JSON.parse(localStorage.getItem(NOTES_KEY) || '{}'); }
      catch { return {}; }
    }
    function saveAllNotes(notes) {
      localStorage.setItem(NOTES_KEY, JSON.stringify(notes));
    }
    function getNoteForDate(dateStr) {
      const all = getAllNotes();
      return all[dateStr] || null;
    }
    function saveNoteForDate(dateStr, payload) {
      const all = getAllNotes();
      all[dateStr] = { ...payload, updatedAt: new Date().toISOString() };
      saveAllNotes(all);
    }
    function clearNoteForDate(dateStr) {
      const all = getAllNotes();
      delete all[dateStr];
      saveAllNotes(all);
    }

    function getDayTypeKey(state) {
      if (state.phase === 'main') {
        return state.dayInWeek === 'weekend' ? 'weekend' : state.dayInWeek;
      }
      if (state.phase === 'warmup') return 'warmup';
      if (state.phase === 'rest-before') return 'rest';
      if (state.phase === 'pre') return 'pre';
      if (state.phase === 'completed') return 'completed';
      return 'weekend';
    }
```

- [ ] **Step 2: Add the three new render functions**

After the existing `renderPhaseProgress()` function, insert:

```js
    /* ============================================================
       DAILY STUDY DASHBOARD — Material / Tip / Note
       ============================================================ */
    function renderStudyMaterial() {
      const s = CURRENT_VIEW_STATE;
      const body = document.getElementById('study-material-body');
      const dayLabel = document.getElementById('study-material-day-label');
      if (!s) { body.innerHTML = ''; dayLabel.textContent = ''; return; }

      if (s.phase !== 'main') {
        dayLabel.textContent = s.phase === 'warmup' ? '웜업'
          : s.phase === 'rest-before' ? '본 프로그램 시작 전'
          : s.phase === 'completed' ? '완주'
          : '시작 전';
        body.innerHTML = `<div class="text-stone-600">${escapeHtml(
          s.phase === 'pre' ? '본 프로그램(6/1)부터 매일 자료가 표시됩니다.'
          : s.phase === 'warmup' ? '웜업 기간입니다. PaperGym 사용법과 자기 페이스를 맞추세요.'
          : s.phase === 'rest-before' ? '내일 Day 1 자료가 표시됩니다.'
          : '16주 프로그램이 끝났습니다. 새 AI 업데이트를 13편 지도 위에서 분류해보세요.'
        )}</div>`;
        return;
      }

      const meta = s.weekMeta || {};
      const paper = s.paperId && PAPER_CORPUS ? PAPER_CORPUS.core_papers?.find(p => p.id === s.paperId) : null;
      const sup = WEEK_SUPPLEMENT[s.weekNum] || null;
      const isDay4 = s.dayInWeek === 4;
      const isDay5 = s.dayInWeek === 5;
      const isWeekend = s.dayInWeek === 'weekend';

      dayLabel.textContent = `Week ${s.weekNum} · ${s.task?.label || ''} (${s.task?.dayName || ''})`;

      const coreTitle = paper?.short_title || meta.name || '논문 큐레이션 준비 중';
      const coreTrack = paper?.track || meta.track || '';
      const coreUrl = paper?.arxiv_abs || '';

      let supplementBlock = '';
      if (isDay4 && sup) {
        supplementBlock = `
          <div class="mt-3 p-3 rounded-lg bg-amber-50 border border-amber-300">
            <div class="text-xs uppercase tracking-wider text-amber-700 font-bold mb-1">오늘의 지정 보강 자료</div>
            <div class="font-bold text-stone-900">${escapeHtml(sup.title)}</div>
            <div class="text-xs text-stone-700 mt-1">${escapeHtml(sup.note)}</div>
          </div>`;
      }

      let dayGuidance = '';
      if (s.dayInWeek === 1)      dayGuidance = '오늘은 Abstract + Introduction + Figure 1만 보세요.';
      else if (s.dayInWeek === 2) dayGuidance = '오늘은 핵심 Section/Table을 보고 무엇이 달라졌는지에 집중하세요.';
      else if (s.dayInWeek === 3) dayGuidance = '오늘은 내 말로 5문장 요약 + 용어 5개 + 질문 1개를 만듭니다.';
      else if (isDay4)            dayGuidance = '오늘은 지정 보강 자료 1개를 읽고 이번 주 논문과 연결합니다.';
      else if (isDay5)            dayGuidance = '오늘은 4명의 노트를 모아 Team Synthesis 초안을 잡습니다.';
      else if (isWeekend)         dayGuidance = '오늘은 회복/복습입니다. 이번 주 가장 인상 깊었던 한 줄을 다시 보세요.';

      body.innerHTML = `
        <div class="flex items-start gap-3">
          <div class="text-3xl shrink-0">📄</div>
          <div class="flex-1 min-w-0">
            <div class="text-xs uppercase tracking-wider text-stone-500 font-bold">이번 주 핵심 논문</div>
            <div class="font-black text-lg text-stone-900 leading-snug">${escapeHtml(coreTitle)}</div>
            ${coreTrack ? `<div class="text-xs text-stone-500 mt-0.5">${escapeHtml(coreTrack)}</div>` : ''}
            ${coreUrl ? `<a href="${escapeHtml(coreUrl)}" target="_blank" rel="noopener" class="inline-block text-xs mt-2 underline text-stone-700 hover:text-stone-900">arXiv 페이지 →</a>` : ''}
          </div>
        </div>
        <div class="mt-3 text-sm text-stone-700">${escapeHtml(dayGuidance)}</div>
        ${supplementBlock}
      `;
    }

    function renderStudyTip() {
      const s = CURRENT_VIEW_STATE;
      const key = getDayTypeKey(s || {});
      const tip = STUDY_TIPS[key] || STUDY_TIPS.weekend;
      document.getElementById('study-tip-body').textContent = tip;
    }

    function renderDailyNote() {
      const s = CURRENT_VIEW_STATE;
      const date = CURRENT_VIEW_DATE;
      const body = document.getElementById('daily-note-body');
      const statusEl = document.getElementById('daily-note-status');
      if (!s || !date) { body.innerHTML = ''; statusEl.textContent = ''; return; }

      const key = getDayTypeKey(s);
      const fields = NOTE_FIELDS[key];
      if (!fields) {
        body.innerHTML = `<div class="text-sm text-stone-500">오늘은 노트 폼이 없습니다.</div>`;
        statusEl.textContent = '';
        return;
      }

      const saved = getNoteForDate(date);
      const savedFields = saved?.fields || {};

      body.innerHTML = fields.map(f => `
        <div>
          <label class="block text-xs font-bold text-stone-700 mb-1">${escapeHtml(f.label)}</label>
          <textarea
            data-note-field="${escapeHtml(f.id)}"
            rows="${f.rows}"
            placeholder="${escapeHtml(f.placeholder)}"
            class="w-full text-sm border border-stone-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-amber-500 resize-y"
          >${escapeHtml(savedFields[f.id] || '')}</textarea>
        </div>
      `).join('');

      if (saved?.updatedAt) {
        const when = new Date(saved.updatedAt).toLocaleString('ko-KR', { hour: '2-digit', minute: '2-digit', month: '2-digit', day: '2-digit' });
        statusEl.textContent = `최근 저장: ${when}`;
      } else {
        statusEl.textContent = '저장 전';
      }
    }

    function collectNoteFields() {
      const out = {};
      document.querySelectorAll('#daily-note-body [data-note-field]').forEach(el => {
        out[el.dataset.noteField] = el.value.trim();
      });
      return out;
    }

    function handleNoteSave() {
      const s = CURRENT_VIEW_STATE;
      const date = CURRENT_VIEW_DATE;
      if (!s || !date) { toast('오늘 정보를 불러올 수 없습니다.'); return; }
      const key = getDayTypeKey(s);
      const fields = collectNoteFields();
      saveNoteForDate(date, {
        date,
        dayTypeKey: key,
        weekNum: s.weekNum || null,
        paperId: s.paperId || null,
        fields,
      });
      toast('💾 노트 저장 완료');
      renderDailyNote();
    }

    function handleNoteClear() {
      const date = CURRENT_VIEW_DATE;
      if (!date) return;
      if (!confirm(`${date} 노트를 초기화할까요?`)) return;
      clearNoteForDate(date);
      toast('🗑️ 노트 초기화');
      renderDailyNote();
    }
```

- [ ] **Step 3: Hook into `refreshAll`**

Find the existing `refreshAll()` function (around line 942). Add three new render calls at the end of its body:

Replace the body of `refreshAll` with:

```js
    function refreshAll() {
      const today = getEffectiveToday();
      CURRENT_VIEW_DATE = CURRENT_VIEW_DATE || today;
      CURRENT_VIEW_STATE = getProgramStateForDate(CURRENT_VIEW_DATE);
      state.currentWeek = CURRENT_VIEW_STATE.weekNum || state.currentWeek;
      renderTodayHero();
      renderWeekSlots();
      renderStreakWidgets();
      renderPhaseProgress();
      renderStudyMaterial();
      renderStudyTip();
      renderDailyNote();
    }
```

- [ ] **Step 4: Wire the save/clear buttons in `init()`**

Find the existing `init()` function (around line 1646). Inside `init`, add these two listeners alongside the other event wiring (e.g., near `today-complete-btn`):

```js
      document.getElementById('daily-note-save').addEventListener('click', handleNoteSave);
      document.getElementById('daily-note-clear').addEventListener('click', handleNoteClear);
```

- [ ] **Step 5: Reload the browser and verify**

Open `index.html`, ensure:
- Today's material card appears with the current week's core paper
- Tip card shows day-appropriate copy
- Note form shows the correct fields based on the day type
- Saving a note shows toast and updates "최근 저장" status

---

### Task 5: Demote the chat / prescription primary UI under an advanced section

**Files:**
- Modify: `index.html` (around the existing `#chat`, `#typing`, `#mermaid-section`, `#blog-section`, and the bottom input)

- [ ] **Step 1: Wrap chat/result/input in a single collapsed advanced block**

Find the block that includes `<!-- Chat -->` through the sticky input form (`<section class="sticky bottom-4 ...">`). Wrap the entire block in a `<details>`:

Insert before `<!-- Chat -->`:

```html
    <!-- Advanced Claude Mentor Mode -->
    <details id="advanced-mentor" class="mb-6 bg-white border-2 border-stone-300 rounded-xl p-4">
      <summary class="cursor-pointer font-bold text-stone-800 text-sm flex items-center gap-2">
        <span>🤖 고급 기능: Claude 멘토에게 채점받기</span>
        <span class="text-xs bg-stone-200 text-stone-600 px-2 py-0.5 rounded-full font-normal">옵션 · Claude API 필요</span>
      </summary>
      <div class="mt-4">
```

Insert after the closing tag of the sticky input `<section>`:

```html
      </div>
    </details>
```

(Keep the `#timer-section` outside this block — it should still appear when active.)

- [ ] **Step 2: Verify advanced section toggles correctly**

Reload the page. The chat input and message area should now live inside a collapsed `<details>` labeled "고급 기능: Claude 멘토에게 채점받기". Opening it should still render the chat UI as before.

---

### Task 6: Final verification

**Files:**
- None modified.

- [ ] **Step 1: Run static content checks**

Run from project root:

```bash
python3 - <<'PY'
from pathlib import Path
s = Path('/Users/kyongeunlee/HQ/ai-study/hackathon-mentor/index.html').read_text()
checks = [
    'id="study-material-section"',
    'id="study-tip-section"',
    'id="daily-note-section"',
    'const WEEK_SUPPLEMENT',
    'const STUDY_TIPS',
    'const NOTE_FIELDS',
    'papergym:study-notes',
    'renderStudyMaterial',
    'renderStudyTip',
    'renderDailyNote',
    '고급 기능: Claude 멘토에게 채점받기',
]
for needle in checks:
    assert needle in s, needle
assert s.count('<section') >= 5
print('PASS dashboard checks')
PY
```

Expected: `PASS dashboard checks`

- [ ] **Step 2: Manual browser sanity check**

Run:

```bash
cd /Users/kyongeunlee/HQ/ai-study/hackathon-mentor && python3 -m http.server 8080
```

Open `http://localhost:8080/index.html`. Verify with the demo jump buttons:

- `웜업 첫날` → 자료 카드: "웜업 기간", 노트 폼: warmup 단일 필드
- `본 프로그램 Day 1` → 자료 카드: Week 1 Chain-of-Thought, 노트 폼: read/hardPart
- `Day 3` → 노트 폼: 5문장/용어/질문
- `Phase 3 시작` → Week 11 Scaling Laws 노출

Save a test note on the `Day 3` jump and reload to verify persistence.

- [ ] **Step 3: Commit**

```bash
cd /Users/kyongeunlee/HQ/ai-study/hackathon-mentor
git add index.html docs/superpowers/specs/2026-05-27-daily-study-dashboard-design.md docs/superpowers/plans/2026-05-27-daily-study-dashboard.md
git commit -m "$(cat <<'EOF'
Add daily study dashboard UX with personal note tracking

기존 대화형 4-stage 흐름을 매일 공부 자료·팁·노트를 보여주는 대시보드 UX로 전환합니다. Day별 study material/tip/note 필드를 추가하고, 개인 노트는 localStorage에 ISO 날짜 기준으로 저장합니다. 기존 prescription/chat 기능은 고급 모드 details로 보존합니다.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Self-Review

**Spec coverage:**
- Today Study Dashboard hero retained from existing `#hero` — Task 1 demotes the 4-stage bar.
- Study Material/Tip/Note sections — Tasks 2, 3, 4.
- Personal Learning Record continues via existing streak/weekly/overall widgets in `#hero`.
- Day-type-aware data and form schemas — Task 3.
- localStorage notes under `papergym:study-notes` — Task 4 step 1.
- Advanced AI mentor section — Task 5.
- No Supabase schema changes — confirmed in "Do not modify".

**Placeholder scan:**
- All copy strings are explicit; no TBD/TODO; no "implement later".

**Type consistency:**
- `NOTE_FIELDS` keys (`1,2,3,4,5,weekend,warmup`) match the values returned by `getDayTypeKey()` for those phases.
- `WEEK_SUPPLEMENT[s.weekNum]` only used inside `if (s.phase === 'main')` so undefined weeks are guarded.
- Storage key `papergym:study-notes` is unique vs existing `papergym:completion`, `papergym:demo-date`, `papergym:apikey`, `papergym:group`, `papergym:log`.

---

## Execution Handoff

Plan saved to `docs/superpowers/plans/2026-05-27-daily-study-dashboard.md`. Inline execution is the right choice here — the steps are tightly coupled edits to one file and need fast iteration.
