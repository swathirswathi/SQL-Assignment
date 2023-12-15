--I. Database Design (Normalization):
--1. Create the database named "SISDB"
--2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based on the provided schema
   --student 
   CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
   );
   --Courses
   CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
    );
	--Enrollment
	CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    );
	--Teacher
	CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
    );
	--payments
	CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
    );

---Create an ERD (Entity Relationship Diagram) for the database.

---3a)Insert at least 10 sample records into each of the following

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    (1, 'Swathi', 'R', '1990-05-15', 'swat@gmail.com', '1234567890'),
    (2, 'Afra', 'Batool', '1992-08-22', 'afuu@gmail.com', '9876543210'),
    (3, 'MOhammed', 'Ruhaib', '1991-04-10', 'kabbu@gmail.com', '5551234567'),
    (4, 'Zaid', 'Amir', '1993-12-05', 'zaid@gmail.com', '1112223333'),
    (5, 'Prajju', 'SK', '1994-07-18', 'prajju@gmail.com', '9998887777'),
    (6, 'Sonika', 'CP', '1990-09-30', 'soni@gmail.com', '4445556666'),
    (7, 'sanju', 'H', '1995-02-25', 'sanju@gmail.com', '7776665555'),
    (8, 'Emma', 'Clark', '1992-11-20', 'emma.clark@example.com', '3334445555'),
    (9, 'Ryan', 'Garcia', '1993-06-12', 'ryan.garcia@example.com', '2223334444'),
    (10, 'Olivia', 'White', '1994-10-08', 'olivia.white@example.com', '6667778888');
	select * from Students;

	INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (101, 'Introduction to Computer Science', 3, 1),
    (102, 'Mathematics 101', 4, 2),
    (103, 'English Composition', 3, 3),
    (104, 'History of Art', 3, 4),
    (105, 'Chemistry Basics', 4, 1),
    (106, 'Physics Fundamentals', 4, 2),
    (107, 'Psychology 101', 3, 3),
    (108, 'Business Ethics', 3, 4),
    (109, 'Environmental Science', 4, 1),
    (110, 'Marketing Principles', 3, 2);
	select * from Courses;

	INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 101, '2023-01-15'),
    (2, 2, 102, '2023-02-10'),
    (3, 3, 103, '2023-03-20'),
    (4, 4, 104, '2023-04-05'),
    (5, 5, 105, '2023-05-12'),
    (6, 6, 106, '2023-06-18'),
    (7, 7, 107, '2023-07-25'),
    (8, 8, 108, '2023-08-10'),
    (9, 9, 109, '2023-09-30'),
    (10, 10, 110, '2023-10-15');
	select * from Enrollments;

	INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Dr. Smith', 'Johnson', 'dr.smith@example.com'),
    (2, 'Prof. Davis', 'Miller', 'prof.davis@example.com'),
    (3, 'Dr. Taylor', 'Clark', 'dr.taylor@example.com'),
    (4, 'Prof. Brown', 'Wilson', 'prof.brown@example.com'),
    (5, 'Dr. Parker', 'Garcia', 'dr.parker@example.com'),
    (6, 'Prof. Moore', 'White', 'prof.moore@example.com'),
    (7, 'Dr. Collins', 'Martinez', 'dr.collins@example.com'),
    (8, 'Prof. Turner', 'Anderson', 'prof.turner@example.com'),
    (9, 'Dr. Walker', 'Harris', 'dr.walker@example.com'),
    (10, 'Prof. King', 'Scott', 'prof.king@example.com');
	select * from Teacher;

	INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
	(1, 1, 500.00, '2023-03-01'),
    (2, 2, 750.00, '2023-03-05'),
    (3, 3, 600.00, '2023-03-10'),
    (4, 4, 450.00, '2023-03-15'),
    (5, 5, 800.00, '2023-03-20'),
    (6, 6, 700.00, '2023-03-25'),
    (7, 7, 550.00, '2023-04-01'),
    (8, 8, 900.00, '2023-04-05'),
    (9, 9, 650.00, '2023-04-10'),
    (10, 10, 750.00, '2023-04-15');
	select * from Payments;

--3B) 1)Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John  b. Last Name: Doe  c. Date of Birth: 1995-08-15 d. Email: john.doe@example.com e. Phone Number: 1234567890
INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

select * from Students;

--3B)2)Write an SQL query to enroll a student in a course. Choose an existing student and course and 
--insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date)
VALUES (11,
    (SELECT student_id FROM Students WHERE first_name = 'Prajju' AND last_name = 'SK'),
    (SELECT course_id FROM Courses WHERE course_name = 'Mathematics 101'),
    '2023-12-01'
);
select * from Enrollments;

--3B)3)Update the email address of a specific teacher in the "Teacher" table. 
--Choose any teacher and modify their email address.
  
 UPDATE Teacher
SET email = 'new_email@example.com'
WHERE teacher_id = 1;

select * from Teacher;

--3B)4)Write an SQL query to delete a specific enrollment record from the "Enrollments" table.
--Select an enrollment record based on student and course.
DELETE from Enrollments where
 student_id =(select student_id from Students where first_name='Ryan' AND last_name='Garcia')
AND course_id=(select course_id from Courses where course_name='History of Art')

select * from Enrollments;

---3B)5) Update the "Courses" table to assign a specific teacher to a course.
--Choose any course and teacher from the respective tables.
select * from Courses;

UPDATE Courses
SET teacher_id = 3 
WHERE course_id = 101;

--3B)6) Delete a specific student from the "Students" table and remove all their enrollment records 
--from the "Enrollments" table. Be sure to maintain referential integrity.
DECLARE @StudentIDToBeDeleted int;
SET @StudentIDToBeDeleted=1;

DELETE from Students 
WHERE student_id=@StudentIDToBeDeleted;

DELETE from Enrollments
WHERE student_id=@StudentIDToBeDeleted;

--3B)7)Update the payment amount for a specific payment record in the "Payments" table. 
--Choose any payment record and modify the payment amount.
select * from Payments;
UPDATE Payments
SET amount=900
WHERE payment_id=5;



----------4. Joins:
--1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
--join the "Payments" table with the "Students" table based on the student's ID.
select * from Students,Payments;

select s.student_id,s.first_name,s.last_name,
sum(p.amount) as total_payments
from Students s
join Payments p 
ON s.student_id=p.payment_id
where
s.student_id=1
group by
s.student_id,s.first_name,s.last_name;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select * from Courses;
select * from Enrollments;

select c.course_id,c.course_name,
count(e.student_id) as students_enrolled
from Courses c
left join Enrollments e
on c.course_id=e.course_id
group by c.course_id,c.course_name;


--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select * from Students;
select * from Enrollments;

select s.student_id,s.first_name,s.last_name
from Students s
left join Enrollments e 
ON s.student_id=e.student_id
where e.enrollment_id is NULL;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
--courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select * from Students;
select * from Enrollments;
select * from Courses;

select s.student_id,s.first_name,s.last_name,
c.course_name
from Students s
join Enrollments e ON s.student_id=e.student_id
join Courses c ON e.course_id=c.course_id;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
--"Teacher" table with the "Courses" table.
select * from Teacher;
select * from Courses;

select t.first_name, t.last_name, c.course_id,c.course_name
from Teacher t
left join Courses c
on t.teacher_id=c.teacher_id;

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
--"Students" table with the "Enrollments" and "Courses" tables.
select * from Students;
select * from Enrollments;
select * from Courses;

SELECT s.first_name, s.last_name,e.enrollment_date
FROM  Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'History of Art';

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
--"Students" table and the "Payments" table and filter for students with NULL payment records
select * from Students;
select * from Payments;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE
    p.payment_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records
select * from Enrollments;
select * from Courses;

SELECT c.course_id,c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE
    e.enrollment_id IS NULL;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
--table to find students with multiple enrollment records.
select * from Enrollments;
select * from Students;

SELECT e1.student_id,s.first_name,s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
JOIN Students s ON e1.student_id = s.student_id
GROUP BY
e1.student_id, s.first_name, s.last_name
HAVING
    COUNT(DISTINCT e1.course_id) < 1;

---10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
--table and the "Courses" table and filter for teachers with NULL course assignments.
select * from Courses;
select * from Teacher;

SELECT t.teacher_id,t.first_name,t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;


 --------5)Aggregate and subqueries
--1. Write an SQL query to calculate the average number of students enrolled in each course.
---Use aggregate functions and subqueries to achieve this.
select c.course_id,c.course_name,
avg(enrollment_count) 
from Courses c
JOIN(
select course_id,COUNT(DISTINCT student_id) AS enrollment_count
from Enrollments group by course_id)
e ON c.course_id=e.course_id
group by c.course_id,c.course_name;

---2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
--payment amount and then retrieve the student(s) associated with that amount.

select s.student_id,s.first_name,s.last_name,p.amount 
from Students s
join
Payments p ON s.student_id=p.payment_id
where
p.amount=(select max(amount) from Payments); 

---3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
--course(s) with the maximum enrollment count.

select * from Enrollments;

SELECT c.course_id,c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM
    Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.enrollment_id) = (
        SELECT MAX(enrollment_count)
        FROM (SELECT course_id,COUNT(enrollment_id) AS enrollment_count
                FROM Enrollments
                GROUP BY course_id
            )AS max_enrollments
    );

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
--payments for each teacher's courses.
select * from Enrollments;
select * from Teacher;
select * from Courses;
select * from Payments;

SELECT
    Teacher.teacher_id,
    Teacher.first_name AS teacher_first_name,
    Teacher.last_name AS teacher_last_name,
    (
        SELECT SUM(Payments.amount)
        FROM Payments
        JOIN Enrollments ON Payments.student_id = Enrollments.student_id
        JOIN Courses ON Enrollments.course_id = Courses.course_id
        WHERE Courses.teacher_id = Teacher.teacher_id
    ) AS total_payments
FROM
    Teacher;



----5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
--student's enrollments with the total number of courses.
select * from Students;
select * from Courses;
select * from Payments;

SELECT s.student_id,s.first_name,s.last_name
FROM Students s
WHERE NOT EXISTS (
        SELECT c.course_id
        FROM Courses c
        WHERE NOT EXISTS
		(   
		    SELECT e.course_id
            FROM Enrollments e
            WHERE e.student_id=s.student_id AND e.course_id=c.course_id
        )
    );

---6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
--find teachers with no course assignments.
select * from Teacher;
select * from Courses;

SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
    WHERE teacher_id IS NOT NULL
);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
--based on their date of birth.

select * from Students;

SELECT AVG(StudentAge) AS average_student_age
FROM 
( SELECT
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS StudentAge
    FROM Students)
	AS StudentAges;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
select * from Courses;
select * from Enrollments;

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use 
--subqueries and aggregate functions to sum payments.
select * from Enrollments;
select * from Courses;
select * from Payments;

SELECT
    Enrollments.student_id,
    Students.first_name AS student_first_name,
    Students.last_name AS student_last_name,
    Enrollments.course_id,
    Courses.course_name,
    (
        SELECT SUM(Payments.amount)
        FROM Payments
        WHERE Payments.student_id = Enrollments.student_id
          AND Payments.student_id = Students.student_id
    ) AS total_payments
FROM
    Enrollments
JOIN
    Students ON Enrollments.student_id = Students.student_id
JOIN
    Courses ON Enrollments.course_id = Courses.course_id;



--10. Identify students who have made more than one payment. Use subqueries and aggregate 
--functions to count payments per student and filter for those with counts greater than one.

SELECT s.student_id,s.first_name,s.last_name
FROM Students s
JOIN  Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING
    COUNT(p.payment_id) > 1;

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT s.student_id,s.first_name,s.last_name,
    SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
SELECT c.course_id,c.course_name,
    COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the 
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT s.student_id,s.first_name,s.last_name,
    AVG(p.amount) AS average_payment_amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;