USE employee_db;

-- 1. Write an SQL query to fetch the EmpId and FullName of all the employees working under Manager with id '986'
SELECT EmpID,FullName FROM employee_details WHERE ManagerId=986;

-- 2. Write an SQL query to fetch the different projects available from the EmployeeSalary table
SELECT DISTINCT Project FROM employee_salary;

-- 3. Write an SQL query to fetch the count of employees working in project 'P1'
SELECT COUNT(EmpId) FROM employee_salary WHERE Project='P1';

-- 4. Write an SQL query to find the maximum, minimum, and average salary of the employees
SELECT MAX(Salary) AS max_salary,MIN(Salary) AS min_salary,AVG(Salary) AS avg_salary
FROM employee_salary ;

-- 5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000
SELECT EmpID FROM employee_salary WHERE Salary BETWEEN 9000 AND 15000;

-- 6. Write an SQL query to fetch those employees who live in Toronto and work under manager with ManagerId '321'
SELECT*FROM employee_details WHERE City='Toronto' AND ManagerId=321;

-- 7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId '321'
SELECT*FROM employee_details WHERE City='California' OR ManagerId=321;

-- 8. Write an SQL query to fetch all those employees who work on Project other than P1
SELECT*FROM employee_salary WHERE  NOT Project='P1';

-- 9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value
SELECT EmpId,(Salary+Variable) AS total_salary FROM employee_salary;

-- 10.Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text "hn" and ending with any sequence of characters
SELECT FullName FROM employee_details WHERE FullName LIKE '__hn%';

-- 11. Write an SQL query to fetch all the EmpIds which are present in either of the tables - 'EmployeeDetails' and 'EmployeeSalary'
SELECT EmpId FROM employee_details
UNION
SELECT EmpId FROM employee_salary;

-- 12. Write an SQL query to fetch common records between two tables
SELECT*FROM employee_details 
WHERE EmpId IN (SELECT EmpId FROM employee_salary); 

-- 13.Write an SQL query to fetch records that are present in one table but not in another table
SELECT*FROM employee_details 
WHERE EmpId NOT IN(SELECT EmpId FROM employee_salary WHERE EmpId IS NOT NULL);

-- 14. Write an SQL query to fetch the EmpIds that are present in both the tables - 'EmployeeDetails' and 'EmployeeSalary'
SELECT ed.EmpId FROM employee_details ed
JOIN employee_salary es 
ON ed.EmpId=es.EmpId;

-- 15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary
SELECT EmpId FROM employee_details 
WHERE EmpId NOT IN (SELECT EmpId FROM employee_salary WHERE EmpId IS NOT NULL);
--     OR
SELECT ed.EmpId FROM employee_details ed
JOIN employee_salary es 
ON ed.EmpId=es.EmpId
WHERE es.EmpId IS NULL;

-- 16. Write an SQL query to fetch the employee full names and replace the space with ‘-’
SELECT REPLACE(FullName,' ','-') AS Modified_Name FROM employee_details;

-- 17. Write an SQL query to fetch the position of a given character(s) in a field.
SELECT FullName,INSTR(FullName, 'a') AS Position_a FROM employee_details;

-- 18.Write an SQL query to display both the EmpId and ManagerId together.
SELECT EmpId,ManagerId FROM employee_details;

-- 19.Write a query to fetch only the first name (string before space) from the FullName column of the EmployeeDetails table.
SELECT SUBSTRING_INDEX(FullName,' ',1) AS FIRST_NAME FROM employee_details;

-- 20.Write an SQL query to upper case the name of the employee and lower case the city values
SELECT UPPER(FullName) AS FULL_NAME_UPPER , LOWER(City) AS CITY_NAME_LOWER 
FROM employee_details;

-- 21.Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field
SELECT SUM(LENGTH(FullName)-LENGTH(REPLACE(FullName,'n',''))) AS Count_Of_n FROM employee_details;

-- 22.Write an SQL query to update the employee names by removing leading and trailing spaces
SELECT TRIM(FullName) as `Name` FROM employee_details;

-- 23. Fetch all the employees who are not working on any project.
SELECT ed.EmpId FROM employee_details ed LEFT JOIN employee_salary es 
ON ed.EmpId=es.EmpId
WHERE es.EmpId IS NULL;

-- 24. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
SELECT ed.FullName FROM employee_details ed
JOIN employee_salary es 
ON ed.EmpId=es.EmpId 
WHERE es.Salary>=5000 AND es.Salary<=10000;

-- 25. Write an SQL query to find the current date-time.
SELECT NOW() AS current_date_time;

-- 26. Write an SQL query to fetch all the Employees details from EmployeeDetails table who joined in the Year 2020.
SELECT*FROM employee_details WHERE YEAR(DateOfJoining)=2020;

-- 27.Write an SQL query to fetch all employee records from EmployeeDetails table who have a salary record in EmployeeSalary table.
SELECT*FROM employee_details 
WHERE EmpId IN (SELECT EmpId FROM employee_salary WHERE Salary );

-- 28.Write an SQL query to fetch project-wise count of employees sorted by project’s count in descending order.
SELECT Project,COUNT(*) AS no_of_employees FROM employee_salary
GROUP BY Project
ORDER BY COUNT(*) DESC;

-- 29.Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT ed.EmpId,ed.FullName,es.Salary
From employee_details ed LEFT JOIN employee_salary es
ON ed.EmpId=es.EmpId;

-- 30.Write an SQL query to join 3 tables
-- Assuming a third table eg:department(EmpId,DepartmentName)
SELECT ed.EmpId,ed.FullName,es.Salary,d.DepartmentName
FROM employee_details ed JOIN employee_salary es
ON ed.EmpId=es.EmpId 
Join department d ON ed.EmpId=d.EmpId;

-- 31.Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table
SELECT*FROM employee_details 
WHERE EmpId IN (SELECT DISTINCT ManagerId FROM employee_details);

-- 32.Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT FullName,COUNT(*)
FROM employee_details 
GROUP BY FullName
HAVING COUNT(*)>1;

-- 34.Write an SQL query to fetch only odd rows from the table.
SELECT*FROM employee_details WHERE EmpId%2=0;

-- 35.Write an SQL query to fetch only even rows from the table
SELECT*FROM employee_details WHERE EmpId%2=1;

-- 36.Write an SQL query to create a new table with data and structure copied from another table.
CREATE TABLE new_employee_details AS
SELECT*FROM employee_details;
SELECT*FROM new_employee_details;

-- 37.Write an SQL query to create an empty table with the same structure as some other table.
CREATE TABLE empty_employee_details AS
SELECT*FROM employee_details WHERE 1=0;
SELECT*FROM empty_employee_details;

-- 38.Write an SQL query to fetch top n records.
SELECT*FROM employee_details LIMIT 2;

-- 39.Write an SQL query to fetch the Nth highest salary from a table
SELECT Salary From(
SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC) AS DS
FROM employee_salary)
AS nth_highest WHERE DS=N;

-- 40.Write SQL query to find the 3rd highest salary from a table without using the TOP/limit keyword
SELECT Salary FROM(
SELECT Salary,DENSE_RANK() OVER(ORDER BY Salary DESC) AS DS
FROM employee_salary)
AS H WHERE DS=3;
