-- persons
-- aditionalcontactinfo
-- adres







USE [master]

DROP DATABASE EmployeeManagementSystem
GO

/****** Object:  Database [EmployeeManagementSystem]    Script Date: 24.11.2019 09:42:30 ******/
CREATE DATABASE [EmployeeManagementSystem]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'EmployeeManagementSystem', FILENAME = N'D:\AA_SQLSERVER\MSSQL14.MSSQLSERVER\MSSQL\DATA\EmployeeManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'EmployeeManagementSystem_log', FILENAME = N'D:\AA_SQLSERVER\MSSQL14.MSSQLSERVER\MSSQL\DATA\EmployeeManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [EmployeeManagementSystem] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EmployeeManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET ARITHABORT OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [EmployeeManagementSystem] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [EmployeeManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [EmployeeManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET  ENABLE_BROKER 
GO

ALTER DATABASE [EmployeeManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [EmployeeManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [EmployeeManagementSystem] SET  MULTI_USER 
GO

ALTER DATABASE [EmployeeManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [EmployeeManagementSystem] SET DB_CHAINING OFF 
GO

ALTER DATABASE [EmployeeManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [EmployeeManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [EmployeeManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [EmployeeManagementSystem] SET QUERY_STORE = OFF
GO

ALTER DATABASE [EmployeeManagementSystem] SET  READ_WRITE 
GO

USE [EmployeeManagementSystem]
GO


GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 30.11.2019 20:24:09 ******/
CREATE TYPE [dbo].[Name] FROM [nvarchar](50) NULL
GO

GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 30.11.2019 20:24:09 ******/
CREATE TYPE [dbo].[NameStyle] FROM [bit] NOT NULL
GO



/****** Object:  Table [Person].[Person]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] [dbo].[NameStyle] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [dbo].[Name] NOT NULL,
	[MiddleName] [dbo].[Name] NULL,
	[LastName] [dbo].[Name] NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL,
	[AdditionalContactInfo] [xml](CONTENT [Person].[AdditionalContactInfoSchemaCollection]) NULL,
	[Demographics] [xml](CONTENT [Person].[IndividualSurveySchemaCollection]) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [EmployeeManagementSystem]
GO
/****** Object:  View [Person].[vAdditionalContactInfo]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Person].[vAdditionalContactInfo] 
AS 
SELECT 
    [BusinessEntityID] 
    ,[FirstName]
    ,[MiddleName]
    ,[LastName]
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:telephoneNumber)[1]/act:number', 'nvarchar(50)') AS [TelephoneNumber] 
    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:telephoneNumber/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [TelephoneSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes";
        (act:homePostalAddress/act:Street)[1]', 'nvarchar(50)') AS [Street] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:City)[1]', 'nvarchar(50)') AS [City] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:StateProvince)[1]', 'nvarchar(50)') AS [StateProvince] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:PostalCode)[1]', 'nvarchar(50)') AS [PostalCode] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:CountryRegion)[1]', 'nvarchar(50)') AS [CountryRegion] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:SpecialInstructions/text())[1]', 'nvarchar(max)') AS [HomeAddressSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:eMailAddress)[1]', 'nvarchar(128)') AS [EMailAddress] 
    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [EMailSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:SpecialInstructions/act:telephoneNumber/act:number)[1]', 'nvarchar(50)') AS [EMailTelephoneNumber] 
    ,[rowguid] 
    ,[ModifiedDate]
FROM [Person].[Person]
OUTER APPLY [AdditionalContactInfo].nodes(
    'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
    /ci:AdditionalContactInfo') AS ContactInfo(ref) 
WHERE [AdditionalContactInfo] IS NOT NULL;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Displays the contact name and content from each element in the xml column AdditionalContactInfo for that person.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'VIEW',@level1name=N'vAdditionalContactInfo'
GO
---------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------
GO
/****** Object:  Table [Person].[Address]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[PostalCode] [nvarchar](15) NOT NULL,
	[SpatialLocation] [geography] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
GO
/****** Object:  Table [Person].[StateProvince]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[StateProvince](
	[StateProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[StateProvinceCode] [nchar](3) NOT NULL,
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[IsOnlyStateProvinceFlag] [dbo].[Flag] NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[TerritoryID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY CLUSTERED 
(
	[StateProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------

GO
/****** Object:  Table [Person].[BusinessEntity]    Script Date: 30.11.2019 20:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[BusinessEntity](
	[BusinessEntityID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BusinessEntity_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------

GO
/****** Object:  Table [Person].[BusinessEntityContact]    Script Date: 30.11.2019 20:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[BusinessEntityContact](
	[BusinessEntityID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ContactTypeID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[PersonID] ASC,
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------

USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Person].[ContactType]    Script Date: 30.11.2019 20:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[ContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-------------------------------------------------------------------------------------------------------







-------------------------------------------------------------------------------------------------------

GO
/****** Object:  Table [Person].[BusinessEntityAddress]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[BusinessEntityAddress](
	[BusinessEntityID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[AddressID] ASC,
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------


USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Person].[AddressType]    Script Date: 30.11.2019 20:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[AddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------



GO
/****** Object:  Table [Person].[CountryRegion]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[CountryRegion](
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CountryRegion_CountryRegionCode] PRIMARY KEY CLUSTERED 
(
	[CountryRegionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------

GO
/****** Object:  Table [Person].[EmailAddress]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[EmailAddress](
	[BusinessEntityID] [int] NOT NULL,
	[EmailAddressID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[EmailAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------











