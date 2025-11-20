SET SERVEROUTPUT ON;

DECLARE
   num INT := &num;
BEGIN
   FOR  i in REVERSE 1..num LOOP
     FOR j in 1..i LOOP
   DBMS_OUTPUT.PUT('* ');
     END LOOP;
   DBMS_OUTPUT.NEW_LINE;
END LOOP;
END;
/

BEGIN 
FOR i IN 1..5 LOOP
  FOR j IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(i || 'X' || j || '=' || (i*j));
    END LOOP;
END LOOP;
END;
/

CREATE TABLE emp(
   emp_id INT PRIMARY KEY,
   name VARCHAR(50),
   gender VARCHAR(10),
   salary INT
);

INSERT INTO emp VALUES(1,'Alice','M',3000);
INSERT INTO emp VALUES(2,'Bob','M',2000);
INSERT INTO emp VALUES(3,'Charlie','F',4000);
INSERT INTO emp VALUES(4,'Diana','F',5000);
INSERT INTO emp VALUES(5,'Eric','M',3000);

SELECT * FROM emp;

SELECT name FROM emp
WHERE salary =(SELECT MIN(salary) FROM emp);

SELECT name FROM emp
WHERE salary=(SELECT MAX(salary) FROM emp);

SELECT  name FROM emp
WHERE salary=(SELECT AVG(salary) FROM emp WHERE salary > 3000);



















