COACHING INSTITUTE PERFORMANCE ANALYTICS
-- ============================================================



INSERT INTO courses VALUES
(1, 'JEE Advanced', 24, 85000, 'Engineering'),
(2, 'NEET UG', 24, 80000, 'Medical'),
(3, 'CA Foundation', 12, 45000, 'Commerce');

INSERT INTO faculty VALUES
(1, 'Rajesh Sharma',  'Physics',     12, 75000, '2018-06-01'),
(2, 'Priya Nair',     'Biology',     8,  65000, '2020-01-15'),
(3, 'Amit Verma',     'Mathematics', 15, 80000, '2017-03-10');

INSERT INTO batches VALUES
(1, 'JEE-Morning-2024', 1, '2024-04-01', '2026-03-31', 1, 40),
(2, 'NEET-Eve-2024',    2, '2024-04-01', '2026-03-31', 2, 35);

select * from courses;
select * from faculty;
select * from batches;

INSERT INTO tests VALUES
(1, 'Physics Test 1',   1, 1, '2024-06-15', 100),
(2, 'Maths Test 1',     2, 1, '2024-06-20', 100),
(3, 'Chemistry Test 1', 3, 1, '2024-06-25', 100),
(4, 'Biology Test 1',   4, 2, '2024-06-18', 100),
(5, 'Physics Test 2',   1, 1, '2024-08-10', 100),
(6, 'Maths Test 2',     2, 1, '2024-08-15', 100);
select * from tests;

INSERT INTO test_scores VALUES
(1,  1, 1, 78), (2,  1, 2, 65), (3,  1, 3, 88),
(4,  2, 1, 82), (5,  2, 2, 70), (6,  2, 3, 91),
(7,  3, 1, 74), (8,  3, 2, 60), (9,  3, 3, 85),
(10, 4, 4, 88), (11, 4, 5, 72), (12, 4, 6, 90),
(13, 5, 1, 85), (14, 5, 2, 68), (15, 5, 3, 92),
(16, 6, 1, 88), (17, 6, 2, 75), (18, 6, 3, 95);

INSERT INTO attendance VALUES
(1, 1, 1, '2024-05-01', 'Present'),(2, 1, 1, '2024-05-02', 'Present'),
(3, 1, 1, '2024-05-03', 'Absent'), (4, 2, 1, '2024-05-01', 'Present'),
(5, 2, 1, '2024-05-02', 'Absent'), (6, 2, 1, '2024-05-03', 'Absent'),
(7, 3, 2, '2024-05-01', 'Present'),(8, 3, 2, '2024-05-02', 'Present'),
(9, 3, 2, '2024-05-03', 'Present'),(10,4, 4, '2024-05-01', 'Present'),
(11,4, 4, '2024-05-02', 'Late'),   (12,5, 4, '2024-05-01', 'Absent'),
(13,5, 4, '2024-05-02', 'Absent'), (14,6, 4, '2024-05-01', 'Present'),
(15,7, 6, '2024-07-01', 'Present'),(16,8, 6, '2024-07-01', 'Absent');

INSERT INTO fee_payments VALUES
(1, 1, 85000, '2024-04-01', 'UPI'),
(2, 2, 30000, '2024-04-01', 'Cash'),
(3, 2, 20000, '2024-06-01', 'UPI'),
(4, 3, 85000, '2024-04-01', 'Bank Transfer'),
(5, 4, 80000, '2024-04-01', 'UPI'),
(6, 5, 40000, '2024-04-01', 'Cash'),
(7, 6, 80000, '2024-04-05', 'Cheque'),
(8, 7, 45000, '2024-06-01', 'UPI'),
(9, 8, 20000, '2024-06-01', 'Cash');

INSERT INTO results VALUES
(1, 1, 'JEE Mains 2024', 2024, 185, 300, 1200, 1),
(2, 2, 'JEE Mains 2024', 2024, 145, 300, 3500, 1),
(3, 3, 'JEE Mains 2024', 2024, 210, 300, 800,  1),
(4, 4, 'NEET UG 2024',   2024, 580, 720, 4200, 1),
(5, 5, 'NEET UG 2024',   2024, 480, 720, 9800, 0),
(6, 6, 'NEET UG 2024',   2024, 610, 720, 2100, 1),
(7, 7, 'CA Foundation',  2024, 55,  100, NULL,  1),
(8, 8, 'CA Foundation',  2024, 40,  100, NULL,  0);


