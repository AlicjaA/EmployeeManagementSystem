USE [EmployeeManagementSystem]
GO
/****** Object:  Schema [HumanResources]    Script Date: 30.11.2019 20:24:09 ******/
CREATE SCHEMA [HumanResources]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to employees and departments.' , @level0type=N'SCHEMA',@level0name=N'HumanResources'
GO
