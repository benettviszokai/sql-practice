/*
 * Project: Analyze Hacker News Trends
 * Course: Codecademy - Learn SQL
 *
 * Description:
 * Analyze Hacker News story data using SQL to identify popular
 * stories, high-scoring users, common content sources, and
 * posting times associated with higher average scores.
 *
 * Concepts practiced:
 * - SUM()
 * - COUNT()
 * - AVG()
 * - ROUND()
 * - GROUP BY
 * - HAVING
 * - ORDER BY
 * - CASE
 * - LIKE
 * - IS NOT NULL
 * - strftime()
 */


/* ------------------------------------------------------------
   Task 1: Find the most popular stories

   Return the five Hacker News stories with the highest scores.
------------------------------------------------------------ */

SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;


/* ------------------------------------------------------------
   Task 2: Calculate the total score

   Find the combined score of all stories in the dataset.
------------------------------------------------------------ */

SELECT SUM(score) AS total_score
FROM hacker_news;


/* ------------------------------------------------------------
   Task 3: Find high-scoring users

   Find users whose submitted stories have accumulated
   a combined score greater than 200.
------------------------------------------------------------ */

SELECT
  user,
  SUM(score) AS total_score
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY total_score DESC;


/* ------------------------------------------------------------
   Task 4: Calculate the power users' share of total points

   Add together the scores of users with more than 200
   combined points and divide them by the total score.
------------------------------------------------------------ */

SELECT (517 + 309 + 304 + 282) / 6366.0 AS score_share;


/* ------------------------------------------------------------
   Task 5: Find users posting the Rickroll link

   Count how many times each user submitted the specified
   YouTube link.
------------------------------------------------------------ */

SELECT
  user,
  COUNT(*) AS post_count
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY post_count DESC;


/* ------------------------------------------------------------
   Task 6: Categorize stories by source

   Categorize URLs as:
   - GitHub
   - Medium
   - New York Times
   - Other
------------------------------------------------------------ */

SELECT
  CASE
    WHEN url LIKE '%github.com%' THEN 'GitHub'
    WHEN url LIKE '%medium.com%' THEN 'Medium'
    WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
    ELSE 'Other'
  END AS source
FROM hacker_news;


/* ------------------------------------------------------------
   Task 7: Count stories by source

   Count how many stories belong to each source category.
------------------------------------------------------------ */

SELECT
  CASE
    WHEN url LIKE '%github.com%' THEN 'GitHub'
    WHEN url LIKE '%medium.com%' THEN 'Medium'
    WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
    ELSE 'Other'
  END AS source,
  COUNT(*) AS story_count
FROM hacker_news
GROUP BY 1;


/* ------------------------------------------------------------
   Task 8: Inspect story timestamps

   Examine how timestamps are stored in the dataset.
------------------------------------------------------------ */

SELECT timestamp
FROM hacker_news
LIMIT 10;


/* ------------------------------------------------------------
   Task 9: Extract the hour from timestamps

   Use SQLite's strftime() function to extract the hour
   component from each timestamp.
------------------------------------------------------------ */

SELECT
  timestamp,
  strftime('%H', timestamp) AS hour
FROM hacker_news
GROUP BY 1
LIMIT 20;


/* ------------------------------------------------------------
   Task 10: Analyze stories by posting hour

   For each hour of the day, calculate:
   - Average story score
   - Number of stories posted
------------------------------------------------------------ */

SELECT
  strftime('%H', timestamp) AS hour,
  AVG(score) AS average_score,
  COUNT(*) AS story_count
FROM hacker_news
GROUP BY 1
ORDER BY average_score DESC;


/* ------------------------------------------------------------
   Task 11: Find the best-performing posting hours

   Improve the previous query by:
   - Removing NULL timestamps
   - Rounding average scores
   - Adding descriptive column aliases
   - Ranking hours by average score
------------------------------------------------------------ */

SELECT
  strftime('%H', timestamp) AS hour,
  ROUND(AVG(score), 1) AS average_score,
  COUNT(*) AS number_of_stories
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY average_score DESC;
