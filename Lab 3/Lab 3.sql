-- Jackson O'Brien
-- Database Systems
-- 2/4/2024

-- question one 
select ordernum, totalusd
from orders;

-- question two
select lastname, homecity 
from people
where prefix = 'Ms.';

-- question three
select prodid, name
from products
where qtyOnHand > 1007;

-- question four
select firstName, homeCity
from people
where extract(year from dob) between 1920 and 1929

-- question five
select prefix, lastname
from people
where prefix != 'Mr.';

-- question six
select *
from products
where city not in ('Dallas', 'Duluth')
	and priceusd <= 17;

-- question seven
select *
from orders
where extract(month from dateordered) = 1;

-- question eight
select *
from orders
where extract(month from dateordered) = 2
	and totalusd > 23000;
	
-- question nine
select * 
from orders
where custid = 007;

-- question ten
select *
from orders
where custid = 005;

