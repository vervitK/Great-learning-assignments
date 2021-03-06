use supply_chain;
# 1.	Read the data from all tables.
select * from customer;
select * from orderitem; 
select * from orders;
select * from product;
select * from supplier;

# 2.	Find the country wise count of customers.
select  country,count(country)
from customer 
group by country;

# 3.	Display the products which are not discontinued.
select * from product
where IsDiscontinued = 0;

# 4.	Display the list of companies along with the product name that they are supplying.
select companyname, productname
from supplier s
join product p
on s.id = p.supplierid;

# 5.	Display customer's information who stays in 'Mexico'
select firstname ,lastname from customer
where city like '%mexico%';
select * from product;
# 6.	Display the costliest item that is ordered by the customer.
-- -----------------------------
select * 
from product order by unitprice desc limit 1
;
#join orders o
#on p.id = o.customerid;
# 7.	Display supplier id who owns highest number of products.
select * from supplier;
select count(supplierid),supplierid from product group by supplierid order by (count(supplierid)) desc limit 1;
#where supplierid = max(count(supplierid));
# 8.	Display month wise and year wise count of the orders placed.
select * from orders;

select year(orderdate), month(orderdate), count(*) from orders
group by year(orderdate), month(orderdate);

# 9.	Which country has maximum suppliers.
select count(country),country from supplier group by country order by count(country) desc limit 1;

# 10.	Which customers did not place any order.
select * from customer where customerid in (select customerid from orders group by id );

-- Section B --> Know the business 
#1.	Arrange the product id, product name based on high demand by the customer.
select * from orderitem;
select * from orders;
select * from product;

select productid,count(productid) , p.productname
from orderitem ot
join product p 
on ot.productid = p.id
group by productid 
order by(count(productid))desc;
#2.	Display the number of orders delivered every year.
select year(orderdate),count(orderdate) from orders
group by year(orderdate);

select * from orders;

#3.	Calculate year-wise total revenue.
select year(orderdate), sum(totalamount) from orders
group by year(orderdate);
#4.	Display the customer details whose order amount is maximum including his past orders.
select sum(totalamount) from customer;
select * from customer ;

select * from orders;
#5.	Display total amount ordered by each customer from high to low.
#A sales and marketing department of this company wants to find out how frequently customer have business with them. This can be done in two ways. (Answer Q 6 and Q 7 for the same)
select firstname,sum(o.totalamount)
from orders o 
join customer s
on o.customerid =s.id 
group by customerid
order by sum(o.totalamount) desc;

#6.	Approach 1. List the current and previous order amount for each customers.
select firstname,lastname, lag(totalamount) 
over (partition by firstname order by orderdate) 
from customer c
join orders o
on c.id = o.customerid  ;

#7.	Approach 2. List the current and previous order amount for each customers.
select firstname,lastname, lag(totalamount) 
over (partition by firstname order by orderdate) 
from customer c
join orders o
on c.id = o.customerid ;

#8.	Find out top 3 suppliers in terms of revenue generated by their products.
select * from supplier;
select * from product;
select * from orders;

# select * from orders where id  (select  from product 
select * 
from supplier where id in 
(select supplierid from product where id = any
(select productid from orderitem where orderid = any
(select ordernumber from orders)));



select s.companyname,s.id
from supplier s
join product p 
on s.id = p.supplierid
join orderitem ot
on ot.productid = p.id
join orders o
on o.id = ot.orderid
group by s.id
order by totalamount
limit 3;


#9.	Display latest order date (should not be same as first order date) of all the customers with customer details.


#10.	Display the product name and supplier name for each order
select ot.orderid , s.companyname, p.productname
from supplier s
join product p
on p.supplierid = s.id
join orderitem ot
on p.id = ot.productid 
;

-- Section C --> Business Analysis 
# 1.	Fetch the records to display the customer details who ordered more than 10 products in the single order
select firstname 
from customer where id = any 
(select customerid from orders where  id = any (
select orderid from orderitem where quantity > 10) ) ;
# 2.	Display all the product details with the ordered quantity size as 1.
select * from product where supplierid =any 
(select productid from orderitem where quantity = 1 );

# 3.	Display the compan(y)ies which supplies products whose cost is above 100.

select * from product where unitprice > 100;

# 4.	Create a combined list to display customers and supplier list as per the below format.
select * from product;
select * from orders;
select * from orderitem;
select * from supplier;

select 'supplier' as ctype , contactname, city, country, phono 
from supplier ;
union all
select 'customer' as ctype , concat() as contactdetals , city, country ,phon
from customer ;

# 5.	Display the customer list who belongs to same city and country arrange in country wise.
select firstname, s.city 
from supplier s
join product p
on s.id = p.supplierid
join orderitem ot
on p.id = ot.productid
join orders o
on ot.orderid = o.id
join customer c
on c.id = o.CustomerId
where s.city = c.city
order by s.country ;
-- Section D --> Challenge 

#1.	Company sells the product at different discounted rates. Refer actual product price in product table and selling
# price in the order item table. Write a query to find out total amount saved in each order then display the orders 
#from highest to lowest amount saved. 

Select (P.unitPrice*oi.Quantity) Selling_Price,(oi.UnitPrice* oi.Quantity) Actual_Price,
((P.unitPrice*oi.Quantity)-(oi.UnitPrice* oi.Quantity)) as Total_Amount_Saved from OrderItem oi
join Product p 
on oi.Productid = p.id
order by Total_Amount_Saved desc;


#2.	Mr. Kavin want to become a supplier. He got the database of "Richard's Supply" for reference. Help him to pick: 
#a. List few products that he should choose based on demand.
#b. Who will be the competitors for him for the products suggested in above questions.
select * from orderitem;
select * 
from product p
join orderitem ot
on p.id = ot.productid 
group by p.productid
order by ot.quantity desc;


select quantity, productname from orderitem ot
join product p
on p.productid = ot.id
order by quantity desc
;
#3.	Create a combined list to display customers and suppliers details considering the following criteria 
#•	Both customer and supplier belong to the same country
#•	Customer who does not have supplier in their country
#•	Supplier who does not have customer in their country
select companyname ,  s.city,firstname,lastname,c.city,c.country
from supplier s
join product p
on s.id = p.supplierid
join orderitem ot
on p.id = ot.productid
join orders o
on ot.orderid = o.id
join customer c
on c.id = o.CustomerId
;

#4.	Every supplier supplies specific products to the customers. Create a view of suppliers and total sales made by their 
#products and write a query on this view to find out top 2 suppliers (using windows function RANK()
# in each country by total sales done by the products.
Select CompanyName as Supplier,TotalAmount as TotalSale,
rank() over(Partition by CompanyName order by totalAmount desc) Rank_Supplier 
from supplier_totalsales
group by Supplier
order by Rank_Supplier desc limit 2
;

#5.	Find out for which products, UK is dependent on other countries for the supply. List the countries which are supplying 
#these products in the same list.
select p.productname,p.supplierid 
from product p
join supplier s 
on s.id = p.supplierid
where country not like '%uk%';
