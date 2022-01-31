USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/21/2021
-- Modified:	10/26/2021
-- Description:	Run all procs in order
-- Mod:			Bug fix for 2.0.2 - Issue1 (ERP/846/Issues/Issue1...txt)
-- =============================================
ALTER PROCEDURE [dbo].[846Task]
AS
EXEC [dbo].[ERPProductStore]
EXEC [dbo].[ERPStagingStore]
EXEC [dbo].[ERPInventoryJoin]
EXEC [dbo].[ERPConvertStore]
EXEC [dbo].[TPLStagingStore]
EXEC [dbo].[ERPCompareJoin]
EXEC [dbo].[ERPCompareExport]