# The Zuber Database
# Introduction
Stack Exchange Is a network of sites, allowing different communities learn and share their knowledge.
Movies & TV Stack Exchange – is one of these sites, focused entirely on questions and answers regarding movies and series. The following database is built according to its structure, and simulates some of the data it has.
# **:file_folder: DATASETS**
The data set contains the following 4 tables which you may refer to the relationship diagram below to understand the connection.
### Votes
Each vote consists of a voting ID, user number (FK), post number (FK), and a date of creation
### posts
Each post can have different comments, each post can be voted by different users (in order to improve its ranking) 
### Comments
The details regarding the various posts comments
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
 
