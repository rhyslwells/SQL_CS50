.tables
PRAGMA table_info(packages);

-- SELECT * FROM addresses LIMIT 5;
-- SELECT * FROM drivers LIMIT 5;
SELECT * FROM packages LIMIT 5;
SELECT * FROM scans LIMIT 5;



-- equally as important as finding the packages is the process that you use to do so.

-- explain why query


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


--  we check if it was delivered to the correct address.

SELECT address_id,action
FROM scans
WHERE package_id = (
    SELECT id
    FROM packages
    WHERE contents = 'Congratulatory letter'
      AND from_address_id = (
          SELECT id
          FROM addresses
          WHERE address = '900 Somerville Avenue'
      )
    --   AND to_address_id = (
    --       SELECT id
    --       FROM addresses
    --       WHERE address = '2 Finnegan Street'
    --   )
);


-- Problem 2: Devious Delivery:

-- -- Information:
-- Good day to you, deliverer of the mail. 
-- You might remember that not too long ago I made my way over from the town of Fiftyville. 
-- I gave a certain box into your reliable hands and asked you to keep things low.
--  My associate has been expecting the package for a while now. And yet,
--   it appears to have grown wings and flown away. Ha! Any chance you could help clarify this mystery?
--    Afraid there’s no “From” address. It’s the kind of parcel that would add a bit more… 
--    quack to someone’s bath times, if you catch my drift.

-- Fiftyville
-- box
-- no “From” address
-- rubber duckies

--  in packages check contents for the word rubber
-- SELECT "contents" FROM "packages" WHERE "contents" LIKE '%rubber%';
-- Rubber duck
-- Duck debugger	

-- address = 'Fiftyville'

--  get packages without from_address_id in packages
SELECT * FROM packages WHERE from_address_id IS NULL;

-- in scans check for

SELECT * FROM scans WHERE package_id=(
    SELECT id FROM packages WHERE from_address_id IS NULL AND contents LIKE '%Duck%'
);

SELECT
	*
FROM
	"addresses"
WHERE
	"id" = (
		SELECT
			"address_id"
		FROM
			"scans"
		WHERE
			"package_id" = (
				SELECT
					"id"
				FROM
					"packages"
				WHERE
					"from_address_id" IS NULL
			)
			AND "action" = 'Drop'
	);

-- What is it
-- SELECT
-- 	"contents"
-- FROM
-- 	"packages"
-- WHERE
-- 	"from_address_id" IS NULL;


-- Problem 3: Forgotten Gift:

-- -- Information:
Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter,
 off at 728 Maple Place. That was about two weeks ago. Now the delivery date has passed 
 by seven whole days and I hear she still waits, her hands empty and heart filled with anticipation.
  I’m a bit worried wondering where my package has gone. I cannot for the life of me 
  remember what’s inside, but I do know it’s filled to the brim with my love for her.
   Can we possibly track it down so it can fill her day with joy? I did send it 
   from my home at 109 Tileston Street.

   

