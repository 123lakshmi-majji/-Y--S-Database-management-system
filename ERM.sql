 DROP TABLE users;
-- drop table contests;
-- drop table challenges cascade constraints;
-- drop table submissions cascade constraints;

CREATE TABLE users(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL
);

CREATE TABLE contests(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	date_of_conduction DATE
);

CREATE TABLE challenges(
    id INT PRIMARY KEY,
    contest_id INT REFERENCES contests(id),
    name VARCHAR(50) NOT NULL,
    score INT NOT NULL
);
-- Associative Entity
CREATE TABLE submissions(
    id INT PRIMARY KEY,
    challenge_id INT REFERENCES challenges(id),
    user_id INT REFERENCES users(id),
    contest_id INT REFERENCES contests(id),
    submitted_on DATE,
    result_ INT
);

INSERT INTO users (id, name, mail) VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO users (id, name, mail) VALUES (2, 'Bob', 'bob@example.com');
INSERT INTO users (id, name, mail) VALUES (3, 'Charlie', 'charlie@example.com');
INSERT INTO users (id, name, mail) VALUES (4, 'David', 'david@example.com');
INSERT INTO users (id, name, mail) VALUES (5, 'Eve', 'eve@example.com');
INSERT INTO users (id, name, mail) VALUES (6, 'Frank', 'frank@example.com');
INSERT INTO users (id, name, mail) VALUES (7, 'Grace', 'grace@example.com');
INSERT INTO users (id, name, mail) VALUES (8, 'Hannah', 'hannah@example.com');
INSERT INTO users (id, name, mail) VALUES (9, 'Ian', 'ian@example.com');
INSERT INTO users (id, name, mail) VALUES (10, 'Jack', 'jack@example.com');

INSERT INTO contests (id, name, date_of_conduction) VALUES (101, 'Code Sprint', TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (102, 'Hackathon', TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (103, 'Winter Coding Challenge', TO_DATE('2025-01-20', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (104, 'Spring Cup', TO_DATE('2025-02-05', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (105, 'Summer Marathon', TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (106, 'Fall Championship', TO_DATE('2025-04-25', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (107, 'Open League', TO_DATE('2025-05-10', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (108, 'Elite Challenge', TO_DATE('2025-06-01', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (109, 'Pro Cup', TO_DATE('2025-06-15', 'YYYY-MM-DD'));
INSERT INTO contests (id, name, date_of_conduction) VALUES (110, 'Grand Finale', TO_DATE('2025-07-01', 'YYYY-MM-DD'));



INSERT INTO challenges (id, contest_id, name, score) VALUES (201, 101, 'Easy Challenge', 50);
INSERT INTO challenges (id, contest_id, name, score) VALUES (202, 101, 'Medium Challenge', 100);
INSERT INTO challenges (id, contest_id, name, score) VALUES (203, 102, 'Hard Challenge', 150);
INSERT INTO challenges (id, contest_id, name, score) VALUES (204, 103, 'Basic Algorithms', 30);
INSERT INTO challenges (id, contest_id, name, score) VALUES (205, 104, 'Data Structures', 80);
INSERT INTO challenges (id, contest_id, name, score) VALUES (206, 105, 'Graph Theory', 120);
INSERT INTO challenges (id, contest_id, name, score) VALUES (207, 106, 'Dynamic Programming', 200);
INSERT INTO challenges (id, contest_id, name, score) VALUES (208, 107, 'Math Puzzles', 60);
INSERT INTO challenges (id, contest_id, name, score) VALUES (209, 108, 'Advanced Coding', 250);
INSERT INTO challenges (id, contest_id, name, score) VALUES (210, 109, 'System Design', 300);


INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (301, 201, 1, 101, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (302, 202, 2, 101, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (303, 203, 3, 102, TO_DATE('2025-01-16', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (304, 204, 4, 103, TO_DATE('2025-01-21', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (305, 205, 5, 104, TO_DATE('2025-02-06', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (306, 206, 6, 105, TO_DATE('2025-03-16', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (307, 207, 7, 106, TO_DATE('2025-04-26', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (308, 208, 8, 107, TO_DATE('2025-05-11', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (309, 209, 9, 108, TO_DATE('2025-06-02', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (310, 210, 10, 109, TO_DATE('2025-06-16', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (311, 201, 1, 101, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (312, 202, 2, 101, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (313, 203, 3, 102, TO_DATE('2025-01-16', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (314, 204, 4, 103, TO_DATE('2025-01-22', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (315, 205, 5, 104, TO_DATE('2025-02-06', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (316, 206, 6, 105, TO_DATE('2025-03-15', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (317, 207, 7, 106, TO_DATE('2025-04-25', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (318, 208, 8, 107, TO_DATE('2025-05-11', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (319, 209, 9, 108, TO_DATE('2025-06-02', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (320, 210, 10, 109, TO_DATE('2025-06-15', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (321, 204, 1, 103, TO_DATE('2025-01-25', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (322, 205, 2, 104, TO_DATE('2025-02-07', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (323, 206, 3, 105, TO_DATE('2025-03-17', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (324, 207, 4, 106, TO_DATE('2025-04-27', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (325, 208, 5, 107, TO_DATE('2025-05-12', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (326, 209, 6, 108, TO_DATE('2025-06-03', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (327, 210, 7, 109, TO_DATE('2025-06-16', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (328, 201, 8, 101, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 1);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (329, 202, 9, 101, TO_DATE('2025-01-13', 'YYYY-MM-DD'), 0);

INSERT INTO submissions (id, challenge_id, user_id, contest_id, submitted_on, result_) 
VALUES (330, 203, 10, 102, TO_DATE('2025-01-17', 'YYYY-MM-DD'), 1);

--Get all the submissions for the contest with id 101
SELECT *
FROM
users
JOIN
submissions
ON(users.id=submissions.user_id)
WHERE submissions.contest_id=101;

--Get all the name of users particicpated in contest with id 102
SELECT DISTINCT(name)
FROM
users
JOIN
submissions
ON(users.id=submissions.user_id)
WHERE submissions.contest_id=102;

--Get contest_id,submissions made in that contest
--No JOIN is required
SELECT contest_id,COUNT(id)
FROM submissions
GROUP BY contest_id;

--The names of the users along side submissions made across all the contests



SELECT * FROM users;
SELECT * FROM contests;
SELECT * FROM challenges;
SELECT * FROM submissions;

























