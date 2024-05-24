.tables
PRAGMA table_info(packages);

SELECT * FROM addresses LIMIT 5;
SELECT * FROM drivers LIMIT 5;
SELECT * FROM packages LIMIT 5;
SELECT * FROM scans LIMIT 5;



-- equally as important as finding the packages is the process that you use to do so.

-- explain why query

-- main

-- Problems:

-- Handle missing packages For each customer that comes to you with a report of a missing package, your job is to determine:

-- The current address (or location!) of their missing package
-- The type of address or location (e.g. residential, business, etc.)
-- The contents of the package


-- Problem 1: Lost Letter:

-- Information:
-- Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. 
-- Not long ago, I sent out a special letter. It’s meant for my friend Varsha. 
-- She’s starting a new chapter of her life at 2 Finnegan Street, uptown.
--  (That address, let me tell you: it was a bit tricky to get right the first time.)
--   The letter is a congratulatory note—a cheery little paper hug from me to her,
--    to celebrate this big move of hers. Can you check if it’s made its way to her yet?

-- Solution: Lost Letter:

-- address: 900 Somerville Avenue
-- type: residential
-- to: 2 Finnegan Street
-- from: Anneke
-- to: Varsha
-- contents: congratulatory note


-- # get package id for package from 900 Somerville Avenue

-- SELECT id,contents FROM packages WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue');

-- package_id=384

--  take the id for 'Congratulatory letter' and using the package_id in scans determine its actions

-- SELECT * FROM scans WHERE package_id = 384;

-- SELECT "address" FROM addresses WHERE id = 854;

-- SELECT "address" FROM addresses WHERE id = 432;

SELECT "address" FROM addresses WHERE id = (
    SELECT to_address_id FROM packages 
    WHERE "contents" = 'Congratulatory letter');






-- *** The Lost Letter ***
SELECT
	"address",
FROM
	"addresses"
WHERE
	"id" = (
		SELECT
			"to_address_id"
		FROM
			"packages"
		WHERE
			"contents" = 'Congratulatory letter'
	);








