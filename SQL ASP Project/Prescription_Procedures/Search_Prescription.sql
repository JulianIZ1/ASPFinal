USE [ASP_Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Find_Prescription]    Script Date: 1/27/2020 8:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/26/2020
-- Description:	Find Prescription
-- =============================================
CREATE PROCEDURE [dbo].[Search_Prescription](
	-- Add the parameters for the stored procedure here
    @patientID varchar(20)
)
AS
    BEGIN
        SELECT	*
        from prescription
		left join patient 
		on patient.patient_id = prescription.patient_id
			left join physician
			on prescription.physician_id = physician.physician_id
            where (cast(patient.patient_id as varchar)like '%' + upper(@patientID) + '%' or cast(patient.patient_id as varchar) = '')
    END
go