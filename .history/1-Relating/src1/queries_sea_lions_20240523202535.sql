-- how to join two tables using primary keys

-- .tables

-- SELECT * FROM "sea_lions";

-- SELECT * FROM "migrations";

SELECT * FROM "sea_lions" JOIN "migration" on "migration"."id" = "sea_lions"."id"; 