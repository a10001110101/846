USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/1/2021
-- Modified:	10/26/2021
-- Description:	Store inventory data from ERP
-- Mod:			Updated to use LIVE846 and LIVE database; added WI/QC
-- =============================================
ALTER PROCEDURE [dbo].[ERPStagingStore]
AS
EXEC [dbo].[ERPStagingPurge]

INSERT INTO [dbo].[ERPStaging] (productKey, locationKey, binKey, onHand, allocated, standardCost)
  SELECT "product-key" AS productKey, "level-key-2" AS locationKey, "level-key-5" AS binKey, "qoh" AS onHand, "qalloc" AS allocated, "last-cost" AS standardCost
  FROM [LIVE846].[ERP].[PUB].[inventory]
  WHERE "system-id" = 'CompanyName' AND "level-key-2" IN ('00000006','00000008') AND "level-key-5" IN ('00000151','00000150','00000149','00000152','00000192')