create TABLE StudentArchive(
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [FullName] NVARCHAR(200),
    [Address] NVARCHAR (200),
    [Age] INT,
    [Date] DATETIME
)

create TRIGGER trg_StudentDelete on Students
after DELETE
AS
BEGIN
INSERT into StudentArchive([FullName],[Address],[Age],[Date])
select [Name],[Address],[Age],GETDATE() from deleted
END

create PROCEDURE usp_DeleteStudent
@id INT
AS
delete from Students WHERE [Id]=@id

exec usp_DeleteStudent 1

select * from Students
select * from StudentArchive

create table Users( 
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [Name] NVARCHAR(250),
    [Email] NVARCHAR(150)
)

insert into Users([Name],[Email])
VALUES('Fexriyye','fexriyye@gmail.com'),
('Xacker','xacker@gmail.com'),
('Sirac','sirac@gmail.com'),
('Rashad','rashad@gmail.com')

create table Doctors( 
    [Id] int PRIMARY KEY IDENTITY (1,1),
    [Name] NVARCHAR(250),
    [Email] NVARCHAR(150)
)


insert into Doctors([Name],[Email])
VALUES('Fexriyye','fexriyye@gmail.com'),
('Xacker','xacker@gmail.com'),
('Sirac','sirac@gmail.com'),
('Rashad','rashad@gmail.com'),
('Test1','test@gmail.com')


INSERT into Users([Name],[Email])
VALUES('Test2','test@gmail.com')

select * from Users
EXCEPT
select * from Doctors

select * from Students

Select Count(*) as 'Student Age',Age
from Students
GROUP BY Age

declare @num1 int =50 
DECLARE @num2 int=20

if(@num1>@num2)
PRINT 'yes'   
ELSE
Print 'no'


DECLARE @counter int
set @counter=1
WHILE(@counter<=10)
BEGIN
Print 'The counter number -' + CONVERT(NVARCHAR,@counter)
SET @counter= @counter +1
END