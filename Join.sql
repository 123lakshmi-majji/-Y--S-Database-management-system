--JOIN:
CREATE TABLE course(
   id INT,
   name VARCHAR(50),
   duration INT,
   price INT
);
CREATE TABLE student(
   id INT,
   name VARCHAR(50),
   college VARCHAR(10),
   branch VARCHAR(10),
   course_id INT
);
INSERT INTO course VALUES(57,'C Language',180,6000);
INSERT INTO course VALUES(63,'Java',220,7000);
INSERT INTO course VALUES(91,'Python',200,8000);
SELECT * FROM course;
INSERT INTO student VALUES(1,'Alice','AEC','CSE',57);
INSERT INTO student VALUES(2,'Bob','ACET','IT',91);
INSERT INTO student VALUES(3,'Charlie','ACOE','DS',57);
INSERT INTO student VALUES(4,'Danny','AEC','IT',47);
SELECT * FROM student;

--Task:Print the student id,name,course_id,course_name the student enrolled in ?
--Inner Join:Compares two column values from two different tables and only joins those records that are matching
SELECT *
FROM 
student
JOIN course
ON(student.course_id=course.id);
--Display Specific columns:
SELECT student.id,student.name,course.id,course.name
FROM 
student
JOIN course
ON(student.course_id=course.id);
--Print the id,name,course_name of the students belong to C Language
SELECT student.id,student.name,course.name
FROM
student
JOIN course
ON(student.course_id=course.id)
WHERE course.id=57;    --course.name='C Language'
