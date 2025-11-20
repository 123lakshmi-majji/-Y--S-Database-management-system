--1.Create and call a PL/SQL function that takes an integer and returns it’s square
CREATE FUNCTION square(a INT)
RETURN INT IS
BEGIN
    RETURN a*a;
END;
/
--Calling the function
SELECT square(5) FROM dual;

--3.Create and call a PL/SQL function that takes 3 integers and returns the maximum of them
CREATE OR REPLACE FUNCTION Find_max(a INT,b INT,c INT)
RETURN INT IS
BEGIN 
     if a>b and a>c THEN RETURN a;
     elsif b>a and b>c THEN RETURN b;
     else RETURN c;
     END IF;
END;
/
--Calling the function
SELECT Find_max(5,6,8) FROM dual;
      
--4.Create and call a PL/SQL function that takes two strings name and gender and returns a new name that is made of name and first letter of gender in the following format– name (g)
--• Example:
-- If Alice and Female passed as name and gender, the function should return Alice (F)   
CREATE OR REPLACE FUNCTION get_gender(
name VARCHAR, gender VARCHAR) RETURN VARCHAR IS
BEGIN
    RETURN name || '(' || SUBSTR(gender, 1, 1) || ')';
END;
/
-- Calling the functions
SELECT get_gender('Alice', 'Female') AS new_name FROM dual;

--5.Create and call a PL/SQL function that takes a string and returns a new_string with first and last letters of the given string
--• Example
-- If oracle is passed as string then, the function should return oe
CREATE FUNCTION new_string(name VARCHAR)
RETURN VARCHAR IS
BEGIN
    RETURN SUBSTR(name,1,1) || SUBSTR(name,-1,1);
END;
/
--Calling the function
SELECT new_string('oracle') FROM dual;

--6.Create and call a PL/SQL function that takes a DATE dob and returns the age of a person
CREATE OR REPLACE FUNCTION get_age(dob DATE)
RETURN INT IS
age INT; -- Declaring a variable here
BEGIN
    age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM dob);
    RETURN age;
END;
/

SELECT get_age(TO_DATE('24-11-2007', 'DD-MM-YYYY')) 
AS age FROM dual;

--7.Create and call a PL/SQL function that takes a DATE doj and returns the years of experience
CREATE FUNCTION get_exp(doj DATE)
RETURN INT IS
exp_ INT;
BEGIN
    exp_ := FLOOR(MONTHS_BETWEEN(SYSDATE, doj)/12);
    RETURN exp_;
END;
/
(SELECT id,name,department,

--10.Create and call a PL/SQL function that takes department and salary and returns bonus computed on following basis
--  department   bonus_perc
--    HR        12%
--  Operations  10%
--    SW        15%
--   Testing    8%
--   None       5%
CREATE FUNCTION get_bonus(dept VARCHAR,salary INT)
RETURN INT IS
bonus_ INT;
BEGIN
     IF dept = 'HR' THEN bonus_ := salary * 0.12;
     ELSIF dept = 'Operations' THEN bonus_ := salary * 0.10;
      ELSIF dept = 'SW' THEN bonus_ := salary * 0.15;
       ELSIF dept = 'Testing' THEN bonus_ := salary * 0.08;
       ELSE bonus_ := salary * 0.05;
       END IF;
       RETURN bonus_;
END;
/
--Calling the function
SELECT id,name,department,salary
     




















