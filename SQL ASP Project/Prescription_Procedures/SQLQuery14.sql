USE [ASP_Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Find_Paitent]    Script Date: 1/27/2020 8:47:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Julian Smith
-- Create date: 1/22/2020
-- Description:	Find a paitent
-- =============================================
CREATE PROCEDURE [dbo].[Find_Patient]
	-- Add the parameters for the stored procedure here
	@patient_id varchar (25),
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
			where (cast(patient.patient_id as varchar)like '%' + upper(@patient_id) + '%' or cast(patient.patient_id as varchar) = '')
			or (upper(fname)like '%' + upper(@fname) + '%' or upper(fname) = '')
			or (upper(lname)like '%' + upper(@lname) + '%' or upper(lname) = '')
			or (upper(gender)like '%' + upper(@gender) + '%' or upper(gender) = '')
				
	end
END
