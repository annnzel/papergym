-- PaperGym Reboot Schema (DROP + CREATE) — v3
-- 2026-05-27 진단: v6 테이블이 (group_code, user_name, date) 기반인데
-- 리부트 spec §6.2는 (user_id uuid, week, day_index) 기반 → schema mismatch.
-- v6 데이터는 발표 데모용이라 손실 OK. 깨끗하게 재생성.
--
-- 4명만 쓰는 사이트 + URL 공유 = 비밀번호 패턴이므로 anon role에 RLS 모두 열어둠.

-- 1. v6 테이블 제거 (CASCADE로 모든 의존 제거)
DROP TABLE IF EXISTS papergym_cheers CASCADE;
DROP TABLE IF EXISTS papergym_progress CASCADE;
DROP TABLE IF EXISTS papergym_members CASCADE;

-- 2. members — 사용자 등록 (UUID PK, 이름·이모지)
CREATE TABLE papergym_members (
  user_id uuid PRIMARY KEY,
  name text NOT NULL,
  emoji text NOT NULL,
  joined_at timestamptz DEFAULT now()
);

-- 3. progress — 일일 완주 + 답변 (PK = user_id + week + day_index)
CREATE TABLE papergym_progress (
  user_id uuid NOT NULL,
  week int NOT NULL CHECK (week BETWEEN 1 AND 16),
  day_index int NOT NULL CHECK (day_index BETWEEN 1 AND 7),
  completed_at timestamptz DEFAULT now(),
  answer text,
  PRIMARY KEY (user_id, week, day_index)
);

-- 4. cheers — 이모지 응원 (4종: 🔥 💪 👏 ❤️)
CREATE TABLE papergym_cheers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  from_user uuid NOT NULL,
  to_user uuid NOT NULL,
  emoji text NOT NULL,
  week int NOT NULL,
  sent_at timestamptz DEFAULT now()
);

-- 5. RLS 활성화 + anon role 모든 작업 허용
ALTER TABLE papergym_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE papergym_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE papergym_cheers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_all_members" ON papergym_members FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all_progress" ON papergym_progress FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all_cheers" ON papergym_cheers FOR ALL TO anon USING (true) WITH CHECK (true);
