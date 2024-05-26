-- cleaning import data:

--0. Drop nametype column
ALTER TABLE "meteorites_temp"
DROP COLUMN "nametype";


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
