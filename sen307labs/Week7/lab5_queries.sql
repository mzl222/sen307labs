
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Miyetti Zoe Lawal
-- Matric: VUG/SEN/24/13082
=

USE sen307_vug_sen_24_13082;

-- Recap check: verify Week 6 data is present
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;


-- Task 1: Students in one department, sorted A-Z

SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: Joins Student and Department on dept_id to filter only students in Software Engineering, then sorts them alphabetically from A to Z by full_name.


-- Task 2: Courses with their lecturers (INNER JOIN)

SELECT c.course_code, c.course_title, l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code ASC;
-- Explanation: Uses two INNER JOINs through the CourseAllocation junction table to match every course with its assigned lecturer(s); courses taught by two lecturers (SEN307 and AIN301) appear twice.


-- Task 3: Students and their courses (LEFT JOIN)

-- Part A: All students and their enrolled courses (including students with no courses)
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name ASC;

-- Part B: Only students with NO enrolments
SELECT s.matric_no, s.full_name
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;
-- Explanation: LEFT JOIN keeps every row from the Student table even when there is no matching row in Enrolment or Course (returning NULL for course_title). Filtering with WHERE c.course_title IS NULL isolates the two students from Week 6 (Peter Audu and Maryam Tafawa) who have zero enrolments.


-- Task 4: Filtering with AND / OR / IN / BETWEEN

SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student
WHERE (gender = 'F' OR gender = 'M')
  AND dept_id IN (1, 3)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY date_of_birth ASC;
-- Explanation: Combines OR, IN, and BETWEEN with AND (using parentheses around the OR condition to ensure proper operator precedence) to retrieve students in Software Engineering (1) or Artificial Intelligence (3) born between 2004-01-01 and 2005-12-31.


-- Task 5: Paginating enrolments with LIMIT and OFFSET

-- Page 1 (rows 1-10)
SELECT e.enrolment_id, s.full_name, c.course_code, c.course_title
FROM Enrolment e
INNER JOIN Student s ON e.student_id = s.student_id
INNER JOIN Course c ON e.course_id = c.course_id
ORDER BY e.enrolment_id ASC
LIMIT 10 OFFSET 0;

-- Page 2 (rows 11-20)
SELECT e.enrolment_id, s.full_name, c.course_code, c.course_title
FROM Enrolment e
INNER JOIN Student s ON e.student_id = s.student_id
INNER JOIN Course c ON e.course_id = c.course_id
ORDER BY e.enrolment_id ASC
LIMIT 10 OFFSET 10;
-- Explanation: Uses LIMIT 10 with OFFSET 0 for page 1 and OFFSET 10 for page 2 to paginate enrolment records 10 rows at a time. ORDER BY is mandatory with LIMIT/OFFSET because SQL tables have no guaranteed physical order; without ORDER BY, rows could shift unpredictably between pages.


-- Challenge (Optional): Task 3 rewritten using RIGHT JOIN

SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name ASC;
-- Explanation: By reversing the table order (starting from Course, then Enrolment, then RIGHT JOINing Student), every row from the right-most table (Student) is preserved just like the LEFT JOIN version. The LEFT JOIN version is easier to read because queries naturally flow top-to-bottom starting from the primary entity we care about (Student) and attaching optional related data to the right.