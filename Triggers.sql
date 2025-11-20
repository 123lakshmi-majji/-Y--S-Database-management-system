--Triggers:
--It is a procedure that automatically fires upon certain events
--INSERT/UPDATE/DELETE
--3 different types of triggers
--BEFORE/AFETR/INSTEAD OF trigger
--BEFORE triggers fires before performing
--DML(INSERT/UPDATE/DELETE) operation
--AFETR triggers fire after performing the DML operation
--1.Statement Level Trigger(Fires once per statement)
--2.Row Level Trigger(Fires once per each row)

--Syntax for creating a trigger:
--CREATE OR REPLACE TRIGGER trigger_name
--[BEFORE | AFETR | INSTEAD OF] [INSERT | UPDATE | DELETE]
--ON table_name
--[FOR EACH ROW] is optional -> used for ROW LEVEL TRIGGER
--BEGIN
--         Logic
--END;

SELECT * FROM employee;

--A trigger that gets fired whenever an update takes place on employee table

SET SERVEROUTPUT ON
--Statement Level Trigger:
CREATE OR REPLACE TRIGGER sample_trigger
BEFORE UPDATE ON employee
BEGIN
      DBMS_OUTPUT.PUT_LINE('An Update took place');
END;
/

UPDATE employee SET age=30
WHERE id=7;

--Row Level Trigger:
CREATE OR REPLACE TRIGGER sample_trigger
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
      DBMS_OUTPUT.PUT_LINE('An Update took place');
END;
/
SELECT * FROM employee;
UPDATE employee SET department='Known' 
WHERE department IS NULL;

CREATE TABLE new_employee(
     e_id INT PRIMARY KEY,
     e_name VARCHAR(50),
     salary INT,
     dob DATE,
     age INT
);

--A trigger that calculates age from date of birth
--before inserting values into employee table


CREATE OR REPLACE TRIGGER trg_calc_age
BEFORE INSERT OR UPDATE ON new_employee
FOR EACH ROW
BEGIN
     --Logic Here
     --In for each row insert trigger
     --There is a pseudo record presence
     --called as :NEW
     :NEW.age := FLOOR(MONTHS_BETWEEN(SYSDATE, :NEW.dob) / 12);
END;
/

--Testing the trigger
INSERT INTO new_employee(e_id,e_name,dob,salary)
VALUES(1,'alice',TO_DATE('12-06-1998','DD-MM-YYYY'),50000);

INSERT INTO new_employee(e_id,e_name,dob,salary)
VALUES(2,'bob',TO_DATE('12-06-2000','DD-MM-YYYY'),45000);

UPDATE new_employee SET dob=TO_DATE('12-06-1997','DD-MM-YYYY')
WHERE e_id=1;

SELECT * FROM new_employee;






























