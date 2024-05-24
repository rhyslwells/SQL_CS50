
.tables

Select * from districts limit 1;
Select * from graduation_rates limit 1;
Select * from schools limit 1;
Select * from expenditures limit 1;
SELECT * FROM staff_evaluations LIMIT 1;


-- 1.sql
-- Your colleague is preparing a map of all public schools in Massachusetts. 
-- In 1.sql, write a SQL query to find the names and cities of all public schools in Massachusetts.


-- SELECT name, city FROM schools WHERE "type"='Public School'; 


-- Keep in mind that not all schools in the schools table are considered traditional public schools.
--  Massachusetts also recognizes charter schools, which (according to DESE!) are considered distinct.

-- 2.sql
-- Your team is working on archiving old data. In 2.sql, write a SQL query to find the names of districts that are no longer operational.
-- Districts that are no longer operational have “(non-op)” at the end of their name.

-- SELECT name FROM districts WHERE name LIKE '%(non-op)%';

-- 3.sql
-- The Massachusetts Legislature would like to learn how much money, on average, 
-- districts spent per-pupil last year. In 3.sql, write a SQL query to find the average per-pupil expenditure. 
-- Name the column “Average District Per-Pupil Expenditure”.
-- Note the per_pupil_expenditure column in the expenditures table contains the average amount,
--  per pupil, each district spent last year. You’ve been asked to find the average of this set of averages,
--  weighting all districts equally regardless of their size.

-- SELECT "district_id",AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
-- FROM expenditures
-- GROUP BY "district_id"; 

-- SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"

-- 4.sql
-- Some cities have more public schools than others. 
-- In 4.sql, write a SQL query to find the 10 cities with the most public schools. 
-- Your query should return the names of the cities and the number of public schools within them, ordered 
-- from greatest number of public schools to least. If two cities have the same number of public schools, order them
--  alphabetically.

--  GET UNIQUE TERMS IN CITY OF DISTRICT
-- SELECT type FROM districts;


SELECT "city", COUNT(*) AS num_public_school 
FROM schools
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY num_public_school DESC, "city" ASC
LIMIT 10;


-- 5.sql
-- DESE would like you to determine in what cities additional public schools might be needed. In 5.sql, write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

-- 6.sql
-- DESE wants to assess which schools achieved a 100% graduation rate. In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

-- 7.sql
-- DESE is preparing a report on schools in the Cambridge school district. In 7.sql, write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”

-- 8.sql
-- A parent wants to send their child to a district with many other students. In 8.sql, write a SQL query to display the names of all school districts and the number of pupils enrolled in each.

-- 9.sql
-- Another parent wants to send their child to a district with few other students. In 9.sql, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).

-- 10.sql
-- In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home) values. In 10.sql, write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.

-- 11.sql
-- Is there a relationship between school expenditures and graduation rates? In 11.sql, write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.

-- You should assume a school spends the same amount per-pupil their district as a whole spends.