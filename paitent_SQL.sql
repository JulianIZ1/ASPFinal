SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/23/2020
-- Description:	Add, View, Delete, and Select procedures for student
-- =============================================
CREATE PROCEDURE Student_Procedures 
	-- Add the parameters for the stored procedure here
	@patient_id int,
	@fname varchar(25),
	@midint varchar(1),
	@lname varchar(25),
	@gender char(6),
	@dob	date,
	@streetname varchar(60),
	@city varchar(60),
	@pait_state char(2),
	@zip	decimal(5,0),
	@home_phone nchar(14),
	@cell_phone nchar(14),
	@email varchar(60),
	@statementType nvarchar(20) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Statement will add a user to the database
	if @statementType = 'Insert'
	begin
		insert into patient (patient_id, fname, midint, lname, gender, dob, 
							 streetname, city, pait_state, zip, home_phone, cell_phone,
							 email)
		values (@patient_id, @fname, @midint, @lname, @gender, @dob, @streetname,
				@city, @pait_state, @zip, @home_phone, @cell_phone, @email)
	end

	-- Statement will select a paitent in the database
	if @statementType = 'Select'
		begin
			select *
			From patient
				where fname = @fname
	end

	-- Statement will update the user in the database
	if @statementType = 'Update'
		begin
			update patient Set
				fname = @fname,
				midint = @midint,
				lname = @lname,
				gender = @gender,
				dob = @dob,
				streetname = @streetname,
				city = @city,
				pait_state = @pait_state,
				zip = @zip,
				home_phone = @home_phone,
				cell_phone = @cell_phone,
				email = @email
			where patient_id = @patient_id
	end

	-- Statement will delete the user from the database
	if @statementType = 'Delete'
		begin
			delete
				from patient
				where fname = @fname and lname = @lname
	end
END
GO
