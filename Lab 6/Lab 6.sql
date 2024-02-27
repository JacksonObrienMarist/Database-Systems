-- Jackson O'Brien
-- Database Systems
-- 2/27/2024

-- question one
select 
	city,
	count(distinct prodId),
	rank() over (order by count(distinct prodId) desc) 
from Products
group by city
order by count desc;

-- question two
select Products.name
from Products
where priceUSD < (
	select avg(priceUSD) * 0.01 
	from Products)
order by Products.name asc;

-- question three
select 
	People.lastName,
	Orders.prodId,
	Orders.totalUSD
from Orders
join Customers
on Orders.custId = Customers.pid
join People
on Customers.pid = People.pid
where extract(month from Orders.dateOrdered) = 3
order by Orders.totalUSD asc;

-- question four
select 
	People.lastName,
	coalesce(sum(Orders.totalUSD), 0) as total
from People
join Customers
on People.pid = Customers.pid
left join Orders
on Customers.pid = Orders.custId
group by People.lastName
order by People.lastName desc;

-- question five
select 
	People.firstName as CustomerFirstName,
	People.lastName as CustomerLastName,
	agentPeople.firstName as AgentFirstname,
	agentPeople.lastName as AgentLastName,
	Products.name as Product
from Orders
join Customers on
Orders.custId = Customers.pid
join People 
on Customers.pid = People.pid
join products 
on Orders.prodId = Products.prodId
join Agents 
on Orders.agentId = Agents.pid
join People as agentPeople
on Agents.pid = agentPeople.pid
where agentPeople.homeCity = 'Chilliwack'

-- question six
select 
	Products.priceUSD,
	Orders.quantityOrdered,
	round(Products.priceUSD * Orders.quantityOrdered, 2) as calculatedUSD,
	Orders.totalUSD
from Orders
join Products 
on Orders.prodId = products.prodId
where round(Products.priceUSD * Orders.quantityOrdered, 2) != Orders.totalUSD;

/*
There could be differences or other equations that are not seen in the database.
Such as possibly a discount system, or added charges. The price may have also
changed at a certain point possibly. It isn't an issue with rounding because the decimals
were almost always 00.
*/
-- question seven
select 
	firstName, 
	lastName
from People
join Agents
on People.pid = Agents.pid
join Customers
on People.pid = Customers.pid;

-- question eight
--customer view
create view PeopleCustomers as
select 
	People.*, 
	Customers.pid as pidCustomer,
	Customers.paymentTerms,
	Customers.discountPct
from People
join Customers
on People.pid = Customers.pid

--agent view
create view  PeopleAgents as
select 
	People.*,
	Agents.pid as pidAgent,
	Agents.paymentTerms,
	Agents.commissionPct
from People
join Agents
on People.pid = Agents.pid;

-- question nine
select
	PeopleCustomers.firstName,
	PeopleCustomers.lastName
from PeopleCustomers
join PeopleAgents
on PeopleCustomers.pid = PeopleAgents.pid;

/* question ten
Views essentially act as functions or methods. You can use them to shorten code and make it less
complex by doing a common query for another query to use. The query that is calling the view 
is reading the data from the view tables. Than applying the join operations to combine the tables
as another kind of join. The way Postgres processes this is by "unwrapping". The output is identical
because the operations and data that are being used are the exact same. Views add a another level of abstraction.

-- question eleven
Left outer join will return all the rows from the left table, or the original
table. Than it will match the data with the right table, if no matches are found
it will put a NULL in the data. It's the opposite for a right outer join, it will take 
all the rows from the right table and only take matched data from the left. 
*/
-- examples of left outer
select firstName
from People
left join Orders
on People.pid = Orders.custId

-- example of right outer
select firstName
from People
right join Orders
on People.pid = Orders.custId