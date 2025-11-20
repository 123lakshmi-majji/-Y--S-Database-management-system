SET SERVEROUTPUT ON;

--Sum of First N natural NUmbers
DECLARE
    N NUMBER(10) := 10;
    total_sum NUMBER(10) := 0;  -- Renamed
    i NUMBER(10) := 1;
BEGIN
    LOOP
        total_sum := total_sum + i;
        i := i + 1;
        EXIT WHEN i > N;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Sum: ' || total_sum);
END;
/

--Prime or NOt
DECLARE
    N NUMBER := &N;
    is_prime BOOLEAN := TRUE;
    i NUMBER;
BEGIN
    FOR i IN 2 .. N/2 LOOP
        IF MOD(N, i) = 0 THEN
            is_prime := FALSE;
            EXIT;
        END IF;
    END LOOP;
    
    IF is_prime THEN
        DBMS_OUTPUT.PUT_LINE(N || ' is a Prime Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(N || ' is Not a Prime Number');
    END IF;
END;
/

--a. Print Multiplication Table (1 to 5)
BEGIN
    FOR i IN 1..5 LOOP
        FOR j IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || (i*j));
        END LOOP;
    END LOOP;
END;
/

--b. Print a Pattern
DECLARE
    N NUMBER := 5;
BEGIN
    FOR i IN 1..N LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT('* ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/

--a. Handle Division by Zero
DECLARE
    x NUMBER := 10;
    y NUMBER := 0;
    result NUMBER;
BEGIN
    result := x / y;
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
END;
/

--b. Handle No Data Found
DECLARE
    name VARCHAR2(50);
BEGIN
    SELECT name INTO name FROM employee WHERE id = 9;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with this ID');
END;
/

SELECT * FROM employee;

--Sum of Factors
CREATE OR REPLACE FUNCTION sum_of_factors(N NUMBER) RETURN NUMBER IS
    sum_factors NUMBER := 0;
BEGIN
    FOR i IN 1..N LOOP
        IF MOD(N, i) = 0 THEN
            sum_factors := sum_factors + i;
        END IF;
    END LOOP;
    RETURN sum_factors;
END;
/

DECLARE
    result NUMBER;
BEGIN
    result := sum_of_factors(12);
    DBMS_OUTPUT.PUT_LINE('Sum of Factors: ' || result);
END;
/


















