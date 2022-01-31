USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		  Tom Whitson, CompanyName
-- Create date: 10/2/2021
-- Modified:    10/22/2021
-- Description:	Export data from ERPCompare
-- Mod:         Changed the file location to E:\Scripts\
-- =============================================
CREATE PROCEDURE [dbo].[ERPCompareExport]
AS

DECLARE @sql varchar(8000)
SET @sql = 'bcp "SELECT * FROM [DB\SQLEXPRESS].[846Composer].[dbo].[ERPCompare]" queryout E:\Scripts\846Export.csv -c -t, -T -S' + @@servername
EXEC master..xp_cmdshell @sql