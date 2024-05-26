

-- Demonstrates importing a CSV into an existing table and adding primary keys
-- Creates mfa.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "meteorites";
DROP TABLE IF EXISTS "meteorites_temp";

-- Imports into a temporary using a CSV without primary keys
.import --csv meteorites.csv meteorites_temp

-- Creates a table to store imported data
CREATE TABLE "meteorites_temp" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

