USE [ASP_Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Find_Physician]    Script Date: 1/27/2020 7:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Find Physician
-- =============================================
CREATE PROCEDURE [dbo].[Search_Physician] 
	-- Add the parameters for the stored procedure here
	@physicianID varchar(25),
	@fname varchar(25),
	@lname varchar(25)
AS
    BEGIN
        SELECT	* 
            from physician
            where (upper(lname)like '%' + upper(@lname) + '%' or upper(lname) = '')
            and (upper(fname)like '%' + upper(@fname) + '%' or upper(fname) = '')
            and (cast(physician_id as varchar)like '%' + upper(@physicianID) + '%' or cast(physician_id as varchar) = '')
    END

