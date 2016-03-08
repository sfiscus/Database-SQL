/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/4/15
*/

/* 
Request 1 
Date Accomplished: 5/4/15
*/

CREATE VIEW DEPTINFO AS (
  SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, D.LOCATION_ID, 
  E.first_name || ' ' || E.last_name AS "FULL NAME"
  FROM Departments d LEFT OUTER JOIN employees e
  ON(E.EMPLOYEE_ID = D.MANAGER_ID)
);

SELECT Department_ID, Department_Name, Manager_ID, Location_ID, 
COALESCE(NULLIF("FULL NAME", ' '), 'NO MANAGER') AS "FULL_NAME"
FROM DEPTINFO
ORDER BY DEPARTMENT_ID;

/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/4/15
*/

/* 
Request 2
Date Accomplished: 5/4/15
*/

SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY
FROM (
      SELECT * 
      FROM EMPLOYEES
      ORDER BY Salary desc
      )
WHERE rownum <= 4
ORDER BY Salary ;

/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/5/15
*/

/* 
Request 3
Date Accomplished: 5/5/15
*/
CREATE TABLE Dept_copy (
DEPARTMENT_ID	NUMBER(4,0),
DEPARTMENT_NAME	VARCHAR2(30 BYTE)
  CONSTRAINT dept_nn_name NOT NULL,
MANAGER_ID	NUMBER(6,0),
LOCATION_ID	NUMBER(4,0)
);

CREATE SEQUENCE dept_copy_seq
INCREMENT BY 10
START WITH 300
NOCACHE
NOCYCLE;

INSERT INTO Dept_copy
SELECT *
FROM Departments;

INSERT INTO Dept_copy VALUES (
  dept_copy_seq.NEXTVAL, 'Operations', 210, 1900  
);

INSERT INTO Dept_copy VALUES (
  dept_copy_seq.NEXTVAL, 'Research', 280, 2000  
);

SELECT *
FROM Dept_copy;

/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/6/15
*/

/* 
Request 4
Date Accomplished: 5/6/15
*/

SELECT CASE WHEN location_id=1700 THEN '1700' ELSE 'All Other Departments' END
AS "Departments", count(*) AS "Employees Per Department",
TO_CHAR(AVG(salary), '999999.99') AS "Average Salary"
FROM employees
JOIN departments USING(department_id)
WHERE department_id IS NOT NULL
GROUP BY CASE WHEN location_id=1700 THEN '1700' ELSE 'All Other Departments' END; 

/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/7/15
*/

/* 
Request 5
Date Accomplished: 5/9/15
*/
SELECT category, title, NVL2(category, 'Category Sum', 'Sum of Category') AS "Category Sum", 
NVL2(category, 'Inventory Sum', 'Sum of All Books') AS "Inventory Sum",  
SUM(paideach * quantity) AS "Total Paid", SUM(quantity) AS "Quantity"
FROM books JOIN orderitems USING(isbn)
GROUP BY ROLLUP(category, title)
ORDER BY category;

/*
Author: Sean Fiscus
Assignment: Project 3
Date: 5/6/15
*/

/* 
Request 6
Date Accomplished: 5/6/15
*/
Set serveroutput On
DECLARE
    v_department_id          departments.department_id%TYPE   ;
    v_department_name        departments.department_name%TYPE   ;
    v_city                   locations.city%TYPE    ;

 BEGIN

 SELECT d.department_id, d.department_name, l.city
      INTO v_department_id, v_department_name, v_city
      FROM departments d 
      JOIN locations l
      ON d.location_id = l.location_id
      WHERE   department_id = 110
  ;

 DBMS_OUTPUT.PUT_LINE 
   	( 'The department id of 110 is '  ||  v_department_name  
      ||  ' and is in '  ||  v_city || '.')
  ;

END  ;