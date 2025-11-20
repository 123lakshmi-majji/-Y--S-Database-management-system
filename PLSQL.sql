--Introduction to PL/SQL:
--PL/SQL is the procedural language extension that is developed by oracle and integrated into oracle data base
--SQL is a declarative language
--In declarative language,we focus more on what to get rather than how to get
--SELECT id,name,salary,gender,department
--FROM employee WHERE department='HR' AND gender='Male';
--DBMS_OUTPUT.PUT_LINE(string) -> syntax for printing output

--Intro to PL/SQL:
--DECLARE
--BEGIN
--EXCEPT
--DECLARE block is used to declaration or initialization of variables
--BEGIN block is used to write executable code(programming logic)
--EXCEPT block is used to throw exceptions
--A simple program that prints Hello World on to screen using PL/SQL

SET SERVEROUTPUT ON;

--Program for print Hello World and my name as well:
BEGIN
     DBMS_OUTPUT.PUT_LINE('Hello World!');
     DBMS_OUTPUT.PUT_LINE('My name is Neeraja');
     DBMS_OUTPUT.PUT_LINE('I am From T-Hub');
END;
/

--DBMS_OUTPUT.PUT():
--It acculates the strings 
--provided in the multiple PUT() statements 
--and needs a DBMS_OUTPUT.NEW_LINE() command 
--to print accumlated string and flush out

BEGIN
     DBMS_OUTPUT.PUT('Hello ');
     DBMS_OUTPUT.PUT('World! ');
     DBMS_OUTPUT.PUT('I am ');
     DBMS_OUTPUT.PUT('Neeraja ');
     DBMS_OUTPUT.NEW_LINE();
END;
/

--Working with variable declaration in PL/SQL
DECLARE 
--Syntax:Variable_name DATA TYPE
     v_num1 INT;
     v_num2 INT;
     v_sum INT;
BEGIN
    --Assign values to v_num1 and v_num2
    --Assignment operator in PL/SQL is " := "
    v_num1 := 10;
    v_num2 := 20;
    v_sum := v_num1+v_num2;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || v_sum);
END;
/

DECLARE 
     v_num1 INT := 10; --Initialization
     v_num2 INT := 20; --Initialization
     v_sum INT;        --Declaration
BEGIN
    v_sum := v_num1+v_num2;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || v_sum);
END;
/

DECLARE 
     e_id INT;
     e_name VARCHAR(50);
     e_dob DATE;
BEGIN
    e_id := 1;
    e_name := 'Pavan';
    e_dob := SYSDATE;
    DBMS_OUTPUT.PUT_LINE('ID is: ' || e_id);
    DBMS_OUTPUT.PUT_LINE('Name is: ' || e_name);
    DBMS_OUTPUT.PUT_LINE('DOB  is: ' || TO_CHAR(e_dob, 'DD-MM-YYYY'));
END;
/

DECLARE 
     v_num1 INT;
     v_num2 INT;
     v_sum INT;
BEGIN
    v_num1 := &v_num1;
    v_num2 := &v_num2;
    v_sum := v_num1+v_num2;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || v_sum);
END;
/

DECLARE
       side INT;
       area INT;
       peri INT;
BEGIN
     side := &side;
     area := side*side;
     peri := 4*side;
     DBMS_OUTPUT.PUT_LINE('Area is: ' || area);
     DBMS_OUTPUT.PUT_LINE('Perimeter is: ' || peri);
END;
/

--Age Calculator:
DECLARE
      dob DATE;
      age INT;
BEGIN
    dob := TO_DATE('24-05-2005','DD-MM-YYYY');
    age := TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(dob,'YYYY');
    DBMS_OUTPUT.PUT_LINE('You are ' || age || ' years old.');
END;
/

DECLARE
      dob DATE;
      age INT;
BEGIN
    dob := TO_DATE('&dob','DD-MM-YYYY');
    age := TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(dob,'YYYY');
    DBMS_OUTPUT.PUT_LINE('You are ' || age || ' years old.');
END;
/

--Conditional Statements:
--These are used fro decision making
--IF-THEN(simple if in C)
--IF-THEN-ELSE(If else in C)
--IF-THEN-ELSEIF-THEN-ELSE(If-else if-else ladder in C)
--Simple CASE (Works on conditions)
--Simple if statement(IF-THEN)
--Syntax:
--If condition THEN code
--If condition is true code will be executed

--Voting Program:
DECLARE
      age INT;
BEGIN
    age := &age;
    IF age > 18 THEN
      DBMS_OUTPUT.PUT_LINE('You Can Vote');
    ELSE
      DBMS_OUTPUT.PUT_LINE('You cannot Vote');
    END IF;  --specifies the END of IF block
      --DBMS_OUTPUT.PUT_LINE('ABC');
END;
/

--Even OR Odd Program:
DECLARE
     num INT;
BEGIN
    num := &num;
    IF MOD(num,2) =0 THEN
      DBMS_OUTPUT.PUT_LINE('Even');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Odd');
    END IF;
END;
/

--Nested IF-ELSE statements:
BEGIN
    IF 10 > 20 THEN
       IF 20 > 10 THEN
         DBMS_OUTPUT.PUT_LINE('C');
        ELSE
         DBMS_OUTPUT.PUT_LINE('A');
        END IF;
    ELSE
       DBMS_OUTPUT.PUT_LINE('B');
    END IF;
END;
/

--Maximum of three Numbers Program:
DECLARE 
    a INT := 70;
    b INT := 60;
    c INT := 40;
    mot INT;
BEGIN
    IF a > b THEN
      IF a > c THEN
        mot := a;
      ELSE
        mot := c;
      END IF;
    ELSE
       IF b > c THEN
          mot := b;
       ELSE 
          mot := c;
       END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Maximum is: ' || mot);
END;
/

--IF-THEN-ELSIF-THEN-ELSE-ENDIF:
--Max of three using else if:

DECLARE
     a INT := 10;
     b INT := 20;
     c INT := 30;
     mot INT;
BEGIN
   IF a >  b AND a > c THEN
       mot := a;
   ELSIF b > a AND b > c THEN
      mot := b;
   ELSE
       mot := c;
   END IF;
     DBMS_OUTPUT.PUT_LINE('Max of three is: ' || mot);
END;
/
    
--Profit Loss or no-profit_no-loss Program:
DECALRE
     cp INT := &cp;
     sp INT := &sp;
BEGIN
    IF sp > cp THEN 
       DBMS_OUTPUT.PUT_LINE('Profit');
    ELSIF sp < cp THEN 
       DBMS_OUTPUT.PUT_LINE('Loss');
    ELSE 
       DBMS_OUTPUT.PUT_LINE('Neither Profit or loss');
    END IF;
END;
/

--Loops:
--while loop syntax:
--A simple program to print numbers from 1 to 10 using WHILE Loop:
DECLARE
     --Declare loop variable
     i INT := 1;
BEGIN
    WHILE i <= 10 LOOP
      DBMS_OUTPUT.PUT_LINE('Numver: ' || i);
       i := i+1;
    END LOOP;
END;
/

DECLARE
     --Declare loop variable
     i INT := 1;
BEGIN
    WHILE i <= 10 LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
       i := i+1;
    END LOOP;
END;
/

--Print reverse order from 10 to 1:
DECLARE
     --Declare loop variable
     i INT := 10;
BEGIN
    WHILE i >= 1 LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
       i := i-1;
    END LOOP;
END;
/

--Factors Program:
DECLARE
     --Declare loop variable
     i INT := 1;
     num INT;
BEGIN
    num := &num;
    WHILE i <= num LOOP
       IF MOD(num,i) = 0 THEN 
      DBMS_OUTPUT.PUT_LINE('Numver: ' || i);
       i := i+1;
       END IF;
    END LOOP;
END;
/






































