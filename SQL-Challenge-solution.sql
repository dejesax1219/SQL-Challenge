--List the following details of each employee: employee number, last name, first name, 
-- gender, and salary.

SELECT "a"."EmployeeNumber", "a"."FirstName", "a"."LastName", "a"."Gender", "b"."Salary"
FROM employee AS "a"
LEFT JOIN salary AS "b" ON ("a"."EmployeeNumber"="b"."EmployeeNumber");

--List employees who were hired in 1986.

SELECT "FirstName", "LastName" FROM employee 
WHERE "Hiredate" BETWEEN '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.


SELECT "de"."DepartmentNumber",
"d"."Department",
"e"."FirstName", "e"."LastName"
, "de"."Fromdate", "de"."Todate"
FROM "department_employee" as "de"
INNER JOIN "departments" as "d" ON ("de"."DepartmentNumber"="d"."DepartmentNumber")
INNER JOIN "employee" as "e" ON ("de"."EmployeeNumber"="e"."EmployeeNumber");

--  List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT "d"."Department",
"e"."EmployeeNumber", "e"."FirstName", "e"."LastName"
FROM "department_employee" as "de"
INNER JOIN "departments" as "d" ON ("de"."DepartmentNumber"="d"."DepartmentNumber")
INNER JOIN "employee" as "e" ON ("de"."EmployeeNumber"="e"."EmployeeNumber");

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT
	first_name,
	last_name
FROM employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.- 

SELECT "d"."Department",
"e"."EmployeeNumber", "e"."FirstName", "e"."LastName"
FROM "department_employee" as "de"
INNER JOIN "departments" as "d" ON ("de"."DepartmentNumber"="d"."DepartmentNumber")
INNER JOIN "employee" as "e" ON ("de"."EmployeeNumber"="e"."EmployeeNumber")
WHERE "Department" = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT "d"."Department",
"e"."EmployeeNumber", "e"."FirstName", "e"."LastName"
FROM "department_employee" as "de"
INNER JOIN "departments" as "d" ON ("de"."DepartmentNumber"="d"."DepartmentNumber")
INNER JOIN "employee" as "e" ON ("de"."EmployeeNumber"="e"."EmployeeNumber")
WHERE "Department" = 'Sales' OR "Department" ='Development'
;

-- In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT "LastName",
COUNT("LastName")
FROM employee
GROUP BY "LastName"
ORDER BY COUNT("LastName") DESC;
