-- Jackson O'Brien
-- Database Systems
-- 2/27/2024

-- question one
select People.*
from People
join Customers
on People.pid = Customers.pid

-- question two
select People.*
from People
join Agents
on People.pid = Agents.pid

-- question three
select 
	People.*, 
	Agents.*
from People
join Customers
on People.pid = Customers.pid
join Agents 
on People.pid = Agents.pid

-- question four
select firstName
from People
where pid not in (
	select pid 
	from Customers
)

-- question five
-- I could not find a way to use join and an outer join in the same query, the best I could do was use a left join to find the nulls in custId
select firstName
from People
left join Orders
on People.pid = Orders.custId
where Orders.custId is null;

-- question six
select 
	Agents.pid, 
	commissionPct
from Agents
join Orders
on Agents.pid = Orders.agentId
where Orders.custId = 008
order by commissionPct desc;

-- question seven
select 
	lastName, 
	homeCity, 
	commissionPct
from People
join Agents
on People.pid = Agents.pid
join Orders
on Agents.pid = Orders.agentId
where Orders.custId = 001
order by commissionPct desc;

-- question eight
select
	People.lastName,
	People.homeCity
from people
join Customers on People.pid = Customers.pid
where People.homeCity in (
	select city
	from Products
	group by city
	order by count(distinct prodId) asc
);

-- question nine
select 
	Products.prodId,
	Products.name
from Products
where Products.prodId in (
	select Orders.prodId
	from Orders
	join Customers on Orders.custid = Customers.pid
	join People on Customers.pid = People.pid
	where People.homecity = 'Arlington'
)
order by Products.name asc;

-- question ten 
select 
	c.firstName as CustomerFirstName, 
    c.lastName as CustomerLastName, 
    a.firstName as AgentFirstName, 
    a.lastName as AgentLastName,
    c.homeCity as SharedCity
from People as c
join Customers on c.pid = Customers.pid
join People a on c.homeCity = a.homeCity
join Agents on a.pid = Agents.pid
where c.pid != a.pid;
	
	