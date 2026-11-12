-- ==========================================
-- Q1. Create the following tables:
-- Customer, Movie and Invoice.
-- ==========================================


-- Create CUSTOMER table

CREATE TABLE CUSTOMER (
    CUST_ID VARCHAR2(3) PRIMARY KEY,
    FNAME VARCHAR2(20) NOT NULL,
    LNAME VARCHAR2(20) NOT NULL,
    AREA VARCHAR2(5),
    PHONE NUMBER(10),
    CONSTRAINT CK_CUST_ID CHECK (CUST_ID LIKE 'A%')
);


-- Create MOVIE table

CREATE TABLE MOVIE (
    MV_NO NUMBER(3) PRIMARY KEY,
    TITLE VARCHAR2(30) NOT NULL,
    TYPE VARCHAR2(15) NOT NULL,
    STAR VARCHAR2(10) NOT NULL,
    PRICE NUMBER(8,2) NOT NULL
);


-- Create INVOICE table

CREATE TABLE INVOICE (
    INV_NO VARCHAR2(5) PRIMARY KEY,
    MV_NO NUMBER(3),
    CUST_ID VARCHAR2(3),
    ISSUE_DATE DATE NOT NULL,
    RETURN_DATE DATE NOT NULL,

    CONSTRAINT FK_INV_MOVIE
    FOREIGN KEY (MV_NO) REFERENCES MOVIE(MV_NO),

    CONSTRAINT FK_INV_CUSTOMER
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),

    CONSTRAINT CK_INV_NO CHECK (INV_NO LIKE 'I%')
);


-- Insert records into CUSTOMER table

INSERT INTO CUSTOMER VALUES
('A01','Ivan','Bayross','SA',6125467);

INSERT INTO CUSTOMER VALUES
('A02','Vandana','Saiteal','MU',5560379);

INSERT INTO CUSTOMER VALUES
('A03','Pramada','Jauguste','DA',4560389);

INSERT INTO CUSTOMER VALUES
('A04','Basu','Navindi','BA',6125401);

INSERT INTO CUSTOMER VALUES
('A05','Ravi','Shreedhar','NA',NULL);

INSERT INTO CUSTOMER VALUES
('A06','Rukmini','Unknown','GH',5125274);


-- Insert records into MOVIE table

INSERT INTO MOVIE VALUES
(1,'Bloody','Action','JC',181);

INSERT INTO MOVIE VALUES
(2,'The Firm','Thriller','TC',200);

INSERT INTO MOVIE VALUES
(3,'Pretty Woman','Romance','RG',151);

INSERT INTO MOVIE VALUES
(4,'Home Alone','Comedy','MC',150);

INSERT INTO MOVIE VALUES
(5,'The Fugitive','Thriller','MF',200);

INSERT INTO MOVIE VALUES
(6,'Coma','Suspense','MD',100);

INSERT INTO MOVIE VALUES
(7,'Dracula','Horror','GO',150);

INSERT INTO MOVIE VALUES
(8,'Quick Change','Comedy','BM',100);

INSERT INTO MOVIE VALUES
(9,'Gone with the Wind','Action','CB',200);

INSERT INTO MOVIE VALUES
(10,'Carry on Doctor','Comedy','LP',100);


-- Insert records into INVOICE table

INSERT INTO INVOICE VALUES
('I01',4,'A01',TO_DATE('23-JUL-93','DD-MON-RR'),
TO_DATE('25-JUL-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I02',3,'A02',TO_DATE('12-AUG-93','DD-MON-RR'),
TO_DATE('15-AUG-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I03',1,'A02',TO_DATE('15-AUG-93','DD-MON-RR'),
TO_DATE('18-AUG-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I04',6,'A03',TO_DATE('10-SEP-93','DD-MON-RR'),
TO_DATE('13-SEP-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I05',7,'A04',TO_DATE('05-AUG-93','DD-MON-RR'),
TO_DATE('08-AUG-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I06',2,'A06',TO_DATE('18-SEP-93','DD-MON-RR'),
TO_DATE('21-SEP-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I07',9,'A05',TO_DATE('07-JUL-93','DD-MON-RR'),
TO_DATE('10-JUL-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I08',9,'A01',TO_DATE('11-AUG-93','DD-MON-RR'),
TO_DATE('14-AUG-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I09',5,'A03',TO_DATE('06-JUL-93','DD-MON-RR'),
TO_DATE('09-JUL-93','DD-MON-RR'));

INSERT INTO INVOICE VALUES
('I10',8,'A06',TO_DATE('03-SEP-93','DD-MON-RR'),
TO_DATE('06-SEP-93','DD-MON-RR'));

COMMIT;


-- ==========================================
-- Q2. Display the customer names and movie
-- number of all customers who have been
-- issued a movie.
-- ==========================================

SELECT
    C.FNAME,
    C.LNAME,
    I.MV_NO
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID;


-- ==========================================
-- Q3. Display the movie number and title
-- that has been issued to Ivan.
-- ==========================================

SELECT
    M.MV_NO,
    M.TITLE
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO
JOIN CUSTOMER C
ON I.CUST_ID = C.CUST_ID
WHERE C.FNAME = 'Ivan';


-- ==========================================
-- Q4. Display title, customer ID and
-- movie number for all movies that are issued.
-- ==========================================

SELECT
    M.TITLE,
    I.CUST_ID,
    I.MV_NO
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO;


-- ==========================================
-- Q5. Display the title and type of the movie
-- that has been issued to Vandana.
-- ==========================================

SELECT
    M.TITLE,
    M.TYPE
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO
JOIN CUSTOMER C
ON I.CUST_ID = C.CUST_ID
WHERE C.FNAME = 'Vandana';


-- ==========================================
-- Q6. Find the names of all customers who
-- have been issued a movie of type ACTION.
-- ==========================================

SELECT DISTINCT
    C.FNAME,
    C.LNAME
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID
JOIN MOVIE M
ON I.MV_NO = M.MV_NO
WHERE M.TYPE = 'Action';


-- ==========================================
-- Q7. Display movie title, last name and
-- first name of customers having movie
-- number greater than or equal to 3.
--
-- Format:
-- The movie taken by {Fname} {Lname}
-- is {Title}.
-- ==========================================

SELECT
    'The movie taken by ' ||
    C.FNAME || ' ' ||
    C.LNAME || ' is ' ||
    M.TITLE || '.' AS MOVIE_DETAILS
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID
JOIN MOVIE M
ON I.MV_NO = M.MV_NO
WHERE I.MV_NO >= 3;


-- ==========================================
-- Q8. Display the customer who has been
-- issued the movie having invoice number I10.
-- ==========================================

SELECT
    C.CUST_ID,
    C.FNAME,
    C.LNAME
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID
WHERE I.INV_NO = 'I10';


-- ==========================================
-- Q9. Display customer name, phone and area
-- who have been issued a movie before
-- the month of August.
-- ==========================================

SELECT DISTINCT
    C.FNAME,
    C.LNAME,
    C.PHONE,
    C.AREA
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID
WHERE I.ISSUE_DATE < TO_DATE('01-AUG-93','DD-MON-RR');


-- ==========================================
-- Q10. Display movie number and title
-- issued to Ivan, Vandana and Ravi.
-- ==========================================

SELECT DISTINCT
    M.MV_NO,
    M.TITLE
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO
JOIN CUSTOMER C
ON I.CUST_ID = C.CUST_ID
WHERE C.FNAME IN ('Ivan','Vandana','Ravi');


-- ==========================================
-- Q11. List movie number and movie name
-- issued to customers.
-- ==========================================

SELECT DISTINCT
    M.MV_NO,
    M.TITLE
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO;


-- ==========================================
-- Q12. Find the type and movie numbers
-- of movies issued to customer IDs A01 and A02.
-- ==========================================

SELECT
    M.TYPE,
    I.MV_NO
FROM MOVIE M
JOIN INVOICE I
ON M.MV_NO = I.MV_NO
WHERE I.CUST_ID IN ('A01','A02');


-- ==========================================
-- Q13. Find out if the movie whose star
-- is Tom Cruise has been issued to any
-- customer. Display customer ID.
-- ==========================================

SELECT DISTINCT
    I.CUST_ID
FROM INVOICE I
JOIN MOVIE M
ON I.MV_NO = M.MV_NO
WHERE M.STAR = 'TC';


-- ==========================================
-- Q14. Display customer first name and
-- last name who have been issued a movie.
-- ==========================================

SELECT DISTINCT
    C.FNAME,
    C.LNAME
FROM CUSTOMER C
JOIN INVOICE I
ON C.CUST_ID = I.CUST_ID;


-- ==========================================
-- Q15. Display the movie number which
-- has never been issued to any customer.
-- ==========================================

SELECT M.MV_NO
FROM MOVIE M
WHERE M.MV_NO NOT IN
(
    SELECT MV_NO
    FROM INVOICE
);


-- ==========================================
-- GROUP B
-- Use the existing EMP table provided
-- by Oracle.
-- ==========================================


-- ==========================================
-- Q16. Display all employees' employee ID,
-- name, manager ID and manager's name.
-- ==========================================

SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,
    E.MANAGER_ID,
    M.FIRST_NAME || ' ' || M.LAST_NAME AS MANAGER_NAME
FROM EMP E
LEFT JOIN EMP M
ON E.MANAGER_ID = M.EMPLOYEE_ID;


-- ==========================================
-- Q17. Display all employee names,
-- manager ID, manager name and
-- manager's manager name.
-- Give appropriate column names.
-- ==========================================

SELECT
    E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,

    E.MANAGER_ID AS MANAGER_ID,

    M.FIRST_NAME || ' ' || M.LAST_NAME AS MANAGER_NAME,

    MM.FIRST_NAME || ' ' || MM.LAST_NAME
    AS MANAGERS_MANAGER_NAME

FROM EMP E

LEFT JOIN EMP M
ON E.MANAGER_ID = M.EMPLOYEE_ID

LEFT JOIN EMP MM
ON M.MANAGER_ID = MM.EMPLOYEE_ID;
