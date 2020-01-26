-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Add Physician
-- =============================================
CREATE PROCEDURE Add_Physician
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
	insert into physician(physician_id, fname, midint, lname, gender, dob, 
							 streetname, city, doc_state, zip, office_phone, personal_phone,
							 work_email, personal_email,  speciality, salary)
	values (@physician_id, @fname, @midint, @lname, @gender, @dob, @streetname,
				@city, @doc_state, @zip, @office_phone, @personal_phone, @work_email, @personal_email, 
				@speciality, @salary)
END
GO
