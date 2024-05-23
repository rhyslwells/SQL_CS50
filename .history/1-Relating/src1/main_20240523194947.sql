
.tables

SELECT * FROM "publishers";

-- SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press'; 
-- 12
-- SELECT "title" FROM "books" WHERE "publisher_id" = 12;

SELECT "title" FROM "books" WHERE "publisher_id" = (
    SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press');
        

