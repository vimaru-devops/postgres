-- 1. Tạo các role mặc định nếu chưa có
DO $$ BEGIN
  CREATE ROLE anon;
EXCEPTION WHEN duplicate_object THEN
  RAISE NOTICE 'Role anon already exists.';
END $$;

DO $$ BEGIN
  CREATE ROLE authenticated;
EXCEPTION WHEN duplicate_object THEN
  RAISE NOTICE 'Role authenticated already exists.';
END $$;

-- 2. Tạo bảng mẫu
CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY,
  email text NOT NULL UNIQUE,
  created_at timestamptz DEFAULT now()
);

-- 3. Cấp quyền cho REST API
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO anon, authenticated;

-- 4. Optional: Tạo policy cơ bản nếu đã bật RLS
-- (Chỉ dùng nếu bạn bật RLS trong Supabase Studio hoặc thủ công)
-- ALTER TABLE users ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Allow full access to all" ON users FOR ALL USING (true);
