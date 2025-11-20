-- DUAL table
-- DUMMY Table that contains one row, one column
-- Dual table is used to apply single row functions
-- without using an actual table as source
SELECT * FROM dual;
SELECT 10 * 20 AS product FROM dual;
SELECT 
    10 * 20 AS product,
    10 + 20 AS sum,
    10 - 20 AS difference
FROM dual;

-- String functions
-- UPPER(string) -> Converts the characters in the string to uppercase
SELECT UPPER('technical hub') AS upper_string FROM dual;
-- SELECT UPPER(name) FROM employee;

-- LOWER(string) -> Coverts the characters in the string to lowercase
SELECT LOWER('TECHNICAL HUB') AS lower_string FROM dual;
-- SELECT LOWER(product_name) FROM products;

-- INITCAP(string) -> Converts the first letters of each word to capital
SELECT INITCAP('technical hub') FROM dual;


-- Strings are 0-indexed in languages like C, C++, Java, Python
-- But not in SQL, in SQL strings are 1-indexed
-- SUBSTR(string, start_pos, number_of_characters)
-- string -> mandatory
-- start_position -> mandatory
-- number_of_characters -> optional
-- start_position can be negative, when negative is given
-- position is counted from right end of the string
SELECT SUBSTR('technicalhub', 1) FROM dual;
SELECT SUBSTR('technicalhub', 2) FROM dual;
SELECT SUBSTR('technicalhub', 2, 3) FROM dual;
SELECT SUBSTR('technicalhub', -1) FROM dual;
SELECT SUBSTR('technicalhub', -3) FROM dual;
SELECT SUBSTR('technicalhub', -6) FROM dual;
SELECT SUBSTR('technicalhub', -6, 2) FROM dual;
-- CONCATENATE THE FIRST AND LAST CHARACTERS OF THE STRING
-- || concatenation
SELECT 'technical' || 'hub' FROM dual;
SELECT 'technical' || 'hub' || 'aditya university' FROM dual;

-- CONCATENATE THE FIRST AND LAST CHARACTERS OF THE STRING
SELECT UPPER(SUBSTR('technicalhub', 1, 1) || SUBSTR('technical hub', -1)) FROM dual;


-- LENGTH(string)
SELECT LENGTH('technical hub') FROM dual;

-- INSTR(string, sub_string, start_pos, occ_no)
-- Used to search the substring in a given string
-- Returns the position of first character of the substring if found
SELECT INSTR('Oracle SQL', 'SQL') FROM dual;
SELECT INSTR('Oracle SQL', 'SQL', 9) FROM dual;
SELECT INSTR('Oracle SQL SQL', 'SQL', 9) FROM dual;
-- 2 indicates 2nd occurrence of  SQL
SELECT INSTR('Oracle SQL SQL', 'SQL', 1, 2) FROM dual;

-- REPLACE(string, sub_string, new_string)
-- Replace all the occurrences of substring from original string with
-- new_string
SELECT REPLACE('Oracle SQL', 'SQL', 'Database') FROM dual;
SELECT REPLACE('12:07:2024', ':', '-') FROM dual;
SELECT REPLACE(email, 'aec.edu.in', 'adityauniversity.in') FROM student;

-- TRIM(trim_character FROM string)
-- Trim the leading and trailing trim_characters from the string

SELECT TRIM('*' FROM '***SQL***') FROM dual;
SELECT TRIM(' ' FROM '   SQL   ') FROM dual;
SELECT LENGTH(TRIM(' ' FROM '   SQL   ')) FROM dual;

-- LPAD(string, length, pad_string) --> Left Padding
SELECT LPAD('SQL', 6, '*') FROM dual;
SELECT LPAD('SQL', 3, '*') FROM dual;
SELECT LPAD('SQL', 2, '*') FROM dual;
SELECT LPAD('SQL', 10, 'abc') FROM dual;
-- RPAD() --> Right Padding


-- Numeric Functions
-- ABS(), CEIL(), FLOOR(), SQRT(), POWER(), MOD(), TRUNC(), ROUND()
-- ABS(number): Returns the absolute value of a number
SELECT ABS(-143) FROM dual;
SELECT ABS(77.94) FROM dual;
SELECT ABS(-77.94) FROM dual;
-- CEIL(number): Returns the smallest integer greater than or equal to number
SELECT CEIL(141.9) FROM dual;
SELECT CEIL(141.1) FROM dual;
SELECT CEIL(-44.7) FROM dual;
SELECT CEIL(141.00) FROM dual;
-- FLOOR(number): Returns the largest integer less than or equal to number 
SELECT FLOOR(141.9) FROM dual; -- 141
SELECT FLOOR(141.1) FROM dual; -- 141
SELECT FLOOR(-44.7) FROM dual; -- -45
SELECT FLOOR(141.00) FROM dual; -- 141
-- SQRT(number): Returns the square root of a number
SELECT SQRT(121) FROM DUAL;
SELECT SQRT(130) FROM DUAL;
-- POWER(base, exponent): Returns the result of base raised to the power of 
-- exponent
SELECT POWER(2, 3) FROM dual;
SELECT POWER(121, 0.5) FROM dual;
SELECT POWER(2.5, 3.5) FROM dual;
-- MOD(number1, number2): Returns the remainder of the division op b/w
-- number1 and number2
SELECT MOD(10, 2) FROM dual;
SELECT MOD(100, 51) FROM dual;
-- TRUN(number, decimal_places): Truncates the number to specified number
-- of decimal places
SELECT TRUNC(123.456789, 2) FROM dual;
SELECT TRUNC(123.456789, 4) FROM dual;
-- ROUND(number, decimal_places): Rounds the number to specified number
-- of decimal places
SELECT ROUND(123.456789, 2) FROM dual;
SELECT ROUND(123.454789, 2) FROM dual;


-- DATE AND TIME FUNCTIONS
-- SYSDATE
-- SYSTIMESTAMP
-- SYSDATE: Gives you current date and time based on Database Server Timezone
-- Oracle 21c --> Database Server
-- nls_sesesion_parameters, NLS_DATE_FORMAT

SELECT SYSDATE FROM dual;

SELECT value
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

ALTER SESSION SET nls_date_format = 'DD-MM-YYYY HH:MI:SS AM';

SELECT SYSDATE FROM dual;

SELECT DBTIMEZONE FROM dual;
SELECT SESSIONTIMEZONE FROM dual;

SELECT (SYSDATE - DATE '2020-11-24') / 365 FROM dual;

--SYSDATE representation depends upon what is current nls_date_format
--Using TO_CHAR() functionn you convert the date into a string on required format
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY')FROM dual;
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY HH:MI:SS:AM') FROM dual;

--We can extract a specific detail(Day,Month,Year,Hour,Min,Sec) from 
SELECT TO_CHAR(SYSDATE,'DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'Day') FROM dual;
SELECT TO_CHAR(SYSDATE,'MM') FROM dual;
SELECT TO_CHAR(SYSDATE,'MON') FROM dual;
SELECT TO_CHAR(SYSDATE,'MONTH') FROM dual;
SELECT TO_CHAR(SYSDATE,'YY') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY') FROM dual;
SELECT TO_CHAR(SYSDATE,'Year') FROM dual;


-- SYSTIMESTAMP (Gives date and time also with fraction seconds)
SELECT SYSTIMESTAMP FROM dual;
-- Date -> Day, Month, Year
-- Time -> Hours, Minutes, Seconds, Fraction Seconds
-- Timezone -> What is the current time zone

-- Getting timestamp in required time zone
SELECT SYSTIMESTAMP AT TIME ZONE 'Asia/Kolkata' FROM dual;





