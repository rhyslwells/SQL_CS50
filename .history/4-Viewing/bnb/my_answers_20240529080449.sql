-- -- Notes

-- -- Code

-- .tables
-- SELECT * FROM availabilities  limit 3;
-- SELECT * FROM listings limit 3;
-- SELECT * FROM reviews limit 3;


-- In no_descriptions.sql, write a SQL statement to create a view named no_descriptions 
-- that includes all of the columns in the listings table except for description.

CREATE VIEW AS no_descriptions;
SELECT id	property_type	host_name	accommodates	bedrooms 
FROM "listings"