-- ==========================================
-- Q1. Create a table EMP with the following structure.
-- ==========================================

CREATE TABLE EMP (
    E_ID NUMBER(5),
    FNAME VARCHAR2(30) NOT NULL,
    LNAME VARCHAR2(30) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(20) NOT NULL,
    SAL NUMBER(10,2) NOT NULL,
    DEPT_ID NUMBER(5),
    CONSTRAINT PK_EMP PRIMARY KEY (E_ID),
    CONSTRAINT CK_EMP_DEPT CHECK (DEPT_ID >= 10)
);


-- Insert the given employee records.

INSERT INTO EMP VALUES (198, 'Donald', 'Connell', TO_DATE('21-Jun-99','DD-MON-RR'), 'SH_CLERK', 2600, 50);

INSERT INTO EMP VALUES (199, 'Douglas', 'Grant', TO_DATE('13-Jan-98','DD-MON-RR'), 'SH_CLERK', 3000, 50);

INSERT INTO EMP VALUES (200, 'Jennifer', 'Whalen', TO_DATE('17-Sep-87','DD-MON-RR'), 'AD_ASST', 4400, 10);

INSERT INTO EMP VALUES (201, 'Michael', 'Hartstein', TO_DATE('19-Jan-99','DD-MON-RR'), 'IT_PROG', 6000, 20);

INSERT INTO EMP VALUES (202, 'Pat', 'Fay', TO_DATE('25-Oct-89','DD-MON-RR'), 'AC_MGR', 6500, 20);

INSERT INTO EMP VALUES (203, 'Susan', 'Mavris', TO_DATE('26-Nov-76','DD-MON-RR'), 'AD_VP', 7500, 40);

INSERT INTO EMP VALUES (204, 'Hermann', 'Baer', TO_DATE('23-Aug-95','DD-MON-RR'), 'AD_PRES', 9500, 90);

INSERT INTO EMP VALUES (205, 'Shelley', 'Higgins', TO_DATE('24-Feb-98','DD-MON-RR'), 'AC_MGR', 2300, 60);

INSERT INTO EMP VALUES (206, 'William', 'Gitz', TO_DATE('12-Mar-01','DD-MON-RR'), 'IT_PROG', 5000, 60);

INSERT INTO EMP VALUES (100, 'Steven', 'King', TO_DATE('15-Jun-02','DD-MON-RR'), 'AD_ASST', 8956, 100);

INSERT INTO EMP VALUES (101, 'Neena', 'Kochar', TO_DATE('10-Jul-03','DD-MON-RR'), 'SH_CLERK', 3400, 30);

COMMIT;


-- ==========================================
-- Q2. Display the FNAME of all employees in
-- ascending order. Give an appropriate alias.
-- ==========================================

SELECT FNAME AS "Employee_Name"
FROM EMP
ORDER BY FNAME ASC;


-- ==========================================
-- Q3. Display the FNAME of all employees in
-- descending order. Give an appropriate alias.
-- ==========================================

SELECT FNAME AS "Employee_Name"
FROM EMP
ORDER BY FNAME DESC;


-- ==========================================
-- Q4. Display the hire date of all employees
-- in ascending order.
-- ==========================================

SELECT HIRE_DATE
FROM EMP
ORDER BY HIRE_DATE ASC;


-- ==========================================
-- Q5. Display employee details whose FNAME
-- starts with either J or M.
-- Sort the result by employee LNAME.
-- ==========================================

SELECT *
FROM EMP
WHERE FNAME LIKE 'J%'
   OR FNAME LIKE 'M%'
ORDER BY LNAME ASC;


-- ==========================================
-- Q6. Find the highest, lowest, average and
-- sum of salary of all employees.
-- Give alias names Max, Min, Avg and Sum.
-- ==========================================

SELECT
    MAX(SAL) AS "Max",
    MIN(SAL) AS "Min",
    AVG(SAL) AS "Avg",
    SUM(SAL) AS "Sum"
FROM EMP;


-- ==========================================
-- Q7. Find the highest, lowest, average and
-- sum of salary of employees of each job type.
-- ==========================================

SELECT
    JOB_ID,
    MAX(SAL) AS "Max",
    MIN(SAL) AS "Min",
    AVG(SAL) AS "Avg",
    SUM(SAL) AS "Sum"
FROM EMP
GROUP BY JOB_ID;


-- ==========================================
-- Q8. Display the number of people under each job.
-- ==========================================

SELECT
    JOB_ID,
    COUNT(*) AS "Number_of_Employees"
FROM EMP
GROUP BY JOB_ID;


-- ==========================================
-- Q9. Display the number of managers in the company
-- without listing their EMP_ID or names.
-- ==========================================

SELECT COUNT(*) AS "Number_of_Managers"
FROM EMP
WHERE JOB_ID LIKE '%MGR%';


-- ==========================================
-- Q10. Find the difference between the highest
-- and lowest salaries.
-- ==========================================

SELECT MAX(SAL) - MIN(SAL) AS "Salary_Difference"
FROM EMP;


-- ==========================================
-- Q11. Display the maximum and average salary
-- of the engineers (IT_PROG).
-- ==========================================

SELECT
    MAX(SAL) AS "Maximum_Salary",
    AVG(SAL) AS "Average_Salary"
FROM EMP
WHERE JOB_ID = 'IT_PROG';


-- ==========================================
-- Q12. Display the employee FNAME that is first
-- and last in the alphabetized list.
-- ==========================================

SELECT
    MIN(FNAME) AS "First_Name",
    MAX(FNAME) AS "Last_Name"
FROM EMP;


-- ==========================================
-- Q13. Display the first employee hire date
-- and last employee hire date.
-- Rename columns as First Hire_Date
-- and Last Hire_Date.
-- ==========================================

SELECT
    MIN(HIRE_DATE) AS "First Hire_Date",
    MAX(HIRE_DATE) AS "Last Hire_Date"
FROM EMP;


-- ==========================================
-- Q14. Display the maximum and average salary
-- of the clerks.
-- ==========================================

SELECT
    MAX(SAL) AS "Maximum_Salary",
    AVG(SAL) AS "Average_Salary"
FROM EMP
WHERE JOB_ID LIKE '%CLERK%';


-- ==========================================
-- Q15. Display department number and salary
-- of the lowest paid employee for each department.
-- Give an alias to minimum salary column.
-- ==========================================

SELECT
    DEPT_ID,
    MIN(SAL) AS "Minimum_Salary"
FROM EMP
GROUP BY DEPT_ID;


-- ==========================================
-- Q16. Display department number and salary
-- of the lowest paid employee for each department.
-- Exclude groups where minimum salary is 3000
-- or less. Sort in descending order of salary.
-- ==========================================

SELECT
    DEPT_ID,
    MIN(SAL) AS "Minimum_Salary"
FROM EMP
GROUP BY DEPT_ID
HAVING MIN(SAL) > 3000
ORDER BY MIN(SAL) DESC;


-- ==========================================
-- Q17. Display the following for all rows:
-- <First_name> whose designation is <job_id>
-- gets <Salary> but wants to earn <3*Salary>.
-- ==========================================

SELECT
    FNAME || ' whose designation is ' ||
    JOB_ID || ' gets ' ||
    SAL || ' but wants to earn ' ||
    (3 * SAL) AS "Employee_Information"
FROM EMP;


-- ==========================================
-- Q18. Display employee details in the following
-- format:
-- 198, Donald, Connell, 21-Jun-99, SH_CLERK, 2600, 50
-- ==========================================

SELECT
    E_ID || ', ' ||
    FNAME || ', ' ||
    LNAME || ', ' ||
    TO_CHAR(HIRE_DATE, 'DD-Mon-RR') || ', ' ||
    JOB_ID || ', ' ||
    SAL || ', ' ||
    DEPT_ID AS "Employee_Details"
FROM EMP;


-- ==========================================
-- Q19. Display today's date.
-- Rename the column as TODAY.
-- ==========================================

SELECT SYSDATE AS "TODAY"
FROM DUAL;


-- ==========================================
-- Q20. Display employee ID, day and year
-- in which employees were hired.
-- ==========================================

SELECT
    E_ID,
    TO_CHAR(HIRE_DATE, 'DD') AS "HIRE_DAY",
    TO_CHAR(HIRE_DATE, 'YYYY') AS "HIRE_YEAR"
FROM EMP;


-- ==========================================
-- Q21. Display employee name and hire date
-- in the format DD-MONTH-YY.
-- ==========================================

SELECT
    FNAME || ' ' || LNAME AS "Employee_Name",
    TO_CHAR(HIRE_DATE, 'DD-MONTH-YY') AS "Hire_Date"
FROM EMP;


-- ==========================================
-- Q22. Display employee ID and month
-- in which employees were hired.
-- ==========================================

SELECT
    E_ID,
    TO_CHAR(HIRE_DATE, 'MONTH') AS "HIRE_MONTH"
FROM EMP;


-- ==========================================
-- Q23. Display employee name, employee ID
-- and hire date in DD-MON-YYYY format.
-- ==========================================

SELECT
    FNAME || ' ' || LNAME AS "Employee_Name",
    E_ID,
    TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS "Hire_Date"
FROM EMP;


-- ==========================================
-- Q24. Display employee name, employee ID
-- and hire date in MONTH-DD-YYYY format.
-- ==========================================

SELECT
    FNAME || ' ' || LNAME AS "Employee_Name",
    E_ID,
    TO_CHAR(HIRE_DATE, 'MONTH-DD-YYYY') AS "Hire_Date"
FROM EMP;


-- ==========================================
-- Q25. Display the system year in full spelling.
-- Example: Nineteen Ninety Nine.
-- ==========================================

SELECT TO_CHAR(SYSDATE, 'YEAR') AS "Year_In_Words"
FROM DUAL;


-- ==========================================
-- Q26. Find the date 15 days after and
-- 15 days before today's date.
-- ==========================================

SELECT
    SYSDATE AS "TODAY",
    SYSDATE + 15 AS "AFTER_15_DAYS",
    SYSDATE - 15 AS "BEFORE_15_DAYS"
FROM DUAL;


-- ==========================================
-- Q27. Ensure the domain constraint and
-- entity integrity constraint from the table.
-- ==========================================

-- Domain constraint

ALTER TABLE EMP
ADD CONSTRAINT CK_EMP_DEPT
CHECK (DEPT_ID >= 10);

-- Entity integrity constraint

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP
PRIMARY KEY (E_ID);


-- ==========================================
-- Q28. Drop the domain constraint from the table.
-- ==========================================

ALTER TABLE EMP
DROP CONSTRAINT CK_EMP_DEPT;


-- ==========================================
-- Q29. Drop the primary key from the table.
-- ==========================================

ALTER TABLE EMP
DROP CONSTRAINT PK_EMP;


-- ==========================================
-- Q30. Drop the created table.
-- ==========================================

DROP TABLE EMP;