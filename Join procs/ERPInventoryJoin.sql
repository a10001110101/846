USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/1/2021
-- Description:	Joining data to add in product codes
-- =============================================
CREATE PROCEDURE [dbo].[ERPInventoryJoin]
AS
EXEC [dbo].[ERPInventoryPurge]

INSERT INTO [dbo].[ERPInventory] (productCode, productKey, locationKey, binKey, onHand, allocated, standardCost)
  SELECT ERPProduct.productCode AS productCode, ERPProduct.productKey AS productKey, ERPStaging.locationKey AS locationKey, ERPStaging.binKey AS binKey, ERPStaging.onHand AS onHand, ERPStaging.allocated AS allocated, ERPStaging.standardCost AS standardCost
  FROM [dbo].[ERPProduct]
  INNER JOIN [dbo].[ERPStaging]
  ON ERPProduct.productKey = ERPStaging.productKey