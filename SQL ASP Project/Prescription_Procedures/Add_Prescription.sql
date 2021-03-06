USE [ASP_Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Add_Prescription]    Script Date: 1/26/2020 5:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julian Smith
-- Create date: 1/26/2020
-- Description:	Add Prescription 
-- =============================================
Create PROCEDURE [dbo].[Add_Prescription]
	-- Add the parameters for the stored procedure here
	@rx_number char(3),
	@medication_name varchar(50),
	@refill_amt char(3),
	@refill_date DateTime2 (7),
	@dosage char(3),
	@intake_method varchar(250),
	@frequency varchar(50),
	@patient_id int,
	@physician_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into prescription(rx_number, medication_name, refill_amt, refill_date,
			   dosage, intake_method, frequency, patient_id, physician_id)
	values (@rx_number, @medication_name, @refill_amt, @refill_date,
				@dosage,	@intake_method, @frequency, @patient_id, @physician_id)
END
