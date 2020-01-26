-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/25/2020
-- Description:	Add a Patient
-- =============================================
Create PROCEDURE Add_Patient
	-- Add the parameters for the stored procedure here
	@fname varchar(25),
	@midint varchar(1),
	@lname varchar(25),
	@gender char(6),
	@dob	date,
	@streetname varchar(60),
	@city varchar(60),
	@pait_state char(2),
	@zip	decimal(5,0),
	@home_phone nchar(14),
	@cell_phone nchar(14),
	@email varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into patient (fname, midint, lname, gender, dob, 
							 streetname, city, pait_state, zip, home_phone, cell_phone,
							 email)
		values (@fname, @midint, @lname, @gender, @dob, @streetname,
				@city, @pait_state, @zip, @home_phone, @cell_phone, @email)
END
GO
