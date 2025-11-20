--LOGGING:
--Useful in the case of logging
--Logging is nothing but keeping track of changes
--we are making to data
--Trigger for logging
--Creating an extra table
--called salary_change_log
--emp_id,old_sal,new_sal,updated_on

CREATE TABLE salary_change_log(
      emp_id INT,
      old_sal INT,
      new_sal INT,
      updated_on DATE DEFAULT SYSDATE
);
          
--Triggers that inserts a new row into salary_change_log table
--whenever there is salary change performed in employee table

CREATE OR REPLACE TRIGGER trg_chn_sal
AFTER UPDATE OF salary ON employee
FOR EACH ROW
BEGIN
    INSERT INTO salary_change_log(emp_id,old_sal,new_sal)
    VALUES(:NEW.id,:OLD.salary,:NEW.salary);
END;
/

SELECT * FROM employee;

UPDATE employee SET salary=80000
WHERE id=2;

UPDATE employee SET salary=70000
WHERE id=13;

UPDATE employee SET gender='Male'
WHERE id=26;

SELECT * FROM salary_change_log;

--DROP TRIGGER trg_chn_sal;

--DROP TABLE salary_change_log;

--Creating a sequence that generates nums
CREATE SEQUENCE nums_seql
START WITH 1
INCREMENT BY 1;
--sequence values can be obtained using NEXTVAL
SELECT nums_seq1.NEXTVAL FROM dual;

--'INV-CURRENTYEAR-0000'
SELECT 'INV-' || EXTRACT(YEAR FROM SYSDATE)
|| '-' || LPAD(nums_seql.NEXTVAL,4,'0')FROM dual;

--DROP SEQUENCE nums_seql;

--TASK:
CREATE TABLE user_s(
      u_id INT,
      u_name VARCHAR(50),
      u_email VARCHAR(100)
);

INSERT INTO user_s VALUES(1,'Alice','alice@gmail.com');
INSERT INTO user_s VALUES(2,'Bob','bob@gmail.com');

CREATE TABLE item_s(
    i_id INT,
    i_name VARCHAR(50),
    i_price INT
);

INSERT INTO item_s VALUES(1,'Laptop',50000);
INSERT INTO item_s VALUES(2,'Mouse',1000);

CREATE TABLE order_s(
    o_id INT,
    u_id INT,
    i_id INT,
    o_date DATE DEFAULT SYSDATE,
    quantity INT
);

INSERT INTO order_s(o_id,u_id,i_id,quantity) VALUES(101,1,1,2);
INSERT INTO order_s(o_id,u_id,i_id,quantity) VALUES(102,2,2,5);

SELECT * FROM order_s;

DROP TABLE user_s;

DROP TABLE item_s;

DROP TABLE order_s;












