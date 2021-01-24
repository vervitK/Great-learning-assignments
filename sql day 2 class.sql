use hr;

select * 
from employees
where first_name like'Al%';

select * 
from employees
where first_name like'A_e%';


select * 
from employees
where first_name like '%h_'
Order  by first_name asc # by default it it ascending sort 
# same as head , enter the number of rows _ to view / offset of 2 (first 2 rows are not displayed )
limit 2,5;  


select count(*) # totalnumber of employess in the number of table 
from employees;

# unique values 
select distinct last_name 
from employees;
# unique values 
select count( distinct department_id )
from employees;

select truncate(367.345345,-1);


select sqrt(10);

select sin(110);
select degrees(100);	
select log(12321);		


select first_name , round(salary)
from employees;

select ucase(first_name )
from employees;

select concat(first_name ,' ', last_name)
from employees;

select character_length(first_name)
from employees;

#select substr('hello how are you ',2,22);
#select substr('hello world',4,10);

select concat(substr(first_name,1,1),'.', substr(last_name,1,1))
from employees;


SELECT substr(last_name,0,2)
from employees;

select date_sub(current_date(), interval 30 day);

select str_to_date('01,04,1999','%d,%m,%y');

select hour(current_timestamp()),minute(current_timestamp());

select first_name, salary ,
if(salary <=10000,'low','high')
from employees;

select first_name , salary,
case when salary < 10000 then 'low' 
when salary >10000 then 'high'
else 'moderate'  
end as salaly_bracket
from employees;

select * from employees;

select first_name , commission_pct,
if (commission_pct is null ,'unpaid','paid')
from employees;

select first_name , commission_pct,
ifnull(commission_pct,'not paid')
from employees;

select first_name , last_name
from employees
union all # union 
select first_name , last_name
from employees;



