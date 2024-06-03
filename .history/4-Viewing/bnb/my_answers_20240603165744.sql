-- -- Notes



-- -- Code

-- .tables
-- .schema
-- SELECT * FROM availabilities  limit 3;
-- SELECT * FROM listings limit 3;
-- SELECT * FROM reviews limit 3;

-- NO DESCRIPTIONS

-- In no_descriptions.sql, write a SQL statement to create a view named no_descriptions 
-- that includes all of the columns in the listings table except for description.

-- CREATE VIEW "no_descriptions" AS
-- SELECT "id","property_type","host_name","accommodates"	,"bedrooms" 
-- FROM "listings"

-- SELECT * FROM no_descriptions limit 3;

-- ONE BEDROOMS

-- CREATE VIEW "one_bedrooms" AS
-- SELECT "id","property_type","host_name","accommodates"
-- FROM "listings"
-- WHERE "bedrooms"=1;

-- SELECT * FROM "one_bedrooms" limit 3;

-- AVAILABLE

-- DROP VIEW "available";

-- .tables

-- CREATE VIEW "available" AS
-- SELECT l."id",l."property_type",l."host_name",a."date"
-- FROM availabilities a
-- JOIN listings l ON l.id=a."listing_id";

-- SELECT * FROM "available";

-- SELECT * FROM "availabilities" limit 3;

-- Select * from "listings" limit 3;

-- Frequently_reviewed

-- CREATE VIEW "frequently_reviewed" AS
-- In frequently_reviewed.sql, write a SQL statement to create 
-- a view named frequently_reviewed. This view should contain the 100 most frequently 
-- reviewed listings, sorted from most- to least-frequently reviewed. 
-- Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- reviews, which is the number of reviews the listing has received.
-- If any two listings have the same number of reviews, sort by property_type (in alphabetical order),
--  followed by host_name (in alphabetical order).

-- SELECT * FROM "listings" limit 3;
-- SELECT * FROM "reviews" limit 3;

-- -- DROP VIEW "frequently_reviewed";

-- CREATE VIEW "frequently_reviewed" AS
-- SELECT l."id",l."property_type",l."host_name",COUNT(r."id") as "reviews"
-- FROM listings l
-- JOIN reviews r ON l."id"=r."listing_id"
-- GROUP BY 
-- l."id",
-- 	l."property_type",
-- 	l."host_name"
-- ORDER BY "reviews" DESC,"property_type" ASC,"host_name" ASC
-- LIMIT 100;



-- SELECT * FROM "frequently_reviewed";

-- June vacancies

-- In june_vacancies.sql, write a SQL statement to create a view named june_vacancies.
--  This view should contain all listings and the number of days in June of 2023 that
--   they remained vacant. Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- days_vacant, which is the number of days in June of 2023, that the given listing 
-- was marked as available.

SELECT * FROM "listings" limit 3;
SELECT * FROM "availabilities" limit 3;

-- WHY a left join in this case?

-- DROP VIEW "june_vacancies";

-- CREATE VIEW "june_vacancies" AS
-- SELECT l."id",l."property_type",l."host_name",COUNT(a."date") as "days_vacant"
-- FROM listings l
-- JOIN availabilities a ON l."id"=a."listing_id"
-- WHERE 
-- a."available"='TRUE'
-- AND
-- a."date" BETWEEN '2023-06-01' AND '2023-06-30'
-- GROUP BY
-- l."id"
-- ORDER BY "days_vacant" DESC;


-- SELECT * FROM "june_vacancies";

DROP VIEW "june_vacancies_temp";

CREATE VIEW "june_vacancies_temp" AS
SELECT l."id",l."property_type",l."host_name",COUNT(a."date") as "days_vacant"
FROM listings l
LEFT JOIN availabilities a ON l."id"=a."listing_id";

SELECT * FROM "june_vacancies_temp";