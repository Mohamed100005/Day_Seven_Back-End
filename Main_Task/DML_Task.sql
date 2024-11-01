CREATE DATABASE CompanyDB;
CREATE SEQUENCE EM_SEQ AS INT INCREMENT BY 1
CREATE TABLE Sales.employees
(
    employee_id INT PRIMARY KEY DEFAULT NEXT VALUE FOR EM_SEQ,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    salary DECIMAL,
);
ALTER TABLE Sales.employees ADD hire_date DATETIME;
-- DML

--Select all columns from the "employees" table.
SELECT *
FROM Sales.employees;

--Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name , last_name
FROM Sales.employees;

--Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT first_name + ' ' + last_name AS full_name
FROM Sales.employees;

--Show the average salary of all employees.
SELECT AVG(salary) AS Average_Salary
FROM Sales.employees;

--Find employees with salaries between 40000 and 60000.
SELECT *
FROM Sales.employees
WHERE salary BETWEEN 40000 AND 60000;

--Show employees with names containing the substring 'man.'
SELECT *
FROM Sales.employees
WHERE first_name LIKE '%man%';

--Display employees with a NULL value in the "hire_date" column.
SELECT *
FROM Sales.employees
WHERE hire_date IS NULL;

--Select employees with a salary in the set (40000, 45000, 50000).
SELECT *
FROM Sales.employees
WHERE salary IN (40000 , 45000, 50000);

--Retrieve employees hired between '2020-01-01' and '2021-01-01.'
SELECT *
FROM Sales.employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01';

--List employees with salaries in descending order.
SELECT *
FROM Sales.employees
ORDER BY salary DESC;

--Show the first 5 employees ordered by "last_name" in ascending order.
SELECT TOP(5)
    *
FROM Sales.employees
ORDER BY last_name ASC;

--Display employees with a salary greater than 55000 and hired in 2020.
SELECT *
FROM Sales.employees
WHERE salary > 55000 AND YEAR(hire_date) = '2020';

--Select employees whose first name is 'John' or 'Jane.'
SELECT *
FROM Sales.employees
WHERE first_name = 'John' OR first_name = 'Jane';

--List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT *
FROM Sales.employees
WHERE salary <= 55000 AND hire_date > '2022-01-01';

--Retrieve employees with a salary greater than the average salary.
SELECT *
FROM Sales.employees
WHERE salary > (SELECT AVG(salary)
FROM Sales.employees);

--Display the 3rd to 7th highest-paid employees.
SELECT *
FROM Sales.employees
ORDER BY salary DESC OFFSET 2 ROW FETCH NEXT 5 ROWS ONLY;

--List employees hired after '2021-01-01' in alphabetical order.
SELECT *
FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name ASC;

--Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT *
FROM Sales.employees
WHERE salary > 50000 AND last_name NOT LIKE 'A%';

--Display employees with a salary that is not NULL.
SELECT *
FROM Sales.employees
WHERE salary IS NOT NULL;

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT *
FROM Sales.employees
WHERE (first_name LIKE '%i%' OR first_name LIKE '%e%') AND salary > 45000;