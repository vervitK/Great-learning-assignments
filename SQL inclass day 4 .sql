# Pre-Requsites
# Assuming Candidates are familiar with “Group by” and “Grouping functions” because these are used along with JOINS in the questionnaire. 

Table Definitions:

1. BANK_CUSTOMER - Details of Customers of the Bank
2. BANK_CUSTOMER_EXPORT - Details of Customers of the Bank - to be used only when explicitly asked.
3. Bank_Account_Details - Account Details of the customers along with ADD on cards. One customer can have multiple details for Savings deposits, Recurring deposits, Credit Cards and Add on credit cards.
4. Bank_Account_Relationship_Details - Details of secondary accounts linked to primary accounts.
5. BANK_ACCOUNT_TRANSACTION - Details of the transactions.
6. BANK_CUSTOMER_MESSAGES - Details of Messages sent to customers after a transaction takes place.
7. BANK_INTEREST_RATE - Current interest rates for savings, RD and other accounts.
8. Bank_Holidays - Details of Bank Holidays.


# Create below DB objects 
create database Inclass;
use hr;
CREATE TABLE BANK_CUSTOMER 
( customer_id INT PRIMARY KEY,
customer_name VARCHAR(20),
Address 	VARCHAR(20),
state_code  VARCHAR(3) ,    	 
Telephone   VARCHAR(10)	);
				
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",  	"CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow", 	"NY" , "1897614000");



CREATE TABLE BANK_CUSTOMER_EXPORT 
( 
customer_id CHAR(10)PRIMARY KEY,
customer_name CHAR(20),
Address CHAR(20),
state_code  CHAR(3) ,    	 
Telephone  CHAR(10));
    
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123001 ","Oliver", "225-5, Emeryville", "CA" , "1897614500") ;
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123002 ","George", "194-6,New brighton","MN" , "189761700");


#Bank_Account_details table

CREATE TABLE Bank_Account_Details
(Customer_id INT,
Account_Number VARCHAR(19) PRIMARY KEY,
Account_type VARCHAR(25) ,
Balance_amount INT,
Account_status VARCHAR(10),             	 
Relationship_type varchar(1)) ;

ALTER TABLE Bank_Account_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);

INSERT INTO Bank_Account_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , 200000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123001, "5000-1700-3456", "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO Bank_Account_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS", 400000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" ,750000,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123004, "5000-1700-6091", "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123004, "4000-1956-3401",  "SAVINGS" , 655000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123005, "4000-1956-5102",  "SAVINGS" , 300000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, "4000-1956-5698",  "SAVINGS" , 455000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , 355000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S");
INSERT INTO Bank_Account_Details  VALUES (123007, "9000-1700-7777-4321",  "Credit Card"	,0  ,"INACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123007, '5900-1900-9877-5543', "Add-on Credit Card" ,   0   ,"ACTIVE", "S");
INSERT INTO Bank_Account_Details  VALUES (123008, "5000-1700-7755",  "SAVINGS"   	,0   	,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5800-1700-9800-7755', "Credit Card"   ,0   	,"ACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5890-1970-7706-8912', "Add-on Credit Card"   ,0   	,"ACTIVE", "S");
INSERT INTO Bank_Account_Details VALUES (123004,'5000-1700-7791','RECURRING DEPOSITS',40000,'ACTIVE','S');


# CREATE TABLE Bank_Account_Relationship_Details

CREATE TABLE Bank_Account_Relationship_Details
( Customer_id INT ,
Account_Number VARCHAR(19) PRIMARY KEY ,
Account_type VARCHAR(25),
Linking_Account_Number VARCHAR(19) 
);

ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);
ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Linking_Account_Number) REFERENCES bank_account_details(Account_Number);

								
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" , "4000-1956-3456");  
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" , "4000-1956-2001" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-7791",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, "9000-1700-7777-4321",  "Credit Card" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5900-1900-9877-5543', 'Add-on Credit Card', '9000-1700-7777-4321' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5800-1700-9800-7755', 'Credit Card', '4000-1956-5698' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5890-1970-7706-8912', 'Add-on Credit Card', '5800-1700-9800-7755' );


# CREATE TABLE BANK_ACCOUNT_TRANSACTION

CREATE TABLE BANK_ACCOUNT_TRANSACTION 
(  
Account_Number VARCHAR(19),
Transaction_amount Decimal(18,2) , 
Transcation_channel VARCHAR(18) ,
Province varchar(3) , 
Transaction_Date Date
) ;

ALTER TABLE Bank_Account_Transaction ADD FOREIGN KEY (Account_number) REFERENCES Bank_Account_Details(Account_Number);

INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3456",  -2000, "ATM withdrawl" , "CA", "2020-01-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -4000, "POS-Walmart"   , "MN", "2020-02-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -1600, "UPI transfer"  , "MN", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -6000, "Bankers cheque", "CA", "2020-03-23");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -3000, "Net banking"   , "CA", "2020-04-24");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  23000, "cheque deposit", "MN", "2020-03-15");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-6091",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-7791",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3401",   8000, "Cash Deposit"  , "NY", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5102",  -6500, "ATM withdrawal" , "NY", "2020-03-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5698",  -9000, "Cash Deposit"  , "NY", "2020-03-27");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-9977",  50000, "ECS transfer"  , "NY", "2020-01-16");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -5000, "POS-Walmart", "NY", "2020-02-17");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -8000, "Shopping Cart", "MN", "2020-03-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -2500, "Shopping Cart", "MN", "2020-04-21");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5800-1700-9800-7755", -9000, "POS-Walmart","MN", "2020-04-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( '5890-1970-7706-8912', -11000, "Shopping Cart" , "NY" , "2020-03-12") ;



# CREATE TABLE BANK_CUSTOMER_MESSAGES

CREATE TABLE BANK_CUSTOMER_MESSAGES 
(  
Event VARCHAR(24),
Customer_message VARCHAR(75),
Notice_delivery_mode VARCHAR(15)) ;


INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Adhoc", "All Banks are closed due to announcement of National strike", "mobile" ) ;
INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Transaction Limit", "Only limited withdrawals per card are allowed from ATM machines", "mobile" );


INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    10000.00     ,'ECS transfer',     'MN' ,    '2020-02-16' ) ;

-- inserted for queries after 17th  
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    40000.00     ,'ECS transfer',     'MN' ,    '2020-03-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    60000.00     ,'ECS transfer',     'MN' ,    '2020-04-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    20000.00     ,'ECS transfer',     'MN' ,    '2020-03-20' ) ;

-- inserted for queries after 24th 

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    49000.00     ,'ECS transfer',     'MN' ,    '2020-06-18' ) ;




# CREATE TABLE BANK_INTEREST_RATE

CREATE TABLE BANK_INTEREST_RATE(  
account_type varchar(24)PRIMARY KEY,
interest_rate decimal(4,2),
month varchar(2),
year  varchar(4)
)	;

INSERT  INTO BANK_INTEREST_RATE VALUES ( "SAVINGS" , 0.04 , '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES ( "RECURRING DEPOSITS" , 0.07, '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES   ( "PRIVILEGED_INTEREST_RATE" , 0.08 , '02' , '2020' );

# Bank_holidays:

Create table Bank_Holidays (
Holiday  date PRIMARY KEY,
Start_time datetime ,
End_time timestamp);

Insert into bank_holidays values ( '2020-05-20','2020-05-20','2020-05-20' ) ;

Insert into bank_holidays values( '2020-03-13' ,'2020-03-13' ,'2020-03-13' ) ;




############################################ Questions ############################################


# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.
use hr;
select customer_id , customer_name , avg(account_balance)
from bank_customer bc
join bank_account_details ba
on bc.customer_id = ba.customer_id
group by customer_name;

# Question 2:
# 2) Print customer_id , account_number and balance_amount for all the accounts.
# for account_type = "Credit Card" apply the condition that if balance_amount is nil then assign transaction_amount 
select customer_id ,ba.Account_Number ,
case 
	when account_type like '&Credit%' and ifnull(balance_amount,0)=0 
						then transaction_amount 
	else balance_amount
end as 'balance_amount'
from bank_account_details bd
join Bank_Account_Transaction bat
on bd.Account_Number = bat.Account_Number;

# Question 3:
# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from Bank_Account_Details and 
# bank_account_transaction for all the transactions occurred during march,2020 and april, 2020
select ba.account_number , balance_amount,transaction_amount,Transaction_Date
from Bank_Account_Details ba
join bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
where Transaction_Date between 2020/03/01 and 2020/05/1;

# Question 4:
# 4) Print all the customer ids, account number,  balance_amount, transaction_amount , Transaction_Date 
# from bank_customer, Bank_Account_Details and bank_account_transaction tables where excluding 
# all of their transactions in march, 2020  month
select bc.customer_id, ba.account_number,  balance_amount, transaction_amount , Transaction_Date 
from bank_customer bc
join Bank_Account_Details ba
on bc.customer_id = ba.customer_id
join bank_account_transaction bat
on bat.Account_Number = ba.Account_Number
where year(Transaction_Date)=2020 and month(Transaction_Date) != (3);

# Question 5:
# 5) Print the customer ids, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.
select customer_id, ba.account_number, balance_amount,transaction_amount ,transaction_date
from Bank_Account_Details ba
join bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
where  year(Transaction_Date)=2020 and month(Transaction_Date) in (1,2,3);

# Question 6:
# 6) Print account_number, Event and Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to 
# display an “Adhoc" Event for all customers who have  “SAVINGS" account_type account.
select account_number, event ,Customer_message
from BANK_CUSTOMER_MESSAGES bcm
cross join Bank_Account_Details 
where event='adhoc' and account_type ='savings' ;


# Question 7:
# 7) Print all the Customer_ids, Account_Number, Account_type, and display deducted balance_amount by  
# subtracting only negative transaction_amounts for Relationship_type =
#  "P" ( P - means  Primary , S - means Secondary ) .
select Customer_id, ba.Account_Number, Account_type
case when Transaction_amount < 0 
	then balance_amount+transaction_amounts
    else bank_amount
end 'new_balance '
from Bank_Account_Details ba
join Bank_Account_Transaction bat
on ba.Account_Number = bat.Account_Number
where Relationship_type = 'p';



select * from Bank_Account_Details;
select * from Bank_Account_Transaction;
# Question 8:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
select bad.Account_type,bad.balance_amount, bad.account_number,bar.account_number,bar.account_type
from Bank_Account_Details bad
right join Bank_Account_Relationship_Details bar
on bad.account_number= bar.Linking_Account_Number;


# Question 9:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  
# transaction amount of accounts appeared  in another column.
select bad.Account_type,bad.balance_amount,bad.account_type, bad.account_number,bar.account_number,bar.account_type,bat.Transaction_amount
from Bank_Account_Details bad
join Bank_Account_Relationship_Details bar
on bad.account_number= bar.account_number
join Bank_Account_Transaction bat
on bat.account_number=bar.account_number;

# Question 10:
# 10) Display all account holders from Bank_Accounts_Details table who have “Add-on Credit Cards" and “Credit cards" 
select bad.Account_type,bad.balance_amount, bad.account_number
from Bank_Account_Details bad
where account_type like '%credit%';


# Question 11:
# 11)  Display  records of “SAVINGS” accounts linked with “Credit card" account_type and its credit
# aggregate sum of transaction amount.
select bad.balance_amount, bad.account_number , sum(Transaction_amount)
from Bank_Account_Details bad
right join Bank_Account_Transaction bat
on bat.Account_Number = bad.Account_Number
join Bank_Account_Relationship_Details bar
on bar.Account_Number = bad.Account_Number
where account_type = ('credit')
group by account_number ;



select * from Bank_Account_Relationship_Details;

# Ref: Use bank_Account_Details for Credit card types
		#Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 


# Question 12:
# 12) Display all type of “Credit cards”  accounts including linked “Add-on Credit Cards" 
# type accounts with their respective aggregate sum of transaction amount.
select bad.Account_type,bad.balance_amount, bad.account_number
from Bank_Account_Details bad
where account_type like '%credit%'
group by account_number;



# Ref: Check Bank_Account_Details_table for all types of credit card.
        # Check transaction_amount in bank_account_transaction. 
		
# Question 13:
# 13) Display “SAVINGS” accounts and their corresponding aggregate sum of transaction amount 
# of all recurring deposits
select bad.Account_type,bad.balance_amount, bad.account_number
from Bank_Account_Details bad
where account_type like '%saving%'
group by account_number;



# Question 14:
# 14) Display recurring deposits and their transaction amounts in  Feb 2020  along with 
# associated SAVINGS account_number , balance. 
select bar.account_type,bat.transaction_amount,ba.account_number,ba.balance_amount from 
bank_account_details ba join 
bank_account_relationship_details bar on ba.account_number=bar.linking_account_number
join bank_account_transaction bat on ba.account_number=bat.account_number where
bar.account_type like '%recurring%' and month(transaction_date)=2 and year(transaction_date)=2020
group by ba.account_type,bat.transaction_amount,ba.account_number,ba.balance_amount;
# Question 15:
# 15) Display every account's total no of transactions for every year and each month.
select account_number,year(transaction_date),month(transaction_date),count(*) from bank_account_transaction group by account_number,year(transaction_date),month(transaction_date);

# Question 16:
# 16) Compare the aggregate sum transaction amount of Feb2020 month versus Jan2020 Month for each account number.
-- Display account_number, transaction_amount , 
-- sum of feb month transaction amount ,
-- sum of Jan month transaction amount , 
select bat1.account_number  ,sum(bat2.account_number) as feb ,sum(bat1.account_number) as jan
from bank_account_transaction bat1 
join bank_account_transaction bat2
on bat1.account_number = bat2.account_number
where month(bat1.transaction_date)=1 and month(bat2.transaction_date) =2
group by bat1.account_number;
use hr;
# Question 17:
# 17) Display the customer names who have all three account types - 
# savings, recurring and credit card account holders.
select customer_name ,Account_type
from bank_customer bc
join  Bank_Account_Details bad
on bc.customer_id = bad.customer_id
where account_type like '%savings' and '%recurring%' ;


select * from Bank_Account_Details;

# Question 18:
# 18) Display savings accounts and its corresponding Recurring deposits transactions that are occuring more than 4 times.
select * from bank_account_details;
select * from bank_customer;
select * from bank_account_relationship_details;
select ba.account_type,bar.account_type,count(*) from bank_account_details ba join 
bank_account_relationship_details bar on ba.account_number=bar.linking_account_number
join bank_account_transaction bat on ba.account_number=bat.account_number group by
ba.account_type,bar.account_type having count(*)>4;

# Question 19:
# 19) Display savings accounts and its recurring deposits account with their aggregate 
# transactions per month occurs in 3 different months.
use hr;
select * 
from Bank_Account_Details bad
where account_type like '%Savings%'
group by Account_Number
join Bank_Account_Transaction bat
on bad.Account_Number = bat.Account_Number
where count(Transaction_Date) > 3;

select * from Bank_Account_Details;
# Question 20:
# 20) Find the no. of transactions of credit cards including add-on Credit Cards
select count(*) from bank_account_transaction bat join bank_account_details ba on
ba.account_number=bat.account_number where account_type like '%credit%';

