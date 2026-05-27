# Team AI Builder Curriculum v2 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Update PaperGym's curriculum page from a 13-paper curation guide into a team-ready 16-week AI builder curriculum for non-developer operators, with modern supplements and practical weekly outputs.

**Architecture:** Keep the static single-file architecture. Modify only `curriculum.html` content and small CSS utilities; do not change the main app workflow, Supabase, or paper corpus data in this pass. The page should still explain the original 13 core papers, but add a clear v2 operating layer: Week 0, weekly routine, modern supplements, generalized builder outputs, and final graduation criteria.

**Tech Stack:** Static HTML, Tailwind CDN, Pretendard, existing brutal-card visual style.

---

## File Structure

**Modify:**
- `curriculum.html` — primary page content. Add team/non-developer positioning, Week 0, weekly operating routine, v2 week-by-week details, review outputs, and revised optional reading framing.
- `README.md` — small link/positioning update so the project description mentions the curriculum guide and team AI-builder use case.
- `CLAUDE.md` — update current-version note to record that curriculum.html is now v2 team/generalized rather than Ann-personal.

**Do not modify:**
- `index.html` — no app logic changes in this plan.
- `handoff/*.json` — no corpus schema changes in this plan.
- Supabase configuration — no data/backend changes.

---

### Task 1: Reposition curriculum page hero and criteria

**Files:**
- Modify: `curriculum.html:6-84`

- [ ] **Step 1: Update title and meta description**

Replace:

```html
<title>PaperGym 🏋️ — 13편 큐레이션 가이드</title>
<meta name="description" content="왜 이 13편인가 — Classic 정전 기준 + 4 Phase 학습 흐름 + 논문 간 연결" />
```

With:

```html
<title>PaperGym 🏋️ — 16주 AI 빌더 커리큘럼</title>
<meta name="description" content="비개발자 AI 빌더와 팀 스터디를 위한 16주 커리큘럼 — 13편 정전, 최신 보강 자료, 주간 산출물" />
```

- [ ] **Step 2: Update header subtitle**

Replace:

```html
<div class="text-xs text-stone-500 -mt-0.5">13편 큐레이션 가이드 · Why these 13 papers</div>
```

With:

```html
<div class="text-xs text-stone-500 -mt-0.5">16주 AI 빌더 커리큘럼 · Team Study Guide</div>
```

- [ ] **Step 3: Replace hero copy**

Replace the hero label, headline, paragraph, and date badge at `curriculum.html:44-58` with:

```html
<div class="text-xs uppercase tracking-widest text-amber-700 font-black mb-3">TEAM CURRICULUM</div>
<h1 class="text-4xl md:text-6xl font-black leading-tight mb-4">
  16주 후, AI 뉴스를 <span class="text-amber-600">분류하는 팀</span>
</h1>
<p class="text-lg text-stone-700 leading-relaxed max-w-3xl">
  PaperGym v2는 연구자 양성 과정이 아닙니다. 비개발자 AI 빌더, 마케터, 기획자, 오퍼레이터가
  13편 정전(canon)을 기준점으로 삼고, 매주 최신 AI 업데이트를 그 위에 연결해
  업무·콘텐츠·제안서·에이전트 설계 언어로 번역하는 16주 팀 스터디입니다.
</p>
<div class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-3 max-w-4xl">
  <div class="bg-stone-900 text-amber-300 rounded-lg px-5 py-3">
    <div class="text-xs uppercase tracking-widest font-bold">일정</div>
    <div class="font-black">2026-06-01 → 2026-09-20 · 16주</div>
  </div>
  <div class="bg-white border-2 border-stone-900 rounded-lg px-5 py-3">
    <div class="text-xs uppercase tracking-widest font-bold text-stone-500">대상</div>
    <div class="font-black">AI 빌더 · 비개발자 · 팀 스터디</div>
  </div>
  <div class="bg-white border-2 border-stone-900 rounded-lg px-5 py-3">
    <div class="text-xs uppercase tracking-widest font-bold text-stone-500">성과</div>
    <div class="font-black">논문 지도 + 최신 뉴스 분류력</div>
  </div>
</div>
```

- [ ] **Step 4: Update selection criteria fourth card**

Replace the fourth card text at `curriculum.html:83-84` with:

```html
<div class="font-black text-lg mb-2">4. 비개발자 AI 빌더 관점</div>
<p class="text-sm text-stone-700 leading-relaxed">연구자 양성 X. 수식 완전 정복보다 *업무 판단력*이 목표. 각 논문은 제안서, 콘텐츠, 리서치, 자동화, 에이전트 설계에 연결된다.</p>
```

- [ ] **Step 5: Run a quick browser-free sanity check**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
p = Path('curriculum.html')
s = p.read_text()
assert '16주 AI 빌더 커리큘럼' in s
assert '비개발자 AI 빌더 관점' in s
assert 'Ann 업무' not in s
print('PASS hero/criteria text')
PY
```

Expected: `PASS hero/criteria text`

---

### Task 2: Add Week 0 and weekly operating routine sections

**Files:**
- Modify: `curriculum.html` after the current Learning Flow section ending around `</section>` at line 163.

- [ ] **Step 1: Insert Week 0 section**

Insert this block immediately after the Learning Flow section:

```html
<!-- Week 0 Bootcamp -->
<section>
  <div class="text-xs uppercase tracking-widest text-stone-500 font-black mb-3">WEEK 0</div>
  <h2 class="text-3xl md:text-4xl font-black mb-6">🧭 시작 전 1시간: LLM 최소 기초</h2>
  <div class="bg-white border-2 border-stone-900 rounded-xl p-6 shadow-brut space-y-5">
    <p class="text-base text-stone-700 leading-relaxed">
      CoT, ReAct, RLHF를 바로 읽기 전에 팀 전체가 같은 언어를 가져야 합니다. Week 0은 깊은 수학이 아니라
      논문을 읽을 때 길을 잃지 않기 위한 최소 개념 부트캠프입니다.
    </p>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div class="border-2 border-stone-200 rounded-lg p-4 bg-stone-50">
        <div class="font-black mb-2">알아야 할 10개 단어</div>
        <ul class="text-sm text-stone-700 space-y-1 list-disc pl-5">
          <li>Token — 모델이 읽는 텍스트 조각</li>
          <li>Embedding — 토큰을 숫자 공간에 놓는 방식</li>
          <li>Attention — 토큰 사이 관계를 계산하는 구조</li>
          <li>Transformer — 현대 LLM의 기본 뼈대</li>
          <li>Pretraining — 다음 토큰 예측을 배우는 단계</li>
          <li>Post-training — assistant처럼 행동하게 다듬는 단계</li>
          <li>RLHF — 사람 선호를 반영하는 훈련</li>
          <li>Context window — 모델이 한 번에 보는 작업 공간</li>
          <li>Inference — 학습된 모델이 답을 생성하는 과정</li>
          <li>Benchmark — 성능 시험. 실무 성능과 다를 수 있음</li>
        </ul>
      </div>
      <div class="border-2 border-amber-300 rounded-lg p-4 bg-amber-50">
        <div class="font-black mb-2">통과 질문</div>
        <ol class="text-sm text-stone-700 space-y-1 list-decimal pl-5">
          <li>LLM은 검색엔진인가, 예측기인가?</li>
          <li>Pretraining과 post-training은 무엇이 다른가?</li>
          <li>Context window와 memory는 무엇이 다른가?</li>
          <li>AI agent는 왜 도구를 호출하는가?</li>
          <li>Benchmark 점수가 높으면 실무에서도 무조건 좋은가?</li>
        </ol>
      </div>
    </div>
  </div>
</section>
```

- [ ] **Step 2: Insert weekly routine section after Week 0**

Insert this block immediately after the Week 0 section:

```html
<!-- Weekly Routine -->
<section>
  <div class="text-xs uppercase tracking-widest text-stone-500 font-black mb-3">WEEKLY OPERATING SYSTEM</div>
  <h2 class="text-3xl md:text-4xl font-black mb-6">⏱️ 매주 5시간 운영법</h2>
  <div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
    <div class="bg-white border-2 border-stone-900 rounded-xl p-6 shadow-brut">
      <div class="font-black text-xl mb-3">표준 루틴</div>
      <div class="space-y-2 text-sm">
        <div class="flex gap-3"><span class="font-black w-16">Day 1</span><span>Core paper Abstract + Introduction + Figure 1</span></div>
        <div class="flex gap-3"><span class="font-black w-16">Day 2</span><span>핵심 Section / Table / Method 일부 읽기</span></div>
        <div class="flex gap-3"><span class="font-black w-16">Day 3</span><span>내 말로 5문장 요약 + 용어 5개 정리</span></div>
        <div class="flex gap-3"><span class="font-black w-16">Day 4</span><span>최신 자료 1개를 이번 논문 계보에 연결</span></div>
        <div class="flex gap-3"><span class="font-black w-16">Day 5</span><span>팀 공유용 산출물 1개 작성</span></div>
      </div>
    </div>
    <div class="bg-stone-900 text-stone-50 rounded-xl p-6 shadow-brut">
      <div class="font-black text-xl mb-3 text-amber-300">바쁜 주 방어선</div>
      <div class="space-y-2 text-sm text-stone-200">
        <div><strong class="text-white">3시간:</strong> 논문 90분 + 최신 자료 45분 + 산출물 45분</div>
        <div><strong class="text-white">2시간:</strong> Abstract/Intro/Figure + 적용 카드</div>
        <div><strong class="text-white">1시간:</strong> 최신 뉴스 1개를 논문 계보에 분류</div>
        <div><strong class="text-white">30분:</strong> 이번 주 핵심 질문 3개만 답하기</div>
      </div>
      <p class="text-xs text-stone-400 mt-4">완벽한 완주보다 중요한 것은 끊기지 않는 분류 습관입니다.</p>
    </div>
  </div>
</section>
```

- [ ] **Step 3: Run text checks**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
s = Path('curriculum.html').read_text()
for needle in ['WEEK 0', 'LLM 최소 기초', 'WEEKLY OPERATING SYSTEM', '매주 5시간 운영법']:
    assert needle in s, needle
print('PASS week0/routine sections')
PY
```

Expected: `PASS week0/routine sections`

---

### Task 3: Expand each paper card with team-builder outputs and modern supplements

**Files:**
- Modify: `curriculum.html:170-336`

- [ ] **Step 1: For every paper card, add two paragraphs before the connection paragraph**

Use this exact pattern inside each week card, after the `왜 정전` paragraph and before `다음과 연결`:

```html
<p class="text-sm text-stone-700 mb-2"><strong>최신 보강:</strong> [modern supplement text]</p>
<p class="text-sm text-stone-700 mb-2"><strong>팀 산출물:</strong> [general team-builder output]</p>
```

- [ ] **Step 2: Apply these week-specific supplement/output pairs**

Use the following exact text values:

| Week | 최신 보강 | 팀 산출물 |
|---|---|---|
| W1 CoT | Self-Consistency, o1/R1, test-time compute를 함께 본다. | 복잡한 업무를 단계별 사고 구조로 쪼개는 CoT 프롬프트 카드. |
| W2 ReAct | Claude Code, Cursor, Devin 같은 coding agent 사례와 연결한다. | Thought → Action → Observation 업무 루프 카드. |
| W3 Toolformer | Function calling, MCP, computer use, tool router 개념과 연결한다. | 도구 사용 기준표: 언제 검색·계산·파일·문서 도구가 필요한가. |
| W5 InstructGPT | 최신 모델 release note를 post-training 관점에서 읽는다. | Base model과 assistant model 차이를 설명하는 1페이지 카드. |
| W6 Constitutional AI | 기업 AI policy, brand safety, refusal behavior와 연결한다. | 팀용 AI 사용 원칙 constitution 초안. |
| W7 Reflexion | Agent verification, self-correction, eval loop와 연결한다. | 실패 후 개선 메모 템플릿: 무엇을 시도했고 무엇을 배웠나. |
| W9 Attention | Transformer visual guide와 최신 architecture 요약을 함께 본다. | Attention을 비전문가에게 설명하는 3문장 비유. |
| W10 GPT-3 | In-context learning과 prompt example design을 함께 본다. | 좋은 예시 3개로 결과 품질을 끌어올리는 few-shot 템플릿. |
| W11 Scaling Laws | AI capex, compute race, frontier lab 발표를 함께 읽는다. | 모델 발표 읽기 체크리스트: scale, data, compute, benchmark, cost. |
| W12 Chinchilla | LLaMA, Mistral, Qwen, DeepSeek 등 open model 흐름과 연결한다. | 용도별 모델 선택 기준표: 성능, 비용, 보안, 속도, 맥락 길이. |
| W13 RAG | Enterprise RAG, Perplexity, Notion AI, Copilot류 사례와 연결한다. | RAG가 필요한 업무와 단순 prompting으로 충분한 업무를 구분하는 표. |
| W14 MemGPT | Letta, Zep, Graphiti, Claude Memory, context engineering과 연결한다. | 팀 지식 저장소 구조도: session, docs, memory, archive의 차이. |
| W15 Tree of Thoughts | o1/R1, self-consistency, test-time compute와 연결한다. | 중요한 의사결정을 여러 경로로 탐색하는 decision prompt template. |
| W16 Final Synthesis | 최근 1개월 AI 뉴스 5개를 직접 분류한다. | AI Paper Lineage Map + 팀별 업무 적용 지도 + graduation note. |

- [ ] **Step 3: Add explicit review cards for W4 and W8**

After the W3 card and before the Phase 1 closing `</div>`, insert:

```html
<div class="ph1 border-2 rounded-xl p-5 border-dashed">
  <div class="flex items-baseline gap-3 mb-2 flex-wrap">
    <span class="text-2xl font-black">W4</span>
    <h4 class="text-xl font-black">Phase 1 Review · Agent Loop Map</h4>
    <span class="text-xs text-stone-600">CoT · ReAct · Toolformer 통합</span>
  </div>
  <p class="text-sm text-stone-700 mb-2"><strong>활동:</strong> 세 논문을 비교해 AI agent가 왜 생각하고, 행동하고, 관찰하는지 한 장으로 정리한다.</p>
  <p class="text-sm text-stone-700 mb-2"><strong>팀 산출물:</strong> Workflow로 충분한 일과 agent가 필요한 일을 구분하는 체크리스트.</p>
  <p class="text-sm text-stone-600 italic"><strong>성공 기준:</strong> Claude Code 같은 도구를 단순 챗봇이 아니라 agentic workflow로 설명할 수 있다.</p>
</div>
```

After the W7 card and before the Phase 2 closing `</div>`, insert:

```html
<div class="ph2 border-2 rounded-xl p-5 border-dashed">
  <div class="flex items-baseline gap-3 mb-2 flex-wrap">
    <span class="text-2xl font-black">W8</span>
    <h4 class="text-xl font-black">Phase 2 Review · Assistant Training Map</h4>
    <span class="text-xs text-stone-600">InstructGPT · CAI · Reflexion 통합</span>
  </div>
  <p class="text-sm text-stone-700 mb-2"><strong>활동:</strong> base model이 assistant가 되는 과정을 instruction tuning, feedback, principle, reflection으로 분해한다.</p>
  <p class="text-sm text-stone-700 mb-2"><strong>팀 산출물:</strong> 좋은 AI 답변을 평가하는 기준표: 유용성, 정확성, 안전성, 톤, 재시도 가능성.</p>
  <p class="text-sm text-stone-600 italic"><strong>성공 기준:</strong> AI의 친절함과 조심스러움이 성격이 아니라 post-training의 결과임을 설명할 수 있다.</p>
</div>
```

- [ ] **Step 4: Run section checks**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
s = Path('curriculum.html').read_text()
assert s.count('<strong>최신 보강:</strong>') >= 14
assert s.count('<strong>팀 산출물:</strong>') >= 16
for needle in ['W4', 'Agent Loop Map', 'W8', 'Assistant Training Map', 'AI Paper Lineage Map']:
    assert needle in s, needle
print('PASS weekly card expansion')
PY
```

Expected: `PASS weekly card expansion`

---

### Task 4: Replace optional reading with v2 supplement map

**Files:**
- Modify: `curriculum.html:339-382`

- [ ] **Step 1: Replace optional reading heading and intro**

Replace:

```html
<div class="text-xs uppercase tracking-widest text-stone-500 font-black mb-3">OPTIONAL READING</div>
<h2 class="text-3xl md:text-4xl font-black mb-6">📖 옵션 reading list</h2>
<p class="text-base text-stone-700 mb-6">13편 완주 후 깊이 원하면 — *AI 교과서 정전 후보*들. Review week에 참조 자료로 등장.</p>
```

With:

```html
<div class="text-xs uppercase tracking-widest text-stone-500 font-black mb-3">MODERN SUPPLEMENTS</div>
<h2 class="text-3xl md:text-4xl font-black mb-6">📖 2026 보강 자료 지도</h2>
<p class="text-base text-stone-700 mb-6">13편은 뼈대입니다. 최신성은 아래 보강 자료를 매주 하나씩 붙여 확보합니다. 전부 깊게 읽는 것이 아니라, “어느 정전 위에 꽂히는가”를 분류하는 용도입니다.</p>
```

- [ ] **Step 2: Add Evaluation card to the supplement grid**

Before the closing `</div>` of the supplement grid, add:

```html
<div class="bg-white border-2 border-stone-300 rounded-xl p-5">
  <div class="text-3xl mb-2">📏</div>
  <div class="font-black text-lg mb-1">Evaluation (MMLU · SWE-bench · Arena)</div>
  <div class="text-xs text-stone-500 mb-2">Benchmark literacy</div>
  <p class="text-sm text-stone-700">모델 발표 숫자를 그대로 믿지 않고, 무엇을 측정했고 무엇을 놓쳤는지 읽는 훈련.</p>
</div>
```

- [ ] **Step 3: Add a weekly artifact template section before CTA**

Insert before the CTA section:

```html
<!-- Weekly Artifact Template -->
<section>
  <div class="text-xs uppercase tracking-widest text-stone-500 font-black mb-3">TEAM OUTPUT TEMPLATE</div>
  <h2 class="text-3xl md:text-4xl font-black mb-6">🧾 매주 남기는 1장</h2>
  <div class="bg-white border-2 border-stone-900 rounded-xl p-6 shadow-brut">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-stone-700">
      <div>
        <div class="font-black text-stone-900 mb-2">1. 한 줄 요약</div>
        <p>이 논문은 AI 제품/모델/업무 방식에서 무엇을 바꿨나?</p>
      </div>
      <div>
        <div class="font-black text-stone-900 mb-2">2. 핵심 개념 3개</div>
        <p>팀원이 같은 언어로 말하기 위해 꼭 알아야 할 용어.</p>
      </div>
      <div>
        <div class="font-black text-stone-900 mb-2">3. 최신 자료 연결</div>
        <p>이번 주 AI 뉴스나 모델 발표가 어느 논문 계보 위에 있는가?</p>
      </div>
      <div>
        <div class="font-black text-stone-900 mb-2">4. 빌더 적용</div>
        <p>리서치, 제안서, 콘텐츠, 자동화, 에이전트 설계 중 어디에 쓸 수 있는가?</p>
      </div>
      <div>
        <div class="font-black text-stone-900 mb-2">5. 비전문가 설명</div>
        <p>클라이언트나 동료에게 설명한다면 어떤 3문장으로 말할 것인가?</p>
      </div>
      <div>
        <div class="font-black text-stone-900 mb-2">6. 아직 모르는 것</div>
        <p>다음 주에 확인할 질문 1~3개.</p>
      </div>
    </div>
  </div>
</section>
```

- [ ] **Step 4: Update CTA copy**

Replace CTA paragraph at `curriculum.html:390-393` with:

```html
16주 후, 팀은 AI 뉴스를 더 이상 소음으로 보지 않습니다.
13편 정전 지도 위에 최신 업데이트를 꽂고, 업무에 쓸 것·지켜볼 것·무시할 것을 나눌 수 있게 됩니다.
```

- [ ] **Step 5: Run content checks**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
s = Path('curriculum.html').read_text()
for needle in ['MODERN SUPPLEMENTS', 'Evaluation (MMLU · SWE-bench · Arena)', 'TEAM OUTPUT TEMPLATE', '매주 남기는 1장']:
    assert needle in s, needle
print('PASS supplements/template')
PY
```

Expected: `PASS supplements/template`

---

### Task 5: Update project docs and run final static checks

**Files:**
- Modify: `README.md:23-26`
- Modify: `CLAUDE.md:7-31`

- [ ] **Step 1: Update README one-line definition**

Replace `README.md:23-26` with:

```md
## 🎯 한 줄 정의

매일 60분 · 16주 · 13편 정전 + 최신 보강 자료 + 팀 산출물.
**비개발자 AI 빌더들이 AI 뉴스를 논문 계보 위에 분류하고 업무 언어로 번역하게 만듭니다.**
```

- [ ] **Step 2: Add curriculum guide link to README live links**

Replace the Live Links table at `README.md:16-20` with:

```md
| | URL |
|---|---|
| **앱** | https://papergym.vercel.app |
| **커리큘럼 가이드** | https://papergym.vercel.app/curriculum.html |
| **발표 덱** | https://papergym.vercel.app/deck.html |
```

- [ ] **Step 3: Update CLAUDE current version paragraph**

In `CLAUDE.md`, replace:

```md
**16주 · 13편 Core · 4 Phase · Classic 정전 only**
```

With:

```md
**16주 · 13편 Core · 4 Phase · Team AI Builder Curriculum v2**
```

Then add this bullet under the 13편 mapping block:

```md
- `curriculum.html`은 Ann 개인 적용이 아니라 회사 동료와 함께 쓰는 비개발자 AI 빌더/오퍼레이터용 설명으로 일반화됨
```

- [ ] **Step 4: Run final text checks**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
curr = Path('curriculum.html').read_text()
readme = Path('README.md').read_text()
claude = Path('CLAUDE.md').read_text()
assert 'Ann 업무' not in curr
assert 'AI 빌더 · 비개발자 · 팀 스터디' in curr
assert 'https://papergym.vercel.app/curriculum.html' in readme
assert 'Team AI Builder Curriculum v2' in claude
print('PASS final text checks')
PY
```

Expected: `PASS final text checks`

- [ ] **Step 5: Run git diff review**

Run:

```bash
git diff -- curriculum.html README.md CLAUDE.md
```

Expected: diff only touches copy/content sections described above; no Supabase keys, app logic, or paper corpus data changed.

- [ ] **Step 6: Optional local preview**

Run:

```bash
python3 -m http.server 8080
```

Open `http://localhost:8080/curriculum.html` and verify:
- Hero says team curriculum.
- Week 0 appears before 13-paper guide.
- Each week card shows latest supplement and team output.
- Weekly artifact template appears before CTA.

Stop the server with `Ctrl+C` after preview.

---

## Self-Review

**Spec coverage:**
- Generalize personal Ann-specific application: Task 1, Task 3, Task 5.
- Add detailed B안 curriculum content to the site: Task 2, Task 3, Task 4.
- Keep static single-file architecture and avoid backend/app scope creep: File Structure and Task 5 checks.

**Placeholder scan:**
- No TBD/TODO/placeholders. Week-specific supplement/output copy is fully specified.

**Type/content consistency:**
- HTML uses existing Tailwind/brutal card classes.
- No JS function names or data schema changes introduced.

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-05-26-team-ai-builder-curriculum-v2.md`. Two execution options:

1. **Subagent-Driven (recommended)** - dispatch a fresh subagent per task, review between tasks, fast iteration
2. **Inline Execution** - execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
