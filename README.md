# The Zuber Database
# Introduction
As an analyst for Zuber, a newly established ride-sharing company in Chicago, your responsibility is to analyze the available data to uncover patterns and insights. Your primary objective is to gain a better understanding of passenger preferences and determine how external factors influence ride frequency. To achieve this, you will work with a database containing information from competitors to identify trends and test a hypothesis on the impact of weather on ride demand. By leveraging data analytics, you will help Zuber make data-driven decisions to improve their services and outperform their competitors in the ride-sharing industry
# **:file_folder: DATASETS**
The data set contains the following 4 tables which you may refer to the relationship diagram below to understand the connection.
### **1.neighborhoods table**: 
<details><summary>
View Table
 </summary> 
 data on city neighborhoods
 
 -Show the first 5 values
   
 | neighborhood_id	|  name |
 | --------------- |  --------- |
 | 0	              | Albany Park |
 | 1	              | Andersonville |
 | 2	              | Archer Heights |
 | 3	              | Armour Square |
 | 4	              | Ashburn       |
 | 5	              | Auburn Gresham |

 </details>

### **2.cabs**:
<details><summary>
View Table
 </summary>
 data on rides
 
 -Show the first 5 values
 
 -vehicle_id was cut short 11 characters.
 
  | cab_id	|  vehicle_id | company_name |
  | ------ |  -----------| ------------ |
  | 0      |  0fc17a66d66...| Dispatch Taxi Affiliation |
  | 1      |  38f6145c9a2...| Taxi Affiliation Services |
  | 2      |  11c21d0290e...| Star North Management LLC |
  | 3      |  43c12494b50...| Dispatch Taxi Affiliation |
  | 4      |  a48710b8f31...| Blue Ribbon Taxi Association Inc |
  | 5      |  c591191b4ca...| Blue Ribbon Taxi Association Inc |
 
 </details>
 
### **3.trips**:
<details><summary>
View Table
 </summary>
 data on rides
 
 -Show the first 5 values
 | trip_id	|  cap_id | start_td            | end_ts	            | duration_seconds	| distance_miles | pickup_location_id | dropoff_location_id |
 | ------ |  --------| ------------------- | -----------------  | -----------------| ---------------| -------------------| --------------------|
 | 1       |  1514   |  2017-11-07 21:00:00| 2017-11-07 21:00:00 | 81              |  0.04          | 0                  | 0                   |
 | 2       |  1514   |  2017-11-07 21:00:00| 2017-11-07 21:00:00 | 671             |  0.65          | 0                  | 0                   |
 | 3       |  1768   |  2017-11-03 14:00:00| 2017-11-03 15:00:00 | 318             |  0.9           | 0                  | 0                   |
 | 4       |  4274   |  2017-11-24 04:00:00| 2017-11-24 04:00:00 | 115             |  0.4           | 0                  | 0                   |
 | 5       |  3970   |  2017-11-12 03:00:00| 2017-11-12 03:00:00 | 475             |  1.6           | 0                  | 0                   |

 </details>
 
 ### **4.weather_records**:
 <details><summary>
View Table
 </summary>
 data on rides
 
 -Show the first 5 values
  | record_id	|  ts                | temperature | description|
  | --------- | -------------------| ------------| -------------| 
  | 1         | 2017-11-01 00:00:00| 276.15	     | broken clouds| 
  | 2         | 2017-11-01 01:00:00| 275.7       | scattered clouds|
  | 3         | 2017-11-01 02:00:00| 275.61      | overcast clouds |
  | 4         | 2017-11-01 03:00:00| 275.35      | broken clouds   |
  | 5         | 2017-11-01 04:00:00| 275.24      | broken clouds   |
 
  </details>
  
  # Table scheme
  
  ![image](https://github.com/kaizermm/The-Zuber-Database/assets/121756502/2edba3f3-131c-40eb-b0d0-273d6213d7db)


# Diagram
![image](https://user-images.githubusercontent.com/121756502/229656245-4a8b4edf-f292-44aa-a737-00ec2418b1d4.png)
 
 </details>

# :speech_balloon:ANALYSIS QUESTIONS
1.Find the number of taxi rides for each taxi company for November 15-16, 2017. Name the resulting field trips_amount and print it along with the company_name field. Sort the results by the trips_amount field in descending order. **

2.Find the number of rides for every taxi company whose name contains the words "Yellow" or "Blue" for November 1-7, 2017. Name the resulting variable trips_amount. Group the results by the company_name field.

3.In November 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. Find the number of rides for these two companies and name the resulting variable trips_amount. Join the rides for all other companies in the group "Other." Group the data by taxi company names. Name the field with taxi company names company. Sort the result in descending order by trips_amount.

4.Retrieve the identifiers of the O'Hare and Loop neighborhoods from the neighborhoods table.

5.For each hour, retrieve the weather condition records from the weather_records table. Using the CASE operator, break all hours into two groups: "Bad" if the description field contains the words "rain" or "storm," and "Good" for others. Name the resulting field weather_conditions. The final table must include two fields: date and hour (ts) and weather_conditions.

6.Retrieve from the trips table all the rides that started in the Loop (neighborhood_id: 50) and ended at O'Hare (neighborhood_id: 63) on a Saturday. Get the weather conditions for each ride. Use the method you applied in the previous task. Also retrieve the duration of each ride. Ignore rides for which data on weather conditions is not available.

## **:dart: INSIGHTS GENERATED**
1.Bad weather conditions between 2017-11-18 12:00:00 AM and 2017-11-18 7:00:00 PM resulted in lower ride durations
2.Between Flash Cab and Taxi Affiliation Services.Flash Cab has higher trip amount
 
