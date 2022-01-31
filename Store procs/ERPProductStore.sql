USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/1/2021
-- Modified:	10/21/2021
-- Description:	Store data from ERP to use for looking up product codes
-- Mod:			Updated to use LIVE846 and LIVE database
-- =============================================
ALTER PROCEDURE [dbo].[ERPProductStore]
AS
EXEC [dbo].[ERPProductPurge]

DECLARE
@openQuery nvarchar(4000),
@tsql nvarchar(4000),
@linkedServer nvarchar(4000)

SET NOCOUNT ON
SET @linkedServer = 'LIVE846'
SET @openQuery = 'SELECT "product-code" AS productCode, "product-key" AS productKey FROM OPENQUERY('+ @linkedServer + ', '''
SET @tsql = 'SELECT "product-code", "product-key" FROM PUB.product WHERE "system-id" = ''''SOG Knives'''' '')'

INSERT INTO [dbo].[ERPProduct] (productCode, productKey)
EXEC (@openQuery+@tsql)