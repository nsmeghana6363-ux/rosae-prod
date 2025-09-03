-- PostgreSQL migration script for Render deployment
-- This creates the basic tables needed for the theatre management system

-- Create sessions table for connect-pg-simple
CREATE TABLE IF NOT EXISTS "session" (
  "sid" varchar NOT NULL COLLATE "default",
  "sess" json NOT NULL,
  "expire" timestamp(6) NOT NULL
);

ALTER TABLE "session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid");
CREATE INDEX "IDX_session_expire" ON "session" ("expire");

-- Users table
CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  first_name TEXT,
  last_name TEXT,
  profile_image_url TEXT,
  password_hash TEXT,
  role TEXT DEFAULT 'user',
  active INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
  id TEXT PRIMARY KEY,
  theatre_name TEXT NOT NULL,
  time_slot TEXT NOT NULL,
  guests INTEGER NOT NULL,
  customer_name TEXT NOT NULL,
  phone_number TEXT,
  age INTEGER,
  total_amount REAL NOT NULL DEFAULT 0,
  cash_amount REAL NOT NULL DEFAULT 0,
  upi_amount REAL NOT NULL DEFAULT 0,
  snacks_amount REAL NOT NULL DEFAULT 0,
  snacks_cash REAL NOT NULL DEFAULT 0,
  snacks_upi REAL NOT NULL DEFAULT 0,
  booking_date TEXT NOT NULL,
  is_eighteen_plus INTEGER NOT NULL DEFAULT 1,
  eighteen_plus_reason TEXT,
  eighteen_plus_description TEXT,
  visited INTEGER NOT NULL DEFAULT 1,
  visited_reason TEXT,
  visited_description TEXT,
  repeat_count INTEGER NOT NULL DEFAULT 0,
  refund_status TEXT DEFAULT 'none',
  refund_amount REAL NOT NULL DEFAULT 0,
  refund_reason TEXT,
  refunded_at TEXT,
  refund_requested_by TEXT,
  refund_approved_by TEXT,
  review_flag INTEGER NOT NULL DEFAULT 0,
  created_by TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Expenses table
CREATE TABLE IF NOT EXISTS expenses (
  id TEXT PRIMARY KEY,
  description TEXT NOT NULL,
  amount REAL NOT NULL,
  category TEXT NOT NULL,
  expense_date TEXT NOT NULL,
  creator_name TEXT,
  paid_cash REAL,
  paid_upi REAL,
  paid_via TEXT,
  created_by TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Daily income table
CREATE TABLE IF NOT EXISTS daily_income (
  id TEXT PRIMARY KEY,
  date TEXT NOT NULL,
  number_of_shows INTEGER NOT NULL,
  cash_received REAL NOT NULL DEFAULT 0,
  upi_received REAL NOT NULL DEFAULT 0,
  other_payments REAL NOT NULL DEFAULT 0,
  notes TEXT,
  adjusted_shows INTEGER,
  adjusted_revenue REAL,
  refund_total REAL,
  created_by TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Other necessary tables (simplified versions)
CREATE TABLE IF NOT EXISTS leave_applications (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  leave_type TEXT NOT NULL DEFAULT 'PTO',
  start_date TEXT NOT NULL,
  end_date TEXT NOT NULL,
  reason TEXT NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS notifications (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  title TEXT NOT NULL,
  body TEXT,
  type TEXT DEFAULT 'leave',
  is_read INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS configurations (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_by TEXT,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reviews (
  id TEXT PRIMARY KEY,
  booking_id TEXT NOT NULL,
  phone TEXT,
  name TEXT,
  token TEXT NOT NULL,
  status TEXT DEFAULT 'pending',
  requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  submitted_at TIMESTAMP,
  note TEXT
);

-- Insert default admin user
INSERT INTO users (id, email, first_name, last_name, role, active)
VALUES ('admin-001', 'admin@rosae.com', 'Admin', 'User', 'admin', 1)
ON CONFLICT (email) DO NOTHING;

-- Insert default configurations
INSERT INTO configurations (key, value) VALUES
('theatres', '["Theatre 1", "Theatre 2", "Theatre 3"]'),
('timeslots', '["10:00-13:00", "14:00-17:00", "18:00-21:00"]')
ON CONFLICT (key) DO NOTHING;