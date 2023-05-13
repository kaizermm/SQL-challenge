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
### Users
The details of the users who commented / wrote a post / voted 
# Diagram
![image](https://user-images.githubusercontent.com/121756502/229656245-4a8b4edf-f292-44aa-a737-00ec2418b1d4.png)
# :speech_balloon: BASICS ANALYSIS QUESTIONS
1.How many post were made each year ?

2.How many votes were made in each day of the week (Sunday, Monday, Tuesday, etc.) ?

3.List all comments created on September 19th, 2012

4.List all users under the age of 33, living in London

# :speech_balloon: ADVANCED ANALYSIS QUESTIONS
1.Display the number of votes for each post title

2.Display posts with comments created by users living in the same location as the post creator.

3.How many users have never voted ?

4.Display all posts having the highest amount of comments

5.For each post, how many votes are coming from users living in Canada ? What’s their percentage of the total number of votes

6.How many hours in average, it takes to the first comment to be posted after a creation of a new post

7.Whats the most common post tag ?

8.Create a pivot table displaying how many posts were created for each year (Y axis) and each month (X axis)
 
