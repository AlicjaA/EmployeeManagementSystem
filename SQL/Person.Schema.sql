USE [EmployeeManagementSystem]
GO
/****** Object:  Schema [Person]    Script Date: 30.11.2019 20:24:09 ******/
CREATE SCHEMA [Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
