USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/26/2021
-- Description:	Sum ERP data before comparing
-- Fix for?:	Issue1, ver 2.0.2
-- =============================================
ALTER PROCEDURE [dbo].[ERPConvertStore]
AS
EXEC [dbo].[ERPConvertPurge]

INSERT INTO [dbo].[ERPConvert] (productCode, onHand, allocated, standardCost)
  SELECT ERPInventory.productCode AS productCode, SUM(ERPInventory.onHand) AS onHand, SUM(ERPInventory.allocated) AS allocated, MAX(ERPInventory.standardCost) AS standardCost
  FROM [dbo].[ERPInventory]
  GROUP BY ERPInventory.productCode