# Datasets used: employee_details.csv and Department_Details.csv
# Use subqueries to answer every question
create database employee;
CREATE SCHEMA IF NOT EXISTS Employee;
USE Employee;
# import csv files in Employee database.

SELECT * FROM DEPARTMENT_DETAILS;
SELECT * FROM EMPLOYEE_DETAILS;


#Q1. Retrive employee_id , first_name , last_name and salary details of those employees whose salary is greater than the average salary of all the employees.
select employee_id , first_name , last_name , salary from employee_details where salary > (select avg(salary) from employee_details);

#Q2. Display first_name , last_name and department_id of those employee where the location_id of their department is 1700
select first_name , last_name , department_id from employee_details where department_id = any (select department_id from department_details where location_id = 1700 );
select department_id from department_details where location_id = 1700;

#Q3. From the table employees_details, extract the employee_id, first_name, last_name, job_id and department_id who work in  any of the departments of Shipping, Executive and Finance.
select employee_id, first_name, last_name, job_id , department_id from employee_details where department_id in (select department_id from department_details where department_name like '%shipping%');
select department_id from department_details where department_name like '%shipping%';   

#Q4. Extract employee_id, first_name, last_name,salary, phone_number and email of the CLERKS who earn more than the salary of any IT_PROGRAMMER.
select employee_id , first_name, last_name,salary, phone_number , email 
from employee_details where salary > 
(select job_id from employee_details where job_id like '%it_prog%'  order by salary limit 1 ) 
and job_id like '%clerk%' ;

#Q5. Extract employee_id, first_name, last_name,salary, phone_number, email of the AC_ACCOUNTANTs who earn a salary more than all the AD_VPs.
select employee_id, first_name, last_name,salary, phone_number, email 
from employee_details where salary >
( select salary from employee_details where job_id like '%ad_vp%' order by salary limit 1) 
and job_id like '%AC_ACCOUNTANT%';

#Q6. Write a Query to display the employee_id, first_name, last_name, department_id of the employees who have been recruited in the recent half timeline since the recruiting began. 
select employee_id, first_name, last_name, department_id 
from employee_details where hire_date in 


alter table add column
update employee_details
set hiredate = str_to_sate(hire_date,date);
#Q7. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees belonging to the 'Contracting' department 
select employee_id, first_name, last_name, phone_number, salary , job_id 
from employee_details where department_id in 
(select department_id from department_details where department_name like '%contracting%');

#Q8. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees who does not belong to 'Contracting' department
select employee_id, first_name, last_name, phone_number, salary , job_id from employee_details where department_id in (select department_id from department_details where department_name not like '%contracting%');

#Q9. Display the employee_id, first_name, last_name, job_id and department_id of the employees who were recruited first in the department
select employee_id, first_name, last_name, job_id , department_id from employee_details where hire_date = (select * from employee_details group by job_id );
select first_name , department_id 
from employee_details 
group by department_id
order by hire_date
 ;

select * from employee_details where department_id in 
(select department_id  from employee_details
group by department_id )
;
SELECT * FROM EMPLOYEE_DETAILS;

#Q10. Display the employee_id, first_name, last_name, salary and job_id of the employees who earn maximum salary for every job.
select employee_id, first_name, last_name, salary , job_id from employee_details where salary in ( select max(salary) from employee_Details group by DEPARTMENT_ID);


