--1b. Write a trigger to display the old and new attendance when a student's attendance is updated using AFTER Trigger.
CREATE TABLE StudentAttendance (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    attendance INT
);

INSERT INTO StudentAttendance(student_id,name,attendance)VALUES(1,'Alice',80);
INSERT INTO StudentAttendance(student_id,name,attendance)VALUES(2,'Bob',75);
INSERT INTO StudentAttendance(student_id,name,attendance)VALUES(3,'Charlie',90);
INSERT INTO StudentAttendance(student_id,name,attendance)VALUES(4,'Eric',85);

SELECT * FROM StudentAttendance;
--Create a Trigger
CREATE OR REPLACE TRIGGER trg_after_attendance_update
AFTER UPDATE ON StudentAttendance
FOR EACH ROW
BEGIN
    -- Display the old and new attendance
    SELECT 
        CONCAT('Old Attendance: ', OLD.attendance, ', New Attendance: ', NEW.attendance) AS Attendance_Change;
END;
/

UPDATE StudentAttendance
SET attendance = 90
WHERE student_id = 1;

