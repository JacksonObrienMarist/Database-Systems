-- Jackson O'Brien
-- Database Management
-- Relational Database Project
-- 4/30/2024

create table people (
	pid int not null,
	firstname text,
	lastname text,
	rid int not null,
	zipcodes text,
	homeaddress text,
	dob date not null,
	dateofenlistment date not null,
	primary key(pid)
);

create table rank (
    rid int not null,
    rankname text not null,
    paygrade text not null,
    primary key(rid)
);

create table zipcodes (
    zipcode text not null,
    state text not null,
    city text not null,
    primary key(zipcode)
);

create table salary (
    paygrade text not null,
    salary int not null,
    primary key(paygrade)
);

create table pilots (
    pid int not null,
    flighthours int,
    missioncount int,
    status text,
    primary key (pid)
);

create table crewmembers (
	pid int not null,
	roid int not null,
	sid int not null,
	primary key(pid)
);

create table roles (
	roid int not null,
	role text,
	primary key(roid)
);

create table shifts (
	sid int not null,
	timeOfDay text,
	primary key(sid)
);

create table operations (
    oid int not null,
    location text not null,
    operationdate date not null,
    primary key (oid)
);

create table jetoperations (
    jid int not null,
    oid int not null,
    role text,
    primary key(jid, oid)
);

create table armaments (
    aid int not null,
    model text not null,
    maxrange int not null,
    costusd int not null,
    primary key(aid)
);

create table loadouts (
    lid int not null,
    pylonone int,
    pylontwo int,
    pylonthree int,
    pylonfour int,
    primary key (lid)
);

create table jets (
    jid int not null,
    model text not null,
    status text,
	pilot int,
	copilot int,
	role text,
    costUSD int,
	lid int,
    primary key(jid)
);

create table maintenance (
	mid int not null,
	jid int not null,
	dateOf date,
	type text,
	status text,
	primary key(mid)
);

insert into rank (rid, rankname, paygrade) values
('001', 'Seaman Recruit', 'E1'),
('002', 'Seaman Apprentice', 'E2'),
('003', 'Seaman', 'E3'),
('004', 'Petty Officer Third Class', 'E4'),
('005', 'Petty Officer Second Class', 'E5'),
('006', 'Ensign', 'O1'),
('007', 'Lieutenant Junior Grade', 'O2'),
('008', 'Lieutenant', 'O3'),
('009', 'Lieutenant Commander', 'O4'),
('010', 'Commander', 'O5');

insert into salary (paygrade, salary) values
('E1', 12000),
('E2', 14000),
('E3', 17000),
('E4', 21000),
('E5', 26000),
('O1', 68000),
('O2', 75000),
('O3', 91000),
('O4', 95000),
('O5', 110000);

insert into people (pid, firstname, lastname, rid, zipcodes, homeaddress, dob, dateofenlistment) values
('001', 'Alan', 'Laboseur', '006', '12601', '3399 North Road', '1990-06-17', '2012-07-10'),
('002', 'Lucy', 'Ripley', '005', '23510', '321 Nostromo Way', '1986-04-20', '2006-03-14'),
('003', 'Jack', 'Ryan', '010', '32202', '456 Patriot Ave', '1968-10-11', '1990-09-01'),
('004', 'Max', 'Doe', '004', '07928', '789 Ocean Blvd', '1995-08-30', '2015-06-01'),
('005', 'Pierre', 'Yamato', '003', '12601', '101 First Blood Dr', '1971-07-06', '1993-05-24'),
('006', 'Sarah', 'Connor', '002', '29401', '202 Sky Rd', '1984-05-12', '2004-10-26'),
('007', 'Maverick', 'Mitchell', '009', '31547', '303 Top Gun St', '1969-05-27', '1989-01-03'),
('008', 'Tom', 'Cruise', '008', '06340', '808 Book Ln', '1989-11-16', '2009-07-13'),
('009', 'Steve', 'McQueen', '007', '31547', '939 Shield Rd', '1918-07-04', '1942-06-14'),
('010', 'Stanley', 'Kubrick', '001', '29401', '417 Collection Rd', '1984-12-03', '2004-08-22');

insert into zipcodes (zipcode, state, city) values
('12601', 'NY', 'Poughkeepsie'),
('23510', 'VA', 'Norfolk'),
('32202', 'FL', 'Jacksonville'),
('96860', 'HI', 'Pearl Harbor'),
('98312', 'WA', 'Bremerton');

insert into pilots (pid, flighthours, missioncount, status) values
('001', 1500, 300, 'Active'),
('002', 1200, 200, 'Active'),
('003', 900, 150, 'Active'),
('004', 2100, 250, 'Active'),
('005', 800, 100, 'Active');


insert into roles (roid, role) values
('001', 'Launch Technician'),
('002', 'Aircraft Mechanic'),
('003', 'Air Traffic Controller'),
('004', 'Culinary Specialist');

insert into crewmembers (pid, roid, sid) values
('006', '001', '001'), -- Launch Technician
('007', '002', '002'), -- Aircraft Mechanic
('008', '003', '003'), -- Air Traffic Controller
('009', '004', '004'), -- Culinary Specialist
('010', '001', '005'); -- Another Launch Technician (Different Shift)

insert into shifts (sid, timeOfDay) values
('001', 'Morning'),
('002', 'Afternoon'),
('003', 'Evening');

insert into operations (oid, location, operationdate) values
('001', 'Pacific Ocean', '2024-05-01'),
('002', 'Indian Ocean', '2024-05-02'),
('003', 'Atlantic Ocean', '2024-05-03'),
('004', 'Mediterranean Sea', '2024-05-04'),
('005', 'Arabian Sea', '2024-05-05');

insert into jetoperations (jid, oid, role) values
('001', '001', 'Reconnaissance'),
('002', '002', 'Surveillance'),
('003', '003', 'Combat'),
('004', '004', 'Patrol'),
('005', '005', 'Training');

insert into armaments (aid, model, maxrange, costusd) values
('001', 'AIM-9 Sidewinder', 18, 60000),
('002', 'AIM-120 AMRAAM', 180, 400000),
('003', 'AGM-88 HARM', 150, 800000),
('004', 'AGM-65 Maverick', 22, 170000),
('005', 'Mark 84 General Purpose Bomb', 0, 20000);

insert into loadouts (lid, pylonone, pylontwo, pylonthree, pylonfour) values
('001', '001', '002', '003', '004'),
('002', '002', '002', '003', '005'),
('003', '001', '001', '004', '004'),
('004', '003', '003', '005', '005'),
('005', '004', '004', '001', '002');

insert into jets (jid, model, status, pilot, copilot, role, costUSD, lid) values
('001', 'F/A-18 Hornet', 'Operational', '001', null, 'Combat', 70000000, '001'),
('002', 'F-35C Lightning II', 'Operational', '003', null, 'Reconnaissance', 95000000, '002'),
('003', 'EA-18G Growler', 'Maintenance', '005', '002', 'Electronic Warfare', 67000000, '003'),
('004', 'F-14 Tomcat', 'Operational', '007', '001', 'Interceptor', 38000000, '004'),
('005', 'AV-8B Harrier II', 'Operational', '009', null, 'Ground Attack', 24000000, '005');

insert into maintenance (mid, jid, dateOf, type, status) values
('001', '003', '2024-04-10', 'Engine Overhaul', 'Completed'),
('002', '005', '2024-04-15', 'Avionics Upgrade', 'In Progress'),
('003', '004', '2024-04-20', 'Radar Calibration', 'Completed'),
('004', '002', '2024-04-25', 'After Action Review', 'Scheduled'),
('005', '001', '2024-04-30', 'Weapon Systems Check', 'Completed');

-- fist view
create view OperationOverview as
select 
    operations.oid,
    operations.location,
    operations.operationdate,
    jets.model,
    jets.status,
    people.firstname,
    people.lastname,
    rank.rankname as rank,
    loadouts.lid as loadout,
    coalesce((select costusd from armaments where aid = loadouts.pylonone), 0) +
    coalesce((select costusd from armaments where aid = loadouts.pylontwo), 0) +
    coalesce((select costusd from armaments where aid = loadouts.pylonthree), 0) +
    coalesce((select costusd from armaments where aid = loadouts.pylonfour), 0) as total_armament_cost
from operations
join jetoperations on operations.oid = jetoperations.oid
join jets on jetoperations.jid = jets.jid
join pilots on jets.pilot = pilots.pid
join people on pilots.pid = people.pid
join rank on people.rid = rank.rid
join loadouts on jets.lid = loadouts.lid
order by operations.operationdate desc;

-- query 1:
select *
from OperationOverview
where operationdate between '2024-05-01' and '2024-05-31';

-- query 2:
select *
from OperationOverview
where location = 'Pacific Ocean';


-- second view
create view PilotSummary as
select 
    people.pid,
    people.firstname,
    people.lastname,
    rank.rankname,
    people.zipcodes,
    people.homeaddress,
    people.dob,
    people.dateofenlistment,
    pilots.flighthours,
    pilots.missioncount,
    pilots.status
from 
    people
join pilots 
on people.pid = pilots.pid
join rank 
on people.rid = rank.rid;
	
-- first query 
select 
    pid,
    firstname,
    lastname,
    zipcodes,
    homeaddress,
    dob,
    dateofenlistment,
    flighthours,
    missioncount,
    status
from PilotSummary
where rankname = 'Ensign';

-- second query
select 
    pid,
    firstname,
    lastname,
    zipcodes,
    homeaddress,
    dob,
    dateofenlistment,
    flighthours,
    missioncount,
    status
from PilotSummary
where flighthours > 1000;

-- report 1
select
    jets.model,
    jets.status,
    people.firstname,
    people.lastname,
    pilots.flighthours
from jets
join pilots on jets.pilot = pilots.pid
join people on pilots.pid = people.pid
order by jets.status, pilots.flighthours desc;
-- report 2
select
    people.firstname,
    people.lastname,
    roles.role,
    shifts.timeOfDay
from crewmembers
join people 
on crewmembers.pid = people.pid
join roles 
on crewmembers.roid = roles.roid
join shifts 
on crewmembers.sid = shifts.sid
order by roles.role, shifts.timeOfDay;

-- security
create role general;
grant all 
on all tables in schema public
to general;

create role officer;
grant select, insert, update 
on all tables in schema public
to officer;

create role enlisted;
grant select
on all tables in schema public
to enlisted;


-- first procedure
create or replace function UpdateCrewMemberRole(crewMemberId int, newRoleId int)
returns text as 
$$
declare currentRole int;
begin
    select roid into currentRole from crewmembers where pid = crewMemberId;

    if currentRole != newRoleId then
        update crewmembers set roid = newRoleId where pid = crewMemberId;
        return 'Crew member role updated successfully.';
    end if;
end;
$$ 
language plpgsql;

select *
from crewmembers
where pid = 6

select UpdateCrewMemberRole(6, 7);


-- second
create or replace function updateJetStatus(jet_id int, new_status text)
returns void as $$
begin
    update jets
    set status = new_status
    where jid = jet_id;
end;
$$ language plpgsql;


-- query to change status
select updateJetStatus(1, 'Needs Repair');
select * from jets where jid = 1;

-- triggers
create or replace function retirePilot()
returns trigger as 
$$
begin
    if new.flighthours > 5000 then
        update pilots
        set status = 'Retired'
        where pid = new.pid;
    end if;
    return new;
end;
$$ 
language plpgsql;

create trigger retirePilot
after update of flighthours on pilots
for each row
execute function retirePilot();

update pilots
set flighthours = flighthours + 3500
where pid = '001';

select pilots.pid, people.firstname, people.lastname, pilots.flighthours, pilots.status
from pilots
join people on pilots.pid = people.pid
where pilots.pid = '001';