USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Agencies].[Agency]    Script Date: 14.12.2019 19:03:02 ******/
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
SET IDENTITY_INSERT [Agencies].[Agency] ON 

INSERT [Agencies].[Agency] ([AgencyId], [AgencyName]) VALUES (5, N'Testowa')
INSERT [Agencies].[Agency] ([AgencyId], [AgencyName]) VALUES (6, N'Testowa')
INSERT [Agencies].[Agency] ([AgencyId], [AgencyName]) VALUES (7, N'Testowa')
SET IDENTITY_INSERT [Agencies].[Agency] OFF
