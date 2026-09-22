/*
 * Project: New York Restaurants
 * Course: Codecademy - Learn SQL
 *
 * Description:
 * Practice querying and analyzing restaurant data using SQL.
 *
 * Concepts practiced:
 * - SELECT
 * - DISTINCT
 * - WHERE
 * - Comparison operators
 * - AND / OR
 * - LIKE
 * - IS NULL
 * - ORDER BY
 * - LIMIT
 * - CASE
 */


/* ------------------------------------------------------------
   Task 1: Explore the nomnom table

   Get a feel for the data and inspect the available columns.
------------------------------------------------------------ */

SELECT *
FROM nomnom;


/* ------------------------------------------------------------
   Task 2: Find distinct neighborhoods

   Return all unique neighborhood names.
------------------------------------------------------------ */

SELECT DISTINCT neighborhood
FROM nomnom;


/* ------------------------------------------------------------
   Task 3: Find distinct cuisine types

   Return all unique cuisine types available.
------------------------------------------------------------ */

SELECT DISTINCT cuisine
FROM nomnom;


/* ------------------------------------------------------------
   Task 4: Find Chinese restaurants

   Return all restaurants serving Chinese cuisine.
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';


/* ------------------------------------------------------------
   Task 5: Find highly-rated restaurants

   Return all restaurants with a review rating of 4 or higher.
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE review >= 4;


/* ------------------------------------------------------------
   Task 6: Find Italian restaurants with $$$ pricing

   Return all restaurants that:
   - Serve Italian cuisine
   - Have a price level of $$$
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE cuisine = 'Italian'
  AND price = '$$$';


/* ------------------------------------------------------------
   Task 7: Search for a restaurant by name

   Find restaurants whose name contains the word "meatball".
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';


/* ------------------------------------------------------------
   Task 8: Find restaurants in selected neighborhoods

   Return all restaurants located in:
   - Midtown
   - Downtown
   - Chinatown
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
   OR neighborhood = 'Downtown'
   OR neighborhood = 'Chinatown';


/* ------------------------------------------------------------
   Task 9: Find restaurants with pending health grades

   An empty health grade is represented by NULL.
------------------------------------------------------------ */

SELECT *
FROM nomnom
WHERE health IS NULL;


/* ------------------------------------------------------------
   Task 10: Create a Top 10 restaurant ranking

   Sort restaurants by review rating in descending order
   and return only the top 10.
------------------------------------------------------------ */

SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;


/* ------------------------------------------------------------
   Task 11: Categorize restaurant ratings

   Create a new rating category based on the review score:
   - > 4.5  → Extraordinary
   - > 4    → Excellent
   - > 3    → Good
   - > 2    → Fair
   - <= 2   → Poor

   The new column is named "Rating".
------------------------------------------------------------ */

SELECT name,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
  END AS Rating
FROM nomnom;
