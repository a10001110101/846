USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/2/2021
-- Modified:	10/26/2021
-- Description:	Combine and compare ERP and 3PL data
-- Mod:			Bug fix for 2.0.2 - Issue1 (ERP/846/Issues/Issue1...txt)
-- =============================================
CREATE PROCEDURE [dbo].[ERPCompareJoin]
AS
EXEC [dbo].[ERPComparePurge]

INSERT INTO [dbo].[ERPCompare] (onHandGen, productCodeGen, productCode, onHand, allocated, standardCost)
  SELECT TPLStaging.onHandGen AS onHandGen, TPLStaging.productCodeGen AS productCodeGen, ERPConvert.productCode AS productCode, ERPConvert.onHand AS onHand, ERPConvert.allocated AS allocated, ERPConvert.standardCost AS standardCost
  FROM [dbo].[3PLStaging]
  FULL OUTER JOIN [dbo].[ERPConvert]
  ON TPLStaging.productCodeGen = ERPConvert.productCode