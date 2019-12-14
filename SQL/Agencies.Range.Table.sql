USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Agencies].[Range]    Script Date: 14.12.2019 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Agencies].[Range](
	[RangeId] [int] IDENTITY(1,1) NOT NULL,
	[AgencyId] [int] NOT NULL,
	[RangeFrom] [int] NOT NULL,
	[RangeTo] [int] NOT NULL,
	[TotalRange] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Agencies].[Range] ON 

INSERT [Agencies].[Range] ([RangeId], [AgencyId], [RangeFrom], [RangeTo], [TotalRange]) VALUES (1, 5, 2, 11, 9)
SET IDENTITY_INSERT [Agencies].[Range] OFF
ALTER TABLE [Agencies].[Range]  WITH CHECK ADD  CONSTRAINT [FK_Range_Agency] FOREIGN KEY([AgencyId])
REFERENCES [Agencies].[Agency] ([AgencyId])
GO
ALTER TABLE [Agencies].[Range] CHECK CONSTRAINT [FK_Range_Agency]
GO
