Data Integrity:
--------------
1.No two students have same roll number
2.Age of a person(will never be negative)(120)

CONSTRAINTS:
-----------
1.primary key:
-------------
a. Is a column that uniquely identifies the record
b. When you set a column to primary key,it's automatically UNIQUE and NOT NULL
c. Only one column in the table can be set to primary key
------------------------------------------------------------
2.NOT NULL
3.UNIQUE
4.CHECK
5.Foreign key
6.DEFAULT
--------------------------------------------------
CREATE TABLE users(
  id INT,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL
);
INSERT INTO users(id name,age) VALUES(1,'Neeru',17);
DROP TABLE users;
DROP TABLE CASCADE CONSTRAINTS PURGE;
---------------------------------------
CREATE TABLE STUDENTS(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
INSERT INTO STUDENTS VALUES(1,'ALICE',16);
INSERT INTO STUDENTS VALUES(2,'BOB',69);                                          
INSERT INTO STUDENTS VALUES(3,'CHARLIE',12);
SELECT * FROM STUDENTS;

DROP TABLE STUDENTS;

SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE table_name='STUDENTS';
----------------------------------------------------
CREATE TABLE cities(
    name VARCHAR(50),
    population INT,
    continent VARCHAR(20) DEFAULT 'Asia'
);
INSERT INTO cities(name,population)
VALUES('Mumbai',50000);
INSERT INTO cities
VALUES('Los Angles',10000,'North America');
select * from cities;
DROP TABLE cities;
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE table_name='cities';
--------------------------------------------------
CREATE TABLE customers(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);
INSERT INTO customers
VALUES(1,'Neeraja','abc@example.com');
INSERT INTO customers
VALUES(2,'Uma','xyz@example.com');
INSERT INTO customers
VALUES(3,'Anu','pqr@example.com');
SELECT * FROM customers;
DROP TABLE customers CASCADE CONSTRAINTS;
-------------------------------------------------------