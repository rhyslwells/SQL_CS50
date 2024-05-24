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


/*
    This SQL query retrieves information about packages that are being sent from '900 Somerville Avenue' to '2 Finnegan Street'.
    It selects the package ID, the address of the sender ('900 Somerville Avenue'), the address of the recipient ('2 Finnegan Street'), and the contents of the package.
    The query joins the 'packages' table with the 'addresses' table twice, once for the sender address and once for the recipient address.
    It filters the results based on the specified sender and recipient addresses.
*/
SELECT p.id AS package_id, a1.address AS from_address, a2.address AS to_address, p.contents
FROM packages p
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE a1.address = '900 Somerville Avenue'
    AND a2.address = '2 Finnegan Street';












