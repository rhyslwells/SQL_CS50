-- -- Notes

-- -- Code

-- .tables
SELECT * FROM availabilities  limit 3;
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

SELECT * FROM "available";


SELECT * FROM "availabilities" limit 3;

Select * from "listings" limit 3;