-- -- Auto-Generation
-- -- Only one column in your table can be IDENTITY
-- -- IDENTITY can be applied on numeric types only
-- -- START value will be 1, INCREMENT values will be 1
-- CREATE TABLE student(
--     id INT GENERATED AS IDENTITY PRIMARY KEY,
--     -- id INT GENERATED AS IDENTITY(START WITH 500 INCREMENT BY 3) PRIMARY KEY,
--     name VARCHAR(50) NOT NULL
-- );
-- INSERT INTO student(name) VALUES('Alice');
-- INSERT INTO student(name) VALUES('Bob');
-- INSERT INTO student(name) VALUES('Charlie');

-- SELECT * FROM student;
-- DATE data type
CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    joining_date DATE -- DATE is a data type
);

-- NLS_DATE_FORMAT (DD-MM-YYYY, YYYY-MM-DD, DD-MON-RR)
-- Natural Language Support
-- A parameter which determines how the date format is
-- currently present in your session
-- Query to see how NLS_DATE_FORMAT currently is
SELECT value
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

INSERT INTO employee
VALUES(1, 'Alice', 50000, '02-JAN-25'); -- CURRENT NLS DATE FORMAT
-- TO_DATE('02-01-2025', 'DD-MM-YYYY')
-- TO_DATE('2025-02-01', 'YYYY-DD-MM')
INSERT INTO employee
VALUES(2, 'Bob', 45000, TO_DATE('17-12-2023', 'DD-MM-YYYY'));
INSERT INTO employee
VALUES(3, 'Charlie', 45000, TO_DATE('21/04/1999', 'DD/MM/YYYY'));

-- Changing  current NLS_DATE_FORMAT
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
INSERT INTO employee VALUES(4, 'David', 60000, '17-03-2002');

SELECT * FROM employee;















