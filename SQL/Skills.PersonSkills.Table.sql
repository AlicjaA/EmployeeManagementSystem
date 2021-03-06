USE [EmployeeManagementSystem]
GO
/****** Object:  Table [Skills].[PersonSkills]    Script Date: 14.12.2019 19:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Skills].[PersonSkills](
	[SkillID] [int] NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
 CONSTRAINT [PK_PersonSkills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC,
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersonSkills]    Script Date: 14.12.2019 19:03:09 ******/
ALTER TABLE [Skills].[PersonSkills] ADD  CONSTRAINT [IX_PersonSkills] UNIQUE NONCLUSTERED 
(
	[SkillID] ASC,
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Skills].[PersonSkills]  WITH CHECK ADD  CONSTRAINT [FK_PersonSkills_Level] FOREIGN KEY([LevelID])
REFERENCES [Skills].[Level] ([LevelID])
GO
ALTER TABLE [Skills].[PersonSkills] CHECK CONSTRAINT [FK_PersonSkills_Level]
GO
ALTER TABLE [Skills].[PersonSkills]  WITH CHECK ADD  CONSTRAINT [FK_PersonSkills_Person] FOREIGN KEY([BusinessEntityID])
REFERENCES [Person].[Person] ([BusinessEntityID])
GO
ALTER TABLE [Skills].[PersonSkills] CHECK CONSTRAINT [FK_PersonSkills_Person]
GO
ALTER TABLE [Skills].[PersonSkills]  WITH CHECK ADD  CONSTRAINT [FK_PersonSkills_Skill] FOREIGN KEY([SkillID])
REFERENCES [Skills].[Skill] ([SkillID])
GO
ALTER TABLE [Skills].[PersonSkills] CHECK CONSTRAINT [FK_PersonSkills_Skill]
GO
