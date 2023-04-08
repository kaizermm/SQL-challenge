--------------------------------------------------------------------------
-- Basic Analysis QUESTIONS --
-------------------------------------------------------------------------
-- Q1.How many post were made each year ?*/
/* --------- SOLUTION --------- */
SELECT COUNT(*) NUM_POSTS, YEAR(CreationDate) AS Creation_Year
FROM [data_analysis_stack_exchange_movies].[dbo].[posts]
GROUP BY YEAR(CreationDate)
-- Q2.How many votes were made in each day of the week (Sunday, Monday, Tuesday, etc.) ?*/
/* --------- SOLUTION --------- */

-- Q3.List all comments created on September 19th, 2012

