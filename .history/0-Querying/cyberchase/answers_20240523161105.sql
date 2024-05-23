-- Basics

-- table name
-- SELECT name
-- FROM sqlite_master
-- WHERE type = 'table';
-- table called episodes

-- how to get the columns in a table ands store as list
-- PRAGMA table_info(episodes);
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


SELECT "title" FROM "episodes" WHERE "topic" IS NULL;


-- In 5.sql, find the title of the holiday episode that aired on December 31st, 2004.



-- In 6.sql, list the titles of episodes from season 6 (2008) that were released early, in 2007.



-- In 7.sql, write a SQL query to list the titles and topics of all episodes teaching fractions.



-- In 8.sql, write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.



-- You might find it helpful to know you can use BETWEEN with dates, such as BETWEEN '2000-01-01' AND '2000-12-31'.



-- In 9.sql, write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.



-- In 10.sql, write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.



-- In 11.sql, list the titles of episodes from season 5, in reverse alphabetical order.



-- In 12.sql, count the number of unique episode titles.



-- In 13.sql, write a SQL query to explore a question of your choice. This query should:



-- Involve at least one condition, using WHERE with AND or OR


-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States.
-- Your query should output a table with a single column for the title of each episode.
-- Try to find a better solution than LIKE if you can!




-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
-- Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.