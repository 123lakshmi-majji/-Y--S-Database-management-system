DROP TABLE employee;
DROP TABLE dependent;
--STRONG ENTITY:
CREATE TABLE employee(
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  salary INT NOT NULL
);
--WEAK ENTITY:
CREATE TABLE dependent(
   id INT,  --PARTIAL KEY(Can be used in a composite key)
   emp_id INT,  --FOREIGN KEY
   name VARCHAR(50),
   relation VARCHAR(50),
   FOREIGN KEY(emp_id) REFERENCES employee(id),
   --COMPOSITE PRIMARY KEY
   PRIMARY KEY(id,emp_id)
);
INSERT INTO employee VALUES(1,'Alice',50000);
INSERT INTO employee VALUES(2,'Bob',400000);
SELECT * FROM employee;

INSERT INTO dependent(id,emp_id,name,relation)VALUES(1,1,'Charlie','Husband');
INSERT INTO dependent(id,emp_id,name,relation)VALUES(2,1,'Denver','Father');
SELECT * FROM dependent;

   
