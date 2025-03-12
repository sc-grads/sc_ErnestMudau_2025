use OurFirstDatabase

select * from dbo.student
go
select * from dbo.Course


select *
from student
full join Course
on course.RollNO=student.rollno