-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

use sample;
# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.


use sample; 
 SELECT * FROM sample.cricket_1
union
SELECT * FROM sample.cricket_2;
 

# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select Player_Id , Player_Name 
from cricket_1
where Runs >50;

# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select * from cricket_1 where Player_Name like 'y%v';


# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
select * from cricket_1 where player_name not like '&t';
 
 
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to create a new column PC_Ratio that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
SELECT * FROM sample.cric_combined;

alter table cric_combined add column PC_Ratio decimal(10,2);
select *,
(Popularity/Charisma)  as PC_Ratio from cric_combined;



# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
select * from cric_combined order by Popularity desc limit 5;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.

select * from cric_combined 
where Player_Name like '%D%';

# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
#Player_ID, PC_Ratio 
select * from cric_combined
where PC_Ratio between 0.12 and 0.25;
-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
select * from new_cricket
where Charisma is null;

 
# Q10. Write a MySQL query to display all the NULL values imputed with 0.
select * ,
ifnull(Charisma,0)
from new_cricket;

# Q11. Separate all Player_Id into single numeric ids (example PL1 =  1).
select
substr(Player_ID,3)
from new_cricket;


# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select Player_ID,PLayer_Name 
from new_cricket
where Charisma>25;


-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
select
round(MonthlyServiceCharges,1),
ceil(TotalAmount),paymentmethod
from Churn_Details
where PaymentMethod='Electronic check';

# Q14. Rename the table churn1 to “Churn_Details”.
alter table churn1 rename to Churn_Details;

# Q15. Write a query to create a new column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
alter table Churn_Details add column new_Amount decimal(10,2);
select * ,
(TotalAmount + MonthlyServiceCharges) as new_Amount from Churn_Details;

# Q16. Rename column new_Amount to Amount.
ALTER TABLE Churn_Details
RENAME COLUMN new_Amount TO Amount;


# Q17. Drop the column “Amount” from the table “Churn_Details”.
alter table Churn_Details drop column Amount;

# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerID ,InternetConnection, gender
from Churn_Details
where InternetConnection like '_i%';


# Q19. Find the records where the tenure is 6x, where x is any number.
select * 
from Churn_Details
where (tenure %6)=0;

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
select upper(player_name),ifnull(charisma,0) from new_cricket
order by player_name;

