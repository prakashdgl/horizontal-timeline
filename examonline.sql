USE [master]
GO
/****** Object:  Database [MyOnlineExam]    Script Date: 17-02-2019 21:39:03 ******/
CREATE DATABASE [MyOnlineExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aspnet-OnlineExam-20181006105057.mdf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\aspnet-OnlineExam-20181006105057.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'aspnet-OnlineExam-20181006105057_log.ldf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\aspnet-OnlineExam-20181006105057_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyOnlineExam] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyOnlineExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyOnlineExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyOnlineExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyOnlineExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyOnlineExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyOnlineExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyOnlineExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyOnlineExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyOnlineExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyOnlineExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyOnlineExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyOnlineExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyOnlineExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyOnlineExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyOnlineExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyOnlineExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyOnlineExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyOnlineExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyOnlineExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyOnlineExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyOnlineExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyOnlineExam] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyOnlineExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyOnlineExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyOnlineExam] SET  MULTI_USER 
GO
ALTER DATABASE [MyOnlineExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyOnlineExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyOnlineExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyOnlineExam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyOnlineExam] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyOnlineExam', N'ON'
GO
ALTER DATABASE [MyOnlineExam] SET QUERY_STORE = OFF
GO
USE [MyOnlineExam]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MyOnlineExam]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17-02-2019 21:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
	[MobileNumber] [char](10) NOT NULL,
	[EducationID] [char](3) NOT NULL,
	[BoardID] [char](2) NULL,
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[RegisteredDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTest]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTest](
	[StudentTestID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[TestTypeID] [tinyint] NOT NULL,
	[TestStartDate] [smalldatetime] NOT NULL,
	[TestEndDate] [smalldatetime] NULL,
	[TestStatus] [char](10) NOT NULL,
	[Progress] [tinyint] NOT NULL,
 CONSTRAINT [PK_StudentTest] PRIMARY KEY CLUSTERED 
(
	[StudentTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mSubject]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mSubject](
	[SubjectID] [int] NOT NULL,
	[SubjectName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_mSubject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mTestType]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mTestType](
	[TestTypeID] [tinyint] NOT NULL,
	[TestTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_mTestType] PRIMARY KEY CLUSTERED 
(
	[TestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwStudentTestOverview]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vwStudentTestOverview]
  AS
  SELECT A.FirstName,S.SubjectName,T.TestTypeName, ST.TestStartDate, ST.TestStatus, ST.Progress, ST.StudentID 
    FROM StudentTest ST 
	INNER JOIN AspNetUsers A on ST.StudentID = A.StudentID 
	INNER JOIN mSubject S on ST.SubjectID = S.SubjectID
	INNER JOIN mTestType T on ST.TestTypeID = T.TestTypeID
GO
/****** Object:  Table [dbo].[QuestionDetails]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionDetails](
	[QuestionDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[SerialNo] [tinyint] NOT NULL,
	[OptionName] [nvarchar](100) NOT NULL,
	[IsAnswer] [char](1) NOT NULL,
	[Explanation] [nvarchar](100) NULL,
 CONSTRAINT [PK_QuestionDetails] PRIMARY KEY CLUSTERED 
(
	[QuestionDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[QuestionTypeID] [tinyint] NOT NULL,
	[GroupID] [int] NULL,
	[QuestionNo] [int] NOT NULL,
	[QuestionName] [nvarchar](max) NOT NULL,
	[MaxMarks] [tinyint] NOT NULL,
	[Explanation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwQuestion]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vwQuestion]
AS
SELECT TOP 100 QD.QuestionID, Q.LessonID, Q.QuestionTypeID, Q.QuestionNo, Q.QuestionName, Q.MaxMarks, QD.QuestionDetailsID,  QD.SerialNo, QD.OptionName, QD.IsAnswer
  FROM
	Question Q INNER JOIN QuestionDetails QD ON Q.QuestionID = QD.QuestionID
	ORDER BY QD.QuestionID, QD.SerialNo
GO
/****** Object:  Table [dbo].[mBoard]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mBoard](
	[BoardID] [char](2) NOT NULL,
	[BoardName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_mBoard] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mLesson]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mLesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectGradeBookID] [int] NOT NULL,
	[LessonNo] [tinyint] NOT NULL,
	[LessonName] [nvarchar](50) NOT NULL,
	[TermNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_mLesson] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mEducation]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mEducation](
	[EducationID] [char](3) NOT NULL,
	[EducationName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_mEducation] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectGrade]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectGrade](
	[SubjectGradeID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectGradeName] [nvarchar](50) NULL,
	[BoardID] [tinyint] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[EducationID] [char](3) NOT NULL,
 CONSTRAINT [PK_SubjectGrade] PRIMARY KEY CLUSTERED 
(
	[SubjectGradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectGradeBook]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectGradeBook](
	[SubjectGradeBookID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectGradeID] [int] NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[Publisher] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubjectGradeBook] PRIMARY KEY CLUSTERED 
(
	[SubjectGradeBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwLessonView]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwLessonView] 
AS
SELECT        dbo.mEducation.EducationID, dbo.mBoard.BoardID, dbo.mSubject.SubjectID, dbo.mBoard.BoardName, dbo.mSubject.SubjectName, dbo.mEducation.EducationName, dbo.SubjectGradeBook.BookName, dbo.mLesson.LessonName, dbo.mLesson.LessonNo, dbo.mLesson.TermNo, 
                         dbo.mLesson.SubjectGradeBookID, dbo.mLesson.LessonID
FROM            dbo.SubjectGrade INNER JOIN
                         dbo.mSubject ON dbo.SubjectGrade.SubjectID = dbo.mSubject.SubjectID INNER JOIN
                         dbo.SubjectGradeBook ON dbo.SubjectGrade.SubjectGradeID = dbo.SubjectGradeBook.SubjectGradeID INNER JOIN
                         dbo.mLesson ON dbo.SubjectGradeBook.SubjectGradeBookID = dbo.mLesson.SubjectGradeBookID INNER JOIN
                         dbo.mEducation ON dbo.SubjectGrade.EducationID = dbo.mEducation.EducationID INNER JOIN
                         dbo.mBoard ON dbo.SubjectGrade.BoardID = dbo.mBoard.BoardID
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mTestPhase]    Script Date: 17-02-2019 21:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mTestPhase](
	[TestPhaseID] [tinyint] NOT NULL,
	[TestPhaseName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_mTestPhase] PRIMARY KEY CLUSTERED 
(
	[TestPhaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mUser]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUser](
	[UserCode] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MobileNumber] [numeric](10, 0) NOT NULL,
	[UserPhoto] [varbinary](max) NULL,
 CONSTRAINT [PK_mUser] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionGroup]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_QuestionGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[QuestionTypeID] [tinyint] NOT NULL,
	[QuestionTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTestDetails]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTestDetails](
	[StudentTestDetailsID] [bigint] NOT NULL,
	[StudentTestID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[QuestionDetailsID] [bigint] NOT NULL,
	[AnsweredDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_StudentTestDetails] PRIMARY KEY CLUSTERED 
(
	[StudentTestDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [IPAddress], [MobileNumber], [EducationID], [BoardID], [StudentID], [RegisteredDate]) VALUES (N'21ef0ac6-6796-44e9-9a94-c8ecdc7f4016', N'nithyapriyaselvaraj@outlook.com', 0, N'AD5Gun/a5404SVeTpKJRb9luPE8Hhv8/sSWg+jAXoQGjOQLSgnEv894T/uDukbWAJQ==', N'1c95fb1c-e432-4bdf-ad4a-eb657c9f0d68', NULL, 0, 0, NULL, 1, 0, N'nithyapriyaselvaraj@outlook.com', N'Prakash', N'Ramachandran', N'::1', N'9000234609', N'101', NULL, 1, CAST(N'2018-10-10T05:29:00' AS SmallDateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [IPAddress], [MobileNumber], [EducationID], [BoardID], [StudentID], [RegisteredDate]) VALUES (N'45c3bc4a-273e-4596-ba44-4305d06f75f8', N'prakashdgl@gmail.com', 1, N'ALKWbPdk9w2/+eOyPg91fFu+z1+WY6Mj+S5GNn/S+Qb0sKiH5hj3wpGOvAcHn7Yi6A==', N'c2ab794f-71e0-479e-9c57-7d3b85d280ad', NULL, 0, 0, NULL, 1, 0, N'prakashdgl@gmail.com', N'Prakash', N'Ramachandran', N'::1', N'9000234906', N'101', N'3 ', 2, CAST(N'2018-10-10T05:29:00' AS SmallDateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [IPAddress], [MobileNumber], [EducationID], [BoardID], [StudentID], [RegisteredDate]) VALUES (N'9e2b2087-c625-453e-9343-46ccead2e2ae', N'prakashdgl@hotmail.com', 1, N'AFDX1uPG77SKiIsaeZij3dEEZgIOBHpsD8R8qIRCv/tZBZId8nTft8YtAcU5rBcWow==', N'6cbd320d-1703-43cf-b426-32a3fcd5fcae', NULL, 0, 0, NULL, 1, 0, N'prakashdgl@hotmail.com', N'Prakash', N'Ramachandran', N'::1', N'9000234906', N'101', N'3 ', 4, CAST(N'2018-10-10T05:31:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
INSERT [dbo].[mBoard] ([BoardID], [BoardName]) VALUES (N'1 ', N'State Board')
INSERT [dbo].[mBoard] ([BoardID], [BoardName]) VALUES (N'2 ', N'Matriculation')
INSERT [dbo].[mBoard] ([BoardID], [BoardName]) VALUES (N'3 ', N'CBSE')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'101', N'I Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'102', N'II Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'103', N'III Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'104', N'IV Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'105', N'V Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'106', N'VI Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'107', N'VII Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'108', N'VIII Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'109', N'IX Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'110', N'X Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'111', N'XI Grade')
INSERT [dbo].[mEducation] ([EducationID], [EducationName]) VALUES (N'112', N'XII Grade')
SET IDENTITY_INSERT [dbo].[mLesson] ON 

INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (2, 1, 2, N'The Little For Tree', N'1')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (3, 1, 3, N'Nasruddin''s Aim', N'1')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (4, 1, 4, N'Alice in Wonderland', N'2')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (5, 1, 5, N'Helen Kellers', N'2')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (6, 1, 6, N'The Milkman''s Cow', N'2')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (7, 1, 7, N'The Scholar''s Mother Tongue', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (9, 1, 8, N'The Giving Trees', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (10, 1, 9, N'Going to buy a Book', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (11, 1, 10, N'Pinocchios', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (13, 1, 1, N'First Lessons', N'1')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (14, 1, 11, N'Trees', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (15, 1, 12, N'Prithika Prakash', N'3')
INSERT [dbo].[mLesson] ([LessonID], [SubjectGradeBookID], [LessonNo], [LessonName], [TermNo]) VALUES (16, 1, 13, N'Ahimsa', N'3')
SET IDENTITY_INSERT [dbo].[mLesson] OFF
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (509, N'Biology')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (508, N'Chemistry')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (506, N'Computer Science')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (502, N'English')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (510, N'English Grammar')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (511, N'General Knowledge')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (503, N'Maths')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (507, N'Physics')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (504, N'Science')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (505, N'Social Science')
INSERT [dbo].[mSubject] ([SubjectID], [SubjectName]) VALUES (501, N'தமிழ்')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (1, N'Plan Lession')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (2, N'Start Study Mode')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (3, N'Finish Study Mode')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (4, N'Start Practice Mode')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (5, N'Finish Practice Mode')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (6, N'Start Exam Mode')
INSERT [dbo].[mTestPhase] ([TestPhaseID], [TestPhaseName]) VALUES (7, N'Finish Exam Mode')
INSERT [dbo].[mTestType] ([TestTypeID], [TestTypeName]) VALUES (1, N'Study Mode')
INSERT [dbo].[mTestType] ([TestTypeID], [TestTypeName]) VALUES (2, N'Practice Mode')
INSERT [dbo].[mTestType] ([TestTypeID], [TestTypeName]) VALUES (3, N'Exam Mode')
INSERT [dbo].[mTestType] ([TestTypeID], [TestTypeName]) VALUES (4, N'Term Exam Mode')
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionID], [LessonID], [QuestionTypeID], [GroupID], [QuestionNo], [QuestionName], [MaxMarks], [Explanation]) VALUES (1, 2, 1, NULL, 1, N'I used a lemon to make lemonade.', 1, NULL)
INSERT [dbo].[Question] ([QuestionID], [LessonID], [QuestionTypeID], [GroupID], [QuestionNo], [QuestionName], [MaxMarks], [Explanation]) VALUES (2, 2, 1, NULL, 2, N'She could never reach the right note on the piano', 1, NULL)
INSERT [dbo].[Question] ([QuestionID], [LessonID], [QuestionTypeID], [GroupID], [QuestionNo], [QuestionName], [MaxMarks], [Explanation]) VALUES (3, 2, 1, NULL, 3, N'Do you feel _______? We get our water from a __________.', 1, NULL)
INSERT [dbo].[Question] ([QuestionID], [LessonID], [QuestionTypeID], [GroupID], [QuestionNo], [QuestionName], [MaxMarks], [Explanation]) VALUES (4, 2, 1, NULL, 4, N'Mrs. Johnson said Carrie was a
_________ student.
The light from the headlights was
________ .', 1, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionDetails] ON 

INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (1, 1, 1, N'The color of the baby''s room is lemon', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (2, 1, 2, N'That car was a lemon', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (3, 1, 3, N'This cleaner has a lovely lemon scent', N'Y', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (4, 1, 4, N'Rachel bought a lemon at the store', N'Y', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (5, 2, 1, N'Please make a note of this change', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (6, 2, 2, N'I wrote a note so you will not forget', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (7, 2, 3, N'The musical note he asked us to play was C', N'Y', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (8, 2, 4, N'Note the large size of the building', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (9, 3, 1, N'Well', N'Y', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (10, 3, 2, N'Good', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (11, 3, 3, N'Pipe', N'N', NULL)
INSERT [dbo].[QuestionDetails] ([QuestionDetailsID], [QuestionID], [SerialNo], [OptionName], [IsAnswer], [Explanation]) VALUES (12, 3, 4, N'Sick', N'N', NULL)
SET IDENTITY_INSERT [dbo].[QuestionDetails] OFF
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (1, N'Multiple Choice')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (2, N'Multiple Selection ')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (3, N'True or False')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (4, N'Fill in the Blanks')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (5, N'Match the following')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (6, N'Question Answer')
INSERT [dbo].[QuestionType] ([QuestionTypeID], [QuestionTypeName]) VALUES (7, N'Comprehension')
SET IDENTITY_INSERT [dbo].[StudentTest] ON 

INSERT [dbo].[StudentTest] ([StudentTestID], [StudentID], [SubjectID], [TestTypeID], [TestStartDate], [TestEndDate], [TestStatus], [Progress]) VALUES (2, 4, 501, 1, CAST(N'2018-10-08T05:49:00' AS SmallDateTime), NULL, N'Incomplete', 68)
INSERT [dbo].[StudentTest] ([StudentTestID], [StudentID], [SubjectID], [TestTypeID], [TestStartDate], [TestEndDate], [TestStatus], [Progress]) VALUES (3, 4, 502, 1, CAST(N'2018-10-08T05:49:00' AS SmallDateTime), NULL, N'Incomplete', 87)
INSERT [dbo].[StudentTest] ([StudentTestID], [StudentID], [SubjectID], [TestTypeID], [TestStartDate], [TestEndDate], [TestStatus], [Progress]) VALUES (4, 4, 503, 1, CAST(N'2018-10-09T15:49:00' AS SmallDateTime), NULL, N'Incomplete', 56)
INSERT [dbo].[StudentTest] ([StudentTestID], [StudentID], [SubjectID], [TestTypeID], [TestStartDate], [TestEndDate], [TestStatus], [Progress]) VALUES (6, 4, 504, 1, CAST(N'2018-10-09T00:00:00' AS SmallDateTime), NULL, N'Incomplete', 50)
INSERT [dbo].[StudentTest] ([StudentTestID], [StudentID], [SubjectID], [TestTypeID], [TestStartDate], [TestEndDate], [TestStatus], [Progress]) VALUES (7, 4, 505, 1, CAST(N'2018-10-09T00:00:00' AS SmallDateTime), NULL, N'Incomplete', 70)
SET IDENTITY_INSERT [dbo].[StudentTest] OFF
SET IDENTITY_INSERT [dbo].[SubjectGrade] ON 

INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (1, N'CBSE-I Grade-தமிழ்', 3, 501, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (2, N'CBSE-I Grade-English', 3, 502, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (3, N'CBSE-I Grade-Maths', 3, 503, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (4, N'CBSE-I Grade-Science', 3, 504, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (5, N'CBSE-I Grade-Social Science', 3, 505, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (6, N'CBSE-I Grade-Computer Science', 3, 506, N'101')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (7, N'CBSE-II Grade-தமிழ்', 3, 501, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (8, N'CBSE-II Grade-English', 3, 502, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (9, N'CBSE-II Grade-Maths', 3, 503, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (10, N'CBSE-II Grade-Science', 3, 504, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (11, N'CBSE-II Grade-Social Science', 3, 505, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (12, N'CBSE-II Grade-Computer Science', 3, 506, N'102')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (13, N'CBSE-III Grade-தமிழ்', 3, 501, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (14, N'CBSE-III Grade-English', 3, 502, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (15, N'CBSE-III Grade-Maths', 3, 503, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (16, N'CBSE-III Grade-Science', 3, 504, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (17, N'CBSE-III Grade-Social Science', 3, 505, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (18, N'CBSE-III Grade-Computer Science', 3, 506, N'103')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (19, N'CBSE-IV Grade-தமிழ்', 3, 501, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (20, N'CBSE-IV Grade-English', 3, 502, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (21, N'CBSE-IV Grade-Maths', 3, 503, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (22, N'CBSE-IV Grade-Science', 3, 504, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (23, N'CBSE-IV Grade-Social Science', 3, 505, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (24, N'CBSE-IV Grade-Computer Science', 3, 506, N'104')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (25, N'CBSE-V Grade-தமிழ்', 3, 501, N'105')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (26, N'CBSE-V Grade-English', 3, 502, N'105')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (27, N'CBSE-V Grade-Maths', 3, 503, N'105')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (28, N'CBSE-V Grade-Science', 3, 504, N'105')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (29, N'CBSE-V Grade-Social Science', 3, 505, N'105')
INSERT [dbo].[SubjectGrade] ([SubjectGradeID], [SubjectGradeName], [BoardID], [SubjectID], [EducationID]) VALUES (30, N'CBSE-V Grade-Computer Science', 3, 506, N'105')
SET IDENTITY_INSERT [dbo].[SubjectGrade] OFF
SET IDENTITY_INSERT [dbo].[SubjectGradeBook] ON 

INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (1, 20, N'Marigold', N'NCERT')
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (2, 14, N'Marigold', N'NCERT')
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (4, 15, N'Marigold', NULL)
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (5, 16, N'Marigold', NULL)
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (6, 17, N'Marigold', NULL)
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (7, 18, N'Marigold', NULL)
INSERT [dbo].[SubjectGradeBook] ([SubjectGradeBookID], [SubjectGradeID], [BookName], [Publisher]) VALUES (8, 13, N'தமிழ்நாடு பாடநூல் ', N'தமிழ்நாடு')
SET IDENTITY_INSERT [dbo].[SubjectGradeBook] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17-02-2019 21:39:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17-02-2019 21:39:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17-02-2019 21:39:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 17-02-2019 21:39:05 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17-02-2019 21:39:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUsers]    Script Date: 17-02-2019 21:39:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AspNetUsers] ON [dbo].[AspNetUsers]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17-02-2019 21:39:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_mSubject]    Script Date: 17-02-2019 21:39:05 ******/
CREATE NONCLUSTERED INDEX [IX_mSubject] ON [dbo].[mSubject]
(
	[SubjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SubjectGradeBook]    Script Date: 17-02-2019 21:39:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SubjectGradeBook] ON [dbo].[SubjectGradeBook]
(
	[SubjectGradeID] ASC,
	[BookName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_RegisteredDate]  DEFAULT (getdate()) FOR [RegisteredDate]
GO
ALTER TABLE [dbo].[QuestionDetails] ADD  CONSTRAINT [DF_QuestionDetails_IsAnswer]  DEFAULT ('N') FOR [IsAnswer]
GO
ALTER TABLE [dbo].[StudentTest] ADD  CONSTRAINT [DF_StudentTest_TestStatus]  DEFAULT ('Incomplete') FOR [TestStatus]
GO
ALTER TABLE [dbo].[StudentTest] ADD  CONSTRAINT [DF_StudentTest_Progress]  DEFAULT ((0)) FOR [Progress]
GO
ALTER TABLE [dbo].[StudentTestDetails] ADD  CONSTRAINT [DF_StudentTestDetails_AnsweredDate]  DEFAULT (getdate()) FOR [AnsweredDate]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[mLesson]  WITH CHECK ADD  CONSTRAINT [FK_mLesson_SubjectGradeBook] FOREIGN KEY([SubjectGradeBookID])
REFERENCES [dbo].[SubjectGradeBook] ([SubjectGradeBookID])
GO
ALTER TABLE [dbo].[mLesson] CHECK CONSTRAINT [FK_mLesson_SubjectGradeBook]
GO
ALTER TABLE [dbo].[mUser]  WITH CHECK ADD  CONSTRAINT [FK_mUser_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[mUser] CHECK CONSTRAINT [FK_mUser_AspNetUsers]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_mLesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[mLesson] ([LessonID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_mLesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionType] FOREIGN KEY([QuestionTypeID])
REFERENCES [dbo].[QuestionType] ([QuestionTypeID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionType]
GO
ALTER TABLE [dbo].[QuestionDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuestionDetails_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[QuestionDetails] CHECK CONSTRAINT [FK_QuestionDetails_Question]
GO
ALTER TABLE [dbo].[StudentTestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentTestDetails_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[StudentTestDetails] CHECK CONSTRAINT [FK_StudentTestDetails_Question]
GO
ALTER TABLE [dbo].[StudentTestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentTestDetails_QuestionDetails] FOREIGN KEY([QuestionDetailsID])
REFERENCES [dbo].[QuestionDetails] ([QuestionDetailsID])
GO
ALTER TABLE [dbo].[StudentTestDetails] CHECK CONSTRAINT [FK_StudentTestDetails_QuestionDetails]
GO
ALTER TABLE [dbo].[StudentTestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentTestDetails_StudentTest] FOREIGN KEY([StudentTestID])
REFERENCES [dbo].[StudentTest] ([StudentTestID])
GO
ALTER TABLE [dbo].[StudentTestDetails] CHECK CONSTRAINT [FK_StudentTestDetails_StudentTest]
GO
ALTER TABLE [dbo].[SubjectGrade]  WITH CHECK ADD  CONSTRAINT [FK_SubjectGrade_mSubject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[mSubject] ([SubjectID])
GO
ALTER TABLE [dbo].[SubjectGrade] CHECK CONSTRAINT [FK_SubjectGrade_mSubject]
GO
ALTER TABLE [dbo].[SubjectGradeBook]  WITH CHECK ADD  CONSTRAINT [FK_SubjectGradeBook_SubjectGrade] FOREIGN KEY([SubjectGradeID])
REFERENCES [dbo].[SubjectGrade] ([SubjectGradeID])
GO
ALTER TABLE [dbo].[SubjectGradeBook] CHECK CONSTRAINT [FK_SubjectGradeBook_SubjectGrade]
GO
/****** Object:  StoredProcedure [dbo].[GetDDBoard]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetDDBoard] AS
SELECT * from mboard Order by 1 DESC
GO
/****** Object:  StoredProcedure [dbo].[GetDDEducation]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[GetDDEducation] AS
 Select * from meducation 
GO
/****** Object:  StoredProcedure [dbo].[GetUserData]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserData](@userID nvarchar(128))
AS
SELECT TOP 1 * FROM mUser WHERE UserID = @userID
GO
/****** Object:  StoredProcedure [dbo].[SPDelLessonsForSubjectGradeBook]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SPDelLessonsForSubjectGradeBook] (@LessonID INT)
AS
Delete TOP (1) mLesson WHERE LessonID = @LessonID
GO
/****** Object:  StoredProcedure [dbo].[SPDelQuestionHeader]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
cREATE PROC [dbo].[SPDelQuestionHeader](@QuestionID INT)
AS
Delete Question
	WHERE QuestionID = @QuestionID
GO
/****** Object:  StoredProcedure [dbo].[spFindUser]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[spFindUser](@EMailID nvarchar(256))
  as
  Declare @ID nvarchar(256)
  Declare @UserID INT
  Select top 1 @ID = ID, @UserID = StudentID from AspNetUsers where EMail = @EMailID
  Select @ID as ID, @UserID as UserID
GO
/****** Object:  StoredProcedure [dbo].[SPGetLessonForQuestions]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPGetLessonForQuestions] (@SubjectGradeBookID INT = NULL, @EducationID char(3) = NULL)
AS
IF @SubjectGradeBookID IS NOT NULL
BEGIN
	select BoardName + '-'+ EducationName+'-'+SubjectName+'-'+BookName+'-'+LessonName as LessonName, LessonID, LessonNo, TermNo  from [dbo].[vwLessonView]
	Where [SubjectGradeBookID] = @SubjectGradeBookID
	RETURN
END
IF @EducationID IS NOT NULL
BEGIN
	select BoardName + '-'+ EducationName+'-'+SubjectName+'-'+BookName+'-'+LessonName as LessonName, LessonID, LessonNo, TermNo  from [dbo].[vwLessonView]
	Where EducationID = @EducationID
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[SPGetLessonsForSubjectGradeBook]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SPGetLessonsForSubjectGradeBook](@SubjectGradeBookID INT)
AS
SELECT  LessonID, LessonNo, LessonName, TermNo, SubjectGradeBookID from mLesson 
WHERE SubjectGradeBookID= @SubjectGradeBookID
GO
/****** Object:  StoredProcedure [dbo].[SPGetQuestionDetails]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPGetQuestionDetails] (@QuestionID BIGINT)
AS
SELECT * FROM QuestionDetails WHERE QuestionID = @QuestionID ORDER BY SerialNo
GO
/****** Object:  StoredProcedure [dbo].[SPGetQuestionHeader]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPGetQuestionHeader](@LessonID INT, @QuestionTypeID TINYINT)
AS
SELECT QuestionID, QuestionNo, QuestionName, MaxMarks
	FROM Question
	WHERE LessonID = @LessonID and QuestionTypeID = @QuestionTypeID
	Order by QuestionNo
GO
/****** Object:  StoredProcedure [dbo].[SPGetQuestions]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SPGetQuestions](@LessonID INT, @QuestionTypeID TINYINT)
AS
SELECT * FROM vwQuestion WHERE LessonID = @LessonID and QuestionTypeID = @QuestionTypeID
GO
/****** Object:  StoredProcedure [dbo].[SPGetQuestionType]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPGetQuestionType] AS
 select QuestionTypeID, QuestionTypeName from QuestionType
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentDashboardData]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spGetStudentDashboardData] (@UserName nvarchar(128))
 AS
 Declare @StudentID int
 SELECT @StudentID = StudentID from [dbo].[AspNetUsers] WHERE UserName = @UserName
 SELECT TOP 4 SubjectName,Progress   FROM [dbo].[vwStudentTestOverview] WHERE TestStatus = 'Incomplete' and  STUDENTID = @StudentID ORDER BY TestStartDate
GO
/****** Object:  StoredProcedure [dbo].[SPGetStudentMain]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPGetStudentMain] (@StudentID INT)
AS
Select TOP 4 * from vwStudentTestOverview
	Where StudentID = @StudentID AND  TestStatus = 'Incomplete'
	ORDER BY TestStartDate 
GO
/****** Object:  StoredProcedure [dbo].[spGetSubjectGradeBooks]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubjectGradeBooks] AS

SELECT B.SubjectGradeName + '-' + BookName AS SubjectGradeBookName,A.* from  SubjectGradebook A INNER JOIN SubjectGrade B ON A.SubjectGradeID = B.SubjectGradeID
GO
/****** Object:  StoredProcedure [dbo].[SPGetSubjectsforGrade]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[SPGetSubjectsforGrade](@BoardID TINYINT, @EducationID Char(3))
AS
SELECT SubjectGradeID, S.SubjectID, S.SubjectName 
  FROM dbo.SubjectGrade SG INNER JOIN mSubject S ON SG.SubjectID = S.SubjectID
  WHERE BOARDID =@BoardID and EducationID = @EducationID
GO
/****** Object:  StoredProcedure [dbo].[SPInsLessonsForSubjectGradeBook]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SPInsLessonsForSubjectGradeBook] (@SubjectGradeBookID INT, @LessonNo TinyInt, @LessonName NVarchar(50), @TermNo varchar(20))
AS
INSERT mLesson ([SubjectGradeBookID],[LessonNo],[LessonName],[TermNo])
	SELECT @SubjectGradeBookID,@LessonNo,@LessonName,@TermNo

GO
/****** Object:  StoredProcedure [dbo].[SPInsQuestionHeader]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPInsQuestionHeader](@LessonID INT,@QuestionTypeID TINYINT, @QuestionNo INT, @QuestionName nvarchar(max), @MaxMarks TinyInt)
AS
INSERT Question (LessonID,QuestionTypeID,QuestionNo,QuestionName,MaxMarks)
SELECT @LessonID,@QuestionTypeID,@QuestionNo,@QuestionName,@MaxMarks
GO
/****** Object:  StoredProcedure [dbo].[SPUpdLessonsForSubjectGradeBook]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[SPUpdLessonsForSubjectGradeBook] (@LessonID INT, @SubjectGradeBookID INT, @LessonNo TinyInt, @LessonName NVarchar(50), @TermNo varchar(20))
AS
UPDATE mLesson SET [SubjectGradeBookID] = @SubjectGradeBookID, [LessonNo] = @LessonNo,
			[LessonName] = @LessonName,  [TermNo] = @TermNo
	WHERE LessonID = @LessonID

GO
/****** Object:  StoredProcedure [dbo].[SPUpdQuestionHeader]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
cREATE PROC [dbo].[SPUpdQuestionHeader](@QuestionID INT, @QuestionNo INT, @QuestionName nvarchar(max), @MaxMarks TinyInt)
AS
UPDATE Question
	SET QuestionNo = @QuestionNo, 
	QuestionName =@QuestionName, 
	MaxMarks=@MaxMarks	 
	WHERE QuestionID = @QuestionID
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserData]    Script Date: 17-02-2019 21:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateUserData](@UserID nvarchar(128), @FirstName nvarchar(50), @LastName nvarchar(50),@MobileNumber numeric(10))
as
IF Exists (SELECT TOP 1 'ABC' FROM mUser WHERE UserID = @userID)
	Begin
		Update mUser SET FirstName =@FirstName , LastName = @LastName, MobileNumber = @MobileNumber 
			WHERE UserID = @userID
		IF @@ROWCOUNT =1 AND @@ERROR !=0
			Return 0
		Else
			Return 1
	End
Else
	Return -1
GO
USE [master]
GO
ALTER DATABASE [MyOnlineExam] SET  READ_WRITE 
GO
