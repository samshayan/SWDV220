/********************************************************************
*	Date		Author		Note
*	10-5-2019	Sam Shayan	script for disk_inventory database
	10-11-2019	Sam Shayan	Added insert statements
	10-18-2019	Sam Shayan	Create queries for disk_inventoryss database.
	10-22-2019	Sam Shayan	Create Stored procedure and execute statement
	10-22-2019	Sam Shayan	Add Stored procedure and execute statement for Project 5
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


/***************************************************************************
								Project 3
****************************************************************************/

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
		   ,('Drake', 'Graham', 1)
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
GO

/***************************************************************************
								Project 4
****************************************************************************/

--3, Show the disks in your database and any associated Individual artists only. Sort by Artist Last Name, First Name & Disk Name.

SELECT disk_name AS 'Disk Name', CONVERT(varchar(10), disk_release_date, 101 ) AS'Release Date'
	   , artist_first_name AS 'Artist first Name', artist_last_name AS 'Artist last Name'
-- Joining the tables Disk, diskHasArtist and Artist
FROM Disk
JOIN diskHasArtist ON Disk.disk_id = diskHasArtist.disk_id
JOIN Artist	ON Artist.artist_id = diskHasArtist.artist_id
WHERE artist_type_id = 1
--Sorting the output Last Name, First Name & Disk Name
ORDER BY artist_last_name, artist_first_name, disk_name;
GO

--4, Create a view called View_Individual_Artist that shows the artists’ names and not group names. Include the artist id in the view definition but do not display the id in your output.

--Droping the view if it already exisits
DROP VIEW IF EXISTS View_Individual_Artist;
GO

--creating a view 
CREATE VIEW View_Individual_Artist as 
--select first, last and artist id from Artist table where we have artist_type_id = 1
	SELECT artist_id, artist_first_name, artist_last_name
	FROM Artist
	WHERE artist_type_id = 1;
GO

--Displaying artists first and last name from the view
SELECT artist_first_name AS 'First Name', artist_last_name AS 'Last Name'
FROM View_Individual_Artist;
Go

--5, Show the disks in your database and any associated Group artists only. Use the View_Individual_Artist view. Sort by Group Name & Disk Name.

SELECT disk_name AS 'Disk Name',  CONVERT(varchar(10), disk_release_date, 101 ) AS'Release Date', artist_first_name AS 'Group Name'
FROM Disk
-- Joining tables
JOIN diskHasArtist ON Disk.disk_id = diskHasArtist.disk_id
JOIN Artist ON Artist.artist_id = diskHasArtist.artist_id
-- Adding a subquery to the WHERE Clause, artist_id would be 2 (Group)
WHERE Artist.artist_id NOT IN
			(SELECT artist_id
			FROM View_Individual_Artist)
--Sorting the output by Group Name & Disk Name
ORDER BY artist_first_name, disk_name;
GO

--6, Show which disks have been borrowed and who borrowed them. Sort by Borrower’s Last Name, then First Name, then Disk Name, then Borrowed Date, then Returned Date.

SELECT borrower_first_name AS First, borrower_last_name AS Last, disk_name AS 'Disk Name'
	, CONVERT(varchar(10), borrowed_date, 120) AS 'Borrowed Date'
	,CONVERT(varchar(10), borrower_return_date, 120)  AS 'Returned Date'
FROM Borrower
-- Joining tables
JOIN diskHasBorrower ON Borrower.borrower_id = diskHasBorrower.borrower_id
JOIN Disk ON Disk.disk_id = diskHasBorrower.disk_id
--Sorting the output by Borrower’s Last Name, then First Name, then Disk Name, then Borrowed Date, then Returned Date
ORDER BY borrower_last_name, borrower_first_name, disk_name, borrowed_date, borrower_return_date
GO

--7, In disk_id order, show the number of times each disk has been borrowed

SELECT Disk.disk_id AS DiskId, disk_name AS 'Disk Name', COUNT(*) AS 'Times Borrowed'
FROM Disk
-- Joining tables
JOIN diskHasBorrower ON Disk.disk_id = diskHasBorrower.disk_id
GROUP BY Disk.disk_id, disk_name
--Sorting the output by disk_id
ORDER BY Disk.disk_id;
GO

--8, Show the disks outstanding or on-loan and who has each disk. Sort by disk name.

SELECT disk_name AS 'Disk Name', CONVERT(varchar(10), borrowed_date, 120) AS 'Borrowed Date'
	,CONVERT(varchar(10), borrower_return_date, 120)  AS 'Returned Date', borrower_last_name AS 'Last Name'
FROM Disk
-- Joining tables
JOIN diskHasBorrower ON Disk.disk_id = diskHasBorrower.disk_id
JOIN Borrower ON Borrower.borrower_id = diskHasBorrower.borrower_id
--Getting the output where the returned Date is NULL
WHERE borrower_return_date IS NULL
--Sorting the output by disk_name
ORDER BY disk_name;
GO

/****************************************************************************
								Project 5
****************************************************************************/

/******* Stored procs & execute statement for Artist table *****************/

/***************************************************************************/

/********************************* 1.Insert************************************/
--Drop stored procedur sp_InsArtist if it alredy exists
DROP PROC IF EXISTS sp_InsArtist;
GO

--Create stored procedur sp_InsArtist to insert data to Artist table
CREATE PROC sp_InsArtist
-- Adding parameters
	@artist_first_name nvarchar(100),
	@artist_type_id int,
	@artist_last_name nvarchar(100) = NULL

AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY
	INSERT INTO [dbo].[Artist]
			   ([artist_first_name]
			   ,[artist_last_name]
			   ,[artist_type_id])
		 VALUES
			   (@artist_first_name
			   ,@artist_last_name
			   ,@artist_type_id)
END TRY
BEGIN CATCH
-- Printing error message if the data could not be inserted
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
			--returns the number of the error
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
			--returns the complete text of the error message
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to insert data using stored procedur
EXEC  sp_InsArtist 'Joe', 1,  'Walsh'
EXEC  sp_InsArtist 'Prince', 1 
EXEC  sp_InsArtist '$%#', NULL --artist_type_id can not be NULL
GO


SELECT * 
FROM Artist
GO
/********************************* 2.Update************************************/

--Drop stored procedur sp_UpdArtist if it alredy exists
DROP PROC IF EXISTS sp_UpdArtist;
GO

--Create stored procedur sp_UpdArtist to update Artist table's data
CREATE PROC sp_UpdArtist
-- Adding parameters
	@artist_id int,
	@artist_first_name nvarchar(100),
	@artist_type_id int,
	@artist_last_name nvarchar(100) = NULL
	
AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY
	UPDATE [dbo].[Artist]
	   SET [artist_first_name] = @artist_first_name
		  ,[artist_last_name] = @artist_last_name
		  ,[artist_type_id] = @artist_type_id
	 WHERE artist_id = @artist_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be updated
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to updated data using stored procedur
EXEC sp_UpdArtist 29, 'Burno', 1, 'Mars'
EXEC sp_UpdArtist 21, 'Cher', 1		--One value is missing
EXEC sp_UpdArtist 21, 'Burno', NULL -- artist_type_id can not be NULL
GO

/********************************* 3.DELETE************************************/

--Drop stored procedur sp_DelArtist if it alredy exists
DROP PROC IF EXISTS sp_DelArtist;
GO

--Create stored procedur sp_DelArtist to delete Artist table's data
CREATE PROC sp_DelArtist
-- Adding parameter
	@artist_id int
AS
-- Add TRY and CATCH block for error handling
 
BEGIN TRY
	DELETE FROM [dbo].[Artist]
	 WHERE artist_id = @artist_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be delete
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to delete data using stored procedur
EXEC sp_DelArtist 28
EXEC sp_DelArtist NULL -- Can not have NULL value
GO

/******* Stored procs & execute statement for Borrower table *****************/

/*****************************************************************************/

/********************************* 4.Insert**************************************/

--Drop stored procedur sp_InsBorrower if it alredy exists
DROP PROC IF EXISTS sp_InsBorrower;
GO

--Create stored procedur sp_InsBorrower to insert data to Artist table
CREATE PROC sp_InsBorrower
-- Adding parameters
	@borrower_first_name nvarchar(100),
	@borrower_phone nvarchar(50),
	@borrower_last_name nvarchar(100) 

AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY

INSERT INTO [dbo].[Borrower]
           ([borrower_first_name]
           ,[borrower_last_name]
           ,[borrower_phone])
     VALUES
           (@borrower_first_name
           ,@borrower_last_name
           ,@borrower_phone)

END TRY
BEGIN CATCH
-- Printing error message if the data could not be inserted
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
			--returns the number of the error
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
			--returns the complete text of the error message
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to insert data using stored procedur
EXEC  sp_InsBorrower 'Joe', 1234567899999,  'Walsh'
EXEC  sp_InsBorrower 'Prince', 1123123, NULL -- Can not have NULL value
EXEC  sp_InsBorrower '$%#', NULL			 -- One value is missing
GO


SELECT * 
FROM Borrower
GO
/********************************* 5.Update************************************/

--Drop stored procedur sp_UpdBorrower if it alredy exists
DROP PROC IF EXISTS sp_UpdBorrower;
GO

--Create stored procedur sp_UpdBorrower to update Artist table's data
CREATE PROC sp_UpdBorrower
-- Adding parameters
	@borrower_id int,
	@borrower_first_name nvarchar(100),
	@borrower_phone nvarchar(50),
	@borrower_last_name nvarchar(100) 
	
AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY
	UPDATE [dbo].[Borrower]
	   SET [borrower_first_name] = @borrower_first_name
		  ,[borrower_last_name] = @borrower_last_name
		  ,[borrower_phone] = @borrower_phone
	 WHERE borrower_id = @borrower_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be updated
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
		END CATCH
GO

-- Execute statement to update data using stored procedur
EXEC sp_UpdBorrower 22, 'mike', 1123564654, 'Basel'
EXEC sp_UpdBorrower 21, 'tom',1456789999, NULL -- Can not have NULL value
EXEC sp_UpdBorrower 21, 'jerry', NULL		   -- One value is missing
GO

/********************************* 6.DELETE************************************/

--Drop stored procedur sp_DelBorrower if it alredy exists
DROP PROC IF EXISTS sp_DelBorrower;
GO

--Create stored procedur sp_DelBorrower to delete Artist table's data
CREATE PROC sp_DelBorrower
	@borrower_id int
AS
-- Add TRY and CATCH block for error handling
 
BEGIN TRY
	DELETE FROM [dbo].[Borrower]
	 WHERE borrower_id = @borrower_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be delete
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to delete data using stored procedur
EXEC sp_DelBorrower 22
EXEC sp_DelBorrower NULL  -- Can not have NULL value
GO

/******* Stored procs & execute statement for Disk table *****************/

/*************************************************************************/

/********************************* 7.Insert************************************/
--Drop stored procedur sp_InsDisk if it alredy exists
DROP PROC IF EXISTS sp_InsDisk;
GO

--Create stored procedur sp_InsDisk to insert data to Artist table
CREATE PROC sp_InsDisk
-- Adding parameters
			    @disk_name nvarchar(100)
			   ,@disk_release_date date
			   ,@genre_id int
			   ,@status_id int
			   ,@disk_type_id int

AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY
	INSERT INTO [dbo].[Disk]
			   ([disk_name]
			   ,[disk_release_date]
			   ,[genre_id]
			   ,[status_id]
			   ,[disk_type_id])
		 VALUES
			    (@disk_name
			   ,@disk_release_date
			   ,@genre_id
			   ,@status_id
			   ,@disk_type_id)

END TRY
BEGIN CATCH
-- Printing error message if the data could not be inserted
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
			--returns the number of the error
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
			--returns the complete text of the error message
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to insert data using stored procedur
EXEC  sp_InsDisk 'New disk', '11-11-2009', 4,2,3
EXEC  sp_InsDisk 'Prince', NULL, 1,1,1 -- Can not have NULL value
EXEC  sp_InsDisk 'Mikael', NULL		   -- One value is missing
GO

SELECT * 
FROM Disk
GO
/********************************* 8.Update************************************/

--Drop stored procedur sp_UpdDisk if it alredy exists
DROP PROC IF EXISTS sp_UpdDisk;
GO

--Create stored procedur sp_UpdDisk to update Artist table's data
CREATE PROC sp_UpdDisk
		 @disk_id int
		  ,@disk_name nvarchar(100)
		 ,@disk_release_date date
		 ,@genre_id int
		 ,@status_id int
		 ,@disk_type_id int
	
AS
-- Add TRY and CATCH block for error handling 
BEGIN TRY

	UPDATE [dbo].[Disk]
	   SET [disk_name] = @disk_name
		  ,[disk_release_date] = @disk_release_date 
		  ,[genre_id] = @genre_id
		  ,[status_id] = @status_id
		  ,[disk_type_id] = @disk_type_id
	WHERE disk_id = @disk_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be updated
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
END CATCH
GO

-- Execute statement to update data using stored procedur
EXEC sp_UpdDisk 21, 'New disk3', '11-11-2010', 1,1,1
EXEC sp_UpdDisk 21, 'tom',NULL, 1,1,1			-- Can not have NULL value
EXEC sp_UpdDisk 21, 'jerry', '11-11-2010',1 ,1  -- One value is missing
GO

/********************************* 9.DELETE************************************/

--Drop stored procedur sp_DelDisk if it alredy exists
DROP PROC IF EXISTS sp_DelDisk;
GO

--Create stored procedur sp_DelDisk to delete Artist table's data
CREATE PROC sp_DelDisk
	@disk_id int
AS
-- Add TRY and CATCH block for error handling
 
BEGIN TRY
	DELETE FROM [dbo].[Disk]
	 WHERE disk_id = @disk_id

END TRY
BEGIN CATCH
-- Printing error message if the data could not be delete
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
		END CATCH
GO

-- Execute statement to delete data using stored procedur
EXEC sp_DelDisk 22
EXEC sp_DelDisk NULL		-- can not have NULL value
GO
