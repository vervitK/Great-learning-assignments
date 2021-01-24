use inclass;
###################### Use 'account_details' table from in-class exercise for below questions

# Q.1 Kim wants to pay Jeff 550 dollars after they both had lunch together. At the same time, GL NEWSLETTER is going to deduct 
# 150 dollars from Jeff's bank account as annual subscription. Write a query such that GL NEWSLETTER should be able to deduct the amount once Kim transfers 
# the amount to Jeff's account
# Solution: 
select * from bank_customer;
start transaction;
update account_Details set balance=balance-550 where first_name= 'kim';
update account_details set balance=balance+550 where first_name='jeff';
update account_details set balance=balance-150 where first_name='jeff';
commit;

######################################################################################################################################
# Create table:
CREATE TABLE BANK_ACCOUNT ( Customer_id INT, 		   			  
							Account_Number VARCHAR(19),
							Account_type VARCHAR(25),
							Balance_amount INT ,
                            Account_status VARCHAR(10), 
                            Relationship_type varchar(1), 
                            Primary Key (Customer_id));
# Insert records:
INSERT INTO BANK_ACCOUNT  VALUES (123001, "4000-1956-3456",  "SAVINGS"            , 200000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO BANK_ACCOUNT  VALUES (123002, "4000-1956-2001",  "SAVINGS"            , 400000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123003, "4000-1956-2900",  "SAVINGS"            ,750000,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "4000-1956-3401",  "SAVINGS"            , 655000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123005, "4000-1956-5102",  "SAVINGS"            , 300000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123006, "4000-1956-5698",  "SAVINGS"            , 455000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "5000-1700-9800",  "SAVINGS"            , 355000 ,"ACTIVE" ,"P"); INSERT INTO BANK_ACCOUNT  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "9000-1700-7777-4321",  "CREDITCARD"    ,0      ,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123008, "5000-1700-7755",  "SAVINGS"            ,NULL   ,"INACTIVE","P"); 

select * from bank_account; 

# Q.2 Write a lock query such that whenever an User X perform trasaction customer_id 123001 in table bank_account, it should only allow other users
# to read the table and not perfrom any transaction till the lock is released by User X
# Solution:
start transaction;
select * from bank_account where customer_id = 123001 lock in share mode;



############################################################################################################################################
# Q.3 A customer approaches a bank and wishes to open a new account. Unknonwingly two bankers try to perform same entries in the bank_account table
#Table: Bank_account
#customer_id : 123009
#Account_number : '5000-1700-9800'
#Account_type: 'SAVINGS'
#balance: 20000
#status: 'ACTIVE'
#relationship: 'P'
#How the avoid duplicate entry into the table when two users try to insert the same record at a time.
#Solution:	
-- --------session 1
start transaction; 
select * from bank_account for update;
insert into bank_account values (123009,'5000-1700-9800','savings',20000,'active','p');
commit;

-- --- session 1
start transaction; 
select * from bank_account for update;
insert into bank_account values (123009,'5000-1700-9800','savings',20000,'active','p');
commit;
#############################################################################################################################################
-- ----------------------------------------------------
# Datset Used: admission_predict.csv
-- ----------------------------------------------------
# Q.4 A university is looking for candidates with GRE score between 330 and 340. Also they should be proficient in english 
#i.e. their Toefl score should not be less than 115. Create a view for this university.
#Solution:	
#create table uni_adm as
select * from admission_predict where `toefl score` > 115 and `gre score` between 330 and 340;

# Q.5 Create a view of the candidates with the CGPA greater than the average CGPA.
#Solution:	
create view cgpa as
select `serial no.`,cgpa from admission_predict where cgpa > (select avg(cgpa) from admission_predict);
select * from admission_predict;

 #############################################################################################################################################
 
-- -------------------------------------------------------------------------------------
# Datsets Used: world_cup_2015.csv and world_cup_2016.csv 
-- -------------------------------------------------------------------------------------
# Q.6 Create a view "team_1516" of the players who played in world cup 2015 as well as in world cup 2016.
#Solution:	
start transaction;
create view team_1516 as
select player_id from world_cup_2015 where player_id in (select player_id from world_cup_2016);

# Q.7 Create a view "All_From_15" that contains all the players who played in world cup 2015 but not in the year 2016Along with those players who played in both the world cup matches.
#Solution:	
use inclass;
select 
(select player_id from world_cup_2015 where player_id not in (select player_id from world_cup_2016)) as table_1,
(select player_id from world_cup_2015 where player_id in (select player_id from world_cup_2016)) as  table_2
from world_cup_2015; -- doubt


create view ALL_from_15 as select world_cup_2015.player_name from  world_cup_2015 left join world_cup_2016 on  world_cup_2015.player_id=world_cup_2016.player_id;
select * from  ALL_from_15;

# Q.8 Create a view "All_From_16" that contains all the players who played in world cup 2016 but not in the year 2015 Along with those players who played in both the world cup matches.
#Solution:

create view ALL_from_16 as select world_cup_2016.player_name from  world_cup_2015 right join world_cup_2016 on  world_cup_2015.player_id=world_cup_2016.player_id;
select * from  ALL_from_16;

# Q.9 Drop multiple views "all_from_16", "all_from_15", "players_ranked"
#Solution:

drop view all_from_16,all_from_15,team_1516;