COACHING INSTITUTE PERFORMANCE ANALYTICS
-- ============================================================

CREATE DATABASE coaching_analytics;
USE coaching_analytics;

-- Students master table
CREATE TABLE students (
    student_id      INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100) NOT NULL,
    gender          ENUM('Male', 'Female', 'Other'),
    dob             DATE,
    enrollment_date DATE,
    batch_id        INT,
    course_id       INT,
    contact         VARCHAR(15),
    city            VARCHAR(50),
    fee_paid        DECIMAL(10,2),
    total_fee       DECIMAL(10,2)
);

-- Courses (e.g., JEE, NEET, CA Foundation)
CREATE TABLE courses (
    course_id   INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    duration_months INT,
    fee         DECIMAL(10,2),
    category    VARCHAR(50)  -- 'Engineering', 'Medical', 'Commerce'
);

-- Batches (morning/evening/weekend)
CREATE TABLE batches (
    batch_id    INT PRIMARY KEY AUTO_INCREMENT,
    batch_name  VARCHAR(50),
    course_id   INT,
    start_date  DATE,
    end_date    DATE,
    faculty_id  INT,
    capacity    INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Faculty
CREATE TABLE faculty (
    faculty_id      INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100),
    subject         VARCHAR(50),
    experience_yrs  INT,
    salary          DECIMAL(10,2),
    joining_date    DATE
);

-- Subjects
CREATE TABLE subjects (
    subject_id   INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100),
    course_id    INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Attendance (daily)
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id    INT,
    subject_id    INT,
    date          DATE,
    status        ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Tests / Exams
CREATE TABLE tests (
    test_id     INT PRIMARY KEY AUTO_INCREMENT,
    test_name   VARCHAR(100),
    subject_id  INT,
    batch_id    INT,
    test_date   DATE,
    max_marks   INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (batch_id)   REFERENCES batches(batch_id)
);

-- Test scores per student
CREATE TABLE test_scores (
    score_id    INT PRIMARY KEY AUTO_INCREMENT,
    test_id     INT,
    student_id  INT,
    marks       DECIMAL(5,2),
    FOREIGN KEY (test_id)    REFERENCES tests(test_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Fee payments
CREATE TABLE fee_payments (
    payment_id   INT PRIMARY KEY AUTO_INCREMENT,
    student_id   INT,
    amount       DECIMAL(10,2),
    payment_date DATE,
    mode         ENUM('Cash', 'UPI', 'Bank Transfer', 'Cheque'),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Final results (mock/board exam)
CREATE TABLE results (
    result_id   INT PRIMARY KEY AUTO_INCREMENT,
    student_id  INT,
    exam_name   VARCHAR(100),
    year        YEAR,
    score       DECIMAL(6,2),
    max_score   DECIMAL(6,2),
    rank_secured INT,
    cleared     BOOLEAN,  -- 1 = passed/qualified
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);



  