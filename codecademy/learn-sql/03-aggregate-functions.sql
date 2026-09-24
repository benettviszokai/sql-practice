/*
 * Project: Trends in Startups
 * Course: Codecademy - Learn SQL
 *
 * Description:
 * Analyze startup data using SQL aggregate functions to discover
 * trends in company valuations, funding, categories, and locations.
 *
 * Concepts practiced:
 * - COUNT()
 * - SUM()
 * - MAX()
 * - MIN()
 * - AVG()
 * - ROUND()
 * - WHERE
 * - GROUP BY
 * - HAVING
 * - ORDER BY
 */


/* ------------------------------------------------------------
   Task 1: Explore the startups table

   Inspect the available data and columns in the startups table.
------------------------------------------------------------ */

SELECT *
FROM startups;


/* ------------------------------------------------------------
   Task 2: Count the companies

   Calculate the total number of companies in the table.
------------------------------------------------------------ */

SELECT COUNT(*) AS Companies
FROM startups;


/* ------------------------------------------------------------
   Task 3: Calculate total valuation

   Find the combined valuation of all companies.
------------------------------------------------------------ */

SELECT SUM(valuation) AS Valuation
FROM startups;


/* ------------------------------------------------------------
   Task 4: Find the highest amount raised

   Return the maximum amount of money raised by a startup.
------------------------------------------------------------ */

SELECT MAX(raised) AS Raised
FROM startups;


/* ------------------------------------------------------------
   Task 5: Find the highest amount raised during Seed stage

   Return the maximum amount raised by companies whose
   funding stage is Seed.
------------------------------------------------------------ */

SELECT MAX(raised) AS 'Maximum raised at seed'
FROM startups
WHERE stage = 'Seed';


/* ------------------------------------------------------------
   Task 6: Find the oldest company

   Return the earliest founding year in the dataset.
------------------------------------------------------------ */

SELECT MIN(founded) AS 'Earliest founded'
FROM startups;


/* ------------------------------------------------------------
   Task 7: Calculate the average valuation

   Return the average valuation across all startups.
------------------------------------------------------------ */

SELECT AVG(valuation) AS 'Average valuation'
FROM startups;


/* ------------------------------------------------------------
   Task 8: Calculate average valuation by category

   Group startups by category and calculate the average
   valuation for each category.
------------------------------------------------------------ */

SELECT
  category AS Category,
  AVG(valuation) AS 'Average valuation'
FROM startups
GROUP BY category;


/* ------------------------------------------------------------
   Task 9: Round average valuations

   Calculate the average valuation for each category and
   round the results to two decimal places.
------------------------------------------------------------ */

SELECT
  category AS Category,
  ROUND(AVG(valuation), 2) AS 'Average valuation'
FROM startups
GROUP BY category;


/* ------------------------------------------------------------
   Task 10: Rank categories by average valuation

   Order the categories from highest to lowest average
   valuation.
------------------------------------------------------------ */

SELECT
  category AS Category,
  ROUND(AVG(valuation), 2) AS 'Average valuation'
FROM startups
GROUP BY category
ORDER BY 'Average valuation' DESC;


/* ------------------------------------------------------------
   Task 11: Count companies by category

   Return each category and the number of companies
   that belong to it.
------------------------------------------------------------ */

SELECT
  category,
  COUNT(*) AS Companies
FROM startups
GROUP BY category;


/* ------------------------------------------------------------
   Task 12: Find the most competitive categories

   Return only categories containing more than three companies.
------------------------------------------------------------ */

SELECT
  category,
  COUNT(*) AS Companies
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;


/* ------------------------------------------------------------
   Task 13: Calculate average startup size by location

   Find the average number of employees for startups
   in each location.
------------------------------------------------------------ */

SELECT
  location,
  AVG(employees) AS 'Average employees'
FROM startups
GROUP BY location;


/* ------------------------------------------------------------
   Task 14: Find locations with large startups

   Return locations where the average startup size
   is greater than 500 employees.
------------------------------------------------------------ */

SELECT
  location,
  AVG(employees) AS 'Average employees'
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;
