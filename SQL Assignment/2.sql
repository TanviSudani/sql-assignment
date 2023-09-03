use hrdb;
select * from employees;
-- 1. Display the maximum, minimum and average salary and commission earned. 
select max(salary),min(salary),avg(salary) from employees where commission_pct != 0 ;

-- 2. Display the department number, total salary payout and total commission payout for each department. 
select department_id,sum(salary),sum(commission_pct) from employees group by department_id;

-- 3. Display the department number and number of employees in each department.
select department_id,count(first_name) from employees group by department_id;
 
-- 4. Display the department number and total salary of employees in each department. 
select department_id,sum(salary) as `Total Salary`,count(first_name) as `Total Employee` from employees group by department_id;
 
-- 5. Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
select first_name as ` ` from employees where commission_pct != 0 ;

-- 6. Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select concat(first_name,' ' ,last_name) as `Employees Name`,department_id as `Department No` ,ifnull(commission_pct,"No commission") as `commission` from employees;

-- 7. Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
select concat(first_name,' ' ,last_name) as `Employees Name` ,salary as `Salary`,
case 
	when commission_pct then commission_pct * 2 
    else 'No Commission'
end as `Commission * 2`
from employees;

-- 8. Display the employee's name, department id who have the first name same as another employee in the same department.
select count(first_name),first_name,employees.department_id from employees
join departments on employees.department_id = departments.department_id 
group by employees.department_id ,first_name
having count(first_name) >1 ;

-- 9. Display the sum of salaries of the employees working under each Manager.
select manager_id,sum(salary) from employees group by manager_id;
select * from employees;
select * from jobs; 

-- 10. Select the Managers name, the count of employees working under and the department ID of the manager. 
select department_id,count(*) from employees group by department_id;

-- 11. Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
select concat(first_name,' ', last_name),last_name,department_id,salary from employees where last_name like '_a%';

-- 12. Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
select department_id,avg(salary) as `sum of salary` from employees 
group by department_id
order by department_id; 

-- 13. Select the maximum salary of each department along with the department id.
select department_id,max(salary) from employees group by department_id; 

-- 14. Display the commission, if not null display 10% of salary, if null display a default value 1
select first_name,last_name,
case
	when commission_pct is null then 1
else 
	salary*0.10
end as commission
from employees;