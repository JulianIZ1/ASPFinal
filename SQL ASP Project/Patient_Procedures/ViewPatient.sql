-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ViewPatient 
	-- Add the parameters for the stored procedure here
	@fname varchar(25),
	@lname varchar(25),
	@streetname varchar(40),
	@city varchar(60),
	@pait_state char(2),
	@zip decimal(5,0),
	@dob datetime2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @fname, @lname, @streetname, @city, @pait_state,
			@zip, @dob
	from patient
END
GO
