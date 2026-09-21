/*
 * Project: Create a Table
 * Course: Codecademy - Learn SQL
 *
 * Description:
 * Practice creating and modifying a table using basic SQL commands.
 * The project covers CREATE TABLE, INSERT, SELECT, UPDATE,
 * ALTER TABLE, and DELETE.
 */

/* ------------------------------------------------------------
   Task 1: Create the friends table

   Create a table named friends with the following columns:
   - id       INTEGER
   - name     TEXT
   - birthday DATE
------------------------------------------------------------ */

CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);


/* ------------------------------------------------------------
   Task 2: Add Ororo Munroe

   Add Ororo Munroe to the friends table.
   Her birthday is May 30, 1940.
------------------------------------------------------------ */

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');


/* ------------------------------------------------------------
   Task 3: Verify the data

   Check that the friends table was created successfully
   and that Ororo Munroe was added.
------------------------------------------------------------ */

SELECT *
FROM friends;


/* ------------------------------------------------------------
   Task 4: Add two more friends
------------------------------------------------------------ */

INSERT INTO friends (id, name, birthday)
VALUES (2, 'John Doe', '1990-01-01');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Jane Doe', '1993-05-05');


/* ------------------------------------------------------------
   Task 5: Update Ororo's name

   Ororo Munroe changed her name to Storm.
------------------------------------------------------------ */

UPDATE friends
SET name = 'Storm'
WHERE id = 1;


/* ------------------------------------------------------------
   Task 6: Add an email column
------------------------------------------------------------ */

ALTER TABLE friends
ADD COLUMN email TEXT;


/* ------------------------------------------------------------
   Task 7: Add email addresses
------------------------------------------------------------ */

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'john@doe.com'
WHERE id = 2;

UPDATE friends
SET email = 'jane@doe.com'
WHERE id = 3;


/* ------------------------------------------------------------
   Task 8: Remove Storm

   Storm is a fictional character, so remove her record
   from the friends table.
------------------------------------------------------------ */

DELETE FROM friends
WHERE id = 1;


/* ------------------------------------------------------------
   Task 9: View the final result
------------------------------------------------------------ */

SELECT *
FROM friends;
