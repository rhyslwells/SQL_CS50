-- -- Demonstrates importing a CSV into an existing table and adding primary keys
-- -- sqlite3 meteorites.db 

-- -- Deletes prior tables if they exist
-- DROP TABLE IF EXISTS "meteorites";
-- DROP TABLE IF EXISTS "meteorites_temp";

-- -- Creates a table to store imported data
-- CREATE TABLE "meteorites_temp" (
--     "name" TEXT,
--     "id" INTEGER PRIMARY KEY AUTOINCREMENT,
--     "nametype" TEXT,
--     "class" TEXT,
--     "mass" REAL,
--     "discovery" TEXT,
--     "year" INTEGER,
--     "lat" REAL,
--     "long" REAL
-- );

-- -- Imports into a temporary using a CSV without primary keys
-- .import --csv --skip 1 meteorites.csv meteorites_temp

-- cat import.sql | sqlite3 meteorites.db

-- SELECT * FROM meteorites LIMIT 5;