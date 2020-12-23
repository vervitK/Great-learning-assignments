# Question 1:
# 1) Create a Database Bank

create database Bank;
use Bank;

# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purcahase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --


create table bank_inventory
(
product varchar(30),
qty integer,
price real,
purchase_cost decimal(6,2),
estimated_sale_price float
);

# Question 3:
# 3) Display all columns and their datatype and size in Bank_Inventory

describe bank_inventory

# Question 4:
# 4) Insert two records into Bank_Inventory .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56

insert into bank_inventory values('Paycard',2,300.45,8000.87,9000.56);
insert into bank_inventory values('PayPoints',4,200.89,7000.67,6700.56);
Select * from bank_inventory;
# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 

alter table bank_inventory
ADD Geo_location varchar(50);

insert into bank_inventory (Geo_loaction) values('Delhi')

# Question 6:
# 6) What is the value of Geo_Location for product : ‘PayCard’?

Select Geo_location
from bank_inventory
where  product = 'Paycard';

# Question 7:
# 7) How many characters does the  Product : ‘PayCard’ stores in the Bank_Inventory table.

select char_length(product) from bank_inventory where product='Paycard';

# Question 8:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table

update bank_inventory set
Geo_location = 'Delhi-city'
where  Geo_location is null ;

select char_length(Geo_location) from bank_inventory where Geo_location='Delhi-city';


# Question 9:
# 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 

alter table bank_inventory modify product varchar(10);

# Question 10:
# 10) Reduce the size of the Product field from 10 to 6 and check if it is possible 
alter table bank_inventory modify product varchar(6);
# error Data truncated for column 'product' at row 1

# Question 11:
# 11) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10  

update bank_inventory set
qty = 10
where  product = 'Paycard';


# Question 12:
# 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 

create table Bank_Holidays
(
dt date,
Start_time datetime,
End_time timestamp
);

 # Question 13:
# 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
insert into Bank_Holidays values(current_date(),current_date(),current_date());
update Bank_Holidays set dt = date_add(dt,interval 1 day);

# Question 14:
# 14) Modify  the Start_time data with today’s date in the Bank_Holidays table 
update Bank_Holidays set Start_time = current_timestamp();

# Question 15:
# 15) Update the End_time with current european time in the Bank_Holidays table. 
UPDATE Bank_Holidays SET END_TIME = utc_timestamp();

# Question 16:
# 16) Select all columns from Bank_Inventory without mentioning any column name
select * from Bank_Holidays;

# Question 17:
# 17)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
select product as new_product from bank_inventory;

# Question 18:
# 18)  Display only one record from bank_Inventory 
select * from bank_inventory limit 1;

# Question 19:
# 19) Display Holiday field as  DD-MM-YYYY format in Bank_holidays table. 
--  Ex: 10-February-2020
UPDATE Bank_Holidays SET END_TIME = date_format();

select date_format(dt,'%d-%m-%y')from Bank_Holidays;
# Question 20:
# 20) Display the first five characters of the Geo_location field of Bank_Inventory.
select substring('Delhi',1,5)  from bank_inventory;