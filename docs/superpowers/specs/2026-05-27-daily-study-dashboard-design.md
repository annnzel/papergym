# PaperGym Daily Study Dashboard Design

## Goal

Transform PaperGym's primary UX from a conversation-first AI mentor flow into a daily study dashboard where each participant can see today's study material, study tips, assignments, and their own learning progress.

## User

The primary user is a busy non-developer AI builder/operator participating in a 16-week team study. They need to know what to study today within a few seconds, complete a small daily task, and track their own learning process without needing to chat with an AI every time.

## Core UX shift

Current default:

> Talk to AI mentor → receive prescription → answer friction question → get grading/output.

New default:

> Open dashboard → see today's material/tip/assignment → write personal note → check completion → optionally use AI mentor.

The AI conversation flow remains available as an advanced optional section, but it is no longer the main path.

## Page structure

### 1. Header

Keep the existing PaperGym header, group widget, workout log, and BYOK controls. Replace the 4-stage progress bar with a 6-slot weekly routine indicator:

1. Day 1 — 자료 읽기
2. Day 2 — 핵심 이해
3. Day 3 — 개인 노트
4. Day 4 — 지정 보강 자료
5. Day 5 — Team Synthesis
6. Weekend — 회복

The active day should be visually highlighted.

### 2. Today Study Dashboard

The hero area becomes the primary dashboard card.

It shows:
- Current week/day
- Current paper title
- Current task
- Estimated duration
- Completion button
- Link to curriculum guide

The copy should make the site feel like a daily study cockpit, not a chat app.

### 3. Study Material Card

This card tells the user what to read today.

For Day 1-3:
- Core paper title
- Why this paper matters
- Suggested reading sections
- PDF/arXiv link if available
- Short instruction: “오늘은 여기만 읽으세요”

For Day 4:
- Designated supplement title
- Connection question
- Why it connects to this week's core paper

For Day 5:
- Weekly team artifact goal
- What the user should contribute to the synthesis

For Weekend:
- Review focus
- Recovery guidance

### 4. Study Tip Card

Show one practical tip based on day type:

- Day 1: Read the abstract/Figure first. Do not try to master the whole paper.
- Day 2: Focus on what changed compared to the previous method.
- Day 3: If you cannot summarize in five sentences, you do not understand it yet.
- Day 4: The supplement is not extra homework; it shows where the paper is alive today.
- Day 5: A team artifact is shared language, not a perfect answer.
- Weekend: Recovery is part of the system.

### 5. Personal Learning Record Panel

Show each participant their own progress:

- This week: completed slots out of 6
- Overall: completed days out of 112
- Current streak
- Day-by-day status for the current week
- Note status for today: not started / saved / updated

This is personal tracking. It does not expose note contents to the team.

### 6. Daily Note Form

A localStorage-backed form changes by day type.

Day 1 fields:
- Read section
- One difficult part

Day 2 fields:
- Three key concepts
- One thing still unclear

Day 3 fields:
- Five-sentence summary
- Five terms
- One question

Day 4 fields:
- Supplement key point
- Connection to core paper
- 2026 AI relevance

Day 5 fields:
- Point to contribute to team note
- Three-sentence non-expert explanation
- Question for next week

Weekend fields:
- One-line weekly reflection
- One concept to revisit

Saved notes are stored under `papergym:study-notes` keyed by ISO date.

### 7. Team Panel

Keep the existing Supabase member/progress leaderboard. This version does not share note text. Team visibility remains limited to completion and existing encouragement mechanics.

### 8. Advanced AI Mentor Section

Move the current chat/prescription/Claude grading flow into a collapsible section labeled:

> 고급 기능: Claude 멘토에게 채점받기

The existing prescription modal and Claude chat logic may remain, but they should no longer dominate the first screen.

## Data model

Use localStorage for personal notes:

```json
{
  "2026-06-03": {
    "week": 1,
    "dayIndex": 3,
    "paperId": "cot",
    "fields": {
      "fiveSentenceSummary": "...",
      "terms": "...",
      "question": "..."
    },
    "updatedAt": "2026-06-03T10:00:00.000Z"
  }
}
```

Completion tracking continues to use the existing localStorage/Supabase progress flow.

## Non-goals

This version does not implement:
- Supabase note sharing
- Team note aggregation
- AI-generated Team Synthesis
- Note search
- Markdown export
- Full refactor of `index.html`

## Success criteria

- A user can open the app and understand today’s study task within 5 seconds.
- A user can save a personal note for today without using Claude API.
- The app still supports completion tracking and the existing leaderboard.
- The advanced AI mentor flow is still reachable but visually secondary.
- No Supabase schema changes are required.

## Implementation notes

`index.html` is large. The implementation should avoid speculative refactors. Add focused helpers for:
- day type detection
- study material rendering
- study tip rendering
- note form rendering
- localStorage note save/load

Prefer replacing the visible layout first, then preserving existing functions needed by prescription/chat as advanced mode.
