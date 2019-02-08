USE Company
GO

-- 1. Find All Information About Departments

SELECT * FROM [Departments]
GO

-- 2. Find all Department Names

SELECT d.Name
FROM Departments AS d
GO

-- 3. Find Salary of Each Employee

SELECT e.FirstName, e.LastName, e.Salary
FROM Employees AS e
GO

-- 4. Find Full Name of Each Employee

SELECT e.FirstName, e.MiddleName, e.LastName
FROM Employees AS e
GO

-- 5. Compose Email Address for Each Employee

SELECT CONCAT(e.FirstName, e.LastName, '@softuni.bg') AS Email
FROM Employees AS e
GO

-- 6. Find All Different Employee’s Salaries

SELECT DISTINCT e.Salary
FROM Employees AS e
GO

-- 7. Find all Information About Employees

SELECT *
FROM Employees AS e
WHERE e.JobTitle = 'Sales Representative'
GO

-- 8. Find Names of All Employees by Salary in Range

SELECT * 
FROM Employees AS e
WHERE e.Salary BETWEEN 20000 AND 30000
GO

-- 9. Find Names of All Employees 

SELECT CONCAT(e.FirstName, ' ',
			 CASE (e.MiddleName)
			   WHEN NULL THEN ''
			   ELSE e.MiddleName + ' '
			 END, 
			 e.LastName) AS [Full Name]
FROM Employees AS e
GO

-- 9.1 Find Names of All Employees 

SELECT CONCAT(e.FirstName, ' ',
			 ISNULL(e.MiddleName, ''), ' ',
			 e.LastName) AS [Full Name]
FROM Employees AS e
GO

-- 10. Find All Employees Without Manager

SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE e.ManagerID IS NULL
GO

-- 11.  Find All Employees with Salary More Than 50000

SELECT e.FirstName, e.LastName, e.Salary
FROM Employees AS e
WHERE e.Salary > 50000
ORDER BY e.Salary DESC
GO

-- 12. Find 5 Best Paid Employees

SELECT TOP(5) e.FirstName, e.LastName
FROM Employees AS e
WHERE e.Salary > 50000
ORDER BY e.Salary DESC
GO

-- 13. Find All Employees Except Marketing

SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE e.DepartmentID <> (SELECT d.DepartmentID
						 FROM Departments AS d
						 WHERE d.Name = 'Marketing')
GO

-- 13.1 Find All Employees Except Marketing

SELECT e.FirstName, e.LastName
FROM Employees AS e
INNER JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE d.Name <> 'Marketing'
GO

-- 14. Sort Employees Table

SELECT *
FROM Employees AS e
ORDER BY e.Salary DESC, e.FirstName ASC, e.LastName DESC, e.MiddleName ASC
GO

-- 15. Create View Employees with Salaries

CREATE VIEW EmployeesWithSalaries AS
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees AS e
GO

-- 16. Create View Employees with Job Titles

CREATE VIEW EmployeesWithJob AS
SELECT (e.FirstName + e.LastName) AS [Full Name],
		e.JobTitle AS [Job Title]
FROM Employees AS e
GO

-- 17. Distinct Job Titles

SELECT DISTINCT e.JobTitle
FROM Employees AS e
GO

-- 18. Find First 10 Started Projects

SELECT TOP(10) *
FROM Projects AS p
ORDER BY p.StartDate ASC, p.Name
GO


-- 19. Last 7 Hired Employees

SELECT TOP(7) e.FirstName, e.LastName, E.HireDate
FROM Employees AS e
ORDER BY e.HireDate DESC

-- 20. Increase Salaries

UPDATE Employees
SET Salary = Salary / 1.12
WHERE EmployeeID IN(
		SELECT e.EmployeeID
		FROM Employees AS e
		WHERE e.DepartmentID IN (
				SELECT d.DepartmentID
				FROM Departments AS d
				WHERE d.Name IN ('Engineering',
							  'Tool Design',
							  'Marketing',
							  'Information Services')))
GO

SELECT e.FirstName, e.DepartmentID, e.Salary FROM Employees AS e






















