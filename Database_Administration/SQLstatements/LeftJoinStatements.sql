use OurFirstDatabase

select * from dbo.student
go
select * from dbo.Course


select *
from student
left join Course
on course.courseid=student.rollno