
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/22/2020
-- Description:	Find a paitent
-- =============================================
CREATE PROCEDURE Find_Paitent
	-- Add the parameters for the stored procedure here
	@patient_id int,
	@fname varchar(25),
	@lname varchar(25),
	@gender char(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	begin
			select *
			From patient
				where  patient_id = @patient_id or fname = @fname or lname = @lname or gender = @gender
	end
END
GO
