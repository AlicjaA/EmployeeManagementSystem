USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Agencies].[Agency]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Agencies].[Agency](
	[AgencyId] [int] IDENTITY(1,1) NOT NULL,
	[AgencyName] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AgencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
