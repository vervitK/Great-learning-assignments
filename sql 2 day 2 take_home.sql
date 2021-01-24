CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
select name, platform , sum(na_sales) 
over (partition by na_sales) 
from video_games_sales;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,
#total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.
#select name, platform , Genre , total_sales from Video_Games_sales over ( order by );



# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
select genre, publisher , row_number() 
over (partition by platform order by year_of_release) 
from video_games_sales;

# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
select year_of_release ,avg(global_sales) 
over( partition by year_of_release  order by year_of_release desc) 
from video_games_sales;

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 
----- select name,publisher,critic_count,row_number() over (partition by publisher order by critic_count desc ) from video_games_sales;

use inclass;
-- ---------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-- ----------------------------------------------------------------------------------
select * from web;
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date

Select Website_id,No_Users,
lead(day,2) over(order by day) Opening_Day
from Website_Stats;
select * from website_stats;


# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.
Select Website_id,Day,Income,
First_Value(Income) over(order by income) First_day_income
from website_Stats
where Website_id = 1;


-- ---------------------------------------------------------------
# Dataset Used: play_store.csv 
-- ---------------------------------------------------------------
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
Select ID, Game_Name,Genre,Released, Date_of_Release,
Rank() over(order by Released) Ranking,
dense_Rank() over(Order by Released) dense_ranking,
Row_number() over(Order by Released) Row_no
from Play_Store;