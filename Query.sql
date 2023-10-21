/* AUTHOR   - KEVIN HUANG(WAN QUYEN HUANG)
 Tool Used  - PostgreSQL
 Since the data for the project is located within the TripleTen interface, most of the SQL will be executed on the TripleTen website interface.
 Created on - May-2023*/
--------------------------------------------------------------------------
-- Analysis QUESTIONS --
-------------------------------------------------------------------------
/* Q1.Print the company_name field. Find the number of taxi rides for each taxi company for November 15-16, 2017, name the resulting field trips_amount and print it, too. 
Sort the results by the trips_amount field in descending order. ?*/
/* --------- SOLUTION --------- */
select cabs.company_name as company_name,count(trips.trip_id) as trips_amount
from cabs
join trips on cabs.cab_id=trips.cab_id
group by
company_name
order by
trips_amount
desc;
/*Explanation of the query:
This SQL query is used to retrieve the number of trips made by each taxi company during a specific time period. 
The query uses the "cabs" and "trips" tables, joining them based on the "cab_id" column. 
The GROUP BY clause groups the results by company name, and the COUNT function is used to count the number of trips made by each company. 
Finally, the results are sorted in descending order based on the number of trips made by each company.
/*

/* Q2. Could you please generate the SQL query that retrieves the pickup location names and the total number of trips taken to each pickup location,
while also joining the 'cabs,' 'trips,' and 'neighborhoods' tables to associate the data correctly and sorting the results in descending order of trip count? */
/* --------- SOLUTION --------- */
select 
    neighborhoods.name as pickup_location,count(trips.trip_id) as n_trip
from cabs
join trips on cabs.cab_id=trips.cab_id
join  neighborhoods on neighborhoods.neighborhood_id=trips.pickup_location_id
group by
drop_location
order by
n_trip
desc;
/*Explanation of the query:
This SQL query retrieves data on pickup locations from the 'neighborhoods' table and calculates the total number of trips originating from each neighborhood, which is then assigned to the 'pickup_location' alias. 
The data is merged with information from the 'cabs' and 'trips' tables, connecting via cab IDs and pickup location IDs. The results are grouped by 'drop_location' and ordered in descending order by the number of trips. 
In essence, it provides insights into which neighborhoods serve as frequent pickup points for rides.

/* Q3.Could you please create an SQL query to retrieve the drop-off locations with the highest number of trips, using the "neighborhoods" dataset's "name" column, joined with the "cabs" and "trips" tables? 
The query should calculate the count of trips for each drop-off location and order the results in descending order of trip count.
/* --------- SOLUTION --------- */
select 
    neighborhoods.name as drop_location,count(trips.trip_id) as n_trip
from cabs
join trips on cabs.cab_id=trips.cab_id
join  neighborhoods on neighborhoods.neighborhood_id=trips.dropoff_location_id
group by
drop_location
order by
n_trip
desc;

/*Explanation of the query:
This SQL query combines data from multiple tables, including "cabs," "trips," and "neighborhoods". 
It retrieves the name of the drop-off locations from the "neighborhoods" table and counts the number of trips to each location. 
The results are grouped by drop-off location and ordered in descending order based on the count of trips (n_trip). 
This query provides valuable insights into the neighborhoods with the highest number of trips, helping to identify popular drop-off locations for cab services.


/* Q4.Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare 
 (dropoff_location_id: 63). Get the weather conditions for each ride. Use the method you applied in the previous task. Also, retrieve 
 the duration of each ride. Ignore rides for which data on weather conditions is not available.*/
The table columns should be in the following order:
start_ts
weather_conditions
duration_seconds
Sort by trip_id.--
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
