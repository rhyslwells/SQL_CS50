-- Create the temporary table
-- CREATE TABLE "meteorites_temp" (
--   "id" INTEGER PRIMARY KEY AUTOINCREMENT,
--   "name" TEXT,
--   "class" TEXT,
--   "mass" REAL,
--   "discovery" TEXT,
--   "year" INTEGER,
--   "lat" REAL,
--   "long" REAL
-- );

-- Import the data from meteorites.csv into the temporary table
-- This command should be run in the SQLite shell, not included in the SQL script
-- .import --csv meteorites.csv meteorites_temp

-- Clean and update data in the temporary table if necessary
-- Example: Update mass column to handle missing values or incorrect data
-- UPDATE "meteorites_temp" SET "mass" = 0 WHERE "mass" IS NULL;

-- -- Create the final table
-- CREATE TABLE "meteorites" (
--   "id" INTEGER PRIMARY KEY AUTOINCREMENT,
--   "title" TEXT,
--   "class" TEXT,
--   "mass" REAL,
--   "discovery" TEXT,
--   "year" INTEGER,
--   "lat" REAL,
--   "long" REAL
-- );


-- -- Insert data from the temporary table into the final table, reordering columns, sorting, and updating IDs
-- INSERT INTO "meteorites" ("title", "class", "mass", "discovery", "year", "lat", "long")
-- SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
-- FROM "meteorites_temp"
-- ORDER BY "year" ASC, "name" ASC;

-- -- Drop the temporary table
-- -- DROP TABLE "meteorites_temp";
