USE [846Composer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tom Whitson, CompanyName
-- Create date: 10/26/2021
-- Description:	Procedure to clean ERPConvert
-- Fix for?:	Issue1, ver 2.0.2
-- =============================================
ALTER PROCEDURE [dbo].[ERPConvertPurge]
AS
TRUNCATE TABLE [dbo].[ERPConvert];