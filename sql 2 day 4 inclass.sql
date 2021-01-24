
use inclass;
DROP TABLE IF EXISTS `account_details`;
CREATE TABLE IF NOT EXISTS `account_details` (
  `acc_id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `ssn` char(10) NOT NULL,
  `acc_holder_id` int(10) NOT NULL,
  `balance` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`acc_id`));
  
INSERT INTO `account_details` (`acc_id`, `acc_holder_id`, `balance`, `first_name`, `last_name`, `ssn`) VALUES
	(1, 100, 132.1020, 'Joseph', 'Cane', '098765432'),
	(2, 300, 4435.2030, 'Kim', 'Karry', '087654321'),
	(3, 120, 2345223.6600, 'Jim', 'Anderson', '123456780'),
	(4, 90, 98763.2300, 'Jessie', 'Thomson', '765432109'),
	(5, 110, 34221.1000, 'Palak', 'Patel', '654321890'),
	(6, 80, 7634.8000, 'Max', 'Jerrard', '456789012'),
	(7, 10, 876964.7000, 'Peter', 'Koshnov', '512345670'),
	(8, 110, 299876.6000, 'Monica', 'Irodov', '120088551'),
	(9, 100, 7659809.5300, 'Petro', 'Jenkins Jr', '123456789'),
	(10, 200, 111.1200, 'Jeff', 'Joshua', '765432189' );
    
select * from account_details;
# Q.1 Write a tansactional query that transfers 1000 dollars from Monica's account to Joseph's account
set autocommit = 0;
set sql_safe_updates = 0;
start transaction;
update account_details set balance = balance -1000 where first_name = 'monica';
update account_details set balance = balance +1000 where first_name = 'joseph';
select * from account_details;
commit;


# Q.2 Suppose while writing the above query you update i.e. transfer 1000 dollars to Peter's account instead of Joseph's account.
# Write a query to discard all the changes and end the transaction
start transaction ;
update account_details set balance = balance -1000 where first_name = 'monica';
update account_details set balance = balance +1000 where first_name = 'peter';
select * from account_details;
rollback;
select * from account_details;

commit;

#############################################################################################################################################
# Create table to answer the follwoing question
Create table id_passwords( user_id varchar(20), 
							passwords varchar(20));
insert into id_passwords values
		('deborah_a', 'pass123'),
		('pique_xav', '123789pix'),
        ('jenny_fawx', '##**000'),
        ('alpha_m','infinity');
select * from id_passwords;

# Q.3 Write a query to make sure that no other mysql session should be able to insert any user ids or passwords
lock table id_passwords  write ;

############################################################################################################################################# 
-- ----------------------------------------------------
# Datasets Used: employee_details.csv and department_details.csv
-- ----------------------------------------------------
unlock tables;
use inclass;


# Q.4 Create a view "details" that contains the columns employee_id, first_name, last_name and the salary from the table "employee_details".
create view details as 
select employee_id, first_name, last_name, salary from employee_details;

# Q.5 Update the view "details" such that it contains the records from the columns employee_id, first_name, last_name, salary, hire_date and job_id 
-- --  where job_id is ‘IT_PROG’.
create view detail as 
select employee_id, first_name, last_name, salary, hire_date, job_id from employee_details where job_id ='it_prog';


# Q.6 Create a view "check_salary" that contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary should be greater than 50000.
create table check_salary as
select employee_id, first_name, last_name, salary, hire_date, job_id from employee_details where salary > 5000;
 
 
# Q.7 Create a view "location_details" that contains the records from the columns department_name, manager_id and the location_id from the table "department_details" 
-- --  where the department_name is ‘Shipping’.
create table location_details as
select department_name, manager_id , location_id from department_details where department_name like '%shipping%';
select * from location_details;
# Q.8 Create a view "salary_range" such that it contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary is in the range (30000 to 50000).
create table salary_range as
select employee_id, first_name, last_name, job_id , salary from employee_details where salary between 30000 and 50000;

# Q.9 Create a view "pattern_matching" such that it contains the records from the columns employee_id, first_name, job_id and salary from the table name "employee_details" 
-- --  where first_name ends with "l".
create table pattern_matching as
select employee_id, first_name, job_id , salary from employee_details where first_name like '%l';

# Q.10 Drop multiple existing views "pattern_matching", "salary" and "location_details".
drop view pattern_matching ,salary,location_details;
# Q.11 Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".
create table employee_departments as
select * from employee_details where employee_id = any (select employee_id from department_details);

-- ----------------------------------------------------
# Datset Used: admission_predict.csv
-- ----------------------------------------------------
# Q.12 A university focuses only on SOP and LOR score and considers these scores of the students who have a research paper. Create a view for that university.
create table slr_focus as
select 'serial no.',sop,lor, research from admission_predict
where research = 1;
SELECT * FROM SLR_FOCUSs;
# Q.13 Create and append a new column "SOP_LOR_AVG" to the view "SLR_Focus".
alter view slr_focus as 
select (sop/lor)/2 from admission_predict;
select * from admission_predict;
#############################################################################################################################################
#Create Table:
CREATE TABLE BANK_CUSTOMER ( customer_id INT , 
			     customer_name VARCHAR(20), 
			     Address     VARCHAR(20),
			     state_code  VARCHAR(3) ,         
			     Telephone   VARCHAR(10)    );
		    
#Insert records:
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",      "CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow",     "NY" , "1897614000");

# Q.14 Suppose there is no customer_id: 123009 in the bank_customer table,
#One of the first user is trying to update the customer_id details with condition customer_id > 123008 and updating telephone as NULL.
#At the same time, if some other user is trying to insert a record with customer_id : 123009 with values ( 123009, 'Ropert' , '99-Bechkingam', 'CA' , 1867888950).
#During the above two transactions occuring at a same time, After first user checks the database , he recieves an additional record entry of 123009 which he doesn't expect.
#How will you restrict the second user entry?
set transaction isolation level repeatable read;
start transaction;
select * from bank_customer where customer_id > 123008 for update;
update bank_ccustomer set telephone = nill where customer_id > 123008;

-- user 2
insert into bank_customer values(123008,'ropert','99-abc','ca','123432443');
# Q.15 Write a query such that users can perform concurrent DML operations on the same customer_id = 123002 in bank_customer. 
# One user performs an updates House Address for that customer_id with "2999 New brighton" 
# Other user performs an update Telephone number with 189891899
start transaction;
select * from bank_account where customer_id = 123002 for update;
update bank_customer set telephone = 123423423 where customer_id =123002;
commit;

start transaction;
update bank_customer set address = '2999 new brighton' where customer_id = 123002;

# Q.16 Write a transaction on customer Id = 123001 in table: bank_customer to acquire shared lock . So others can also acquire the 
# shared lock but cannot modify any rows in the bank_customer table
start transaction;
select * from bank_customer lock in share mode;

#############################################################################################################################################
CREATE TABLE BANK_ACCOUNT ( Customer_id INT, 		   			  
							Account_Number VARCHAR(19),
							Account_type VARCHAR(25),
							Balance_amount INT ,
                            Account_status VARCHAR(10), 
                            Relationship_type varchar(1) ) ;
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


# Q.17 Write a transactional query such that a 3% interest is added in the balance_amount of all account_numbers 
# of a customer Id = 123001 in bank_account table. Make sure that no other users is able to make any update to the table
start transaction;
select * from bank_amount where customer_id = 123001 for update;
update Balance_amount set balance_amount = balance_amount + 0.03 * balance_amount where customer_id = 123001;

# Q.18 Three users are performing DML operations;
# Out of three users, one user increases  balance_amount by 0.03% of customer_id = 123001; in bank_account table.
# Write transactional query such that after the above update users can insert two different balance_amount concurrently for an account : '4000-1956-3401' parallely without any deadlock

set transaction isolation level read committed;

start transaction ;
select * from bank_account where accont_number = '4000-1956-3401' for update;
update Balance_amount set balance_amount = balance_amount + 0.03 * balance_amount where customer_id = 123001;
commit;


-- s2
start transaction;
insert into bank_account (accoount_number , balance_amount )
values ('4000-1956-3401',7700);

-- s3
start transaction;
insert into bank_account (accoount_number , balance_amount )
values ('4000-1956-3401',7750);


