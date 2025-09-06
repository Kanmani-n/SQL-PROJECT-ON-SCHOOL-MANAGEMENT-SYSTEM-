CREATE DATABASE school_management;
USE school_management;

CREATE TABLE students ( student_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL,  
class VARCHAR(20), age INT,  gender ENUM('M', 'F', 'Other'), contact VARCHAR(15)
       );

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(50),
    contact VARCHAR(15)
     );
     
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
    );


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
     );

    CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks DECIMAL(5,2),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id));
    
-- 1 .students table - insert 10 sample records
INSERT INTO students (name, class, age, gender, contact) VALUES
('Rahul Sharma', '10A', 15, 'M', '9876543210'),
('Priya Mehta', '9B', 14, 'F', '9876501234'),
('Amit Verma', '11C', 16, 'M', '9123456789'),
('Sneha Iyer', '12A', 17, 'F', '9345678901'),
('Arjun Reddy', '10B', 15, 'M', '9456789012'),
('Kavya Nair', '9A', 14, 'F', '9567890123'),
('Rohit Gupta', '11A', 16, 'M', '9678901234'),
('Ananya Singh', '12B', 17, 'F', '9789012345'),
('Vikram Das', '10C', 15, 'M', '9890123456'),
('Meera Pillai', '9C', 14, 'F', '9901234567');

select * from students;

-- 2.teachers table - insert 5 sample records 
INSERT INTO teachers (name, subject, contact) VALUES
('Suresh Kumar', 'Mathematics - Algebra', '9811111111'),
('Suresh Kumar', 'Physics', '9811111111'),
('Suresh Kumar', 'World History', '9811111111'),
('Anita Sharma', 'English Literature', '9822222222'),
('Ravi Verma', 'Physics', '9833333333'),
('Pooja Nair', 'World History', '9844444444'),
('Ajay Mehta', 'Computer Programming', '9855555555'),
('Ajay Mehta', 'English Literature', '9855555555');



-- 3.Create the courses table with teacher assignments.
INSERT INTO courses (course_name, teacher_id) VALUES
('Mathematics - Algebra', 1), ('English Literature', 2),
('Physics', 3), ('World History', 4), ('Computer Programming', 5);

-- 4.Create the enrollments table and assign students to courses.

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-06-01'), -- Rahul Sharma → Mathematics - Algebra
(2, 2, '2025-06-02'), -- Priya Mehta → English Literature
(3, 3, '2025-06-03'), -- Amit Verma → Physics
(4, 4, '2025-06-04'), -- Sneha Iyer → World History
(5, 5, '2025-06-05'), -- Arjun Reddy → Computer Programming
(6, 1, '2025-06-06'), -- Kavya Nair → Mathematics - Algebra
(7, 3, '2025-06-07'), -- Rohit Gupta → Physics
(8, 2, '2025-06-08'), -- Ananya Singh → English Literature
(9, 5, '2025-06-09'), -- Vikram Das → Computer Programming
(10, 4, '2025-06-10'); -- Meera Pillai → World History



-- 5.Insert sample attendance data for a month

        INSERT INTO attendance (student_id, course_id, date, status) VALUES
     -- Rahul Sharma (Student 1) - Mathematics
        (1, 1, '2025-08-01', 'Present'),
        (1, 1, '2025-08-02', 'Absent'),
        (1, 1, '2025-08-03', 'Present'),
        (1, 1, '2025-08-04', 'Present'),

      -- Priya Mehta (Student 2) - English Literature
        (2, 2, '2025-08-01', 'Present'),
        (2, 2, '2025-08-02', 'Present'),
        (2, 2, '2025-08-03', 'Late'),
        (2, 2, '2025-08-04', 'Present'),

        -- Amit Verma (Student 3) - Physics
        (3, 3, '2025-08-01', 'Absent'),
        (3, 3, '2025-08-02', 'Present'),
        (3, 3, '2025-08-03', 'Present'),
        (3, 3, '2025-08-04', 'Present'),

     -- Sneha Iyer (Student 4) - World History
        (4, 4, '2025-08-01', 'Present'),
        (4, 4, '2025-08-02', 'Present'),
        (4, 4, '2025-08-03', 'Present'),
        (4, 4, '2025-08-04', 'Absent'),

    -- Arjun Reddy (Student 5) - Computer Programming
        (5, 5, '2025-08-01', 'Late'),
        (5, 5, '2025-08-02', 'Present'),
        (5, 5, '2025-08-03', 'Present'),
            (5, 5, '2025-08-04', 'Present'),
            
-- Kavya Nair (Student 6) - Mathematics - Algebra
(6, 1, '2025-08-01', 'Present'),
(6, 1, '2025-08-02', 'Absent'),
(6, 1, '2025-08-03', 'Absent'),
(6, 1, '2025-08-04', 'Present'),

-- Rohit Gupta (Student 7) - Physics
(7, 3, '2025-08-01', 'Present'),
(7, 3, '2025-08-02', 'absent'),
(7, 3, '2025-08-03', 'Late'),
(7, 3, '2025-08-04', 'absent'),

-- Ananya Singh (Student 8) - English Literature
(8, 2, '2025-08-01', 'Absent'),
(8, 2, '2025-08-02', 'Present'),
(8, 2, '2025-08-03', 'Present'),
(8, 2, '2025-08-04', 'Present'),

-- Vikram Das(Student 9) - Computer Programming
(9, 5, '2025-08-01', 'Present'),
(9, 5, '2025-08-02', 'Present'),
(9, 5, '2025-08-03', 'Present'),
(9, 5, '2025-08-04', 'Absent'),

-- Meera Pillai(Student 10) -World History 
(10, 4, '2025-08-01', 'Late'),
(10, 4, '2025-08-02', 'Present'),
(10, 4, '2025-08-03', 'Present'),
(10, 4, '2025-08-04', 'Present');

INSERT INTO grades (student_id, course_id, marks, grade) VALUES
-- Student 1: Rahul Sharma → Mathematics
(1, 1, 85.00, 'A'),

-- Student 2: Priya Mehta → English Literature
(2, 2, 72.00, 'B'),

-- Student 3: Amit Verma → Physics
(3, 3, 91.50, 'A'),

-- Student 4: Sneha Iyer → World History
(4, 4, 68.00, 'C'),

-- Student 5: Arjun Reddy → Computer Programming
(5, 5, 77.00, 'B'),

-- Student 6: Kavya Nair → Mathematics
(6, 1, 88.00, 'A'),

-- Student 7: Rohit Gupta → Physics
(7, 3, 59.00, 'D'),

-- Student 8: Ananya Singh → English Literature
(8, 2, 81.00, 'A'),

-- Student 9: Vikram Das → Computer Programming
(9, 5, 64.00, 'C'),

-- Student 10: Meera Pillai → World History
(10, 4, 92.00, 'A');


-- 6.List all students in a particular class
SELECT student_id, name, class, age, gender, contact
FROM students 
WHERE class = '10A';


-- 7.	Show all teachers and their subjects.

SELECT teacher_id, name AS teacher_name, subject
FROM teachers;

-- 8.Display all courses and assigned teachers.

 SELECT 
 c.course_id,
 c.course_name,
 t.name AS teacher_name,
 t.subject
 FROM courses c
JOIN teachers t ON c.teacher_id = t.teacher_id;

-- 9.Find students enrolled in a specific course.

   SELECT 
    s.student_id,
    s.name AS student_name, s.class,
    c.course_name
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    JOIN courses c ON e.course_id = c.course_id
    WHERE c.course_name = 'Physics';
    
-- 10.Show attendance records for a particular student.

SELECT 
s.student_id,
s.name AS student_name,
c.course_name,
a.date,
a.status
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN courses c ON a.course_id = c.course_id
WHERE s.student_id = 1
ORDER BY a.date ;

-- 11.Count total students enrolled in each course.

SELECT 
c.course_id,
c.course_name,
COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 12.List students with attendance below 75%.

SELECT 
 s.student_id,
 s.name AS student_name,
 COUNT(a.attendance_id) AS total_classes,
 SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_days,
ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / 
COUNT(a.attendance_id)), 2) AS attendance_percentage
FROM students s
JOIN attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING attendance_percentage < 75;


-- 13.Find the average grade of each student across courses.
 
SELECT 
s.student_id,
s.name AS student_name,
c.course_name,
ROUND(AVG(g.marks), 2) AS average_marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id
GROUP BY s.student_id, s.name, c.course_name
ORDER BY s.student_id, c.course_name;

 -- 14.Show students who scored above 90 in any course.

SELECT 
s.student_id,
s.name AS student_name,
c.course_name,
g.marks
FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN courses c ON g.course_id = c.course_id
WHERE g.marks > 90
ORDER BY g.marks DESC;

-- 15.	Display all courses taught by a specific teacher.
SELECT 
c.course_id,
c.course_name,
t.name AS teacher_name,
t.subject
FROM courses c
JOIN teachers t ON c.teacher_id = t.teacher_id
WHERE t.name = 'Suresh Kumar';

-- 16.Create a view student_performance showing student name,course, and grade.

CREATE VIEW student_performance AS
SELECT 
s.student_id,
s.name AS student_name,
c.course_name,
g.marks,
g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id;


SELECT * FROM student_performance;

-- 17.Write a stored procedure to update a student’s grade.

DELIMITER $$

CREATE PROCEDURE update_student_grade (
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_marks DECIMAL(5,2),
    IN p_grade VARCHAR(2)
)
BEGIN
    UPDATE grades
    SET marks = p_marks,
        grade = p_grade
    WHERE student_id = p_student_id
      AND course_id = p_course_id;
END $$
 DELIMITER ;

CALL update_student_grade(1, 101, 95, 'A');

DROP TRIGGER IF EXISTS after_enrollment_insert;
-- 18.Create a trigger to mark attendance automatically when a student is enrolled in a course.

DELIMITER $$
CREATE TRIGGER after_enrollment_insert
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    -- Insert an initial attendance record for the enrollment date
    INSERT INTO attendance (student_id, course_id, date, status)
    VALUES (NEW.student_id, NEW.course_id, NEW.enrollment_date, 'Present');
END $$
DELIMITER ;

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (21, 3, 2, '2025-09-03');

select * from enrollments;

-- 19.Generate a report showing top-performing students in each class.
      
WITH student_avg AS (
    SELECT 
        s.student_id,
        s.name AS student_name,
        s.class,
        ROUND(AVG(g.marks), 2) AS avg_marks
    FROM students s
    JOIN grades g ON s.student_id = g.student_id
    GROUP BY s.student_id, s.name, s.class
)
SELECT sa.class, sa.student_id, sa.student_name, sa.avg_marks
FROM student_avg sa
WHERE sa.avg_marks = (
    SELECT MAX(avg_marks)
    FROM student_avg
    WHERE class = sa.class
);


-- 20.Write a query to find the teacher handling the most courses.

SELECT 
	t.teacher_id,
	t.name AS teacher_name,
	COUNT(c.course_id) AS total_courses
FROM teachers t
JOIN courses c ON t.teacher_id = c.teacher_id
GROUP BY t.teacher_id, t.name
ORDER BY total_courses DESC;









