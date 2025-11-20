--Normalizing a table that is violating 2NF
--3 Tables needed student,course,enrollments
--DROP TABLE student;
CREATE TABLE student(
     s_id INT PRIMARY KEY,
     s_name VARCHAR(50),
     s_age INT
);

INSERT INTO student VALUES(1,'Alice',17);
INSERT INTO student VALUES(2,'Bob',21);
INSERT INTO student VALUES(3,'Charlie',19);

SELECT * FROM student;

--DROP TABLE course;
CREATE TABLE course(
     c_id INT PRIMARY KEY,
     c_name VARCHAR(50)
);

INSERT INTO course VALUES(101,'C');
INSERT INTO course VALUES(102,'Java');
INSERT INTO course VALUES(103,'Python');

SELECT * FROM course;

CREATE TABLE enrollments(
     s_id INT REFERENCES student(s_id),  --Foreign key
     c_id INT REFERENCES course(c_id),   --Foreign key
     enroll_date DATE DEFAULT SYSDATE,
     grade VARCHAR(1),
     price INT,
     PRIMARY KEY(s_id,c_id)              --Composite key
);

INSERT INTO enrollments(s_id,c_id,grade,price)VALUES(1,101,'B',5000);
INSERT INTO enrollments(s_id,c_id,grade,price)VALUES(2,103,'C',7000);
INSERT INTO enrollments(s_id,c_id,grade,price)VALUES(1,102,'A',6000);
INSERT INTO enrollments(s_id,c_id,grade,price)VALUES(3,101,'D',5000);

SELECT * FROM enrollments;

--Target:Normalize enrollments table 
--Migrate all the price values from enrollments into course table,without losing any data
--Step 1:Add a new column called price in course table
--ALTER + ADD command to do this

ALTER TABLE course ADD price INT;

--Updating course table with corresponding prices
UPDATE course c
SET price=(SELECT price FROM
(SELECT DISTINCT c_id,price FROM enrollments)
WHERE c_id=c.c_id);

SELECT * FROM enrollments;

SELECT * FROM course;

--Dropping price column from enrollments
ALTER TABLE enrollments DROP COLUMN price;

--3NF:

CREATE TABLE employees(
    e_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary INT,
    age INT,
    d_id INT,
    d_name VARCHAR(50),
    d_hod VARCHAR(5)
);

INSERT INTO employees VALUES(1,'alice',500000,27,12,'IT','XYZ');
INSERT INTO employees VALUES(2,'bob',55000,25,44,'DS','ABC');
INSERT INTO employees VALUES(3,'Charlie',45000,31,12,'IT','XYZ');
INSERT INTO employees VALUES(4,'diana',60000,42,42,'AIML','PQR');
INSERT INTO employees VALUES(5,'eric',80000,39,44,'DS','ABC');

SELECT * FROM employees;

--DROP TABLE department;
--DROP TABLE department;
CREATE TABLE department AS
SELECT DISTINCT d_id,d_name,d_hod FROM employees;

SELECT * FROM department;

--DROP TABLE employees;
--DROP TABLE department;

--Procedures -->Takes table name and column name
--DROPS The column from table
CREATE OR REPLACE PROCEDURE drop_column(
tab_name VARCHAR,col_name VARCHAR)IS
--command VARCHAR(50) := 'ALTER TABLE ' || tab_name || ' DROP COLUMN ' || col_name;
BEGIN
     --DML->ALTER
     --EXECUTE IMMEDIATE DDL COMMAND
     EXECUTE IMMEDIATE
     'ALTER TABLE ' || tab_name || ' DROP COLUMN ' || col_name;
END;
/
--EXEC executes a procedure
SELECT * FROM employees;
EXEC drop_column('employees','d_name');

--Adding primary key to department table
ALTER TABLE department
MODIFY d_id INT PRIMARY KEY;

INSERT INTO department VALUES(42,'CSE','MNO');

--Making d_id as foreign key 

















     
     