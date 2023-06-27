-- CREATE INDEX ON users(username);
-- DROP INDEX users_username_idx1;

-- With Index: 0.04ms
-- Without Index: 0.7ms
-- EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';

-- users -> 800kb & index -> 180kb
-- SELECT pg_size_pretty(pg_relation_size('users'));
-- SELECT pg_size_pretty(pg_relation_size('users_username_idx'));

-- Get all current indexes in DB
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';