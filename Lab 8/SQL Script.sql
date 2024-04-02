-- Jackson O'Brien
-- Database Management
-- 4/2/2024

create table Actor (
	ActorID		int not null,
	FirstName	text,
	LastName	text,
	Address		text,
	BirthDate 	date,
	HairColor	text,
	EyeColor	text,
	HeightInInches	int,
	Weight	int,
	SpouseFirstName	text,
	SpouseLastName	text,
	FavoriteColor	text,
	ScreenActorsGuildAnniversaryDate	date,
	primary key(ActorID)
);

create table Movie (
	MovieID		int not null,
	Name	text,
	YearReleased	int,
	MPAA text,
	DomesticBoxOfficeSalesUSD	int,
	ForeignBoxOfficeSalesUSD int,
	"DVD/Blu-raySalesUSD" int,
	primary key(MovieID)
);

create table Director (
	DirectorID		int not null,
	FirstName	text,
	LastName	text,
	Address		text,
	SpouseFirstName	text,
	SpouseLastName	text,
	FilmSchoolAttended	text,
	DirectorsGuildAnniversaryDate	date,
	favoriteLensMaker	text,
	primary key(DirectorID)
);

create table MovieActors (
	ActorID		int  null,
	MovieID		int  null
);

create table MovieDirectors (
	DirectorID	int  null,
	MovieID		int  null
);

insert into Actor (ActorID, FirstName, LastName, Address, Birthdate, HairColor, EyeColor, HeightInInches, Weight, SpouseFirstName, SpouseLastName, FavoriteColor, ScreenActorsGuildAnniversaryDate)
values
				   (001, 'Tom', 'Hanks', '821 Hollywood Blvd', '1956-07-09', 'Brown', 'Green', 60, 225, 'Rita', 'Wilson', 'Green', '1993-04-16'),
				   (002, 'Cillian', 'Murphy', '108 Leeson Street', '1976-05-25', 'Brown', 'Blue', 56, 154, 'Yvonne', 'McGuinness', 'Green', '2023-02-05'),
				   (003, 'Ryan', 'Gosling', '9100 Wilshire Blvd', '1980-10-12', 'Blonde', 'Blue', 60, 175, 'Eva', 'Mendes', 'Purple', '2007-06-01'),
				   (004, 'Sean', 'Connery', '610 Scottish Ave', '1930-10-25', 'Brown', 'Brown', 62, 165, 'Micheline', 'Roquebrune', 'Black', '1995-02-04'),
				   (005, 'Eric', 'Idle', '1610 Python Rd', '1943-03-29', 'Brown', 'Blue', 61, 180, 'Tania', 'Kosevich', 'Blue', '2006-03-07'),
				   (006, 'Joaquin', 'Phoenix', '9601 Wilshire Blvd', '1974-08-28', 'Brown', 'Brown', 56, 180, 'Rooney', 'Mara', 'Black', '2020-06-10'),
				   (007, 'Gregory', 'Peck', '539 S. Mapleton Dr', '1916-05-05', 'Black', 'Brown', 63, 185, 'Veronique', 'Passani', 'Blue', '1970-01-28'),
				   (008, 'Roger', 'Moore', '915 Spy Ave', '1927-06-14', 'Black', 'Blue' , 61, 180, 'Kristina', 'Tholstrup', 'White', null);

insert into Movie (MovieID, Name, YearReleased, MPAA, DomesticBoxOfficeSalesUSD, ForeignBoxOfficeSalesUSD, "DVD/Blu-raySalesUSD")
values
				   (001, 'Life of Brian', 1979, 'R', 20700000, 140034, null),
				   (002, 'Napoleon', 2023, 'R', 61500000, 159500000, null),
				   (003, 'Drive', 2011, 'R', 35060689, 46297241, 22369852),
				   (004, 'Dr. No', 1962, 'PG', 16067035, 43500000, null),
				   (005, 'Live and Let Die', 1973, 'PG', 35400000, 126400000, null);

insert into Director (DirectorID, FirstName, LastName, Address, SpouseFirstName, SpouseLastName, FilmSchoolAttended, DirectorsGuildAnniversaryDate, FavoriteLensMaker)
values				  (001, 'Ridley', 'Scott', '634 N LA Peer', 'Giannia', 'Facio', 'Royal College of Art', null, 'Anamorphic 75mm'),
					  (002, 'Nicolas', 'Refn', '96 Silver Lake', 'Liv', 'Corfixen', 'American Acadamey of Dramatic Arts', '2004-06-06', 'Atlas 50mm'),
					  (003, 'Stanley', 'Kubrick', '316 S. Camden Drive', 'Christiane', 'Kubrick', null, '1986-01-28','ZEISS 50mm'),
					  (004, 'Guy', 'Hamilton', '2133 Coolidge Ave', 'Miriam', 'Charriere', null, '1961-01-14', 'Minolta 50mm');
					  
insert into MovieActors (ActorID, MovieID)
values				  	 (006, 002),
						 (008, 005),
						 (003, 003),
						 (008, 005);
						 
						 
insert into MovieDirectors (DirectorID, MovieID)
values				  	    (null, 001),
						    (004, 005),
						    (002, 003),
						    (001, 002);		
				  	   

-- Query to find directors Roger Moore worked with
select distinct Director.FirstName, Director.LastName
from Director
join MovieDirectors 
on Director.DirectorID = MovieDirectors.DirectorID
join MovieActors  
on MovieDirectors.MovieID = MovieActors.MovieID
join Actor 
on MovieActors.ActorID = Actor.ActorID
where Actor.FirstName = 'Roger' AND Actor.LastName = 'Moore';


-- query to find ryan gosling (not part of the lab)
select Actor.FirstName, Actor.Lastname
from Actor
join MovieActors 
on Actor.ActorID = MovieActors.ActorID
join Movie 
on MovieActors.MovieID = Movie.MovieID
where Movie.Name = 'Drive';