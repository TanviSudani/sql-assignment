use hrdb;

-- 1. Write a query to display the last name and hire date of any employee in the same 
-- department as SALES. 
select last_name, hire_date from employees
  join departments
  on employees.department_id=departments.department_id
  where department_name like 'sales';

-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary. 
select employee_id,last_name,salary from employees where salary > (select avg(salary) from employees) order by salary ;
select avg(salary) from employees;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a 'u' in their name.
select employee_id, last_name from employees
  where last_name like '%u%';

-- 4. Display the last name, department number, and job ID of all employees whose 
-- department location is ATLANTA. 

-- 5. Display the last name and salary of every employee who reports to FILLMORE.

 
-- 6. Display the department number, last name, and job ID for every employee in the 
-- OPERATIONS department. 
 select department_name, last_name, job_id from employees  
  join departments
  on employees.department_id=departments.department_id
  where department_name  = 'Operations';
  
-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any 
-- employee with a 'u'in their name. 
select employee_id, last_name , salary from employees
  where salary > 6461 and last_name like '%u%';

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept. 
select concat(first_name, " ", last_name) as 'Name'from employees
  join departments
  on employees.department_id=departments.department_id
  join jobs
  on employees.job_id=jobs.job_id 
  where job_id='SA_MAN' or 'SA_REP';

-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise. 


-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
-- names and salaries. 
select last_name,salary from employees order by salary desc limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees 
-- with a null commission should have O in the commission column 
select concat(first_name, " ", last_name) as 'Name', salary, commission_pct, 
case 
  when commission_pct is null then 0
  else commission_pct 
end as  commission_pct
from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and 
-- department information.
select first_name,last_name,departments.* from employees join departments
on employees.department_id = departments.department_id;