NOT NULL:
--------
CREATE TABLE customer(
    id INT ,
    name VARCHAR(50) NOT NULL
);
INSERT INTO customer VALUES(1,'Alice');
INSERT INTO customer(name) VALUES('Bob');
INSERT INTO customer(id) VALUES(3);
SELECT * from customer;
DROP TABLE customer;
DESC customer;
-------------------------------------------
UNIQUE: Make sure no duplicate entries are made under single column
-------
CREATE TABLE users(
    id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE   --won't accept duplicates
);
INSERT INTO users VALUES(1,'Alice','alice@gmail.com');  --works
-- INSERT INTO users VALUES(2,'Bob','alice@gmail.com'); --fails
INSERT INTO users VALUES(2,'Bob','bob@gmail.com'); --works
SELECT * FROM users;
DROP TABLE users;
-------------------------------------------------------
CHECK:Used to check some condition before
-----
CREATE TABLE employees(
    id INT,
    name VARCHAR(50) NOT NULL,
    age INT CHECK(age>18 AND age<100)  -- Age will never be negative 100
);
INSERT INTO employees VALUES(1,'Balu',19); --works
INSERT INTO employees VALUES(2,'Akshu',16); --Fails due to age CONSTRAINT
INSERT INTO employees VALUES(3,'Uma',108);  --Fails due to age CONSTRAINT
SELECT * FROM employees;
DROP TABLE employees;
-----------------------------------------------------------------------------
DEFAULT:Not a CONSTAINT,but still ensures data integrity by filling the rows will default values when data is not provided
--------
CREATE TABLE employees(
    id INT,
    name VARCHAR(50),
    experience INT DEFAULT 0  --sets the experience to 0 when not provided
);
INSERT INTO employees(id,name) VALUES(1,'Alice'); --experience defaults
INSERT INTO employees VALUES(2,'Bob',4);  experience 4
SELECT * FROM employees;
DROP TABLE employees; 
--------------------------------------------------------------------------
PRIMARY KEY: It is a combination of NOT NULL and UNIQUE
-----------  *A Column whose value is very unique to any record/tuple can be set as primary key to identify that record easily
             *Only 1 primary key for a table
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
    --email VARCHAR(100) PRIMARY KEY --Fails
);
INSERT INTO student(name) VALUES('Neeru'); --Fails
INSERT INTO student VALUES(1,'Neeru');
INSERT INTO student VALUES(1,'Uma'); --Fails
SELECT * FROM student;
DROP TABLE student;
-----------------------------------------------------------------------------------
FOREIGN KEY:At least two tables are included
-----------
-- Write a in-line FOREIGN KEY
-- FOREIGN KEY must be atleast UNIQUE/PRIMARY KEY
CREATE TABLE customers(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO customers VALUES(1,'Alice','alice@gmail.com');
INSERT INTO customers VALUES(2,'Bob','bob@gmail.com');
SELECT * FROM customers;
-- child_table_column_name datatype REFERENCES parent_table_name(columnname)->synatx for in-line FOREIGN KEY
-- FOREIGN KEY(child_tab_col_name) REFERENCES parent_tab_name(columnName)->syntax for out-line FOREIGN KEY
CREATE TABLE items(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    customer_id INT REFERENCES customer(id) --FOREIGN KEY
);
INSERT INTO items VALUES(1,'Laptop',50000,1);
INSERT INTO items VALUES(2,'Mouse',1000,2);
INSERT INTO items VALUES(3,'HardDisk',10000,3); --Fails(No customer_id 3)
SELECT * FROM items;
--------------------------------------------------------------------------------------------
TASK:
-----
CREATE TABLE branches(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
INSERT INTO branches VALUES(1,'IT');
INSERT INTO branches VALUES(2,'ECE');
INSERT INTO branches VALUES(3,'CSE');
SELECT * FROM branches;
CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    age INT CHECK(age>18),
    college VARCHAR(50) DEFAULT 'Aditya',
    branch_id INT REFERENCES branches(id) 
);
INSERT INTO students VALUES(1,'Neeraja','neeraja@gmail.com',19,'Aditya',1);
INSERT INTO students VALUES(2,'Uma','uma@gmail.com',20,'IIIT',2);
INSERT INTO students VALUES(3,'Balu','balu@gmail.com',21,'GIET',3);
SELECT * FROM students;
----------------------------------------------------------------------------------