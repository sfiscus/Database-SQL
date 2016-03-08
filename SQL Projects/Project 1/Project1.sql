/*
Author: Sean Fiscus
Assignment: Project 1
Date: 2/21/15
*/

/* 
Request 1 
Date Accomplished: 2/21/15
*/
SELECT job_id, job_title
FROM jobs
WHERE job_title = 'Programmer'
OR job_title LIKE '%Manager%'
AND MAX_SALARY >= 10000;

/* 
Request 2 
Date Accomplished: 2/21/15
*/
SELECT employee_id, first_name || ' ' || last_name AS full_name, phone_number, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN TO_DATE('01-JAN-90') AND TO_DATE('31-DEC-95')
ORDER BY hire_date;

/* 
Request 3 
Date Accomplished: 2/21/15
*/
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, NVL(TO_CHAR(MANAGER_ID), '-NONE-') 
AS "Manager_ID", LOCATION_ID
FROM Departments;

/* 
Request 4 
Date Accomplished: 2/21/15
*/
SELECT e.employee_id, e.salary, NVL(TO_CHAR(e.department_id), ' '), 
NVL(TO_CHAR(d.department_name), ' ')
FROM EMPLOYEES e LEFT OUTER JOIN departments d
ON(e.department_id = d.department_id);

/* 
Request 5
Date Accomplished: 2/21/15
*/
SELECT MAX(Salary) AS "Highest Salary", MIN(Salary) AS "Lowest Salary", 
department_id
FROM employees
WHERE department_id = 50
OR department_id = 60
OR department_id = 80
OR department_id = 90
GROUP BY department_id
ORDER BY department_id DESC;

/* 
Request 6
Date Accomplished: 2/21/15
*/
SELECT employee_id, last_name, REPLACE(SUBSTR (phone_number, 5, 8), '.','-') 
AS "Phone Number", TO_CHAR(hire_date,'fmDD Month YYYY') AS "Hire Date"
FROM employees
WHERE department_id = 50;