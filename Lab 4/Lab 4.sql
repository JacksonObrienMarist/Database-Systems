-- Jackosn O'Brien
-- Database Systems
-- 2/13/2024

-- question 1
select * 
from people
where pid in(select pid from customers);

-- question 2
select *
from people
where pid in(select pid from Agents);

-- question 3
select *
from people
where pid in(
	select pid from customers
	intersect
	select pid from agents);
			
-- question 4
select *
from people
where pid not in (select pid from customers)
and
pid not in (select pid from agents);

-- question 5
select distinct custId
from orders
where prodId in ('p01', 'p03')
order by custId asc;

-- question 6
select custId
from orders
where prodId = 'p01'
intersect
select custId
from orders
where prodId = 'p03'
order by custId desc;

-- question 7
select P.firstName, P.lastName
from people P
where P.pid in (select distinct agentId
	from orders
	where prodId in ('p05', 'p07'))
order by P.lastName asc, P.firstName asc;

-- question 8
select P.DOB, P.homeCity
from people P
where P.pid in (
	select O.agentId
	from Orders O
	where O.custId = 008
)
order by P.homecity desc;

-- question 9
select distinct prodId
from Orders
where agentid in (
	select O.agentId
	from Orders O
	where O.custId in (
		select C.pid
		from Customers C
		where C.pid in(
			select P.pid
			from people P
			where P.homecity = 'Montreal'
		)
	)
)
order by prodId desc;

-- question 10
select P.lastName, P.homeCity
from People P
where P.pid in (
	select O.custId
	from Orders O
	where O.agentId in (
		select A.pid
		from Agents A
		where A.pid in (
			select P2.pid
			from people P2
			where P2.homecity in ('Chilliwack', 'Oslo')
		)
	)
)
order by P.lastName asc;