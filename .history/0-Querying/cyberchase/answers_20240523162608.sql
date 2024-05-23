-- Basics

-- table name
-- SELECT name
-- FROM sqlite_master
-- WHERE type = 'table';
-- table called episodes

-- how to get the columns in a table ands store as list
PRAGMA table_info(episodes);
-- id,season,episode_in_season,title,topic,air_date,production_code

-- In 1.sql, write a SQL query to list the titles of all episodes in Cyberchase’s original season, Season 1.

-- SELECT "title"
-- FROM "episodes"
-- WHERE "season" = 1;

SELECT "title", "episode_in_season" FROM "episodes" WHERE "season" = 1;

-- In 2.sql, list the season number of, and title of, the first episode of every season.

SELECT "season", "title"
FROM "episodes"
WHERE "episode_in_season" = 1;


-- In 3.sql, find the production code for the episode “Hackerized!”.

SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';

-- In 4.sql, write a query to find the titles of episodes that do not yet have a listed topic.


SELECT "title","topic" FROM "episodes" WHERE "topic" IS NULL;


-- In 5.sql, find the title of the holiday episode that aired on December 31st, 2004.

SELECT "title","air_date" FROM "episodes" WHERE "air_date" = '2004-12-31';

-- In 6.sql, list the titles of episodes from season 6 (2008) that were released early, in 2007.

SELECT "title","season","air_date" FROM "episodes" WHERE "season" = 6 AND "air_date" < '2008-01-01';

-- In 7.sql, write a SQL query to list the titles and topics of all episodes teaching fractions.

SELECT "title","topic" FROM "episodes" WHERE "topic" = 'Fractions';

-- In 8.sql, write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.

SELECT COUNT("title") FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';


-- In 9.sql, write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.

SELECT COUNT("title") FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';

-- In 10.sql, write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.

SELECT "id","title","production_code" FROM "episodes" ORDER BY "production_code";

-- In 11.sql, list the titles of episodes from season 5, in reverse alphabetical order.

SELECT "title" FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;

-- In 12.sql, count the number of unique episode titles.

SELECT COUNT(DISTINCT "title") FROM "episodes";

-- In 13.sql, write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR


-- Select all books not released in hardcover format
-- SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

SELECT "title", "air_date", "season"
FROM "episodes"
WHERE "air_date" < '2004-01-01' AND "season" = 1;




-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States.
-- Your query should output a table with a single column for the title of each episode.
-- Try to find a better solution than LIKE if you can!




-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
-- Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.