CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
WORKER_REF_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOIN_DATE DATETIME,
DEPARTMENT CHAR(30)
);

INSERT INTO Worker
(WORKER_REF_ID, FIRST_NAME, LAST_NAME, SALARY, JOIN_DATE, DEPARTMENT)
VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
SELECT * FROM Worker;

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_REF_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
(1, 5000, '2016-02-20 00:00:00'),
(2, 3000, '2016-06-11 00:00:00'),
(3, 4000, '2016-02-20 00:00:00'),
(1, 4500, '2016-02-20 00:00:00'),
(2, 3500, '2016-06-11 00:00:00');    
SELECT * FROM Bonus;

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_REF_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM Title;

select * from Worker;
select FIRST_NAME, SALARY from Worker;

SELECT  44+11; -- this will give us dummy table 
 SELECT lcase('LAKSHAY');-- we get to the words written inside the the bracket in lower letters 
SELECT now(); -- will give us server time 
select ucase('lakshay');
SELECT * FROM  Worker WHERE SALARY > 80000;
SELECT * FROM Worker WHERE DEPARTMENT ='HR';
-- SALARY BETWEEN [300000 , 8000000]
SELECT * FROM Worker WHERE SALARY between 300000 AND 8000000;
-- REDUCE OR CONDITION
-- HR,ADMIN
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN'
-- BETTER WAY FR=OR IN
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR' ,'ADMIN');
-- NOT IN USED 
SELECT * FROM   Worker WHERE DEPARTMENT NOT IN ('HR','ADMIN');

-- IS NULL 
SELECT * FROM Bouns WHERE BOUNS_DATE is NULL;

-- PATTERN SEARCHING/ WILDCARD 
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- SORTING USING ORDER BY  
SELECT * FROM Worker order by SALARY;

-- sorting in decending order 
select * from Worker order by SALARY DESC;

-- distinct values 
select department from Worker ; -- this is not distinct 
select DISTINCT department from Worker;

-- grouping data  that means aggreation -- group by used with aggresion function such as counts, sum aug etc 
select department,COUNT(*) from Worker group by department;



