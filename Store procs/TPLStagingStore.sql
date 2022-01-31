USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyNAme
-- Create date: 10/2/2021
-- Modified:	10/22/2021
-- Description:	Import 3PL's 846 data
-- Mod:			Changed file path to E:\Scripts\CSVStore\CSV\
-- =============================================
ALTER PROCEDURE [dbo].[TPLStagingStore]
AS
EXEC [dbo].[TPLStagingPurge]

BULK INSERT [dbo].[TPLStaging]
FROM 'E:\Scripts\CSVStore\CSV\TPL846.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')