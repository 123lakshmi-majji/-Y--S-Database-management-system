CREATE TABLE students(
    id INT,
    name VARCHAR(20)
);
-- ADDING a new column
-- ALTER TABLE table_name ADD (col_name datatype)
-- ALTER TABLE table_name ADD(col1 dt1, col2 dt2...)
ALTER TABLE students
ADD (age INT);
-- adding multiple columns at once
ALTER TABLE students
ADD(college VARCHAR(50) NOT NULL, branch  VARCHAR(50));

-- ALTER + MODIFY
ALTER TABLE students
MODIFY(id NOT NULL);

ALTER TABLE students
MODIFY (name VARCHAR(50));

ALTER TABLE students
MODIFY (age DEFAULT 0);

-- ALTER + DROP
-- Dropping only 1 column at a time
ALTER TABLE students
DROP COLUMN branch;



DROP TABLE students;


-- CREATE TABLE employee(
--     id INT PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     age INT CHECK(age > 18)
-- );
CREATE TABLE employee(
    id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT,
    -- Syntax to name constraints
    -- CONSTRAINT constraint_name CONSTRAINT_TYPE(column_name)
    CONSTRAINT emp_pk PRIMARY KEY(id),
    CONSTRAINT uq_mail UNIQUE(email),
    CONSTRAINT age_ck CHECK(age > 18)
);


-- ALTER TABLE table_name DROP CONSTRINT constraint_name
ALTER TABLE employee
DROP CONSTRAINT AGE_CK;

-- ALTER + RENAME
DROP TABLE employee;

CREATE TABLE items(
    id INT,
    name VARCHAR(50)
);
-- ALTER TABLE table_name ADD CONSTRAINT cons_name CONSTRAINT_TYPE(col)
ALTER TABLE items
ADD CONSTRAINT items_pk PRIMARY KEY(id)
-- -- ALTER + MODIFY
-- ALTER TABLE items
-- MODIFY (id PRIMARY KEY);
------------------------------------------
CREATE TABLE students(
    id INT,
    name VARCHAR(20)
);
ALTER TABLE students
ADD(age INT);

ALTER TABLE students
ADD(branch VARCHAR(50), college VARCHAR(50));

ALTER TABLE students
MODIFY(name NOT NULL);


ALTER TABLE students
MODIFY(age CHECK(age>18));

ALTER TABLE students
RENAME column branch to department;

ALTER TABLE students
DROP column college;

CREATE TABLE customers(
    id INT PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR(50)
);
DROP TABLE customers;
ALTER TABLE customers
MODIFY(name VARCHAR(50));

ALTER TABLE customers
ADD(digi_wallet INT DEFAULT 0);

ALTER TABLE customers
DROP COLUMN digi_wallet;

ALTER TABLE customers
ADD CONSTRAINT uq_emp UNIQUE(email);

CREATE TABLE items(
    id INT,
    name VARCHAR(50),
    price INT
);
ALTER TABLE items
ADD(customer_id INT);

ALTER TABLE items
ADD CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES customers(id);