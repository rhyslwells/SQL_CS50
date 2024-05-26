
-- -- Alter the password of the website’s administrative account.

-- -- Erase any logs of the above password change recorded by the database.

-- -- Add false data to throw the company off of your trail.

-- .tables

-- SELECT * FROM "users" LIMIT 1;

-- --  change the password of the admin account to password
-- UPDATE "users"
-- SET
--     "password"="123"
-- WHERE
--     "username"="admin";


-- -- check user_logs  for the password change
-- SELECT * FROM "user_logs" ;

-- -- delete the logs
-- DELETE FROM "user_logs"
-- WHERE
--     type = 'update'
--     AND "new_username" = 'admin';

-- SELECT * FROM "user_logs" ;

-- Add false data to throw others off your trail. In particular, to frame emily33,
--  make it only appear—in the user_logs table—as if the admin account has had its 
--  password changed to emily33’s password.

SELECT * FROM "user_logs" ;

-- -- add false data
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update', 'admin', 'emily33', 'e10adc3949ba59abbe56e057f20f883e
', '44bf025d27eea66336e5c1133c3827f7');

SELECT * FROM "user_logs" ;
