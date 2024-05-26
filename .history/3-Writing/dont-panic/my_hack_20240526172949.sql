
-- Alter the password of the website’s administrative account.

-- Erase any logs of the above password change recorded by the database.

-- Add false data to throw the company off of your trail.

.tables

SELECT * FROM "users" LIMIT 1;

--  change the password of the admin account to password
UPDATE "users"
SET
    "password"="123"
WHERE
    "username"="admin";


-- check user_logs  for the password change
SELECT * FROM "user_logs" ;

-- delete the logs
DELETE FROM "user_logs"
WHERE
    type = 'update'
    AND "new_username" = 'admin';

SELECT * FROM "user_logs" ;
