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

-- 4. answer 칼럼 추가 (질문 탭 답변 공유 — spec §11 변경, 본인 완료 후 동료에게 노출)
ALTER TABLE papergym_progress
  ADD COLUMN IF NOT EXISTS answer text;
