USE sen307_vug_sen_24_13082;
SHOW TABLES;


INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;


INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Prof Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Fatima Danjuma', 'f.danjuma@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Tunde Adeyemi', 't.adeyemi@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Zainab Abubakar', 'z.abubakar@vua.edu.ng', 3),
('VUA/ST/107', 'Mr Emeka Nwosu', 'e.nwosu@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Halima Sani', 'h.sani@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Oluwaseun Balogun', 'o.balogun@vua.edu.ng', 5),
('VUA/ST/110', 'Mrs Ngozi Uche', 'n.uche@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/13082', 'Miyetti Zoe Lawal', 'F', '2005-06-18', 1),
('20231234', 'Ada Obi', 'F', '2005-03-14', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 2),
('20231236', 'Chisom Okonkwo', 'F', '2006-01-22', 1),
('20231237', 'Ibrahim Suleiman', 'M', '2003-09-15', 1),
('20231238', 'Amina Garba', 'F', '2005-12-05', 2),
('20231239', 'David Akpan', 'M', '2004-07-19', 2),
('20231240', 'Blessing Etim', 'F', '2006-04-30', 3),
('20231241', 'Yusuf Abdullahi', 'M', '2003-08-11', 3),
('20231242', 'Kemi Ogunleye', 'F', '2005-02-27', 3),
('20231243', 'Samuel Ojo', 'M', '2004-05-09', 4),
('20231244', 'Hauwa Aliyu', 'F', '2007-01-14', 4),
('20231245', 'Victor Nnamdi', 'M', '2005-10-21', 4),
('20231246', 'Grace Bassey', 'F', '2006-09-03', 5),
('20231247', 'Usman Shehu', 'M', '2003-12-28', 5),
('20231248', 'Favour Igwe', 'F', '2005-04-17', 5),
('20231249', 'Daniel Bakare', 'M', '2004-03-25', 1),
('20231250', 'Zainab Idris', 'F', '2006-07-08', 2),
('20231251', 'Peter Audu', 'M', '2003-11-19', 3),
('20231252', 'Maryam Tafawa', 'F', '2007-02-12', 4);

SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;


INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 5),
(2, 1), (2, 2), (2, 10),
(3, 1), (3, 3), (3, 4),
(4, 1), (4, 2),
(5, 1), (5, 2), (5, 4),
(6, 1), (6, 3), (6, 4),
(7, 1), (7, 3),
(8, 1), (8, 5), (8, 6),
(9, 5), (9, 6), (9, 7),
(10, 5), (10, 6), (10, 7),
(11, 8), (11, 9),
(12, 8), (12, 9),
(13, 8), (13, 9),
(14, 10), (14, 4),
(15, 10), (15, 4),
(16, 10),
(17, 2),
(18, 3);


INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5), (5, 6),
(6, 6),
(7, 5),
(8, 7),
(9, 8),
(10, 9);


SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';


INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));


DELETE FROM Department WHERE dept_name = 'Library and Information Science';


SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Department;


SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;