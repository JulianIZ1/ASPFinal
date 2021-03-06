USE [ASP_Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Find_Paitent]    Script Date: 1/27/2020 7:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Julian Smith
-- Create date: 1/22/2020
-- Description:	Find a paitent
-- =============================================
CREATE PROCEDURE [dbo].[SearchPatient](
	-- Add the parameters for the stored procedure here
    @patientID varchar(20),
    @fname varchar(25),
    @lname varchar(25)
)
AS
    BEGIN
        SELECT	* 
            from patient
            where (upper(lname)like '%' + upper(@lname) + '%' or upper(lname) = '')
            and (upper(fname)like '%' + upper(@fname) + '%' or upper(fname) = '')
            and (cast(patient_id as varchar)like '%' + upper(@patientID) + '%' or cast(patient_id as varchar) = '')
    END
END


