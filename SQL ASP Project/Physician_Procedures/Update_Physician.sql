-- =============================================
-- Author:		Julian Smith
-- Create date: 1/26/2020
-- Description:	Updates Physician 
-- =============================================
CREATE PROCEDURE Update_Physician 
	-- Add the parameters for the stored procedure here
	@physician_id int,
	@fname varchar(25),
	@midint varchar(1),
	@lname varchar(25),
	@gender char(6),
	@dob	datetime2,
	@streetname varchar(60),
	@city varchar(60),
	@doc_state char(2),
	@zip	decimal(5,0),
	@office_phone nchar(14),
	@personal_phone nchar(14),
	@work_email varchar(60),
	@personal_email varchar (60),
	@speciality varchar (50),
	@salary decimal(8,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update physician Set
				fname = @fname,
				midint = @midint,
				lname = @lname,
				gender = @gender,
				dob = @dob,
				streetname = @streetname,
				city = @city,
				doc_state = @doc_state,
				zip = @zip,
				office_phone = @office_phone,
				personal_phone = @personal_phone,
				work_email = @work_email,
				personal_email = @personal_email ,
				speciality = @speciality,
				salary = @salary 
			where salary = @salary
END
GO
