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
SELECT 
COUNT(*) AS 'Number of Posts', 
FORMATMESSAGE('%s',DATENAME(WEEKDAY, CAST(CreationDate AS DATE))) AS 'Day of the Week'
FROM [data_analysis_stack_exchange_movies].[dbo].[Votes]
GROUP BY DATEPART(WEEKDAY, CAST(CreationDate AS DATE)), 
FORMATMESSAGE('%s',DATENAME(WEEKDAY, CAST(CreationDate AS DATE)))
-- Q3.List all comments created on September 19th, 2012
/* --------- SOLUTION --------- */
SELECT *
FROM [data_analysis_stack_exchange_movies].[dbo].[Comments]
where CONVERT(DATE, creationDate) = '2012-12-19'
-- Advanced Analysis QUESTIONS --
Q1.Display the number of votes for each post title*/
SELECT pst.Title,count(*) number_of_votes
FROM [data_analysis_stack_exchange_movies].[dbo].[Votes] as vt
join
[data_analysis_stack_exchange_movies].[dbo].posts as pst
on 
vt.Id=pst.Id
group by
pst.Title
order by
count(*)
desc


