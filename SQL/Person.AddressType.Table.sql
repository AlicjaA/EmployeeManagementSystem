USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Person].[AddressType]    Script Date: 14.12.2019 19:03:03 ******/
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
GO
SET IDENTITY_INSERT [Person].[AddressType] ON 

INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (1, N'Billing', N'b84f78b1-4efe-4a0e-8cb7-70e9f112f886', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (2, N'Home', N'41bc2ff6-f0fc-475f-8eb9-cec0805aa0f2', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (3, N'Main Office', N'8eeec28c-07a2-4fb9-ad0a-42d4a0bbc575', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (4, N'Primary', N'24cb3088-4345-47c4-86c5-17b535133d1e', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (5, N'Shipping', N'b29da3f8-19a3-47da-9daa-15c84f4a83a5', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
INSERT [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (6, N'Archive', N'a67f238a-5ba2-444b-966c-0467ed9c427f', CAST(N'2008-04-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [Person].[AddressType] OFF
ALTER TABLE [Person].[AddressType] ADD  CONSTRAINT [DF_AddressType_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[AddressType] ADD  CONSTRAINT [DF_AddressType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for AddressType records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'COLUMN',@level2name=N'AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address type description. For example, Billing, Home, or Shipping.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'COLUMN',@level2name=N'rowguid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of NEWID()' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'CONSTRAINT',@level2name=N'DF_AddressType_rowguid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'CONSTRAINT',@level2name=N'DF_AddressType_ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType', @level2type=N'CONSTRAINT',@level2name=N'PK_AddressType_AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Types of addresses stored in the Address table. ' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'AddressType'
GO
