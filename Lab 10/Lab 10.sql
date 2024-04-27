-- Jackson O'Brien
-- Database Management
-- 4/27/2024

-- function to find the prereqs for a course
create or replace function PreReqsFor(course_Num int) returns table(preReqNum int, preReqName text) as
$$
begin
    return query
    select courses.num, courses.name
    from prerequisites
    join courses 
	on courses.num = prerequisites.preReqNum
    where prerequisites.courseNum = course_Num;
end;
$$
language plpgsql;

-- example of function in use
select * 
from PreReqsFor(220);

-- function to find the prereqs a course gives to other courses
create or replace function IsPreReqFor(course_Num int) returns table(courseNum int, courseName text) as
$$
begin 
    return query
    select courses.num, courses.name
    from Prerequisites
    join courses 
    on courses.num = Prerequisites.courseNum
    where Prerequisites.preReqNum = course_Num;
end;
$$
language plpgsql;

-- example of function in use
select * 
from IsPreReqFor(120);