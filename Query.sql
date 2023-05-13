/* AUTHOR   - KEVIN HUANG(WAN QUYEN HUANG)
 Tool Used  - PostgreSQL
 Created on - May'2023*/
--------------------------------------------------------------------------
-- Analysis QUESTIONS --
-------------------------------------------------------------------------
-- Q1.
Print the company_name field. Find the number of taxi rides for each taxi company for November 15-16, 2017, name the resulting field trips_amount and print it, too. 
Sort the results by the trips_amount field in descending order. ?*/
/* --------- SOLUTION --------- */
select cabs.company_name as company_name,count(trips.trip_id) as trips_amount
from cabs
join trips on cabs.cab_id=trips.cab_id
where 
trips.start_ts::date between '2017-11-15' and  '2017-11-16'
group by
company_name
order by
trips_amount
desc;
/*This SQL query is used to retrieve the number of trips made by each taxi company during a specific time period. 
The query uses the "cabs" and "trips" tables, joining them based on the "cab_id" column. 
The WHERE clause is used to filter the trips that started between November 15th and November 16th, 2017. 
The GROUP BY clause groups the results by company name, and the COUNT function is used to count the number of trips made by each company. 
Finally, the results are sorted in descending order based on the number of trips made by each company.
/*

-- Q2.For each hour, retrieve the weather condition records from the weather_records table. 
Using the CASE operator, break all hours into two groups: "Bad" if the description field contains the words "rain" or "storm," and "Good" for others. 
Name the resulting field weather_conditions. The final table must include two fields: date and hour (ts) and weather_conditions. ?*/
/* --------- SOLUTION --------- */
select 
company_name,count( trips.trip_id) as trips_amount
from
cabs join trips on cabs.cab_id=trips.cab_id
where
cabs.company_name LIKE '%Yellow%' and
trips.start_ts >= '2017-11-01' AND trips.start_ts < '2017-11-08'
group by
company_name
union all 
select 
company_name,count( trips.trip_id) as trips_amount
from
cabs join trips on cabs.cab_id=trips.cab_id
where
cabs.company_name LIKE '%Blue%' and
trips.start_ts >= '2017-11-01' AND trips.start_ts < '2017-11-08'
group by
company_name;
/*This SQL query retrieves the number of trips made by the Yellow and Blue taxi companies between November 1 and November 7, 2017. 
It uses a union to combine the results of two queries. 
The first query counts the number of trips made by Yellow taxis during the specified period, while the second query counts the number of trips made by Blue taxis during the same period. 
Both queries use a join between the cabs and trips tables to match trips to the correct taxi company based on cab_id. 
The LIKE operator is used in both queries to search for company names containing the specified substrings ('Yellow' and 'Blue', respectively). 
The result set includes two columns: company_name (the name of the taxi company) and trips_amount (the number of trips made by that company during the specified period).
*/
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


