use hr;
select * from employees
where salary between 9000 and 17000
order by salary;

select * from employees
where salary >=8000 and (department_id = 50 or department_id = 80);

### or #### in class 

select * from employees
where salary >=8000 and department_id in (50,80);

### sub query 

select * from employees 
where department_id = ( select department_id from departments where department_name = 'Marketing');

# select list of enployees whose salary is greater than 
select * from employees where salary > (select avg(salary) from employees );

# emp details who all earning more than mim salary of all the dept 
select * from employees where salary in (select min(salary) from employees group by department_id);

# display list people managed by payam,
select * from employees where manager_id = (select employee_id from employees where first_name = 'Payam');

# first_name
select * from employees where department_id = (select department_id from employees where first_name ='clara') and first_name != 'clara' ;


select b.first_name , b.last_name from employees b where not exists (select 0 from employees a where a.manager_id = b.employee_id);

select * from employees where manager_id > (select * from departments where manager_id > 0 );

select ;

select * from departments where manager_id > 0;

use hr;
select * from employees where salary in (select salary from employees where first_name = 'Steven');

select department_id,count(job_id) 
from employees 
where 
department_id in (select job_id from employees  ) group by deaprtment_id ;


select department_id,count(job_id),job_id from employees 
where job_id in (select job_id from employees)
group by department_id, job_id with rollup; 


select employee_id, e.department_id, department_name from employees e
join (select department_id,department_name from departments )d
on e.deaprtment_id = d.department_id;


# display the department wise count with the department name 

select e.department_id, count(*) , department_name
from employees e
join (select department_id,department_name
from departments)d
on e.department_id = d.department_id
group by e.department_id;



select e.employee_id,e.first_name, e.salary, e.department_id , d.location_id 
from employees e
join (select location_id from departments)d
on e.department_id = d.department_id
join (select);

use hr;
select e.department_id, department_name, l.location_id
from employees e
join (select department_id,department_name
from departments)d
on e.department_id = d.department_id
join locations l 
on l.location_id = d.location_id
#where salary = (select max(salary) from employees
;


select e.employee_id , e.first_name
from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
where salary  = (select max(salary) from employees where year(hire_date)= 1997) ;

select department_id  from employees where employee_id = (select count(*) from employees );

select d.department_id,d.department_name ,e.cnt from (select department_id, count(employee_id) cnt from employees group by department_id) as e
join departments d
on e.department_id = d.department_id ;
#or join departments d using(department_id)

# display the max , min , avg count of employees considiring all the departments
select max(av), min(av), avg(av) from 
(select department_id, count(*) as av from employees group by department_id) as e;


select count(*) from employees where manager_id in (select manager_id from employees where  job_id like '%Clerk%') group by manager_id with rollup;

select output,count(*) from (
select *,
case
when job_id like '%clerk%' than 'clerk'
when job_id like '%mgr%' than 'manager' end as output
from (
select job_id from employees
where job_id like '%clerk%'
or job_id like '%mgr%')t)t2 group by output);



-- subquery in select clause
select department_id , department_name , 
(select count(employee_id) from employees where department_id=e.department_id) as cnt
from departments as e;







-- Advanced Aggregate Functions / windows function /

--
'

window_function_name(expression)
over (               // parenthesis is mandatory for over function
[partition_definition] - group by
[order_definition] - order by
[frame _definition ]- slices
)

'
;
select * from employees;

select first_name, salary , row_number() over(order by salary desc) from employees;

select row_number(),employee_id ,department_id,salary,
rank() over (partition by department_id order by salary ) rankk from employees;

select row_number() over(order by salary desc) from employees;

use hr;
select salary,employee_id,department_id,
rank() over (partition by department_id order by salary ) rankk,
dense_rank() over (partition by department_id order by salary ) dense_rankk,
percent_rank() over (partition by department_id order by salary ) percent_rankk,
cume_dist() over (partition by department_id order by salary ) cume_dist_
from employees
;

select salary,employee_id,department_id,
-- ranking


set autocommint = 0 ;
create database trans;
use trans;
create table t1 
(
no_ int ,
age int)
;

start transaction;
insert into t1 values (1,44);
commit;


select * from t1;
start transaction;
insert into t1 values (5,44);
insert into t1 values (2,44);
insert into t1 values (3,44);
insert into t1 values (4,44);
commit;

rollback;
start transaction;
insert into t1 values (6,44);
savepoint s1;
insert into t1 values (9,444);
insert into t1 values (89,434);
commit;
rollback;
select * from t1;


select * from t1 lock in share mode;
commit;
set autocommit = 0;
-- isolation
set transaction isolation level read uncommitted ;
start transaction;
select * from t1;
commit;

start transaction;
insert into t1 values (505,55335);
commit;


set transaction isolation level read committed ;
start transaction;
select * from t1;
commit;





use hr;
create view simple_ as
select * from employees;
-- simple view can be updated .
select * from simple_ ;
update simple_ set department_id = 80 where employee_id = 200;
update simple_ set ;


-- complex view cant be updated as it effect multiple tables at ones 
create view complex_ as 
select employee_id , department_id from employees where employee_id = 200;



delete from parent where id='101';
update paretn set id = '107' where id = 109 
-- cascade
drop table child 
create table child 
(
id int
dept varchar(10)
salary int ,
foreign 
)