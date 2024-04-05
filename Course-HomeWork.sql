create DATABASE CodeAcademy
use CodeAcademy
CREATE TABLE Countries(
    [Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50)
)

INSERT into Countries([Name])
VALUES ('Azerbaijan'),
('Turkey'),
('Russia'),
('Italy')

select * from Countries

create TABLE Cities( 
    [Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50),
    [CountryId] int foreign KEY REFERENCES Countries([Id])
)

insert into Cities ([Name],[CountryId])
VALUES ('Baki',1),
('Moscow',3),
('Ganja',1),
('Istanbul',2),
('Venice',2)

SELECT * FROM Cities

create TABLE Students(  
    [Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Address] NVARCHAR(50),
    [Age] int,
    [Email] NVARCHAR(250),
    [CityId] int FOREIGN KEY REFERENCES Cities([Id])
)

insert into Students([Name],[Surname],[Address],[Age],[Email],[CityId])
VALUES ('Ilgar','Shiriyev','Bauil',26,'ilgar@gmail.com',1),
('Reshad','Agayev','Neftciler',21,'rashad@gmail.com',1),
('Oleg','Romanov','Domodedovo',23,'oleg@gmail.com',2),
('Ozhan','Demirci','Bahceviler',18,'ozhan@gmail.com',4),
('Anar','Mammadov','Yasamal',29,'anar@gmail.com',1)

select * from Students

create TABLE Rooms( 
    [Name] NVARCHAR(100),
    [Capacity] int
)

insert into Rooms([Name],[Capacity])
VALUES ('Moon',18),
('Sun',12),
('Artemida',30),
('Earth',10)

SELECT * from Rooms

ALTER TABLE Rooms
ADD [Id] int PRIMARY KEY IDENTITY

create TABLE Educations(    
    [Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100),
)

insert into Educations([Name])
VALUES ('Front end'),
('Back end'),
('Cybersecurity'),
('UI design')

create table Groups(    
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [Name] NVARCHAR(100),
    [Capacity] INT,
    [RoomId] int FOREIGN KEY REFERENCES Rooms([Id]),
    [EducationId] int FOREIGN KEY REFERENCES Educations([Id])
)

select * from Groups

INSERT into Groups([Name],[Capacity],[RoomId],[EducationId])
VALUES ('PB101',15,1,2),
('PB102',10,2,1),
('DG10',10,4,4),
('PB23',20,1,2)

create table Teachers(  
    [Id] int PRIMARY KEY IDENTITY(1,1),
    [FullName] NVARCHAR(200),
    [Sallary] FLOAT,
    [Address] NVARCHAR(200),
    [Email] NVARCHAR(200)
)

insert into Teachers([FullName],[Sallary],[Address],[Email])
VALUES ('Cavid Bashirov',1000,'Nizami','cavid@gmail.com'),
('Rufat Ahmadov',800,'Xirdalan','rufat@gmail.com'),
('Kamran Mammadov',1200,'28May','kamran@gmail.com')

CREATE TABLE GroupTeacher(  
    [Id] int PRIMARY key IDENTITY(1,1),
    [GroupId] int FOREIGN KEY REFERENCES Groups([Id]),
    [TeacherId] int FOREIGN KEY REFERENCES Teachers([Id])
)

SELECT * from Groups
SELECT * FROM Students
SELECT * from Teachers

insert into GroupTeacher([GroupId],[TeacherId])
VALUES (1,1),
(1,2),
(3,3),
(2,3)

create table StudentGroups( 
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [StudenId] int FOREIGN KEY REFERENCES Students([Id]),
    [GroupId] int FOREIGN KEY REFERENCES Groups([Id])
)

insert into StudentGroups([StudenId],[GroupId])
VALUES (1,4),
(2,1),
(4,4),
(3,2),
(1,2)

CREATE TABLE Departments(   
    [Id] int PRIMARY key IDENTITY(1,1),
    [Name] NVARCHAR(200)
)

insert into Departments([Name])
VALUES ('Administration'),
('Sales'),
('Marketing'),
('Technical')

CREATE table Roles( 
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [Name] NVARCHAR(200),
    [DepartmentId] int FOREIGN KEY REFERENCES Departments([Id])
)
insert into Roles([Name],[DepartmentId])
VALUES ('Sales manager',2),
('Director',1),
('SMM',3),
('Mechanic',4),
('Recepcionist',1)


CREATE table StaffMembers(  
    [Id] int PRIMARY KEY IDENTITY(1,1),
    [FullName] NVARCHAR (200),
    [Age] int,
    [Sallary] FLOAT,
    [CityId] int FOREIGN KEY REFERENCES Cities([Id])
)

create TABLE RoleOfStaff(   
    [Id] int PRIMARY KEY IDENTITY(1,1),
    [RoleId] int FOREIGN KEY REFERENCES Roles([Id]),
    [StaffMemberId] int FOREIGN KEY REFERENCES StaffMembers([Id])
)

select * from StaffMembers
select * from Roles

insert into StaffMembers([FullName],[Age],[Sallary],[CityId])
VALUES ('Adela Adigozalova',22,700,1),
('Orxan Badalov',35,5000,1),
('Firuza Mammadova',27,1200,1),
('Mehman Imanov',33,600,1)

insert into RoleOfStaff([RoleId],[StaffMemberId])
VALUES(5,1),
(2,2),
(3,1),
(1,3),
(4,4)

