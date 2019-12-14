USE [EmployeeManagementSystem]
GO

/****** Object:  Table [HumanResources].[Job]    Script Date: 14.12.2019 16:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HumanResources].[Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [varchar](255) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


