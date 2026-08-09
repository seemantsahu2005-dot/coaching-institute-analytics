COACHING INSTITUTE PERFORMANCE ANALYTICS
-- ============================================================

 /*Q1 Which students have attendance below 75% in any subject? */

select 
s.name,
sub.subject_name,
count(*)as total_classes , 
sum(a.status = 'present') as present,
round(sum(a.status = 'present')*100.0/count(*),1)as attendance_pct

from attendance a
join students s on a.student_id=s.student_id
join subjects sub on a.subject_id = sub.subject_id

group by s.student_id, sub.subject_id
having attendance_pct < 75;

/*Q2 What is the average test score per batch per subject over time? */

SELECT 
    b.batch_name,
    sub.subject_name,
    t.test_date,
    ROUND(AVG(ts.marks), 2) AS avg_marks,
    ROUND(AVG(ts.marks) * 100 / t.max_marks, 1) AS avg_pct
FROM test_scores ts
JOIN tests t ON ts.test_id = t.test_id
JOIN batches b ON t.batch_id = b.batch_id
JOIN subjects sub ON t.subject_id = sub.subject_id
GROUP BY b.batch_id, sub.subject_id, t.test_date, t.max_marks
ORDER BY t.test_date;
 
/*Q3 Which student improved the most across consecutive tests? */

select 
s.name ,
sub.subject_name ,
t.test_date,
ts.marks as current_marks,
LAG(ts.marks)OVER(partition by ts.student_id , t.subject_id
order by t.test_date) as prev_marks,
ts.marks - LAG(ts.marks)over(partition by ts.student_id , t.subject_id
order by t.test_date) as improvement 
from test_scores ts 
join tests t on ts.test_id = t.test_id
join students s on ts.student_id = s.student_id 
join subjects sub on t.subject_id = sub.subject_id 
order by improvement desc;


/*Q4 How much fee is pending course-wise and who are the defaulters? */

select 
s.name ,
c.course_name,
s.total_fee,
coalesce(sum(fp.amount),0) as fee_paid,
s.total_fee - coalesce(sum(fp.amount),0)as pending ,
case 
when sum(fp.amount)>= s.total_fee then 'cleared'
when sum(fp.amount)>0 then 'partial'
else'unpaid'
end as status
from students s 
join courses c on s.course_id = c.course_id
left join fee_payments fp on s.student_id = fp.student_id

group by s.student_id , s.name , c.course_name, s.total_fee
having pending>0
order by pending desc;

/*Q5  Which faculty's batch has the highest average score? */

select 
f.name as faculty_name,
b.batch_name,
round(avg(ts.marks*100/t.max_marks),1)as avg_score_pct
from test_scores ts 
join tests t on ts.test_id = t.test_id 
join batches b on t.batch_id = b.batch_id
join faculty f on b.faculty_id = f.faculty_id

group by f.faculty_id,b.batch_id
order by avg_score_pct desc;

/*Q6 What is the pass/fail ratio in each course? */
select 
c.course_name,
count(*)as total_appeared,
sum(r.cleared)as passed,
count(*)-sum(r.cleared)as failed,
round(sum(r.cleared)*100.0/count(*),1)as pass_pct
from results r
join students s on r.student_id = s.student_id
join courses c on s.course_id = c.course_id
group by c.course_id;


/*Q7  How many students enrolled each month? */

select 
year(enrollment_date)as year,
month(enrollment_date)as month,
count(*)as student_enrolled

from students 
group by year(enrollment_date),month(enrollment_date)
order by year,month;

/*Q8  Which subject has the lowest average score across all batches? */

select
sub.subject_name,
round(avg(ts.marks*100/t.max_marks),1)as avg_pct
from test_scores ts 
join tests t on ts.test_id = t.test_id
join subjects sub on t.subject_id = sub.subject_id
group by sub.subject_id
order by avg_pct asc
limit 1;


/*Q9  What is the gender-wise performance comparison per course? */

select 
c.course_name,
s.gender,
count(distinct s.student_id)as total_students,
round(avg(ts.marks*100/t.max_marks),1)as avg_score_pct
from test_scores ts
join tests t on ts.test_id = t.test_id
join students s on ts.student_id= s.student_id
join courses c on s.course_id = c.course_id
group by c.course_id, s.gender 
order by c.course_name , s.gender;


/*Q10 which city has most student*/

select
city,
count(*)as total_student
from students 
group by city 
order by total_student desc;

/*Q11 How does attendance correlate with test scores? */

select 
s.name ,
round(sum(a.status='present')*100.0/count(a.attendance_id),1)as attendance_pct,
round(avg(ts.marks*100/t.max_marks),1)as avg_score_pct

from students s 
join attendance a on s.student_id = a.student_id
join test_scores ts on s.student_id =ts.student_id
join tests t on ts.test_id=t.test_id
group by s.student_id,s.name
order by  attendance_pct desc ;


/*Q12 - What is the month-over-month average score trend per batch? */

select 
b.batch_name,
year(t.test_date)as year,
month(t.test_date)as month,
round(avg(ts.marks*100/t.max_marks),1)as avg_score_pct

from test_scores ts
join tests t on ts.test_id =t.test_id
join batches b on t.batch_id=b.batch_id
group by b.batch_id , b.batch_name,year(t.test_date),month(t.test_date)
order by b.batch_name , year ,month;

SELECT user, host FROM mysql.user;
