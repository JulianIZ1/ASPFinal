-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Delete a patient
-- =============================================
Create PROCEDURE Delete_Patient
	-- Add the parameters for the stored procedure here
	@patient_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from patient
				where patient_id = @patient_id 
END
GO
