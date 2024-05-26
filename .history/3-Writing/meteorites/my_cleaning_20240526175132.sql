-- NOTES:
-- --  import meteroites.csv into a temporary table in the database
-- -- need to reorder columns
-- -- remove nametype from temp


-- Demonstrates importing a CSV into an existing table and adding primary keys
Creates meteorites.db



-- Imports into a temporary using a CSV without primary keys
.import --csv meteorites.csv meteorites_temp

-- -- Inserts into final table by selecting from temporary table
-- INSERT INTO "collections" ("title", "accession_number", "acquired") 
-- SELECT "title", "accession_number", "acquired" FROM "temp";

-- -- Deletes temporary table
-- DROP TABLE "temp";

-- Begin by importing meteorites.csv into a temporary table
-- Start by getting all of the data from meteorites.csv into a temporary table, 
-- one called meteorites_temp. A temporary table is a helpful placeholder: 

-- .tables

-- Before you import a CSV into a SQLite database, it’s best to define the schema for the table into 
-- which that data will be imported. In import.sql, then, try the following:

CREATE TABLE "meteorites_temp" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"name" TEXT,
"class" TEXT,
"mass" REAL,
"discovery" TEXT,
"year" INTEGER,
"lat" REAL,
"long" REAL);
-- We’ll leave the column names up to you.

-- Next, recall that .import is a SQLite statement that can import a CSV into a table of your choice.
--  After your CREATE TABLE statement, write a .import statement to import the data from meteorites.csv 
--  into the meteorites_temp table.

-- Finally, per the Usage section below, try creating meteorites.db by running the statements in import.sql.

-- Write SQL statements to clean the imported data
-- With your data in a temporary table, continue writing SQL statements to clean the data. Consider how you might
--  update the values of the mass column for instance:

-- UPDATE "meteorites_temp"
-- SET "mass" = ...
-- WHERE ...
-- You might need to write a few such statements, one (or more) for each column you’re trying to clean.

-- Transfer the data from your temporary table into a meteorites table
-- Recall that you can INSERT values into a new table by SELECTing rows from another:

-- INSERT INTO "table0" ("column0", "column1")
-- SELECT "column0", "column1" FROM "table1";
-- When you do so, you can re-order your data using ORDER BY. And, so long as you’ve specified a primary key
--  column in your new table, such a statement will auto-assign new IDs to the inserted rows if none is specified.

-- Once you’re done with the temporary table, it’s good practice to drop it!