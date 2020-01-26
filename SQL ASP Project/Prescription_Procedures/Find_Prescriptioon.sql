-- =============================================
-- Author:		Julian Smith
-- Create date: 1/26/2020
-- Description:	Find Prescription
-- =============================================
CREATE PROCEDURE Find_Prescription
	-- Add the parameters for the stored procedure here
	@prescription_id int,
	@patient_id int,
	@physician_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from prescription
		where prescription_id = @prescription_id or patient_id = @patient_id or physician_id = @physician_id
END
GO
