--For loop:
--Syntax:
--FOR loop_variable IN start..stop LOOP
--CODE
--END LOOP;
--Printing 1 t0 10 numbers using for loop in PL/SQL

SET SERVEROUTPUT ON;

BEGIN
    FOR i IN 1..10 LOOP
       DBMS_OUTPUT.PUT_LINE('Number is: ' || i);
    END LOOP;
END;
/
--Print numbers in single line
BEGIN
    FOR i IN 1..10 LOOP
       DBMS_OUTPUT.PUT(i || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/
--To print numbers from 10 to 1 using for loop
BEGIN
    FOR i IN REVERSE 1..10 LOOP
       DBMS_OUTPUT.PUT(i || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/

--Nested looping in PL/SQL
BEGIN
    FOR i IN 1..5 LOOP
       FOR j IN 1..5 LOOP
         DBMS_OUTPUT.PUT('*');
       END LOOP;
         DBMS_OUTPUT.NEW_LINE();
    END LOOP;
END;
/
--Factor count of each number in a certain range
DECLARE
     a INT := 10;
     b INT := 15;
     fc INT;
BEGIN
    FOR i IN a..b LOOP
    fc := 0;
      FOR j IN 1..i LOOP
        IF MOD(i,j) = 0 THEN
           fc := fc+1;
        END IF;
      END LOOP; --End of inner loop
        DBMS_OUTPUT.PUT_LINE('Factor Count of ' || i || ' is: ' || fc);
    END LOOP; --End of outer loop
END;
/

--TRIM:
DECLARE
   fc INT;
   output VARCHAR(1000);
BEGIN
  FOR i IN 2..1000 LOOP
    fc := 0;
  FOR j IN 1..i LOOP
    IF MOD(i,j)=0 THEN
       fc := fc+1;
     END IF;
    END LOOP;
    IF fc =2 THEN 
      output := output || i || '&';
    END IF;
  END LOOP;
   DBMS_OUTPUT.PUT_LINE(TRIM('&' FROM output));
END;
/

--EXIT is a Keyword that can be used in loops to terminate the loop
--Equivalent of break statement in C/Java
BEGIN
    FOR i IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE(i);
        IF i=5 THEN
          EXIT;
        END IF;
        END LOOP;
END;
/

--Basic loop
--syntax
--LOOP
--Code inside
--Inside the loop we need to EXIT WHEN
--to terminate the loop
--Printing numbers from 1 to 10 using Basic loop
--Do-While kind of looping in PL/SQL

DECLARE 
    i INT := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
      i := i+1;
      EXIT WHEN  i=11;
   END LOOP;
END;
/

--Functions in PL/SQL
--Functions are used to write a block of code that can be reused
--Functions in PL/SQL must return a value
--Functions can be directly used in SQL statement  (when written as single row function)
--Functions can contain DML commands inside, but such functions should not be directly used in SQL statements
--Syntax for function definition:
CREATE [OR REPLACE] FUNCTION function_name(parameterlist)
RETURN data_type IS|AS
--Declare local variables here
BEGIN
   --Executable code of function
   --RETURN value
END;
--Function that takes 2 integers and returns their sum

CREATE OR REPLACE FUNCTION add_two(a INT,b INT) 
RETURN INT IS
BEGIN
   RETURN a*a+b*b;
END;
/

--Calling the created function
--1.Can be directly called in a SQL SELECT STATEMENT
SELECT add_two(100,200) FROM dual;
--2.It can also be called from PL/SQL code
DECLARE
     res INT;
BEGIN
    res := add_two(100,200);
    DBMS_OUTPUT.PUT_LINE(res);
END;
/
--Function that takes name gender and returns name(g):
CREATE OR REPLACE FUNCTION get_name(name VARCHAR, gender VARCHAR)
RETURN VARCHAR IS
BEGIN
    RETURN name || '(' || SUBSTR(gender,1,1) || ')';
END;
/
--Calling the function
SELECT get_name('Neeraja','Female') AS new_name FROM dual;

--Using user defined functions in SQL statements
SELECT get_name(name,gender) FROM employee;

--A function called get_age which takes date of birth and returns age of the person
CREATE FUNCTION get_age(dob DATE)
RETURN INT IS
age INT;  --Declaring a variable here
BEGIN
    age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM dob);
    RETURN age;
END;
/
--Calling the function
SELECT get_age(TO_DATE('17-05-2008','DD-MM-YYYY')) AS age FROM dual;

SELECT EXTRACT(YEAR FROM SYSDATE)AS year FROM dual;

--Count the experience of each people in employee table
CREATE FUNCTION get_experience(doj DATE)
RETURN INT IS
age INT;  --Declaring a variable here
BEGIN
    age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM doj);
    RETURN age;
END;
/
--Calling the function
SELECT id,name,date_of_joining,
get_experience(date_of_joining) AS experience
FROM employee
ORDER BY experience;

--PL/SQL Block:
DECLARE 
     --Using INTO statement
     sum_ INT;
BEGIN
    SELECT SUM(salary) INTO sum_ FROM employee;
    DBMS_OUTPUT.PUT_LINE('Sum of all salaries is: ' || sum_);
END;
/

-- Function definition
CREATE OR REPLACE FUNCTION get_salary_sum(
dept_name VARCHAR) RETURN INT IS
sum_ INT;
BEGIN
    SELECT SUM(salary) INTO sum_ FROM employee 
    WHERE department = dept_name;
    RETURN sum_;
END;
/
-- Inside another PL/SQL Block
DECLARE
    dept VARCHAR(50);
    res INT;
BEGIN
    dept := '&dept';
    res := get_salary_sum(dept);
    DBMS_OUTPUT.PUT_LINE('Sum of salaries of ' || dept || 'is: ' || res);
END;
/

--PROCEDURES in PL/SQL(Stored procedures)
--Procedure allows you to write some PL/SQL Block that performs 
--Procedures are used to perform DML operatins from PL/SQL block on a table
--Procedures cannot be directly called from SELECT statement
--In procedures there is no RETURN statement because it is a VOID function
--Two different ways of calling a procedure
--1.Using a command called EXEC (Execute)
--2.Call procedure from a PL/SQL Block
--Syntax:
--CREATE PROCEDURE procedure_name IS|AS
--DECLARE variables here
--BEGIN
    --Code
--END;
--A procedure that just prints hello all on screen whenever called

CREATE OR REPLACE PROCEDURE say_hello IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hello...');
END;
/
--calling the procedure in 2 ways
--1.Use EXEC command to fire the procedure
EXEC say_hello();
--2.Use another pl/sql block to fire the procedure
BEGIN
    say_hello();
END;
/

--Procedure with parameters
--IN Parameter
CREATE OR REPLACE PROCEDURE print_nums(
n IN INT)IS
BEGIN
    FOR i IN 1..n LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
    END LOOP;
END;
/
EXEC print_nums(20);
EXEC print_nums(30);

--Actual use of procedures in terms of minimizing the time and effort to write DML commands
CREATE OR REPLACE PROCEDURE update_sal(emp_id IN INT, new_salary IN INT) IS
BEGIN
    UPDATE employee SET salary = new_salary WHERE id=emp_id;
END;
/

SELECT * FROM employee;

EXEC update_sal(4,90000);
EXEC update_sal(7,100000);

CREATE OR REPLACE PROCEDURE delete_id(emp_id IN INT)IS
BEGIN
     DELETE FROM employee WHERE id=emp_id;
END;
/
EXEC delete_id(3);

SELECT * FROM employee;

--Tasks:
--1.Create and call a PL/SQL procedure that takes an integer n (Use IN parameter) and prints all the numbers from n to 1
CREATE OR REPLACE PROCEDURE get_nums(n IN INT)IS
BEGIN
     FOR i IN REVERSE 1..n LOOP
        DBMS_OUTPUT.PUT_LINE('Number is: ' || i);
    END LOOP;
END;
/
EXEC get_nums(10);

--2.Create and call a PL/SQL procedure that takes two integers a and b (Use IN parameters)
and prints all the numbers from a to b
CREATE OR REPLACE PROCEDURE get_integers(a IN INT,b IN INT)IS
BEGIN
    FOR i IN a..b LOOP 
       DBMS_OUTPUT.PUT_LINE('Number is: ' || i);
    END LOOP;
END;
/
EXEC get_integers(10,20);

--5.Write and call a PL/SQL procedure that department (Use IN parameter) and salary_limit (Use IN parameter) and prints the details of the employees earning more than the salary_limit from the given department.
CREATE OR REPLACE get_salary(dept_name IN VARCHAR ,salary_limit IN INT)
BEGIN
     


--6.Write and call a PL/SQL procedure that takes id and new_salary (Use IN paramters) and UPDATEs the salary of the employee with given id to new_salary
CREATE OR REPLACE PROCEDURE update_sal(emp_id IN INT, new_salary IN INT) IS
BEGIN
    UPDATE employee SET salary = new_salary WHERE id=emp_id;
END;
/

SELECT * FROM employee;

EXEC update_sal(4,90000);
EXEC update_sal(7,100000);

--7.Write and call a PL/SQL procedure that takes department and new_value (integer) (Use IN paramters) and UPDATEs the ages of all the employees who belong the department give to new_value where age is NULL
CREATE OR REPLACE PROCEDURE update_age(new_value IN INT)IS
BEGIN
     UPDATE employee SET age = new_value WHERE age IS NULL;
END;
/
EXEC update_age(20);

SELECT * FROM employee;


CREATE OR REPLACE PROCEDURE sum_c(a IN number,b IN number,c OUT number)AS
BEGIN
     c := a+b;
END;
/

DECLARE
    d number;
BEGIN
     sum_c(2,7,d);
     DBMS_OUTPUT.PUT_LINE(d);
END;
/








































