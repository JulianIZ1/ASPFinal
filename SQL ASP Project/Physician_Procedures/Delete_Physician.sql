-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Delete a patient
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Physician]
	-- Add the parameters for the stored procedure here
	@physician_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from physician
				where physician_id = @physician_id
END
