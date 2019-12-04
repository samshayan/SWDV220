drop procedure if exists sp_ins_checkout
go

create procedure sp_ins_checkout
	@borrower_id int,
	@disk_id int,
	@borrowed_date smalldatetime,
	@borrower_return_date smalldatetime=NULL
as
	BEGIN TRY
		INSERT INTO [dbo].[diskHasBorrower]
				   ([borrower_id]
				   ,[disk_id]
				   ,[borrowed_date]
				   ,[borrower_return_date])
			 VALUES
				   (@borrower_id
				   ,@disk_id 
				   ,@borrowed_date
				   ,@borrower_return_date);
		UPDATE disk
			set status_id = '2'
		WHERE disk_id = @disk_id;
	END TRY
	BEGIN CATCH
		PRINT 'Disk: ' + CONVERT(varchar(200), @disk_id);
		PRINT 'Borrower: ' + CONVERT(varchar(200), @borrower_id);
		PRINT 'Date: ' + CONVERT(varchar(200), @borrowed_date);
		PRINT 'Message: ' + CONVERT(varchar(200), ERROR_MESSAGE());
	END CATCH
GO

grant execute on sp_ins_checkout to diskss
go