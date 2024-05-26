-- -- -- Demonstrates importing a CSV into an existing table and adding primary keys
-- sqlite3 meteorites.db 

-- -- -- Imports into a temporary using a CSV without primary keys
-- .import --csv --skip 1 meteorites.csv meteorites_temp

-- cat import.sql | sqlite3 meteorites.db

-- SELECT * FROM meteorites LIMIT 5;

