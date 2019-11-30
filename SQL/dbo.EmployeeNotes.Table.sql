USE [EmployeeManagementSystem]
GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 30.11.2019 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeNotes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[NoteText] [varchar](max) NOT NULL,
	[CreationDate] [date] NOT NULL,
	[ModifyDate] [date] NULL,
	[Comment] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeNotes]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeNotes_Employee] FOREIGN KEY([BusinessEntityID])
REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[EmployeeNotes] CHECK CONSTRAINT [FK_EmployeeNotes_Employee]
GO
