use hrdb;

-- 1. Write a query to display the last name, department number, department name for all employees.
select last_name,department_name from 
employees join departments on 
employees.department_id = departments.department_id ;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select department_id,department_name, street_address from locations
join departments
on locations.location_id= departments.location_id;

-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission. 
select e.last_name, d.department_name,commission_pct, l.location_id, l.city from employees e
join departments d 
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where e.commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' 
-- in their last name 
select last_name,department_name from 
employees join departments 
on employees.department_id = departments.department_id
where last_name like '%a%';

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
select last_name,job_title,employees.department_id,department_name from 
employees join jobs
on employees.job_id = jobs.job_id join departments
on employees.department_id = departments.department_id;

-- 6. Display the employee last name and employee number along with their manager's last 
-- name and manager number. 
select last_name,employee_id from employees;

-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager).
select last_name,employee_id from employees;
 
-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee. 
SELECT last_name,department_id from employees order by department_id;

-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
SELECT concat(e.first_name, ' ', e.last_name) AS employee_name,e.job_id AS job,d.department_name,e.salary,
    CASE
        WHEN e.salary >= 50000 THEN 'A'
        WHEN e.salary >= 30000 THEN 'B'
        ELSE 'C'
    END AS grade
FROM employees e
JOIN departments d
  ON e.department_id = d.department_id;


-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date
select concat(first_name,' ',last_name) as `Employee Name`,hire_date as `emp_hire_date`  from employees;