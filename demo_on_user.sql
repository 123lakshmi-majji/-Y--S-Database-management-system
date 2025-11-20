--Create a new user
--CREATE USER user_name IDENTIFIED BY  PASSWORD

CREATE USER c##tdo IDENTIFIED BY 12345;

--Granting Priviledge:
--GRANT priviledge_name to user_name

GRANT CREATE SESSION TO c##tdo;
GRANT RESOURCE TO c##tdo;

GRANT UNLIMITED TABLESPACE TO c##tdo;
SELECT * FROM testing_dept_employees;
--Granting a view to user
GRANT SELECT ON system.testing_dept_employees TO c##tdo;
GRANT UPDATE,INSERT ON system.testing_dept_employees TO c##tdo;

SELECT * FROM all_users;