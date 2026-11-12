-- ==========================================
-- Q1. Create the following tables with data.
-- ==========================================

-- Create Sports_Stud table

CREATE TABLE Sports_Stud (
    ROLL NUMBER(5),
    NAME VARCHAR2(30),
    DEPT VARCHAR2(10),
    SPORTS_FEE NUMBER(8),
    CONSTRAINT PK_SPORTS PRIMARY KEY (ROLL),
    CONSTRAINT UQ_SPORTS_NAME UNIQUE (NAME),
    CONSTRAINT CK_SPORTS_DEPT CHECK (DEPT IN ('IT','CS')),
    CONSTRAINT CK_SPORTS_FEE CHECK (SPORTS_FEE >= 1000)
);


-- Create Cultural_Stud table

CREATE TABLE Cultural_Stud (
    ROLL NUMBER(5),
    NAME VARCHAR2(30),
    DEPT VARCHAR2(10),
    CUL_FEES NUMBER(8),
    CONSTRAINT PK_CULTURAL PRIMARY KEY (ROLL),
    CONSTRAINT UQ_CULTURAL_NAME UNIQUE (NAME),
    CONSTRAINT CK_CULTURAL_DEPT CHECK (DEPT IN ('IT','CS')),
    CONSTRAINT CK_CULTURAL_FEE CHECK (CUL_FEES >= 600)
);


-- Insert records into Sports_Stud

INSERT INTO Sports_Stud VALUES (1,'Aman','IT',1500);
INSERT INTO Sports_Stud VALUES (7,'Binay','IT',1200);
INSERT INTO Sports_Stud VALUES (2,'Bipul','CS',1800);
INSERT INTO Sports_Stud VALUES (8,'Joy','CS',1400);


-- Insert records into Cultural_Stud

INSERT INTO Cultural_Stud VALUES (1,'Aman','IT',700);
INSERT INTO Cultural_Stud VALUES (2,'Bipul','CS',600);
INSERT INTO Cultural_Stud VALUES (3,'Surojit','IT',700);
INSERT INTO Cultural_Stud VALUES (4,'Wasim','CS',600);
INSERT INTO Cultural_Stud VALUES (5,'Binay','IT',700);
INSERT INTO Cultural_Stud VALUES (6,'Joy','CS',600);

COMMIT;


-- ==========================================
-- Q2. Display all the distinct students
-- studying in the organization including
-- both the departments.
-- ==========================================

SELECT NAME, DEPT
FROM Sports_Stud

UNION

SELECT NAME, DEPT
FROM Cultural_Stud;


-- ==========================================
-- Q3. Display all the students studying
-- in the organization including both
-- the departments.
-- ==========================================

SELECT NAME, DEPT
FROM Sports_Stud

UNION ALL

SELECT NAME, DEPT
FROM Cultural_Stud;


-- ==========================================
-- Q4. Display those students working in
-- both cultural and sports groups.
-- ==========================================

SELECT NAME, DEPT
FROM Sports_Stud

INTERSECT

SELECT NAME, DEPT
FROM Cultural_Stud;


-- ==========================================
-- Q5. Display those students working
-- in only sports group.
-- ==========================================

SELECT NAME, DEPT
FROM Sports_Stud

MINUS

SELECT NAME, DEPT
FROM Cultural_Stud;


-- ==========================================
-- Q6. Display those students working
-- in only cultural group.
-- ==========================================

SELECT NAME, DEPT
FROM Cultural_Stud

MINUS

SELECT NAME, DEPT
FROM Sports_Stud;


-- ==========================================
-- Q7. Display the roll and both sports fee
-- and cultural fee of students working
-- in both cultural and sports groups.
-- ==========================================

SELECT
    S.ROLL,
    S.SPORTS_FEE,
    C.CUL_FEES
FROM Sports_Stud S
INNER JOIN Cultural_Stud C
ON S.ROLL = C.ROLL;


-- ==========================================
-- Q8. Add a new field BIRTHDAY to both
-- tables for all students.
-- Add data according to your own wish.
-- ==========================================

ALTER TABLE Sports_Stud
ADD BIRTHDAY DATE;

ALTER TABLE Cultural_Stud
ADD BIRTHDAY DATE;


-- Insert birthday data into Sports_Stud

UPDATE Sports_Stud
SET BIRTHDAY = TO_DATE('10-JAN-2005','DD-MON-YYYY')
WHERE ROLL = 1;

UPDATE Sports_Stud
SET BIRTHDAY = TO_DATE('15-MAR-2004','DD-MON-YYYY')
WHERE ROLL = 7;

UPDATE Sports_Stud
SET BIRTHDAY = TO_DATE('20-JUN-2005','DD-MON-YYYY')
WHERE ROLL = 2;

UPDATE Sports_Stud
SET BIRTHDAY = TO_DATE('25-AUG-2004','DD-MON-YYYY')
WHERE ROLL = 8;


-- Insert birthday data into Cultural_Stud

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('10-JAN-2005','DD-MON-YYYY')
WHERE ROLL = 1;

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('20-JUN-2005','DD-MON-YYYY')
WHERE ROLL = 2;

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('12-APR-2005','DD-MON-YYYY')
WHERE ROLL = 3;

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('18-JUL-2004','DD-MON-YYYY')
WHERE ROLL = 4;

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('15-MAR-2004','DD-MON-YYYY')
WHERE ROLL = 5;

UPDATE Cultural_Stud
SET BIRTHDAY = TO_DATE('25-AUG-2004','DD-MON-YYYY')
WHERE ROLL = 6;

COMMIT;


-- ==========================================
-- Q9. Display student name, age and month
-- of birth of all distinct students
-- of the organization.
-- ==========================================

SELECT NAME, AGE, BIRTH_MONTH
FROM
(
    SELECT
        NAME,
        TRUNC(MONTHS_BETWEEN(SYSDATE, BIRTHDAY)/12) AS AGE,
        TO_CHAR(BIRTHDAY, 'MONTH') AS BIRTH_MONTH
    FROM Sports_Stud

    UNION

    SELECT
        NAME,
        TRUNC(MONTHS_BETWEEN(SYSDATE, BIRTHDAY)/12) AS AGE,
        TO_CHAR(BIRTHDAY, 'MONTH') AS BIRTH_MONTH
    FROM Cultural_Stud
);


-- ==========================================
-- Q10. Display the last day of the month
-- in which all students were born.
-- Use set operators.
-- ==========================================

SELECT LAST_DAY(BIRTHDAY) AS LAST_DAY
FROM Sports_Stud

UNION

SELECT LAST_DAY(BIRTHDAY) AS LAST_DAY
FROM Cultural_Stud;


-- ==========================================
-- Q11. Display details of students from
-- Sports_Stud in the following format:
-- <Name> who studies in <Dept> dept
-- pays Rs<Sports_Fee> for sports.
-- ==========================================

SELECT
    NAME || ' who studies in ' ||
    DEPT || ' dept pays Rs' ||
    SPORTS_FEE || ' for sports.' AS STUDENT_DETAILS
FROM Sports_Stud;


-- ==========================================
-- Q12. Display details of all students
-- from IT department.
-- Display total money earned from sports
-- and cultural departments.
-- ==========================================

-- Display IT department students

SELECT *
FROM Sports_Stud
WHERE DEPT = 'IT';

SELECT *
FROM Cultural_Stud
WHERE DEPT = 'IT';


-- Total money earned from Sports

SELECT SUM(SPORTS_FEE) AS TOTAL_SPORTS_FEES
FROM Sports_Stud;


-- Total money earned from Cultural

SELECT SUM(CUL_FEES) AS TOTAL_CULTURAL_FEES
FROM Cultural_Stud;


-- ==========================================
-- Q13. Display the name of all students
-- in descending order.
-- ==========================================

SELECT NAME
FROM
(
    SELECT NAME FROM Sports_Stud

    UNION

    SELECT NAME FROM Cultural_Stud
)
ORDER BY NAME DESC;


-- ==========================================
-- Q14. Drop all the domain constraints
-- from both the tables.
-- ==========================================

-- Drop constraints from Sports_Stud

ALTER TABLE Sports_Stud
DROP CONSTRAINT CK_SPORTS_DEPT;

ALTER TABLE Sports_Stud
DROP CONSTRAINT CK_SPORTS_FEE;


-- Drop constraints from Cultural_Stud

ALTER TABLE Cultural_Stud
DROP CONSTRAINT CK_CULTURAL_DEPT;

ALTER TABLE Cultural_Stud
DROP CONSTRAINT CK_CULTURAL_FEE;


-- ==========================================
-- Q15. Display maximum, minimum and
-- average sports fee taken by the organization.
-- ==========================================

SELECT
    MAX(SPORTS_FEE) AS MAXIMUM_FEE,
    MIN(SPORTS_FEE) AS MINIMUM_FEE,
    AVG(SPORTS_FEE) AS AVERAGE_FEE
FROM Sports_Stud;
