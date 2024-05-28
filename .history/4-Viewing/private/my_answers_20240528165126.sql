
-- Task Summary
-- You need to decode a cipher left by a detective using a book cipher based on
--  "The Adventures of Sherlock Holmes." The cipher is encoded using triplets, each specifying:

-- Sentence Number: The index of the sentence in the text.
-- Character Position: The starting character position within that sentence.
-- Message Length: The number of characters to read from the start position.

-- Steps to Complete the Task:
-- Create a sentences Table: Ensure this table exists and is populated with sentences from the book.
-- Create a triplets Table: Store the triplets (sentence number, start position, length) in this table.
-- Insert Triplets Data: Insert the given triplets into the triplets table.
-- Create a message View:
-- Use the substr function to extract the specified substrings from the sentences.
-- Join the sentences and triplets tables on the sentence number.
-- Create the view named message with a single column phrase.
-- When you query the view with SELECT "phrase" FROM "message";, it should return each 
-- decoded phrase as a row.


-- Code
-- .tables
SELECT * FROM message;
-- .schema

-- Create sentences table if it doesn't exist
-- DROP TABLE IF EXISTS sentences;
-- CREATE TABLE IF NOT EXISTS sentences (
--     sentence TEXT
-- );

-- -- Create triplets table
-- CREATE TABLE IF NOT EXISTS triplets (
--     sentence_number INTEGER,
--     start_position INTEGER,
--     length INTEGER
-- );

-- -- Insert triplets data
-- INSERT INTO triplets (sentence_number, start_position, length) VALUES
--     (14, 98, 4),
--     (114, 3, 5),
--     (618, 72, 9),
--     (630, 7, 3),
--     (932, 12, 5),
--     (2230, 50, 7),
--     (2346, 44, 10),
--     (3041, 14, 5);

-- -- Drop the view if it exists
-- DROP VIEW IF EXISTS message;

-- -- Create the view to extract the substrings
-- CREATE VIEW message AS
-- SELECT 
--     substr(s.sentence, t.start_position, t.length) AS phrase
-- FROM 
--     sentences s
-- JOIN 
--     triplets t
-- ON 
--     s.rowid = t.sentence_number;

-- -- Query to see the decoded message
-- SELECT phrase FROM message;
