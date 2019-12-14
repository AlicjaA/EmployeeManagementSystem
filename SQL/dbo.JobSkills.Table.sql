USE [EmployeeManagementSystem]
GO
/****** Object:  Table [dbo].[JobSkills]    Script Date: 14.12.2019 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkills](
	[SkillID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
 CONSTRAINT [PK_JobSkills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobSkills]    Script Date: 14.12.2019 19:03:09 ******/
ALTER TABLE [dbo].[JobSkills] ADD  CONSTRAINT [IX_JobSkills] UNIQUE NONCLUSTERED 
(
	[SkillID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobSkills_Job] FOREIGN KEY([JobID])
REFERENCES [HumanResources].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [FK_JobSkills_Job]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobSkills_Level] FOREIGN KEY([LevelID])
REFERENCES [Skills].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [FK_JobSkills_Level]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobSkills_Skill] FOREIGN KEY([SkillID])
REFERENCES [Skills].[Skill] ([SkillID])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [FK_JobSkills_Skill]
GO
