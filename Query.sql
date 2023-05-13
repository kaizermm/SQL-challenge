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
/*Explanation of the query:
This SQL query is used to retrieve the number of trips made by each taxi company during a specific time period. 
The query uses the "cabs" and "trips" tables, joining them based on the "cab_id" column. 
The WHERE clause is used to filter the trips that started between November 15th and November 16th, 2017. 
The GROUP BY clause groups the results by company name, and the COUNT function is used to count the number of trips made by each company. 
Finally, the results are sorted in descending order based on the number of trips made by each company.
/*

-- Q2..
Find the number of rides for every taxi companies whose name contains the words "Yellow" or "Blue" for November 1-7, 2017. 
Name the resulting variable trips_amount. Group the results by the company_name field.*/
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
/*Explanation of the query:
This SQL query retrieves the number of trips made by the Yellow and Blue taxi companies between November 1 and November 7, 2017. 
It uses a union to combine the results of two queries. 
The first query counts the number of trips made by Yellow taxis during the specified period, while the second query counts the number of trips made by Blue taxis during the same period. 
Both queries use a join between the cabs and trips tables to match trips to the correct taxi company based on cab_id. 
The LIKE operator is used in both queries to search for company names containing the specified substrings ('Yellow' and 'Blue', respectively). 
The result set includes two columns: company_name (the name of the taxi company) and trips_amount (the number of trips made by that company during the specified period).
*/
-- Q3.For November 1-7, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. 
Find the number of rides for these two companies and name the resulting variable trips_amount. 
Join the rides for all other companies in the group "Other." Group the data by taxi company names. 
Name the field with taxi company names company. Sort the result in descending order by trips_amount.
/* --------- SOLUTION --------- */
SELECT 
    CASE 
        WHEN cabs.company_name = 'Flash Cab' THEN 'Flash Cab' 
        WHEN cabs.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services' 
        ELSE 'Other' 
    END AS company, 
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs 
    INNER JOIN trips ON trips.cab_id = cabs.cab_id 
WHERE 
    CAST(trips.start_ts AS DATE) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    CASE 
        WHEN cabs.company_name = 'Flash Cab' THEN 'Flash Cab' 
        WHEN cabs.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services' 
        ELSE 'Other' 
    END
ORDER BY 
    trips_amount DESC;
/*Explanation of the query:
this SQL query retrieves the number of taxi rides by company for a specified date range. 
The result groups the rides by company name and counts the number of trips for each group. 
The query uses a conditional statement in the SELECT clause to group the companies into three categories: "Flash Cab," "Taxi Affiliation Services," 
and "Other." It joins the "cabs" and "trips" tables on the "cab_id" field to obtain information about the taxi rides.The WHERE clause filters the 
results to include only trips that occurred between November 1st, 2017 and November 7th, 2017. 
Finally, the query orders the results in descending order by the number of trips for each company.
*/
Q4.
Retrieve the identifiers of the O'Hare and Loop neighborhoods from the neighborhoods table.
/* --------- SOLUTION --------- */
SELECT neighborhood_id,name
FROM neighborhoods 
WHERE name LIKE '%Hare' OR name LIKE 'Loop';
/* Explanation of the query:
This SQL query selects the neighborhood_id and name columns from the neighborhoods table. 
The query searches for all neighborhoods that have the word "Hare" at the end of their name or the word "Loop" at the beginning of their name. 
The % sign is a wildcard character that matches any sequence of zero or more characters.*/
Q5.For each hour, retrieve the weather condition records from the weather_records table. 
Using the CASE operator, break all hours into two groups: Bad if the description field contains the words rain or storm, and Good for others. Name the 
resulting field weather_conditions. The final table must include two fields: date and hour (ts) and weather_conditions.
/* --------- SOLUTION --------- */
select
ts,
case
    when description like '%rain%' or description like '%storm%' then
'Bad'
    else 'Good'
 End as weather_conditions
 from 
 weather_records;
 /*Explanation ofthe query:
 This SQL query selects the ts (timestamp) and description columns from a table called weather_records. It then uses a CASE statement to categorize 
each record's weather condition as "Good" or "Bad", based on whether the description column contains the words "rain" or "storm". The result 
will be a table with two columns: ts and weather_conditions, 
where weather_conditions will have one of two possible values: "Good" or "Bad".
 */
 Q6.Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare 
 (dropoff_location_id: 63). Get the weather conditions for each ride. Use the method you applied in the previous task. Also, retrieve 
 the duration of each ride. Ignore rides for which data on weather conditions is not available.
The table columns should be in the following order:
start_ts
weather_conditions
duration_seconds
Sort by trip_id.
/* --------- SOLUTION --------- */
	SELECT
    start_ts,
    Ta.weather_conditions,
    duration_seconds
FROM 
    trips
INNER JOIN (
    SELECT
        ts,
        CASE
            WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
    FROM 
        weather_records          
) as Ta ON Ta.ts = trips.start_ts
WHERE 
    pickup_location_id = 50 AND dropoff_location_id = 63 AND EXTRACT (DOW from trips.start_ts) = 6
ORDER BY trip_id;
/*Explanation of the query:This SQL query retrieves information about trips that were taken on a specific day of the week (Saturday), 
with a pickup location ID of 50 and a dropoff location ID of 63. It joins the "trips" table with a subquery that retrieves the weather
conditions at the start of the trip by matching the trip start timestamp with the timestamp in the "weather_records" table. If the weather 
description contains the words "rain" or "storm", the weather conditions are classified as "Bad", otherwise they are classified as "Good". 
The result set includes the trip start timestamp, the weather conditions, and the duration of the trip, sorted by trip ID.
*/
