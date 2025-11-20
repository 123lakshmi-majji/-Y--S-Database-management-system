--SYSDATE representation depends upon what is current nls_date_format
--Using TO_CHAR() functionn you convert the date into a string on required format
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY')FROM dual;
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY HH:MI:SS:AM') FROM dual;

--We can extract a specific detail(Day,Month,Year,Hour,Min,Sec) from
SELECT TO_CHAR(DATE '2020-11-14','DD') FROM dual;
SELECT TO_CHAR(DATE '2020-11-14','Day') FROM dual;
SELECT TO_CHAR(DATE '2025-02-04','Day') FROM dual;
SELECT TO_CHAR(SYSDATE,'DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'Day') FROM dual;
SELECT TO_CHAR(SYSDATE,'MM') FROM dual;
SELECT TO_CHAR(SYSDATE,'MON') FROM dual;
SELECT TO_CHAR(SYSDATE,'MONTH') FROM dual;
SELECT TO_CHAR(SYSDATE,'YY') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY') FROM dual;
SELECT TO_CHAR(SYSDATE,'Year') FROM dual;

--SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM dual;
SELECT SYSTIMESTAMP AT TIME ZONE 'Asia/Kolkata' FROM dual;
SELECT SYSTIMESTAMP AT TIME ZONE 'US/Pacific' FROM dual;
SELECT SYSTIMESTAMP AT TIME ZONE '+5:30' FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP,'HH')AS hour_GMT FROM dual;  -- GMT TIMEZONE
SELECT TO_CHAR(SYSTIMESTAMP AT TIME ZONE '+5:30', 'HH') AS hour_IST FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP AT TIME ZONE '+5:30', 'MI') AS min_IST FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP AT TIME ZONE '+5:30', 'SS') AS sec_IST FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP AT TIME ZONE '+5:30', 'TZR') AS min_IST FROM dual;


--ADD MONTHS(date,number_of_months_to_add)
SELECT ADD_MONTHS(DATE '2020-07-25',20)FROM dual;

--MONTHS_BETWEEN(date1,date2)
SELECT MONTHS_BETWEEN(DATE '2025-02-04',DATE '2024-02-04') FROM dual;

--NEXT_DAY(date) what's the next day for a given day comes after given date
SELECT NEXT_DAY(DATE '2025-02-04','Monday') FROM dual;

--LAST_DAY(date) provides the last day of the month in the given date
SELECT LAST_DAY(DATE '2025-02-04') FROM dual;
SELECT LAST_DAY(DATE '2024-02-04') FROM dual;

--Date of borrowal,date of submission
SELECT MONTHS_BETWEEN(DATE '2024-04-30',DATE '2023-03-31') / 12 FROM dual;













































