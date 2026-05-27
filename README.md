# PaperGym 🏋️ — AI 논문 16주 스터디 보조 사이트

비개발자 입문 4명을 위한 AI 논문 학습 도구. 매일 평일 30~60분, 16주 동안 13편 본 논문 + 옵션 16편 보충을 완주한다.

## 핵심 기능

- **#today 5탭 학습 카드** — 한국어 풀번역 / 핵심 figure / 신규 용어 / 일상 비유 / 가이드 질문. 모든 탭 방문해야 "오늘 완료" 활성.
- **#papers** — 16주 학습 지도 (4 Phase 색상별) + 보충 16편 옵션 reading list.
- **#team** — 4명 가로 행 + 이모지 4종 응원 (🔥💪👏❤️) + 일요일 자동 요약 카드.
- **사전 큐레이션** — AI 런타임 호출 없음, 콘텐츠는 `data/papers/*.json`에 박힘.
- **4명만 보는 사이트** — URL 공유로 join, 그룹 코드 없음.

## 시작하기

URL: https://papergym.vercel.app
첫 진입 → 이름 + 이모지 등록 → 매일 #today 카드.

## 기술 스택

- 단일 `index.html` + Tailwind CDN + vanilla JS, build step 없음
- 콘텐츠: `data/*.json` (curriculum, papers, glossary, supplementals)
- 멀티유저: Supabase (3 테이블, anon RLS)
- 호스팅: Vercel 정적

## 설계 문서

- `docs/superpowers/specs/2026-05-27-papergym-reboot-design.md` — 리부트 설계
- `docs/superpowers/plans/2026-05-27-papergym-reboot.md` — 구현 plan

---

## 📄 License

해커톤 평가 제출용. 상업적 사용 별도 협의.
