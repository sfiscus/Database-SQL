/*
Author: Sean Fiscus
Assignment: Project 2
Date: 4/18/15
*/

/* 
Request 1 
Date Accomplished: 4/18/15
*/
CREATE TABLE EMPS (
EMPLOYEE_ID	NUMBER(6,0)
  CONSTRAINT emps_emp_id_pk PRIMARY KEY,
FIRST_NAME	VARCHAR2(20 BYTE)
  CONSTRAINT emp_nn_first_name NOT NULL,
LAST_NAME	VARCHAR2(25 BYTE)
  CONSTRAINT emp_nn_last_name NOT NULL,
EMAIL	VARCHAR2(25 BYTE)
  CONSTRAINT emp_nn_email NOT NULL
  CONSTRAINT emp_uq_email UNIQUE,
PHONE_NUMBER	VARCHAR2(20 BYTE),
HIRE_DATE	DATE
  CONSTRAINT emp_nn_hire_date NOT NULL,
JOB_ID	VARCHAR2(10 BYTE)
  CONSTRAINT emp_nn_job_id NOT NULL,
SALARY	NUMBER(8,2)
  CONSTRAINT emp_min_salary CHECK(salary > 0),
COMMISSION_PCT	NUMBER(2,2),
MANAGER_ID	NUMBER(6,0),
DEPARTMENT_ID	NUMBER(4,0)
);

INSERT INTO EMPS
SELECT *
FROM EMPLOYEES;

DELETE FROM EMPS 
WHERE employee_id=178;

ALTER TABLE EMPS
ADD FULL_NAME VARCHAR2(50 BYTE)
GENERATED ALWAYS AS (first_name || ' ' || last_name);

ALTER TABLE EMPS 
MODIFY (FULL_NAME CONSTRAINT emp_nn_full_name NOT NULL);


/*
Author: Sean Fiscus
Assignment: Project 2
Date: 4/18/15
*/

/* 
Request 2 
Date Accomplished: 4/18/15
*/
SELECT EMPLOYEE_ID, FULL_NAME, SALARY, DEPARTMENT_ID
FROM EMPS
ORDER BY FULL_NAME;


/*
Author: Sean Fiscus
Assignment: Project 2
Date: 4/18/15
*/

/* 
Request 3 
Date Accomplished: 4/18/15
*/
CREATE VIEW V_EMPS_TABLE AS (
  SELECT JOB_ID, AVG(SALARY) AS "AVERAGE SALARY", 
  MAX(SALARY) AS "MAX SALARY",
  MIN(SALARY) AS "MIN SALARY",
  MAX(SALARY) - MIN(SALARY) AS "DIFFERENCE SALARY"
  FROM EMPS
  GROUP BY JOB_ID
);

SELECT *
FROM V_EMPS_TABLE;


/*
Author: Sean Fiscus
Assignment: Project 2
Date: 4/18/15
*/

/* 
Request 4 
Date Accomplished: 4/18/15
*/
SELECT E2.EMPLOYEE_ID, E2.FULL_NAME AS "EMPLYEE FULL NAME",
E1.FULL_NAME AS "MANAGER FULL NAME"
FROM EMPS E1
INNER JOIN EMPS E2
ON E1.EMPLOYEE_ID = E2.MANAGER_ID;


/*
Author: Sean Fiscus
Assignment: Project 2
Date: 4/18/15
*/

/* 
Request 5 
Date Accomplished: 4/18/15
*/
CREATE TABLE DEPS (
DEPARTMENT_ID	NUMBER(4,0)
  CONSTRAINT deps_dept_id_pk PRIMARY KEY,
DEPARTMENT_NAME	VARCHAR2(30 BYTE),
MANAGER_ID NUMBER(6,0),
LOCATION_ID NUMBER(4,0)
);
  
INSERT INTO DEPS
SELECT *
FROM DEPARTMENTS;

DELETE FROM DEPS 
WHERE location_id=1400;

INSERT INTO DEPS VALUES(200, 'Human Resources', null, 2700);

UPDATE DEPS
SET DEPARTMENT_NAME = 'Operations'
WHERE DEPARTMENT_NAME = 'Administration';

UPDATE DEPS
SET DEPARTMENT_NAME = UPPER(DEPARTMENT_NAME);

ALTER TABLE DEPS
ADD SECURITY_ID NUMBER(6,0) DEFAULT 101;











