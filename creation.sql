
create table Positions (
    position_id serial primary key,
    position text not null
);

create table Pilot_classes (
	pilot_class_id serial primary key,
	pilot_class text not null
);

create table Employees (
	emp_id serial primary key,
	name text not null,
	position_id int references Positions(position_id),
	phone_number text,
	experience int,
	pilot_class_id int references Pilot_classes(class_id),
	certificate_number text unique not null
);

create table Employee_wishes (
	wish_id serial primary key,
	emp_id int references Employees(emp_id),
	days_off_date date 
);

create table Airport_classes (
	airport_class_id serial primary key,
	airport_class text not null,
	passenger_traffic text not null
);

create table Airports (
    IATA_id text primary key,
    airport_name text not null,
    coordinates text not null,
    airport_class_id int references Airport_classes(airport_class_id),
    number_of_runways int,
    throughput_capacity int
);

create table Aircraft_statuses (
	status_id serial primary key,
	status text
);

create table Aircrafts (
	aircraft_id serial primary key,
	registration_number text not null,
	model text,
	capacity int,
	takeoff_weight int,
	scope numeric,
	height numeric,
	length numeric,
	speed int,
	status_id int references Aircraft_statuses(status_id)
);

create table Flights (
	flight_id serial primary key,
	departure_airport text references Airports(IATA_id),
	arrival_airport text references Airports(IATA_id),
	departure_time timestamp not null,
	arrival_time timestamp not null,
	aircraft_id int references Aircrafts(aircraft_id)
);

create table Employees_flights (
    emp_id int references Employees(emp_id),
    flight_id int references Flights(flight_id),
    primary key (emp_id, flight_id)
);
