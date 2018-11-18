/*
+ Task – Select all records from the Employee table.
+ Task – Select all records from the Employee table where last name is King.
+ Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
2.2 ORDER BY
+ Task – Select all albums in Album table and sort result set in descending order by title.
+ Task – Select first name from Customer and sort result set in ascending order by city
2.3 INSERT INTO
+ Task – Insert two new records into Genre table
+ Task – Insert two new records into Employee table
+ Task – Insert two new records into Customer table
2.4 UPDATE
+ Task – Update Aaron Mitchell in Customer table to Robert Walter
+ Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
2.5 LIKE
+ Task – Select all invoices with a billing address like “T%”
2.6 BETWEEN
+ Task – Select all invoices that have a total between 15 and 50
+ Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
2.7 DELETE
??? Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

*/

SELECT * FROM ALBUM
ORDER BY TITLE DESC;

-- 2.2

SELECT FIRSTNAME, CITY
FROM CUSTOMER
ORDER BY CITY;

--2.3
INSERT INTO GENRE 
VALUES (26, 'LO-FI');
INSERT INTO GENRE 
VALUES (27, 'TRIP-HOP');
SELECT * FROM GENRE;

INSERT INTO EMPLOYEE
VALUES (
    16, 'Vargas', 'Rhyan', 'CEO', null, '06-JUL-89', null, null, null, null, null, null, null, null, null
);
INSERT INTO EMPLOYEE
VALUES (
    17, 'Smith', 'Bob', 'Janitor', null, '09-JUL-89', null, null, null, null, null, null, null, null, null
);

--2.4
UPDATE CUSTOMER
SET FIRSTNAME = 'Robert' , LASTNAME = 'Walter'
WHERE FIRSTNAME = 'Aaron';

SELECT * FROM CUSTOMER
ORDER BY FIRSTNAME ;

UPDATE ARTIST
SET NAME = 'CCR'
WHERE NAME = 'Creedence Clearwater Revival';

SELECT * FROM ARTIST
ORDER BY NAME ;

--2.5
SELECT * FROM INVOICE
WHERE billingaddress LIKE 'T%';

--2.6
SELECT * FROM INVOICE
WHERE TOTAL BETWEEN 15 AND 50
ORDER BY TOTAL;

SELECT * FROM EMPLOYEE
WHERE HIREDATE BETWEEN '01-JUN-03' AND '01-MAR-04';


-- ??? 0 records deleted because it did not exist.
DELETE FROM CUSTOMER
WHERE FIRSTNAME = 'Robert' AND LASTNAME = 'Walter';


/* 
3.0 SQL Functions
In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
3.1 System Defined Functions
+ Task – Create a function that returns the current time.
+ Task – create a function that returns the length of a mediatype from the mediatype table
3.2 System Defined Aggregate Functions
+ Task – Create a function that returns the average total of all invoices
+ Task – Create a function that returns the most expensive track
3.3 User Defined Functions
Task – Create a function that returns the average price of invoiceline items in the invoiceline table
3.4 User Defined Table Valued Functions
Task – Create a function that returns all employees who are born after 1968.
4.0 Stored Procedures
In this section you will be creating and executing stored procedures. You will be creating various types of stored procedures that take input and output parameters.
4.1 Basic Stored Procedure
Task – Create a stored procedure that selects the first and last names of all the employees.
4.2 Stored Procedure Input Parameters
Task – Create a stored procedure that updates the personal information of an employee.
Task – Create a stored procedure that returns the managers of an employee.
4.3 Stored Procedure Output Parameters
Task – Create a stored procedure that returns the name and company of a customer
*/

--3.1
SELECT CURRENT_TIMESTAMP FROM DUAL;

SELECT NAME, LENGTH(NAME) FROM MEDIATYPE
WHERE MEDIATYPEID = 1
GROUP BY NAME;

--3.2
SELECT AVG(TOTAL) "AVERAGE TOTAL" FROM INVOICE;

SELECT NAME, UNITPRICE FROM TRACK
WHERE UNITPRICE = (
    SELECT MAX(UNITPRICE) FROM TRACK
)
ORDER BY NAME;