--CROSS JOIN:
--Doesn't require a join condition
--The result of cross join is the cartesian product of two tables
--Every row from 1st table will be paired up with every row in 2nd table
--The number of rows inside the result table will be equal to x * y
--X ->Number of rows in first table
--Y ->Number of rows in second table
--SELECT * FROM table1 CROSS JOIN table2

DROP TABLE student;
DROP TABLE course;

CREATE TABLE student(
   id INT PRIMARY KEY,
   name VARCHAR(50)
 );
 
 CREATE TABLE course(
   course_id INT PRIMARY KEY,
   name VARCHAR(50),
   duration INT
 );
 
 INSERT INTO student VALUES(1,'Alice');
 INSERT INTO student VALUES(2,'Bob');
 INSERT INTO student VALUES(3,'Charlie');
 
 INSERT INTO course VALUES(101,'C Language',180);
 INSERT INTO course VALUES(102,'Data Structure',200);
 INSERT INTO course VALUES(103,'Python',250);
 INSERT INTO course VALUES(104,'Java Script',400);
 
 SELECT * FROM student CROSS JOIN course;
 
 SELECT * FROM student;
 SELECT * FROM course;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 