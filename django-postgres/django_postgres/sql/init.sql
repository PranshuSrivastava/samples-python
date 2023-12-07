-- Check if the database exists and create it if it doesn't
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'usersdb') THEN
      CREATE DATABASE usersdb;
   END IF;
END
$$;

-- Connect to the new database and create the table if it doesn't exist
\c usersdb

DO $$
BEGIN
   -- Check if the table exists, create it if it doesn't
   IF NOT EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename  = 'application_user') THEN
      CREATE TABLE public.application_user (
         id UUID PRIMARY KEY,
         name VARCHAR(100),
         email VARCHAR(100),
         password VARCHAR(100),
         website VARCHAR(100)
      );
   END IF;
END
$$;
