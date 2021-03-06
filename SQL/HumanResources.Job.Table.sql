USE [EmployeeManagementSystem]
GO
/****** Object:  Table [HumanResources].[Job]    Script Date: 14.12.2019 19:03:03 ******/
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
SET IDENTITY_INSERT [HumanResources].[Job] ON 

INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (1, N'Accountant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (2, N'Accounts Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (3, N'Accounts Payable Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (4, N'Accounts Receivable Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (5, N'Application Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (6, N'Assistant to the Chief Financial Officer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (7, N'Benefits Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (8, N'Buyer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (9, N'Chief Executive Officer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (10, N'Chief Financial Officer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (11, N'Control Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (12, N'Database Administrator', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (13, N'Design Engineer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (14, N'Document Control Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (15, N'Document Control Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (16, N'Engineering Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (17, N'European Sales Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (18, N'Facilities Administrative Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (19, N'Facilities Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (20, N'Finance Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (21, N'Human Resources Administrative Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (22, N'Human Resources Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (23, N'Information Services Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (24, N'Janitor', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (25, N'Maintenance Supervisor', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (26, N'Marketing Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (27, N'Marketing Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (28, N'Marketing Specialist', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (29, N'Master Scheduler', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (30, N'Network Administrator', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (31, N'Network Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (32, N'North American Sales Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (33, N'Pacific Sales Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (34, N'Production Control Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (35, N'Production Supervisor - WC10', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (36, N'Production Supervisor - WC20', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (37, N'Production Supervisor - WC30', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (38, N'Production Supervisor - WC40', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (39, N'Production Supervisor - WC45', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (40, N'Production Supervisor - WC50', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (41, N'Production Supervisor - WC60', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (42, N'Production Technician - WC10', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (43, N'Production Technician - WC20', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (44, N'Production Technician - WC30', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (45, N'Production Technician - WC40', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (46, N'Production Technician - WC45', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (47, N'Production Technician - WC50', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (48, N'Production Technician - WC60', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (49, N'Purchasing Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (50, N'Purchasing Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (51, N'Quality Assurance Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (52, N'Quality Assurance Supervisor', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (53, N'Quality Assurance Technician', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (54, N'Recruiter', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (55, N'Research and Development Engineer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (56, N'Research and Development Manager', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (57, N'Sales Representative', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (58, N'Scheduling Assistant', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (59, N'Senior Design Engineer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (60, N'Senior Tool Designer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (61, N'Shipping and Receiving Clerk', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (62, N'Shipping and Receiving Supervisor', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (63, N'Stocker', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (64, N'Tool Designer', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (65, N'Vice President of Engineering', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (66, N'Vice President of Production', NULL)
INSERT [HumanResources].[Job] ([JobID], [JobTitle], [JobDescription]) VALUES (67, N'Vice President of Sales', NULL)
SET IDENTITY_INSERT [HumanResources].[Job] OFF
