-- Attempt to connect to 'usersdb', if it doesn't exist, connect to the default 'postgres' database
\c usersdb ON_ERROR_STOP on
\c postgres

-- Check if the database exists and create it if it doesn't
SELECT 'CREATE DATABASE usersdb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'usersdb')\gexec

-- You need to reconnect to the new database to create the table
\c usersdb

-- Create the table if it doesn't exist
CREATE TABLE IF NOT EXISTS application_user (
   id UUID PRIMARY KEY,
   name VARCHAR(100),
   email VARCHAR(100),
   password VARCHAR(100),
   website VARCHAR(100)
);
