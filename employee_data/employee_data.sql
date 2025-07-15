USE employee_data_db;

-- 1. Extract the 2-level reporting hierarchy of each employee from the Employee table.
-- Eg: Employee – Manager Level1 –Manager Level 2
-- DOUG->Larry->Brain
-- Reeta->Aalam->Parvati

SELECT e.Name AS Employee,
m1.Name AS Manager_Level1,
m2.Name AS Manager_Level2
FROM employee_data_table e 
LEFT JOIN employee_data_table m1
ON e.Manager=m1.Name
LEFT JOIN employee_data_table m2 
ON m1.Manager=m2.Name;



-- 2. Write a query to pull only the second highest salaries by team.
SELECT Name,Team,Salary FROM(
SELECT Name,Team,Salary,
DENSE_RANK() OVER(PARTITION BY Team ORDER BY Salary DESC) AS rnk
FROM employee_data_table) AS ranked WHERE rnk=2;

-- 3. Display the list of unique teams
SELECT DISTINCT(Team) FROM employee_data_table;

-- 4. Extract the names of the employees who has joined before their manager.
-- Eg: DAVE has joined in 2001 before his manager DOUG, who joined in 2011
SELECT e.Name,DATEDIFF(m.DOJ,e.DOJ) AS date_diff
FROM employee_data_table e JOIN employee_data_table m
ON e.Manager=m.Name WHERE m.DOJ>e.DOJ; 

-- 5. Create a flag variable that contains 1 if the employee salary is above the team’s average salary, else 0
SELECT  e.Name,e.Team,e.Salary,t.avg_team_salary, CASE
WHEN e.Salary>t.avg_team_salary THEN 1
ELSE 0
END AS Salary_flag
FROM employee_data_table e 
JOIN (SELECT Team,AVG(Salary) AS avg_team_salary FROM employee_data_table GROUP BY TEAM)t
ON e.Team=t.Team;


-- 6. Create table with the avg,min,max,sum of salaries by City
CREATE TABLE City_salary_stats AS
SELECT City,AVG(Salary) AS average_salary,
MIN(Salary) AS min_salary,
MAX(Salary) AS max_salary,
SUM(Salary) AS sum_salary
FROM employee_data_table
GROUP BY City;
SELECT*FROM City_salary_stats;

-- 7. Display the salary grades, for those avg salary is greater than 30,000
SELECT Sal_Grades,AVG(Salary) AS avg_salary
FROM employee_data_table GROUP BY Sal_Grades 
HAVING AVG(Salary)>30000;


-- 8. Create table with the employee data of city other than ‘NYC’ and salary grade other than ‘A,B,D'
CREATE TABLE filtered_employees AS
SELECT*FROM employee_data_table WHERE City!='NYC' AND Sal_Grades NOT IN('A','B','D');
SELECT*FROM filtered_employees;

-- 9. Create flag variable contains- “Premium” if salary > 36000, else “Standard”
SELECT EMPID,Name,Salary, 
CASE
WHEN Salary>36000 THEN 'Premium'
ELSE 'Standard'
END AS salary_flag
FROM employee_data_table;

-- 10. Create 3 new variables – Increase salary by 10%, 15% and 20%.
SELECT EMPID,Name,Salary,
Salary*1.1 AS raise_10pct,
Salary*1.15 AS raise_15pct,
Salary*1.20 AS raise_20pct
FROM employee_data_table;







