DO $$
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_database WHERE datname = 'usersdb'
    )
    THEN
        CREATE DATABASE usersdb;
    END IF;
END
$$;