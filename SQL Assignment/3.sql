use hrdb;
-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each 
-- column an appropriate label.
select concat(upper(SUBSTRING(last_name,2,1)) , SUBSTRING(last_name,3,3) )  as `name` from employees;

-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays 
-- the month on which the employee has joined.
select concat(first_name,' - ' ,last_name) as '',hire_date from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus 
-- amount of 1500 each. Provide each column an appropriate label.
select last_name,
case 
	when salary/2 > 10000  then salary*0.10
    else salary*0.115

end as commission
from employees;
select last_name ,salary from employees;
SELECT
    last_name AS "Employee Last Name",
    CASE
        WHEN salary * 0.5 > 10000 THEN ROUND(salary * 1.1 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
    END AS "New Salary with Bonus"
FROM
    employees;
    
-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name 
-- consists of 'z' replace it with '$! 
select concat(substr(employee_id,1,2),'20',substr(employee_id,3),'E'),department_id,salary from employees;


-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees 
-- whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names
select concat(upper(substr(last_name,1,1)),substr(last_name,2),'-> ',char_length(last_name) ) 
as `Last name and lenght of name start with A,J,M` from employees 
where last_name like 'A%' or last_name like 'M%' or last_name like 'J%' ;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 
select last_name,concat('$',format(salary,15)) as salary from employees;

-- 7. Display the employee's name if it is a palindrome 
select first_name,
case 
	when first_name = reverse(first_name) then first_name 
    
end as `palindrome`
from employees;

-- 8. Display First names of all employees with initcaps.
select first_name from employees;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 


-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters  
-- should be in lower case. Display this along with their First Name. 
select lower(concat(substr(first_name,1,1),substr(last_name,1),'@systechusa.com'))as `e-mail address` from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 
select first_name,job_title from 
employees join jobs 
on employees.job_id = jobs.job_id
where job_title = 'stock clerk';

-- 12. Display the names and department name of all employees working in the same city as Trenna.
select first_name,department_name,departments.location_id,city from 
employees join departments 
on employees.department_id = departments.department_id
join locations on
departments.location_id = locations.location_id where city = 'South San Francisco';

-- 13. Display the name of the employee whose salary is the lowest. 
select first_name from employees where first_name = (select min(salary) from employees);

-- 14. Display the names of all employees except the lowest paid.
select first_name,salary from employees order by salary limit 2,200;