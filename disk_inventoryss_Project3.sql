/********************************************************************
*	Date		Author		Note
*	10-5-2019	Sam Shayan	script for disk_inventory database
	10-11-19	Sam Shayan	Added insert statements
*********************************************************************/

use master;
Go

-- code that checks if a database exists and before it deletes it
if DB_ID('disk_inventoryss') IS NOT NULL
	drop database disk_inventoryss
Go

-- Creating a database name disk_inventoryss (with initials)
CREATE DATABASE disk_inventoryss
GO

--using the disk_inventoryss database
USE disk_inventoryss;
GO

-- Create Genre table
create table Genre (
-- identity for auto-increment 
	genre_id	int	not null	identity primary key,
	genre_desc	nvarchar(255)	not null
);

-- Create Status table
create table Status(
	status_id	int	not null identity primary key,
	status_desc	nvarchar(255) not null
);

-- Create DiskType table
create table DiskType(
	disk_type_id	int not null identity primary key,
	disk_type_desc	nvarchar(255) not null
);

-- Create ArtistType table
create table ArtistType(
	artist_type_id		int not null identity primary key,
	artist_type_desc	nvarchar(255) not null
);

-- Create Borrower table
create table Borrower(
	borrower_id				int not null identity primary key,
	borrower_first_name		nvarchar(100) not null,
	borrower_last_name		nvarchar(100) not null,
	borrower_phone			nvarchar(50)  not null,
);

-- Create Artist table
create table Artist(
	artist_id				int not null identity primary key,
	artist_first_name		nvarchar(100) not null,
	artist_last_name		nvarchar(100) null,
	--artist_type_id is foreign key
	artist_type_id int not null references ArtistType(artist_type_id)
);
-- Create Disk table
create table Disk(
	disk_id			 int not null identity primary key,
	disk_name		 nvarchar(100) not null,
	disk_release_date date not null,
	genre_id		 int not null references Genre(genre_id),
	status_id		 int not null references Status(status_id),
	disk_type_id	 int not null references DiskType(disk_type_id),

);
-- Create diskHasBorrower table
create table diskHasBorrower(
	borrower_id		 int not null references Borrower(borrower_id),
	disk_id			 int not null references Disk(disk_id),
	borrowed_date	 smalldatetime not null,
	borrower_return_date	 smalldatetime null,
	--setting the primary keys
	primary key (borrower_id, disk_id,borrowed_date)
);


-- Create diskHasArtist table
create table diskHasArtist(
--disk_id and artist_id are primary and foreign keys
	disk_id		int	not null references Disk(disk_id),
	artist_id	int not null references Artist(artist_id)

	--primary key (disk_id,artist_id)
);

--creating a unique key and an index based on primary keys,
create unique index PK_diskHasArtist on diskHasArtist(disk_id, artist_id);

--Create login for diskss
-- if the user diskss does not exists
if SUSER_ID('diskss') is null
	--new sql server login ID
	create login diskss with password = 'MSPress#1',
	-- setting the default database to disk_inventoryss
	default_database = disk_inventoryss;

	--drop login diskss;

--Create user for disk
if USER_ID('diskss') is null
-- creating a database user with same name as login ID
	create user diskss;

--Altering the role so the user only can select data from any table in the database
alter role db_datareader add member diskss;
go

/****************************************/

-- Add INSERT INTO statement to add new data or records in the Genre table
INSERT INTO [dbo].[Genre]
           ([genre_desc])
     VALUES
            ('Classical Rock')
		   ,('Country')
		   ,('Jass')
		   ,('AltRock')
		   ,('Metal')
GO

-- Add INSERT INTO statement to add new data or records in the ArtistType table
INSERT INTO [dbo].[ArtistType]
           ([artist_type_desc])
     VALUES
            ('Solo')
		   ,('Group')
GO

-- Add INSERT INTO statement to add new data or records in the DiskType table
INSERT INTO [dbo].[DiskType]
           ([disk_type_desc])
     VALUES
            ('CD')
		   ,('Vinyl')
		   ,('8-Track')
		   ,('Cassette')
		   ,('DVD')
GO

-- Add INSERT INTO statement to add new data or records in the Status table
INSERT INTO [dbo].[Status]
           ([status_desc])
     VALUES
           ('Available')
		   ,('On loan')
		   ,('Damage')
		   ,('Missing')
GO

-- Add INSERT INTO statement to add new data or records in the Borrower table
INSERT INTO [dbo].[Borrower]
           ([borrower_first_name]
           ,[borrower_last_name]
           ,[borrower_phone])
     VALUES
            ('Minnie','Mouse','1111111111')
		   ,('Mikkie','Mouse','2222222222')
		   ,('Daisy','Duck','33333333333')
		   ,('Daffy','Mouse','4444444444')
		   ,('Donold','Duck','5555555555')
		   ,('Huey','Duck','6666666666')
		   ,('Dewey','Duck','77777777777')
		   ,('Louie','Duck','8888888888')
		   ,('Buzz','Lightyear','1010101010')
		   ,('Sheriff','Moody','110110110110')
		   ,('Little Bo','Lightyear','121212121212')
		   ,('Slinky','Dog','131313131313')
		   ,('Frozen','Ice','1414141414')
		   ,('Tom','Jerry','1515151515')
		   ,('Cap','Levi','1616161616')
		   ,('Helen','Ice','171717171717')
		   ,('T','Rex','11818181818')
		   ,('Indiana','Jones','1414141414')
		   ,('Harry','Potter','156151515')
		   ,('Thor','Thunder','161616161616')

GO

--Add DELETE statement to delete the record with borrower_id = 20
DELETE Borrower
WHERE borrower_id = 20;

-- Add INSERT INTO statement to add new data or records in the Artist table

INSERT INTO [dbo].[Artist]
           ([artist_first_name]
           ,[artist_last_name]
           ,[artist_type_id])
     VALUES
           ('Ozzy', 'Osbourne', 1)
           ,('Williw', 'Melson', 1)
		   ,('Tayler', 'Swift', 1)
		   ,('Alanis', 'Morrisette', 1)
		   ,('Michael', 'Jackson', 1)
		   ,('Chris', 'Daughty', 1)
		   ,('The Cars', NULL, 2)
		   ,('Black Sabbath', NULL, 2)
		   ,('Patsy', 'Cline', 1)
		   ,('Shinedown', NULL, 2)
		   ,('Collective Soul', NULL, 2)
		   ,('Pearl Jam', NULL, 2)
		   ,('Five Finger Death Punch', NULL, 2)
		   ,('Breaking Benjamin', NULL, 2)
		   ,('Seether', NULL, 2)
		   ,('Alice in chains', NULL, 2)
		   ,('Prince', NULL, 1)
		   ,('Drake', NULL, 1)
		   ,('Allan', 'Walker', 1)
		   ,('Beetles', NULL, 2)
		   
GO

-- Add INSERT INTO statement to add new data or records in the Disk table
INSERT INTO [dbo].[Disk]
           ([disk_name]
           ,[disk_release_date]
           ,[genre_id]
           ,[status_id]
           ,[disk_type_id])
     VALUES
           ('Crazy Train', '1/1/1995',1,1,1)
           ,('No More Tears', '11/11/1995',1,2,2)
           ,('Red', '1/1/2008',2,2,3)
           ,('Jagged Little Pill', '1/1/2008',3,2,4)
           ,('Candy-D', '10/10/1991',1,3,4)
           ,('Hotel California', '1/1/1997',3,4,5)
           ,('One of those Nights', '1/1/1975',1,3,3)
           ,('The Long Run', '1/1/1979',5,1,3)
           ,('Things left Unsaid', '1/1/1999',1,2,1)
           ,('Mints', '1/1/2008',4,1,1)
           ,('Blender', '1/1/2000',1,3,1)
           ,('Unplugged', '1/1/1996',1,1,3)
           ,('Facelift', '1/1/1991',3,2,1)
           ,('Blacke Gives Way to Blue', '1/1/2009',4,1,1)
           ,('Live', '1/1/2008',2,1,2)
           ,('Ten', '1/1/1991',4,3,3)
           ,('Vintalogy', '1/1/1994',1,2,2)
           ,('No Code', '1/1/1996',3,1,1)
           ,('Blackspacer', '1/1/2008',4,1,5)
           ,('Home', '1/1/2008',1,1,1)
            

GO
-- Add UPDATE statement to modify the date of disk_release_date with disk_id = 20
UPDATE Disk
SET disk_release_date = '11/11/2011'
WHERE disk_id = 20

-- Add INSERT INTO statement to add new data or records in the diskHasBorrower table
INSERT INTO [dbo].[diskHasBorrower]
           ([borrower_id]
           ,[disk_id]
           ,[borrowed_date]
           ,[borrower_return_date])
     VALUES
           (2,4, '1-2-2012','2-20-2012')
           ,(3,5, '11-12-2012','12-21-2012')
           ,(3,6, '1-22-2012','2-22-2012')
           ,(2,7, '7-22-2012','8-20-2012')
           ,(5,8, '1-2-2012','2-20-2012')
           ,(5,7, '1-2-2012','2-28-2012')
           ,(4,8, '3-2-2012','2-20-2013')
           ,(11,14, '1-12-2012','2-20-2013')
           ,(12,13, '1-20-2012',NULL)
           ,(13,15, '10-2-2016','12-20-2016')
           ,(14,11, '1-2-2016','2-21-2016')
           ,(15,10, '2-2-2016','2-22-2016')
           ,(15,12, '3-2-2016','2-23-2017')
           ,(8,8, '4-2-2016','2-24-2017')
           ,(9,4, '5-2-2016','2-25-2017')
           ,(10,9, '6-2-2017',NULL)
           ,(4,3, '7-2-2017','2-27-2018')
           ,(5,8, '8-2-2017','2-28-2018')
           ,(7,4, '9-2-2017','3-29-2018')
           ,(7,9, '9-2-2017','3-27-2018')
GO

-- Add INSERT INTO statement to add new data or records in the diskHasArtist table
INSERT INTO [dbo].[diskHasArtist]
           ([disk_id]
           ,[artist_id])
     VALUES
            (1,1)
           ,(2,1)
           ,(3,3)
           ,(4,4)
           ,(5,6)
           ,(6,8)
           ,(7,10)
           ,(8,9)
           ,(8,16)
           ,(8,5)
           ,(9,12)
           ,(10,12)
           ,(11,7)
           ,(12,18)
           ,(13,16)
           ,(14,14)
           ,(15,12)
           ,(16,8)
		   ,(18,5)
           ,(17,15)

GO

--List the disk that are on loan and have not been returnded, part h.
SELECT borrower_id, disk_id, Borrowed_date, borrower_return_date
FROM diskHasBorrower
WHERE borrower_return_date is NULL;


