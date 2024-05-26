-- cleaning import data:

-- -- Deletes prior tables if they exist
DROP TABLE IF EXISTS "meteorites";
DROP TABLE IF EXISTS "meteorites_temp";

-- Creates a table to store imported data
CREATE TABLE "meteorites_temp"(
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" INTEGER,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" INTEGER,
  "long" INTEGER,
  primary key("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

--1.

-- Update empty values to NULL
UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

--2.

-- Round decimal values to the nearest hundredths place
UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2)
WHERE "mass" IS NOT NULL;

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2)
WHERE "lat" IS NOT NULL;

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2)
WHERE "long" IS NOT NULL;

--3.


-- Remove meteorites with nametype "Relict"
DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

ALTER TABLE "meteorites_temp" DROP COLUMN "nametype";



-- Create the final table
CREATE TABLE "meteorites" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "title" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" REAL,
  "long" REAL
);


-- Insert data from the temporary table into the final table, reordering columns, sorting, and updating IDs
INSERT INTO "meteorites" ("title", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year" DESC, "name" ASC;

-- Drop the temporary table
-- DROP TABLE "meteorites_temp";

-- SELECT * FROM meteorites LIMIT 5;
