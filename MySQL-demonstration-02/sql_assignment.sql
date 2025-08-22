-- Database creation
CREATE DATABASE assignment_demo;
USE assignment_demo;

-- To delete a database
DROP DATABASE assignment_demo;

-- Drop table before creating, so that avoid error if table already exists
DROP TABLE IF EXISTS employees;

-- Table creation
CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert data
INSERT INTO employees VALUES 
(1, 'John Doe', 'IT', 55000.00),  
(2, 'Jane Smith', 'HR', 45000.00),  
(3, 'Sam Wilson', 'Finance', 60000.00); 

-- Retrive data
SELECT * FROM employees;

-- Retrieve employees from IT department
SELECT * FROM employees
WHERE department = 'IT';

-- Adding/inserting employees
INSERT INTO employees (emp_id, name, department, salary) VALUES
(4, 'Ravi Kumar', 'IT', 55000.00),
(5, 'Priya Sharma', 'HR', 45000.00),
(6, 'Arjun Verma', 'IT', 58000.00),
(7, 'Vikram Das', 'Finance', 58000.00);
SELECT * FROM employees;

-- Updating/modifying an existing row
UPDATE employees
SET salary = 60000.00
WHERE emp_id = 4; -- Updates Ravi Kumar's salary
SELECT * FROM employees;
-- Group by department employees
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Order by Salary
SELECT * FROM employees
ORDER BY salary DESC;

-- top N records
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Delete an employee
DELETE FROM employees WHERE emp_id = 2;
SELECT * FROM employees;

-- For backup the file, run the below code
-- mysqldump -u root -p	 CompanyDB > companydb_backup.sql
-- or do manually