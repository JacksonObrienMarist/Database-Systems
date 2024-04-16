-- Jackson O'Brien
-- Database Systems
-- 4/16/2024

create table Engineers (
	EngineerID	int not null,
	FirstName	text,
	LastName	text,
	HighestAcademicDegreeEarned		text,
	Age 		int,
	FavoriteVideoGame	text,
	primary key(EngineerID)
);

create table Astronauts (
	AstronautID	 int not null,
	FirstName	 text,
	LastName	 text,
	YearsFlying  int,
	Age 		 int,
	SpouseName   text,
	GolfHandicap int,
	primary key(AstronautID)
);

create table FlightControlOperators (
	FCO_ID	 				int not null,
	FirstName	 			text,
	LastName	 			text,
	ChairPreference 	 	text,
	Age 				 	int,
	PreferredDrink  	 	text,
	RecommendedHangoverCure text,
	primary key(FCO_ID)
);

create table Spacecraft (
	Name	 		text,
	Tailnumber	 	int not null,
	WeightInTons 	int,
	FuelType   		text,
	CrewCapacity 	int,
	primary key(TailNumber)
);

create table Crew (
	AstronautID		  int not null,
	TailNumber int,
	primary key(AstronautID, TailNumber)
);

create table Systems (
	SystemID	int not null,
	Name		text,
	CostUSD		int,
	TailNumber	int,
	primary key (SystemID)
);

create table Parts (
	PartID		int not null,
	Name		text,
	Description	text,
	CostUSD		int,
	SystemID	int not null,
	primary key(PartID)
);

create table Suppliers (
	SupplierID	int not null,
	Name		text,
	Address		text,
	PaymentTerms	text,
	primary key(SupplierID)
);

create table Catalog (
	SupplierID	int not null,
	PartID		int not null,
	primary key(SupplierID, PartID)
);

insert into Engineers (EngineerID, FirstName, LastName, HighestAcademicDegreeEarned, Age, FavoriteVideoGame) values
(001, 'Robert', 'Bryant', 'Ph.D', 45, 'Resident Evil 2'),
(002, 'Ellis', 'Smith', 'Master', 37, 'Hearts of Iron 4'),
(003, 'Cave', 'Johnson', 'Bachelor', 29, 'Dark Souls 3');

insert into Astronauts (AstronautID, FirstName, LastName, YearsFlying, Age, SpouseName, GolfHandicap) values
(001, 'Neil', 'Armstrong', 12, 82, 'Janet Shearon', 3),
(002, 'Buzz', 'Aldrin', 10, 90, 'Anca Faur ', 10),
(003, 'Sally', 'Ride', 9, 65, 'Steven Hawley', 6);

insert into FlightControlOperators (FCO_ID, FirstName, LastName, ChairPreference, Age, PreferredDrink, RecommendedHangoverCure) values
(001, 'Sam', 'Brown', 'Standing Desk', 34, 'Coffee', 'Water'),
(002, 'Olivia', 'Green', 'Ergonomic Chair', 28, 'Water', 'Walking'),

insert into Spacecraft (Name, TailNumber, WeightInTons, FuelType, CrewCapacity) values
('Blizzard', 612, 78, 'Hydrogen', 5),
('Junker', 981, 60, 'Gasoline', 2),
('Bastion', 106, 120, 'Hydrogen', 3);

insert into Crew (AstronautID, TailNumber) values
(001, 612),
(002, 60),
(003, 120);

insert into Systems (SystemID, Name, CostUSD, TailNumber) values
(001, 'Radio', 500000, 612),
(002, 'Oxygen System', 250000, 60),
(003, 'Navigation', 300000, 120);

insert into Parts (PartID, Name, Description, CostUSD, SystemID) values
(001, 'Communication Device', 'Radio Wave Sender', 5000, 001),
(002, 'Oxygen Tanks', 'Big oxygen tanks', 2500, 002),
(003, 'Barometer', 'Instrument Used in Cockpit', 1000, 003);

insert into Suppliers (SupplierID, Name, Address, PaymentTerms) values
(001, 'Kerbit Space.', '740 Kenney Road, FL', 'Yearly'),
(002, 'Jebediah Supplies', '105 Space Avenue, NJ', 'Monthly'),
(003, 'Texas Instruments', '681 Silicon Road, CA', 'Weekly');

insert into Catalog (SupplierID, PartID) values
(001, 001),
(002, 002),
(003, 003);