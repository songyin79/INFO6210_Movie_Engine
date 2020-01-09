CREATE TABLE Country(
    CountryCode INT NOT NULL,
    Continents VARCHAR(30),
    CountryName VARCHAR(30),
    NumberOfActiveUsers INT
    CONSTRAINT PK_Country PRIMARY KEY (CountryCode) 
);
 
CREATE TABLE Company(
    CompanyID INT NOT NULL,
    CompanyName VARCHAR(50),
    CountryCode INT NOT NULL
    CONSTRAINT PK_Company PRIMARY KEY (CompanyID),
    CONSTRAINT FK_Company FOREIGN KEY (CountryCode) REFERENCES Country (CountryCode)
);
 
CREATE TABLE Movie(
    MovieID INT NOT NULL,
    MovieName VARCHAR(50),
    Genre VARCHAR(50),
    ReleaseDate DATE,
    Rate VARCHAR(50),
    Gross INT,
    CompanyID INT NOT NULL
    CONSTRAINT PK_Movie PRIMARY KEY (MovieID),
    CONSTRAINT FK_Movie FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
);




---Ziye Ling
CREATE TABLE [dbo].[moviereleasedin](
 [CountryCode] [int] NOT NULL,
 [MovieID] [int] NOT NULL,
 [DateStart] [date] NULL,
 [DateEnd] [date] NULL,
 CONSTRAINT [prim_moviereleasedin] PRIMARY KEY CLUSTERED
([CountryCode] ASC,
 [MovieID] ASC
)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[ProductionMember](
 [MemberID] [int] NOT NULL,
 [FirstName] [varchar](30) NULL,
 [LastName] [varchar](30) NULL,
 [MemberType] [bit] NOT NULL,
 [Gender] [varchar](6) NULL,
 [DateOfBirth] [date] NULL
 CONSTRAINT production_pk PRIMARY KEY 
(
 [MemberID] ASC
)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Contract](
 [MemberID] [int] NOT NULL,
 [CompanyID] [int] NOT NULL,
 [DateStart] [date] NULL,
 [DateEnd] [date] NULL,
 CONSTRAINT [prim_emp] PRIMARY KEY CLUSTERED
(
 [MemberID] ASC,
 [CompanyID] ASC
)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[moviereleasedin]  WITH CHECK ADD  CONSTRAINT [foreign_moviereleasedin] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[moviereleasedin] CHECK CONSTRAINT [foreign_moviereleasedin]
GO
ALTER TABLE [dbo].[moviereleasedin]  WITH CHECK ADD  CONSTRAINT [foreign1_moviereleasedin] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[moviereleasedin] CHECK CONSTRAINT [foreign1_moviereleasedin]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [foreign_Contract] FOREIGN KEY([MemberID])
REFERENCES [dbo].[ProductionMember] ([MemberID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [foreign_Contract]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [foreign2_Contract] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [foreign2_Contract]
GO



---- Ting-Kai Liu
CREATE TABLE [dbo].[Director](
    [DirectorID] [int] NOT NULL,
        [PercentageAgreement] [decimal](3,2) NOT NULL,
    [Salary] [int] NOT NULL,
        [Residual] [int] NOT NULL,
 CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED ([DirectorID] ASC)
 ) ON [PRIMARY]
 


 
CREATE TABLE [dbo].[Star](
    [StarID] [int] NOT NULL,
    [PercentageAgreement] [decimal](3,2) NOT NULL,
    [Salary] [int] NOT NULL,
 CONSTRAINT [PK_Star] PRIMARY KEY CLUSTERED ([StarID] ASC)
 ) ON [PRIMARY]

GO
 
CREATE TABLE [dbo].[ScreenWriter](
    [ScreenWriterID] [int] NOT NULL,
    [Wage] [int] NOT NULL,
 CONSTRAINT [PK_ScreenWriter] PRIMARY KEY ([ScreenWriterID] ASC)
 ) ON [PRIMARY]
GO
 
ALTER TABLE [dbo].[Director] 
    WITH CHECK ADD  CONSTRAINT [FK1_Direct] FOREIGN KEY([DirectorID])
    REFERENCES [dbo].[ProductionMember] ([MemberID])
GO
 
ALTER TABLE [dbo].[Star] 
    WITH CHECK ADD  CONSTRAINT [FK1_Star] FOREIGN KEY([StarID])
    REFERENCES [dbo].[ProductionMember] ([MemberID])
GO
 
ALTER TABLE [dbo].[ScreenWriter] 
    WITH CHECK ADD  CONSTRAINT [FK1_ScreenWriter] FOREIGN KEY([ScreenWriterID])
    REFERENCES [dbo].[ProductionMember] ([MemberID])
GO





----


CREATE TABLE MovieDirected (
	MovieID int NOT NULL,
	DirectorID int NOT NULL,
	DirectBegin date,
	DirectEnd date,
constraint dir_pk PRIMARY KEY (MovieID, DirectorID),
constraint movieindustry_fk1 FOREIGN KEY	(MovieID) REFERENCES Movie(MovieID),
constraint movieindustry_fk2 FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID)

)

CREATE TABLE MoviePerformed (
	MovieID int NOT NULL,
	StarID int NOT NULL,
	[Role] varchar(25) ,
constraint perf_pk PRIMARY KEY (MovieID, StarID),
constraint perf_fk1 FOREIGN KEY	(MovieID) REFERENCES Movie(MovieID),
constraint perf_fk2  FOREIGN KEY (StarID) REFERENCES Star(StarID)
)

CREATE TABLE MovieScript (
	MovieID int NOT NULL,
	ScreenWriterID int NOT NULL,
	ScriptName varchar(50) ,
	ScriptDescription varchar(70) ,
	Genre varchar(20) ,
constraint scr_pk PRIMARY KEY (MovieID, ScreenWriterID),
constraint scr_fk2 FOREIGN KEY	(MovieID) REFERENCES Movie(MovieID),
constraint scr_fk1 FOREIGN KEY (ScreenWriterID) REFERENCES ScreenWriter(ScreenWriterID)
);


alter table ProductionMember
alter column MemberType char(3);
-- if column like '%D%
-- or if 'W' in column



