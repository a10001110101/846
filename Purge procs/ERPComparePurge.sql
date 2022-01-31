USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/1/2021
-- Description:	Procedure to clean ERPCompare
-- =============================================
CREATE PROCEDURE [dbo].[ERPComparePurge]
AS
TRUNCATE TABLE [dbo].[ERPCompare];