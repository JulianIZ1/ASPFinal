use master
go

--Creates the ASP_Pharmacy_Database
create database ASP_Pharmacy
go

-- Cause SQL to wait
begin
	waitfor delay '00:00:05.000';
end;
go

-- Uses the ASP_Pharmacy database
use ASP_Pharmacy
go

-- Creates a paitent table
create table patient(
	patient_id	int identity(1,1) not null
				constraint pk_patient_id
				primary key,
	fname		varchar(25) not null
					check(fname LIKE '%[A-Z]%'),
	midint		varchar(1) null
					check(midint LIKE '%[A-Z]%'),
	lname		varchar(25) not null
					check(lname LIKE '%[A-Z]%'),
	gender		char(6) not null
					check(gender in('Male', 'Female')),
	dob			date not null,
	streetname  varchar(40) not null,
	city		varchar(60) not null,
	pait_state  char(2) not null
					check(pait_state LIKE '%[A-Z]%'),
	zip			decimal(5,0) null
					check(zip LIKE '%[0-9 - ]%'),
	home_phone  nchar(14) null
					check(home_phone LIKE '%[0-9 () ]%'),
	cell_phone  nchar(14) null
					check(cell_phone LIKE '%[0-9 () ]%'),
	email       varchar(60) null,
)

-- Adds people into the table
insert into patient(fname, midint, lname, gender, dob, streetname, city, pait_state, zip, home_phone, cell_phone, email)
values('Julian', 'v', 'Smith', 'Male', '12/09/1999', '5 Dewey Avenue', 'York', 
		'PA', '17404', '(717)327-9089', '(717)345-9854', 'smithjulian07@gmail.com')

-- Adds a pyhsician table
create table physician(
	physician_id	int identity(1,1) not null
					constraint pk_physician_id
					primary key,
	fname			varchar(25) not null
						check(fname LIKE '%[A-Z]%'),
	midint			varchar(1) null
						check(midint LIKE '%[A-Z]%'),
	lname			varchar(25) not null
						check(lname LIKE '%[A-Z]%'),	
	dob				date not null,
	gender			char(6) not null
						check(gender in('Male', 'Female')),
	streetname		varchar(40) null,
	city			varchar(60) null,
	doc_state		char(2) null
						check(doc_state LIKE '%[A-Z]%'),
	zip				decimal(5,0) null
						check(zip LIKE '%[0-9 - ]%'),
	office_phone	nchar(14) not null
						check(office_phone LIKE '%[0-9 () ]%'),
	personal_phone  nchar(14) null
						check(personal_phone LIKE '%[0-9 () ]%'),
	work_email		varchar(60) not null,
	personal_email	varchar(60) null,
	speciality		varchar(50) not null
						check(speciality LIKE '%[A-Z]%'),
	salary			decimal(8,2) not null
						check(salary LIKE '%[0-9 - ]%'),
)

-- Adds a phyisican into the table
insert into physician(fname, midint, lname, gender, dob, streetname, city, doc_state, zip, office_phone, personal_phone, work_email, personal_email, speciality, salary)
values('George', null, 'DeTorre', 'Male', '12/23/1999', '123 Seaseme street', 'Yeet', 
		'PA', '42069', '(818)784-2342', '(757)765-9832', 'xsadamahmeedl@gmail.com',
		'xsadamahmeedl@gmail.com', 'Cardioligist', '350000')

-- Adds the prescription table
create table prescription(
	prescription_id int identity(1,1) not null
					constraint pk_prescription_id
					primary key,
	rx_number		char(3) not null
						check(rx_number Like '[0-9][0-9][0-9]'),
	medication_name varchar(50) not null,
	refill_amt		decimal(3,0) not null,
	dosage			char(3) not null
						check(dosage Like '[0-9][0-9][0-9]'),
	intake_method	varchar(50) not null,
	patient_id		int constraint fk_prescription_patient_id
					foreign key (patient_id) references patient(patient_id)
					not null,
	physician_id	int constraint fk_prescription_physician_id
					foreign key (physician_id) references physician(physician_id)
					not null,
)

-- Inserts a value into the prescription table
insert into prescription(rx_number, medication_name, refill_amt, dosage, intake_method, patient_id, physician_id)
values('302', 'Penicillin', '20', '050', 'Orally', 1, 1)