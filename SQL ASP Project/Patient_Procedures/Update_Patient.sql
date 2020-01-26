-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Update_Paitent
-- =============================================
CREATE PROCEDURE Update_Paitent
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
	@email varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
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
END
GO
