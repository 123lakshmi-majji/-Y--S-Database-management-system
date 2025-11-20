DDL->Data Definition Language
CARD-T->CREATE ALTER RENAME DROP TRUNCATE
DML->Data Manipulation Language
ALTER:
-----
1.ALTER+ADD
*When you want to add a new column to existing table
*When you want to add a new constraint on a column in an existing table
2.ALTER+MODIFY
*Is used to modify the properties of existing columns
   Let's assume that AGE is set to NOT NULL
3.ALTER+DROP
*Dropping an existing column
*Dropping an existing constraint
Code:
-----
CREATE TABLE employee(
    id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT,
    --Syntax to name constraints
    --CONSTRAINT constraint_name CONSTRAINT_TYPE(column_name)
    CONSTRAINT emp_pk PRIMARY KEY(id),
    CONSTRAINT uq_mail UNIQUE(email),
    CONSTRAINT age_ck CHECK(age>18)
);
------------------------------------------------------------------
4.ALTER+ENABLER/
5.ALTER+RENAME
* Renaming a column
->ALTER TABLE table_name
->RENAME COLUMN old_col_name to new_col_name
*Renaming an entire table
ALTER TABLE
6.ALTER+SET
Task:
-----
CREATE TABLE students(
    id INT,
    name VARCHAR(20)
);
ALTER TABLE students
ADD (age INT);
ALTER TABLE students
ADD(college VARCHAR(50) NOT NULL, branch  VARCHAR(50));
ALTER TABLE students
MODIFY(name NOT NULL);
ALTER TABLE students
MODIFY age INT CHECk (age>18);
ALTER TABLE students
RENAME COLUMN branch to department;
ALTER TABLE students
DROP COLUMN college;
DROP TABLE students;
CREATE TABLE customers(
    id INT,
    name VARCHAR(20),
    email VARCHAR(50)
);
ALTER TABLE customers
MODIFY (name VARCHAR(50));
ALTER TABLE customers
ADD CONSTRAINT uq_mail UNIQUE(email);
ALTER TABLE customers
ADD(digi_wallet INT DEFAULT 0);
DROP TABLE customers;
CREATE TABLE items(
    id INT,
    name VARCHAR(50),
    price INT
);
ALTER TABLE items
ADD(customer_id INT);
ALTER TABLE items
ADD CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES customer(id);
DROP TABLE items;
---------------------------------------------------------------------------------