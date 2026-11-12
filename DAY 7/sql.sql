-- ==========================================
-- Q1. Create the table Employee_Details
-- with the given structure.
-- ==========================================

CREATE TABLE Employee_Details (
    EMPLOYEE_ID NUMBER(6) PRIMARY KEY,
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(25) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(10) NOT NULL,
    SALARY NUMBER(8,2),
    COMMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER(6),
    DEPARTMENT_ID NUMBER(4)
);


-- ==========================================
-- Insert the given employee records.
-- ==========================================

INSERT INTO Employee_Details VALUES
(100,'Steven','King',TO_DATE('17-JUN-87','DD-MON-RR'),'AD_PRES',24000,NULL,NULL,90);

INSERT INTO Employee_Details VALUES
(101,'Neena','Kochhar',TO_DATE('21-SEP-89','DD-MON-RR'),'AD_VP',17000,NULL,100,90);

INSERT INTO Employee_Details VALUES
(102,'Lex','De Haan',TO_DATE('13-JAN-93','DD-MON-RR'),'AD_VP',17000,NULL,100,90);

INSERT INTO Employee_Details VALUES
(103,'Alexander','Hunold',TO_DATE('03-JAN-90','DD-MON-RR'),'IT_PROG',9000,NULL,102,60);

INSERT INTO Employee_Details VALUES
(104,'Bruce','Ernst',TO_DATE('21-MAY-91','DD-MON-RR'),'IT_PROG',6000,NULL,103,60);

INSERT INTO Employee_Details VALUES
(107,'Diana','Lorentz',TO_DATE('07-FEB-99','DD-MON-RR'),'IT_PROG',4200,NULL,103,60);

INSERT INTO Employee_Details VALUES
(124,'Kevin','Mourgos',TO_DATE('16-NOV-99','DD-MON-RR'),'ST_MAN',5800,NULL,100,50);

INSERT INTO Employee_Details VALUES
(141,'Trenna','Rais',TO_DATE('17-OCT-95','DD-MON-RR'),'ST_CLERK',3500,NULL,124,50);

INSERT INTO Employee_Details VALUES
(142,'Curtis','Davies',TO_DATE('29-JAN-97','DD-MON-RR'),'ST_CLERK',3100,NULL,124,50);

INSERT INTO Employee_Details VALUES
(143,'Randall','Matos',TO_DATE('15-MAR-98','DD-MON-RR'),'ST_CLERK',2600,NULL,124,50);

INSERT INTO Employee_Details VALUES
(144,'Peter','Vargas',TO_DATE('09-JUL-98','DD-MON-RR'),'ST_CLERK',2500,NULL,124,50);

INSERT INTO Employee_Details VALUES
(149,'Eleni','Zlotkey',TO_DATE('29-JAN-00','DD-MON-RR'),'SA_MAN',10500,0.2,100,80);

INSERT INTO Employee_Details VALUES
(174,'Ellen','Abel',TO_DATE('11-MAY-96','DD-MON-RR'),'SA_REP',11000,0.3,149,80);

INSERT INTO Employee_Details VALUES
(176,'Jonathan','Taylor',TO_DATE('24-MAR-98','DD-MON-RR'),'SA_REP',8600,0.2,149,80);

INSERT INTO Employee_Details VALUES
(178,'Kimberely','Grant',TO_DATE('24-MAY-99','DD-MON-RR'),'SA_REP',7000,0.15,149,NULL);

INSERT INTO Employee_Details VALUES
(200,'Jennifer','Whalen',TO_DATE('17-SEP-87','DD-MON-RR'),'AD_ASST',4400,NULL,101,10);

INSERT INTO Employee_Details VALUES
(201,'Michael','Hartstein',TO_DATE('17-FEB-96','DD-MON-RR'),'MK_REP',6000,NULL,201,20);

INSERT INTO Employee_Details VALUES
(202,'Pat','Fay',TO_DATE('17-AUG-97','DD-MON-RR'),'MK_REP',6000,NULL,201,20);

INSERT INTO Employee_Details VALUES
(205,'Shelley','Higgins',TO_DATE('07-JUN-94','DD-MON-RR'),'AC_MGR',12000,NULL,101,110);

INSERT INTO Employee_Details VALUES
(206,'William','Gietz',TO_DATE('07-JUN-94','DD-MON-RR'),'AC_ACCOUNT',8300,NULL,205,110);

COMMIT;


-- ==========================================
-- Q2. Display the First Name of all employees
-- in LOWER CASE who work in department
-- number 20 or 50 or 80.
-- ==========================================

SELECT LOWER(FIRST_NAME) AS FIRST_NAME
FROM Employee_Details
WHERE DEPARTMENT_ID IN (20, 50, 80);


-- ==========================================
-- Q3. Display the Last Name of all employees
-- in UPPER CASE who work in department
-- number 10 or 110 or 60.
-- ==========================================

SELECT UPPER(LAST_NAME) AS LAST_NAME
FROM Employee_Details
WHERE DEPARTMENT_ID IN (10, 110, 60);


-- ==========================================
-- Q4. Display all JOB_ID in the format 'Sa_Rep'.
-- ==========================================

SELECT INITCAP(JOB_ID) AS JOB_ID
FROM Employee_Details;


-- ==========================================
-- Q5. Display the full name of all employees
-- using a function.
-- ==========================================

SELECT CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS FULL_NAME
FROM Employee_Details;


-- ==========================================
-- Q6. Find the length of last names of employees
-- getting commission.
-- ==========================================

SELECT LAST_NAME, LENGTH(LAST_NAME) AS NAME_LENGTH
FROM Employee_Details
WHERE COMMISSION_PCT IS NOT NULL;


-- ==========================================
-- Q7. Find the numeric position of letter 'a'
-- in the First Name of all employees.
-- ==========================================

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') AS POSITION
FROM Employee_Details;


-- ==========================================
-- Q8. Display employee first name and last name
-- joined together, length of last name and
-- position of letter 'a' in last name
-- for employees having CLERK in JOB_ID.
-- ==========================================

SELECT
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS FULL_NAME,
    LENGTH(LAST_NAME) AS NAME_LENGTH,
    INSTR(LAST_NAME, 'a') AS POSITION
FROM Employee_Details
WHERE JOB_ID LIKE '%CLERK%';


-- ==========================================
-- Q9. Display salary in 10 digits.
-- Pad extra digits with '$' on the left side.
-- ==========================================

SELECT LPAD(SALARY, 10, '$') AS SALARY
FROM Employee_Details;


-- ==========================================
-- Q10. Trim 'e' from employee first names
-- having 'e' in their first name.
-- Rename column as Trimmed.
-- ==========================================

SELECT TRIM('e' FROM FIRST_NAME) AS TRIMMED
FROM Employee_Details
WHERE FIRST_NAME LIKE '%e%';


-- ==========================================
-- Q11. Display department_id, salary and
-- hire_date of employees whose first name
-- contains exactly 6 characters.
-- ==========================================

SELECT
    DEPARTMENT_ID,
    SALARY,
    TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS HIRE_DATE
FROM Employee_Details
WHERE LENGTH(FIRST_NAME) = 6;


-- ==========================================
-- Q12. Display JOB_ID of employees whose
-- first name contains 'e'.
-- Also display the position of 'e'.
-- ==========================================

SELECT
    JOB_ID,
    INSTR(FIRST_NAME, 'e') AS POSITION
FROM Employee_Details
WHERE FIRST_NAME LIKE '%e%';


-- ==========================================
-- Q13. Display last names of employees
-- whose JOB_ID contains REP starting
-- at the fourth position.
-- ==========================================

SELECT LAST_NAME
FROM Employee_Details
WHERE SUBSTR(JOB_ID, 4) = 'REP';


-- ==========================================
-- Q14. Calculate the remainder of salaries
-- divided by 3000 for Sales Representatives.
-- ==========================================

SELECT
    SALARY,
    MOD(SALARY, 3000) AS REMAINDER
FROM Employee_Details
WHERE JOB_ID = 'SA_REP';


-- ==========================================
-- Q15. Display salary in the format $7,000.00.
-- ==========================================

SELECT TO_CHAR(SALARY, '$9,999,990.00') AS SALARY
FROM Employee_Details;


-- ==========================================
-- Q16. Display salary in the format $7000
-- for employees working in department
-- 60 or 90 or 110.
-- ==========================================

SELECT TO_CHAR(SALARY, '$9999990') AS SALARY
FROM Employee_Details
WHERE DEPARTMENT_ID IN (60, 90, 110);


-- ==========================================
-- Q17. Display employee last names and
-- commission amounts.
-- If commission is NULL, display
-- "No Commission".
-- Label the column COMM.
-- ==========================================

SELECT
    LAST_NAME,
    NVL(TO_CHAR(COMMISSION_PCT), 'No Commission') AS COMM
FROM Employee_Details;


-- ==========================================
-- Q18. Find the number of days elapsed
-- between today's date and hire date.
-- Round off the number of days.
-- ==========================================

SELECT
    LAST_NAME,
    ROUND(SYSDATE - HIRE_DATE) AS DAYS_WORKED
FROM Employee_Details;


-- ==========================================
-- Q19. Find the number of weeks elapsed
-- between today's date and hire date.
-- ==========================================

SELECT
    LAST_NAME,
    ROUND((SYSDATE - HIRE_DATE) / 7) AS WEEKS_WORKED
FROM Employee_Details;


-- ==========================================
-- Q20. Find the number of years elapsed
-- between today's date and hire date.
-- Round off the number of years.
-- ==========================================

SELECT
    LAST_NAME,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS YEARS_WORKED
FROM Employee_Details;


-- ==========================================
-- Q21. Display employee name and number
-- of months between today's date and
-- employee's hire date.
-- Label the column MONTHS_WORKED.
-- ==========================================

SELECT
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS EMPLOYEE_NAME,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTHS_WORKED
FROM Employee_Details;


-- ==========================================
-- Q22. Display employee name and the last day
-- of the month in which employees were hired.
-- ==========================================

SELECT
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS EMPLOYEE_NAME,
    LAST_DAY(HIRE_DATE) AS LAST_DAY
FROM Employee_Details;


-- ==========================================
-- Q23. Display each employee's name and
-- the year in which employees were hired
-- in words.
-- ==========================================

SELECT
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS EMPLOYEE_NAME,
    TO_CHAR(HIRE_DATE, 'YEAR') AS HIRE_YEAR
FROM Employee_Details;


-- ==========================================
-- Q24. Display the date 5 months later
-- than today's date.
-- Rename the column as FUTURE DATE.
-- ==========================================

SELECT ADD_MONTHS(SYSDATE, 5) AS "FUTURE DATE"
FROM DUAL;


-- ==========================================
-- Q25. Display employee name, day and
-- date of joining of all employees.
-- ==========================================

SELECT
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS EMPLOYEE_NAME,
    TO_CHAR(HIRE_DATE, 'DAY') AS JOINING_DAY,
    TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS JOINING_DATE
FROM Employee_Details;


-- ==========================================
-- Q26. Display annual salary using the formula
-- (SALARY * 12) + COMMISSION_PCT.
-- Also display rounded annual salary
-- up to 2 decimal places.
-- ==========================================

SELECT
    LAST_NAME,
    (SALARY * 12) + NVL(COMMISSION_PCT, 0) AS ANNUAL_SALARY,
    ROUND((SALARY * 12) + NVL(COMMISSION_PCT, 0), 2)
    AS ROUNDED_ANNUAL_SALARY
FROM Employee_Details;
