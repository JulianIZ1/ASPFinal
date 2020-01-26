-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Find Physician
-- =============================================
CREATE PROCEDURE Find_Physician 
	-- Add the parameters for the stored procedure here
	@physician_id int,
	@fname varchar(25),
	@lname varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select *
			From physician
				where  physician_id = @physician_id or fname = @fname or lname = @lname
END
GO
