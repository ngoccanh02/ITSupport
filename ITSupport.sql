USE [master]
GO
/****** Object:  Database [ITSupport]    Script Date: 11/04/2023 2:24:43 CH ******/
CREATE DATABASE [ITSupport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITSupport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITSupport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITSupport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITSupport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ITSupport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITSupport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITSupport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITSupport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITSupport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITSupport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITSupport] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITSupport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITSupport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITSupport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITSupport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITSupport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITSupport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITSupport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITSupport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITSupport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITSupport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITSupport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITSupport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITSupport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITSupport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITSupport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITSupport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITSupport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITSupport] SET RECOVERY FULL 
GO
ALTER DATABASE [ITSupport] SET  MULTI_USER 
GO
ALTER DATABASE [ITSupport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITSupport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITSupport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITSupport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITSupport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITSupport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITSupport', N'ON'
GO
ALTER DATABASE [ITSupport] SET QUERY_STORE = OFF
GO
USE [ITSupport]
GO
/****** Object:  Table [dbo].[ACourse]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACourse](
	[IDCreator] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_ACourse_1] PRIMARY KEY CLUSTERED 
(
	[IDCreator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[IDAdmin] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](30) NULL,
	[Name] [nvarchar](50) NULL,
	[Images] [nvarchar](500) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[IDAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NULL,
	[IsCorrect] [bit] NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[IDCourse] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Saleprice] [decimal](18, 0) NULL,
	[Describe] [nvarchar](max) NULL,
	[Images] [nvarchar](500) NULL,
	[IDCreator] [int] NULL,
	[IDTopic] [int] NULL,
	[IDPH] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[TestTime] [int] NULL,
	[IDLesson] [bigint] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[IDCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseQuestion]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseQuestion](
	[CourseId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_CourseQuestions] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[IDLesson] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Describe] [nvarchar](max) NULL,
	[Images] [nvarchar](500) NULL,
	[IDCourse] [bigint] NOT NULL,
	[IDCreator] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[IDLesson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/04/2023 2:24:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[IDOrder] [bigint] NOT NULL,
	[IDCourse] [bigint] IDENTITY(1,1) NOT NULL,
	[Saleprice] [decimal](18, 0) NULL,
	[Name] [varchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC,
	[IDCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublishingHouse]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublishingHouse](
	[IDPH] [int] IDENTITY(1,1) NOT NULL,
	[NamePH] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](15) NULL,
	[Describe] [nvarchar](max) NULL,
	[Images] [nvarchar](500) NULL,
 CONSTRAINT [PK_PublishingHouse] PRIMARY KEY CLUSTERED 
(
	[IDPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Multiple] [bit] NULL,
	[Name] [nvarchar](255) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [time](7) NULL,
	[EndTime] [datetime] NULL,
	[Score] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[Questions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionAnswer]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionAnswer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SessionId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[AnswerId] [bigint] NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSession]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSession](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[StartTime] [datetimeoffset](7) NOT NULL,
	[EndTime] [datetimeoffset](7) NULL,
	[Total] [int] NOT NULL,
	[Correct] [int] NOT NULL,
 CONSTRAINT [PK_TestSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[IDTopic] [int] IDENTITY(1,1) NOT NULL,
	[NameTopic] [nvarchar](50) NULL,
	[Describe] [nvarchar](max) NULL,
	[Images] [nvarchar](500) NULL,
	[IDCreator] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[IDTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/04/2023 2:24:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](30) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACourse] ON 

INSERT [dbo].[ACourse] ([IDCreator], [Role]) VALUES (1, N'Ngọc Cảnh')
INSERT [dbo].[ACourse] ([IDCreator], [Role]) VALUES (2, N'Thùy Trang')
SET IDENTITY_INSERT [dbo].[ACourse] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([IDAdmin], [UserName], [Password], [Name], [Images], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (2, NULL, N'12345', N'Hoàng Ngọc Cảnh', N'mi3.jpg', NULL, N'hoangngoccanh20@gmail.com', NULL, CAST(N'2022-11-18T00:00:00.000' AS DateTime), NULL, CAST(N'2022-12-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Admin] ([IDAdmin], [UserName], [Password], [Name], [Images], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (3, NULL, N'ngoccanh', N'Hoàng Ngọc Cảnh', N'mi3.jpg', NULL, N'hoangngoccanh20@gmail.com', NULL, CAST(N'2022-11-18T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Admin] ([IDAdmin], [UserName], [Password], [Name], [Images], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (4, NULL, N'ngoccanh', N'Hoàng Ngọc Cảnh', N'mi3.jpg', NULL, N'hoangngoccanh2@gmail.com', NULL, CAST(N'2022-11-18T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 0, N'A. MAX', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 0, N'B. MIN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (3, NULL, 1, N'1', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (4, NULL, 0, N'2', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (5, NULL, 1, N'1', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (6, NULL, 0, N'2', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 4, 1, N'A. MAX', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 4, 0, N'B. MIN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 4, 0, N'C. SUM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 4, 0, N'D. AVERAGE', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 5, 0, N'A. MAX', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 5, 0, N'B. MIN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 5, 1, N'C. SUM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 5, 0, N'D. AVERAGE', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 1, 0, N'C. SUM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 1, 1, N'D. AVERAGE', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 6, 1, N'A. Định dạng số', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 6, 0, N'B. Định dạng tiền tệ', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 6, 0, N'C. Định dạng ngày tháng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 6, 0, N'D. Định dạng phần trăm', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 7, 0, N'A. Định dạng số', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 7, 1, N'B. Định dạng tiền tệ', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 7, 0, N'C. Định dạng ngày tháng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 7, 0, N'D. Định dạng phần trăm', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 8, 0, N'A. Định dạng số', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 8, 0, N'B. Định dạng tiền tệ', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 8, 1, N'C. Định dạng ngày tháng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Answer] ([Id], [QuestionId], [IsCorrect], [Content], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (28, 8, 0, N'D. Định dạng phần trăm', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (4, N'Chương 1: Tổng quan về Excel', CAST(250000 AS Decimal(18, 0)), N'<ul>
<li>Giới thiệu về Excel v&agrave; c&aacute;c chức năng ch&iacute;nh của n&oacute;</li>
<li>C&aacute;ch sử dụng giao diện của Excel</li>
</ul>', N'cac-ham-excel-co-ban.jpg', 1, 3, 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), NULL, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (5, N'Chương 2: Các hàm cơ bản trong Excel', CAST(200000 AS Decimal(18, 0)), N'<ul>
<li>T&igrave;m hiểu về c&uacute; ph&aacute;p h&agrave;m</li>
<li>C&aacute;c h&agrave;m to&aacute;n học cơ bản (SUM, AVERAGE, MAX, MIN)</li>
<li>H&agrave;m IF v&agrave; c&aacute;c h&agrave;m li&ecirc;n quan (AND, OR, NOT)</li>
</ul>', N'cac-ham-excel-co-ban.jpg', 1, 3, 1, NULL, NULL, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, 60, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (6, N'Chương 3: Định dạng dữ liệu trong Excel', NULL, N'<ul>
<li>Định dạng số</li>
<li>Định dạng ng&agrave;y th&aacute;ng</li>
<li>Định dạng văn bản</li>
</ul>', N'041446_dinh-dang-du-lieu-chuan-trong-excel_thumb.png', 1, 3, 1, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (7, N'Chương 4: Tạo bảng tính và quản lý dữ liệu', NULL, N'<ul>
<li>Tạo v&agrave; sắp xếp bảng t&iacute;nh</li>
<li>Th&ecirc;m, sửa v&agrave; x&oacute;a dữ liệu trong bảng t&iacute;nh</li>
<li>T&iacute;nh to&aacute;n dữ liệu trong bảng t&iacute;nh</li>
</ul>', N'huong-dan-ve-bieu-do-trong-excel-don-gian-dep-mat-4-760x367.jpg', 1, 3, 1, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (8, N'Chương 5: Biểu đồ và đồ thị trong Excel', NULL, N'<ul>
<li>Tạo biểu đồ v&agrave; đồ thị trong Excel</li>
<li>Sử dụng c&aacute;c loại biểu đồ kh&aacute;c nhau</li>
<li>T&ugrave;y chỉnh biểu đồ v&agrave; đồ thị</li>
</ul>', N'huong-dan-ve-bieu-do-trong-excel-don-gian-dep-mat-4-760x367.jpg', 1, 3, 1, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (9, N'Chương 6: Bảo mật và chia sẻ dữ liệu', NULL, N'<ul>
<li>Bảo mật bảng t&iacute;nh v&agrave; dữ liệu</li>
<li>Chia sẻ bảng t&iacute;nh với người kh&aacute;c</li>
<li>Kiểm so&aacute;t quyền truy cập v&agrave;o bảng t&iacute;nh</li>
</ul>', N'1616488243thumb-800x450-43.jpg', 1, 3, 1, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (10, N'Chương 7: Tính năng mở rộng của Excel', NULL, N'<ul>
<li>Tạo macro trong Excel</li>
<li>Sử dụng c&aacute;c t&iacute;nh năng kh&aacute;c của Excel như PivotTable v&agrave; Solver</li>
</ul>', N'thu-thuat-excel.jpg', 1, 3, 1, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (11, N'Chương 1: Giới thiệu về Word', NULL, N'<ul>
<li>Giới thiệu về Word v&agrave; mục đ&iacute;ch sử dụng</li>
<li>Khởi động v&agrave; t&igrave;m hiểu giao diện Word</li>
<li>C&aacute;c th&agrave;nh phần cơ bản của một t&agrave;i liệu Word (văn bản, định dạng, ti&ecirc;u đề, ch&uacute; th&iacute;ch, h&igrave;nh ảnh, ...)</li>
</ul>', N'1512_word-la-gi-3.jpg', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (12, N'Chương 2: Các tính năng cơ bản trong Word', NULL, N'&nbsp;

&nbsp;

<ul>
<ul>
<li>C&aacute;ch tạo mới t&agrave;i liệu, lưu v&agrave; mở t&agrave;i liệu đ&atilde; lưu</li>
</ul>
</ul>
&nbsp;

<ul>
<ul>
<li>C&aacute;ch th&ecirc;m v&agrave; sắp xếp nội dung trong t&agrave;i liệu Word</li>
</ul>
</ul>
&nbsp;

<ul>
<ul>
<li>C&aacute;c t&iacute;nh năng định dạng văn bản cơ bản (font, size, style, color, ...)</li>
</ul>
</ul>
&nbsp;

&nbsp;
', N'Giao diện và những tính năng cơ bản của Microsoft Words.png', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (13, N'Chương 3: Định dạng văn bản trong Word', NULL, N'<ul>
<li>C&aacute;c t&iacute;nh năng định dạng n&acirc;ng cao (đ&aacute;nh số trang, th&ecirc;m ch&uacute; th&iacute;ch, th&ecirc;m h&igrave;nh ảnh, th&ecirc;m bảng, ...)</li>
<li>C&aacute;c t&iacute;nh năng kiểm tra lỗi ch&iacute;nh tả v&agrave; ngữ ph&aacute;p</li>
<li>C&aacute;ch sử dụng c&ocirc;ng cụ t&igrave;m kiếm v&agrave; thay thế văn bản</li>
</ul>', N'044225_dinh-dang-van-ban-chuan-trong-word_thumb.png', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (14, N'Chương 4: Tạo và quản lý bảng trong Word', NULL, N'<ul>
<li>C&aacute;ch tạo bảng v&agrave; sử dụng t&iacute;nh năng định dạng bảng</li>
<li>C&aacute;c t&iacute;nh năng t&ugrave;y chỉnh bảng (th&ecirc;m/x&oacute;a d&ograve;ng/cột, thay đổi k&iacute;ch thước &ocirc;, ...)</li>
<li>C&aacute;ch sử dụng c&ocirc;ng cụ t&iacute;nh to&aacute;n trong bảng</li>
</ul>', N'cach-tao-bang-trong-word.jpg', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (15, N'Chương 5: Tạo và quản lý danh sách trong Word', NULL, N'<ul>
<li>C&aacute;c t&iacute;nh năng tạo v&agrave; quản l&yacute; danh s&aacute;ch (đ&aacute;nh số, đ&aacute;nh dấu, danh s&aacute;ch đa cấp, ...)</li>
<li>C&aacute;ch t&ugrave;y chỉnh danh s&aacute;ch để ph&ugrave; hợp với y&ecirc;u cầu định dạng</li>
</ul>', N'cach-lam-muc-luc-trong-word-1.jpg', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (16, N'Chương 6: Các tính năng đặc biệt trong Word', NULL, N'<ul>
<li>C&aacute;ch sử dụng t&iacute;nh năng đ&aacute;nh dấu v&agrave; tạo phản hồi trong t&agrave;i liệu Word</li>
<li>C&aacute;ch tạo mẫu v&agrave; sử dụng c&aacute;c t&iacute;nh năng kiểm tra định dạng (form, check box, ...)</li>
<li>C&aacute;ch tạo h&igrave;nh nền, phần đầu v&agrave; ch&acirc;n trang cho t&agrave;i liệu Word</li>
</ul>', N'anh-chen-bai-09_1280x720-800-resize.jpg', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (17, N'Chương 7: Các tính năng hỗ trợ sử dụng Word', NULL, N'<ul>
<li>C&aacute;ch t&igrave;m kiếm v&agrave; chọn mẫu t&agrave;i liệu Word</li>
<li>C&aacute;ch sử dụng t&iacute;nh năng gợi &yacute; từ kh&oacute;a v&agrave; đồng bộ h&oacute;a t&agrave;i liệu</li>
<li>C&aacute;ch t&igrave;m hiểu th&ecirc;m về c&aacute;c t&iacute;nh năng Word th&ocirc;ng qua t&agrave;i liệu trợ gi&uacute;p v&agrave; hướng</li>
</ul>', N'1512_word-la-gi-3.jpg', 1, 1, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (18, N'Chương 1: Giới thiệu về PowerPoint', NULL, N'<ul>
<li>Giới thiệu về PowerPoint v&agrave; mục đ&iacute;ch sử dụng</li>
<li>Khởi động v&agrave; t&igrave;m hiểu giao diện PowerPoint</li>
<li>C&aacute;c th&agrave;nh phần cơ bản của một b&agrave;i thuyết tr&igrave;nh PowerPoint (slide, layout, định dạng, h&igrave;nh ảnh, &acirc;m thanh, ...)</li>
</ul>', N'powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet-.jpg', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (19, N'Chương 2: Các tính năng cơ bản trong PowerPoint', NULL, N'<ul>
<li>C&aacute;ch tạo mới một b&agrave;i thuyết tr&igrave;nh, lưu v&agrave; mở b&agrave;i thuyết tr&igrave;nh đ&atilde; lưu</li>
<li>C&aacute;ch th&ecirc;m v&agrave; sắp xếp nội dung trong b&agrave;i thuyết tr&igrave;nh PowerPoint</li>
<li>C&aacute;c t&iacute;nh năng định dạng cơ bản (font, size, style, color, ...)</li>
</ul>', N'cach-su-dung-powerpoint.jpg', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (20, N'Chương 3: Tạo và quản lý slide trong PowerPoint', NULL, N'<ul>
<li>C&aacute;c t&iacute;nh năng tạo v&agrave; quản l&yacute; slide trong b&agrave;i thuyết tr&igrave;nh (th&ecirc;m, x&oacute;a, sao ch&eacute;p, ... )</li>
<li>C&aacute;ch sử dụng layout để sắp xếp slide v&agrave; tạo nội dung</li>
<li>C&aacute;c t&iacute;nh năng th&ecirc;m v&agrave; định dạng h&igrave;nh ảnh, &acirc;m thanh, video v&agrave;o slide</li>
</ul>', N'slide-la-gi-cach-tao-slide-dep-chuyen-nghiep-de-lai-an-01a-800x450.jpg', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (21, N'Chương 4: Tùy chỉnh định dạng trong PowerPoint', NULL, N'<ul>
<li>C&aacute;c t&iacute;nh năng định dạng slide (tạo chủ đề, background, ...)</li>
<li>C&aacute;ch sử dụng t&iacute;nh năng animation để tạo hiệu ứng động cho nội dung tr&ecirc;n slide</li>
<li>C&aacute;c t&iacute;nh năng định dạng văn bản n&acirc;ng cao (điều chỉnh khoảng c&aacute;ch, ch&egrave;n k&yacute; tự đặc biệt, ...)</li>
</ul>', N'cach-dinh-dang-va-trang-tri-hinh-anh-trong-powerpoint.png', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (24, N'Chương 5: Tạo và quản lý bảng biểu trong PP', NULL, N'&nbsp;

&nbsp;

<ul>
<ul>
<li>C&aacute;ch tạo bảng v&agrave; sử dụng t&iacute;nh năng định dạng bảng</li>
</ul>
</ul>
&nbsp;

<ul>
<ul>
<li>C&aacute;c t&iacute;nh năng t&ugrave;y chỉnh bảng (th&ecirc;m/x&oacute;a d&ograve;ng/cột, thay đổi k&iacute;ch thước &ocirc;, ...)</li>
</ul>
</ul>
&nbsp;

<ul>
<ul>
<li>C&aacute;ch sử dụng c&ocirc;ng cụ t&iacute;nh to&aacute;n trong bảng</li>
</ul>
</ul>
&nbsp;

&nbsp;
', N'cach-chieu-2-man-hinh-vua-trinh-chieu-vua-xem-slide-thumb-800x450.jpg', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (25, N'Chương 6: Các tính năng đặc biệt trong PowerPoint', NULL, N'<ul>
<li>C&aacute;ch sử dụng t&iacute;nh năng speaker notes để tạo ghi ch&uacute; cho người tr&igrave;nh b&agrave;y</li>
<li>C&aacute;ch tạo mẫu v&agrave; sử dụng c&aacute;c t&iacute;nh năng kiểm tra định dạng (form, check box, ...)</li>
<li>C&aacute;ch sử dụng t&iacute;nh năng chia sẻ v&agrave; đồng bộ h&oacute;a b&agrave;i thuyết tr&igrave;nh</li>
</ul>', N'them-tieu-de-ppt-thumb.jpg', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([IDCourse], [Name], [Saleprice], [Describe], [Images], [IDCreator], [IDTopic], [IDPH], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [TestTime], [IDLesson]) VALUES (26, N'Chương 7: Các tính năng hỗ trợ sử dụng PowerPoint', NULL, N'&nbsp;

&nbsp;

<ul>
<ul>
<li>C&aacute;ch t&igrave;m kiếm v&agrave; sử dụng c&aacute;c mẫu b&agrave;i thuyết tr&igrave;nh c&oacute; sẵn</li>
</ul>
</ul>
&nbsp;

<ul>
<ul>
<li>C&aacute;ch t&igrave;m hiểu th&ecirc;m về c&aacute;c t&iacute;nh năng PowerPoint th&ocirc;ng qua t&agrave;i liệu trợ gi&uacute;p v&agrave; hướng dẫn.</li>
</ul>
</ul>
&nbsp;

&nbsp;
', N'SEO1479-thumb.png', 1, 6, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (4, 1, 0)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (4, 4, 2)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (4, 5, 1)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (5, 1, 2)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (5, 4, 3)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (5, 5, 1)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (6, 6, 1)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (6, 7, 2)
INSERT [dbo].[CourseQuestion] ([CourseId], [QuestionId], [Order]) VALUES (6, 8, 3)
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Hàm và cách sử dụng các hàm trong excel', N'&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><strong><span lang="EN-US">I). KH&Aacute;I NIỆM H&Agrave;M:</span></strong>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">H&agrave;m l&agrave; những c&ocirc;ng thức định sẵn của Excel nhằm thực hiện một chức năng t&iacute;nh to&aacute;n ri&ecirc;ng biệt n&agrave;o đ&oacute;, hoặc để thực hiện c&aacute;c thao t&aacute;c tr&ecirc;n bảng t&iacute;nh, hoặc gi&uacute;p đỡ việc ra một quyết định dựa tr&ecirc;n những th&ocirc;ng tin cung cấp. Ta c&oacute; thể sử dụng c&aacute;c h&agrave;m c&oacute; sẵn của Excel hoặc c&oacute; thể viết ra những h&agrave;m mới cho ri&ecirc;ng m&igrave;nh.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">C&uacute; ph&aacute;p chung của h&agrave;m như sau:</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>= T&Ecirc;NH&Agrave;M(Đối số 1, Đối số 2, &hellip;, Đối số n)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Trong đ&oacute;:</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Dấu &ldquo;=&rdquo;: Bắt buộc phải c&oacute; trước h&agrave;m, nếu k&ocirc;ng c&oacute; dấu &ldquo;=&rdquo; th&igrave; Excel kh&ocirc;ng t&iacute;nh to&aacute;n g&igrave; cả m&agrave; sẽ hiển thị c&ocirc;ng thức đ&oacute; l&ecirc;n &ocirc; như một chuỗi văn bản.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>T&Ecirc;NH&Agrave;M: Do Excel qui định v&agrave; mỗi h&agrave;m c&oacute; một t&ecirc;n ri&ecirc;ng của n&oacute;. C&oacute; thể d&ugrave;ng k&yacute; tự hoa hoặc thường cho t&ecirc;n h&agrave;m (trong t&ecirc;n h&agrave;m kh&ocirc;ng được c&oacute; khoảng trống).</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Số lượng c&aacute;c đối số sẽ tuỳ thuộc theo từng h&agrave;m v&agrave; tuỳ từng trường hợp m&agrave; c&oacute; nhiều hay &iacute;t, c&aacute;c đối số sẽ ngăn c&aacute;ch bởi dấu phẩy &ldquo;,&rdquo; v&agrave; ch&uacute;ng phải được nằm trong dấu cặp dấu ().</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Trong h&agrave;m c&oacute; thể chứa tất cả c&aacute;c loại dữ liệu của Excel, c&aacute;c địa chỉ &ocirc;, t&ecirc;n khối, t&ecirc;n v&ugrave;ng,&hellip;, ri&ecirc;ng dữ liệu loại chuỗi khi đặt trong h&agrave;m phải được đặt trong cặp dấu nh&aacute;y k&eacute;p &ldquo; &ldquo;. C&oacute; thể sử dụng một h&agrave;m l&agrave;m đối số cho một h&agrave;m v&agrave; chỉ được giới hạn trong 7 mức lồng nhau.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><strong><span lang="EN-US">II). C&Aacute;C H&Agrave;M TH&Ocirc;NG DỤNG TRONG EXCEL:</span></strong>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">1.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>H&agrave;m Ng&agrave;y/Th&aacute;ng/Năm:</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>a). H&agrave;m Lấy Ng&agrave;y: (Day)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>=Day(chuỗi<span style="mso-spacerun: yes;">&nbsp; </span>th&aacute;ng ng&agrave;y năm)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m trả về gi&aacute; trị ng&agrave;y của chuỗi th&aacute;ng ng&agrave;y năm.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Ex:<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>=day(&ldquo;12/24/2003&rdquo;)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&reg;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>24</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>b). H&agrave;m Lấy Th&aacute;ng: (Month):</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>=Month(chuỗi<span style="mso-spacerun: yes;">&nbsp; </span>th&aacute;ng ng&agrave;y năm)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m trả về gi&aacute; trị th&aacute;ng của chuỗi th&aacute;ng ng&agrave;y năm</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Ex:<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>=month(&ldquo;12/24/2003&rdquo;)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>&reg;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>12</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>c). H&agrave;m Lấy Năm: (Year)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=Year(chuỗi<span style="mso-spacerun: yes;">&nbsp; </span>th&aacute;ng ng&agrave;y năm)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;</span>C&ocirc;ng dụng: H&agrave;m trả về gi&aacute; trị th&aacute;ng của chuỗi th&aacute;ng ng&agrave;y năm</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Ex:<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>=year(&ldquo;12/24/2003&rdquo;)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&reg;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2003</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">d). H&agrave;m Lấy ng&agrave;y th&aacute;ng năm: (Date):</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=Date(năm, th&aacute;ng, ng&agrave;y)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m trả về kiểu ng&agrave;y th&aacute;ng năm</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Ex:<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>=date(2003,12,24)<span style="mso-spacerun: yes;">&nbsp; </span>&reg;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>24/12/2003 hoặc12/24/2003</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">e). H&agrave;m Lấy ng&agrave;y giờ hiện tại: (Now)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=Now()</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m trả về ng&agrave;y giờ hiện tại (ng&agrave;y giờ hệ thống)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;</span></span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">2.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&aacute;c h&agrave;m về số:</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">a). H&agrave;m lấy phần nguy&ecirc;n: (INT)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p: =INT(n)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m INT cho kết quả l&agrave; phần nguy&ecirc;n của số n.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=INT(3.1416)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 3.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=INT(123.456)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 123.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">b) H&agrave;m chia lấy dư: (MOD)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=MOD(m,n)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m MOD cho kết quả l&agrave; số dư của m chia cho n. Nếu n=0, MOD returns the #DIV/0! error value.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=MOD(9,2) sẽ cho kết quả l&agrave;: 1.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">c). H&agrave;m l&agrave;m tr&ograve;n số: (ROUND)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p: =ROUND(n,m)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m ROUND l&agrave;m tr&ograve;n số n đến m số.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Nếu m&gt;0 h&agrave;m l&agrave;m tr&ograve;n với m số lẻ.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ: =ROUND(3.1416,2)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 3.14</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Nếu m&lt;0 h&agrave;m sẽ l&agrave;m tr&ograve;n qua phần nguy&ecirc;n.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ: =ROUND(1234567, -2)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 1234600.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">d). H&agrave;m lấy cực đại: (MAX)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p: =MAX(n1,n2,&hellip;,nm).</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m MAX cho kết quả l&agrave; số nguy&ecirc;n lớn nhất trong m số.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=MAX(A5:B8,C9:G11,G13)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span lang="FR" style="mso-ansi-language: FR;">=MAX(12,4,3,27,14)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 27.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="DE" style="mso-ansi-language: DE;">e). H&agrave;m lấy cực tiểu: (MIN)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=MIN(n1,n2,&hellip;,nm)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m MIN cho kết quả l&agrave; số nhỏ nhất trong m số.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="NL" style="mso-ansi-language: NL;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>=MIN(A5:B8,C9:G11,G13)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span lang="FR" style="mso-ansi-language: FR;">=MIN(12,4,3,27,14)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 3.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">f). H&agrave;m t&iacute;nh tổng: (SUM)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=SUM(n1,n2,&hellip;,nm)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m SUM cho kết quả l&agrave; tổng c&aacute;c số n1,n2,&hellip;,nm.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=SUM(A5:B8,C9:G11,G13)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;</span>=SUM(12,4,3,27,14)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 60.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">g). H&agrave;m t&iacute;nh tổng c&oacute; điều kiện: (SUMIF)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>=Sumif(v&ugrave;ng điều kiện, điều kiện, v&ugrave;ng t&iacute;nh tổng)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng:H&agrave;m t&iacute;nh tổng v&ugrave;ng t&iacute;nh tổng m&agrave; thỏa điều kiện.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>V&iacute; dụ: =Sumif(B1:B5,&rdquo;Nam&rdquo;,C1:C5) : T&iacute;nh Tổng tiền từ C1 đến C5 của V&ugrave;ng từ B1 đến B5 c&oacute; những &ocirc; tương ứng l&agrave; Nam</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="DE" style="mso-ansi-language: DE;">h). H&agrave;m T&iacute;nh trung b&igrave;nh: (AVERAGE)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=AVERAGE(n1,n2,&hellip;,nm )</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m AVERAGE trả về một số l&agrave; trung b&igrave;nh cộng của c&aacute;c số n1,n2,&hellip;,nm<span style="mso-spacerun: yes;">&nbsp; </span>.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=AVERAGE(A5:B8,C9:G11,G13).</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span lang="FR" style="mso-ansi-language: FR;">=AVERAGE(12,4,3,27,14)<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 12.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="FR" style="mso-ansi-language: FR;">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">i). H&agrave;m đếm số: (COUNT)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=COUNT(V&ugrave;ng dữ liệu)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m COUNT cho kết quả l&agrave; tổng số c&aacute;c &ocirc; c&oacute; gi&aacute; trị trong V&ugrave;ng dữ liệu.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=COUNT(&ldquo;B&rdquo;,2,4,1,6)<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span>sẽ cho kết quả l&agrave;: 4.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">j). H&agrave;m đếm chuỗi: (COUNTA) (đếm c&aacute;c &ocirc; kh&ocirc;ng rỗng)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=COUNTA(V&ugrave;ng dữ liệu)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m COUNTA cho kết quả l&agrave; tổng số c&aacute;c &ocirc; kh&ocirc;ng rỗngtrong V&ugrave;ng dữ liệu.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">Ri&ecirc;ng h&agrave;m Count chỉ đếm số, để đếm được chuỗi th&igrave; phải sử dụng h&agrave;m Counta</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">k). H&agrave;m đếm c&oacute; điều kiện: (COUNTIF)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&uacute; ph&aacute;p:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>=COUNTIF(v&ugrave;ng dữ liệu, điều kiện)</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&middot;<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>C&ocirc;ng dụng: H&agrave;m đếm v&ugrave;ng dữ liệu m&agrave; thỏa điều kiện.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>V&iacute; dụ:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=Countif(A1:D5,18) : Đếm v&ugrave;ng dữ liệu từ A1 đến D5 m&agrave; thỏa<span style="mso-spacerun: yes;">&nbsp; </span>điều kiện =18.</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US">&nbsp;</span>

&nbsp;

&nbsp;

<p class="MsoNormal" style="line-height: 150%;"><span lang="EN-US"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>=Countif(A1:D5,&rdquo;&gt;=18&rdquo;) : Đếm v&ugrave;ng dữ liệu từ A1 đến D5 m&agrave; thỏa điều kiện &gt;=18.</span>

&nbsp;

&nbsp;
', N'cac-ham-excel-co-ban.jpg', 5, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Làm quen với Microsoft Excel', N'&nbsp;

<p class="MsoNormal" style="margin-left: 29.95pt; text-indent: -18.0pt;"><span lang="EN-US">&nbsp;</span>/n

&nbsp;

<p class="MsoTocHeading" style="text-align: center;" align="center"><span lang="EN-US">Mục Lục</span>/n

&nbsp;

<p class="MsoToc1" style="tab-stops: 22.0pt right dotted 450.8pt;"><!-- [if supportFields]><span

 lang=EN-US><span style=''mso-element:field-begin''></span><span

 style=''mso-spacerun:yes''> </span>TOC \o &quot;1-3&quot; \h \z \u <span

 style=''mso-element:field-separator''></span></span><![endif]--><span lang="EN-US"><span class="MsoHyperlink"><span style="mso-no-proof: yes;"><a href="#_Toc131802902">1.<span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp; </span></span>L&agrave;m quen với Microsoft Excel<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802902 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">1</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300032000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span></span>/n

&nbsp;

<p class="MsoToc2" style="tab-stops: 33.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802903"><span style="font-family: Symbol;">&middot;</span><span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp; </span></span>Giao diện Excel<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802903 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">1</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300033000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc1" style="tab-stops: 22.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802904">2.<span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp; </span></span>L&agrave;m việc với Excel<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802904 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">2</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300034000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc2" style="tab-stops: 33.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802905"><span style="font-family: Symbol;">&middot;</span><span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp; </span></span>Thanh c&ocirc;ng cụ Ribbon<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802905 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">2</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300035000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc2" style="tab-stops: 33.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802906"><span style="font-family: Symbol;">&middot;</span><span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp; </span></span>Thay đổi t&ugrave;y chọn hiển thị Ribbon<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802906 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">3</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300036000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc1" style="tab-stops: 22.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802907">3.<span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp; </span></span>Thanh c&ocirc;ng cụ Quick Access Toolbar<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-begin''></span></span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''> PAGEREF

 _Toc131802907 \h </span><span style=''color:windowtext;display:none;mso-hide:

 screen;text-decoration:none;text-underline:none''><span style=''mso-element:

 field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">4</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300037000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc2" style="tab-stops: 33.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802908"><span style="font-family: Symbol;">&middot;</span><span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp; </span></span><span style="border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm;">Th&ecirc;m lệnh v&agrave;o thanh c&ocirc;ng cụ Quick Access Toolbar</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802908 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">5</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300038000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc2" style="tab-stops: 33.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802909"><span style="font-family: Symbol;">&middot;</span><span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp; </span></span><span style="border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm;">L&agrave;m thế n&agrave;o để sử dụng Tell me</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802909 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">5</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900300039000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc1" style="tab-stops: 22.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802910">4.<span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp; </span></span>Chế độ xem Worksheet<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802910 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">7</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900310030000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoToc1" style="tab-stops: 22.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131802911">5.<span style="color: windowtext; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp; </span></span>Chức năng Backstage view<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">.. </span></span><!-- [if supportFields]><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''><span style=''mso-element:field-begin''></span></span><span

 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;

 text-underline:none''> PAGEREF _Toc131802911 \h </span><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">8</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>

  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300032003900310031000000</w:data>

 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;

 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span

 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n

&nbsp;

<p class="MsoNormal"><!-- [if supportFields]><b><span lang=EN-US

 style=''mso-no-proof:yes''><span style=''mso-element:field-end''></span></span></b><![endif]--><span lang="EN-US">&nbsp;</span>/n

&nbsp;

<p class="MsoNormal"><span lang="EN-US">&nbsp;</span>/n

&nbsp;

<h1 style="margin-left: 29.95pt; text-align: left; text-indent: -18.0pt; mso-list: l11 level1 lfo15;" align="left"><a name="_Toc131802902"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">1.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">L&agrave;m quen với Microsoft Excel</span></h1>
&nbsp;

<p style="margin: 0cm; line-height: 19.5pt; background: white;"><strong><span style="font-family: ''inherit'',serif; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm;">Microsoft Excel</span></strong><span style="font-family: ''Arial'',sans-serif; color: black; mso-color-alt: windowtext;">&nbsp;l&agrave; một chương tr&igrave;nh xử l&yacute; bảng t&iacute;nh được thiết kế gi&uacute;p ghi lại, tr&igrave;nh b&agrave;y c&aacute;c th&ocirc;ng tin xử l&yacute; dưới dạng bảng, thực hiện t&iacute;nh to&aacute;n v&agrave; x&acirc;y dựng c&aacute;c số liệu thống k&ecirc; trực quan c&oacute; trong bảng.</span>/n

&nbsp;

<p style="line-height: 19.5pt; background: white; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.87); orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 7.5pt 0cm 7.5pt 0cm;"><span style="font-family: ''Arial'',sans-serif; color: black; mso-color-alt: windowtext;">Mặc d&ugrave; bạn c&oacute; thể cho rằng Excel chỉ được sử dụng bởi một số người khi xử l&yacute; dữ liệu phức tạp nhưng tr&ecirc;n thực tế, bất kỳ ai trong số ch&uacute;ng ta cũng c&oacute; thể học c&aacute;ch sử dụng c&aacute;c t&iacute;nh năng hữu &iacute;ch của chương tr&igrave;nh.</span>/n

&nbsp;

<p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: #003399; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;</span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Cho d&ugrave; bạn đang giữ ng&acirc;n s&aacute;ch, x&acirc;y dựng một bản ghi đ&agrave;o tạo, hoặc tạo ra một h&oacute;a đơn, Microsoft Excel sẽ l&agrave;m cho n&oacute; trở n&ecirc;n dễ d&agrave;ng hơn để l&agrave;m việc với c&aacute;c loại dữ liệu kh&aacute;c nhau. </span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;</span>/n

&nbsp;

<h2 style="margin-left: 62.95pt; text-indent: -18.0pt; mso-list: l4 level1 lfo16;"><a name="_Toc131802903"></a><!-- [if !supportLists]--><span lang="vi" style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; font-weight: normal; mso-bidi-font-weight: bold;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Giao diện Excel</span></h2>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Khi mở Excel 2016, m&agrave;n h&igrave;nh&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Start Screen Excel</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;sẽ xuất hiện. Tại đ&acirc;y, bạn c&oacute; thể tạo ra một bảng t&iacute;nh mới, chọn một mẫu v&agrave; truy cập c&aacute;c bảng t&iacute;nh đ&atilde; chỉnh sửa gần đ&acirc;y của m&igrave;nh.</span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l3 level1 lfo1; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Từ m&agrave;n h&igrave;nh&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Start Screen</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;của Excel, h&atilde;y t&igrave;m v&agrave; chọn bảng t&iacute;nh trống để truy cập v&agrave;o giao diện Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-1.jpg" alt="Từ m&agrave;n h&igrave;nh Start Screen của Excel, h&atilde;y t&igrave;m v&agrave; chọn bảng t&iacute;nh trống để truy cập v&agrave;o giao diện Excel."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l13 level1 lfo2; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Click v&agrave;o c&aacute;c n&uacute;t tương t&aacute;c minh họa b&ecirc;n dưới để l&agrave;m quen với giao diện Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-2.jpg" alt="Click v&agrave;o c&aacute;c n&uacute;t tương t&aacute;c minh họa b&ecirc;n dưới để l&agrave;m quen với giao diện Excel."><br><!--[endif]--></span>/n

&nbsp;

<h1 style="margin-left: 29.95pt; text-align: left; text-indent: -18.0pt; mso-list: l11 level1 lfo15;" align="left"><a name="_Toc131802904"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">2.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">L&agrave;m việc với Excel</span></h1>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Ribbon</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;v&agrave;&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Quick Access Toolbar</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;l&agrave; nơi bạn sẽ t&igrave;m thấy c&aacute;c lệnh để thực hiện c&aacute;c t&aacute;c vụ phổ biến trong Excel. Chức năng&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Backstage view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;sẽ cung cấp cho bạn c&aacute;c t&ugrave;y chọn kh&aacute;c nhau để lưu trữ, mở tệp tin, in v&agrave; chia sẻ t&agrave;i liệu.</span>/n

&nbsp;

<h2 style="margin-left: 35.45pt; text-indent: -18.0pt; mso-list: l4 level1 lfo16;"><a name="_Toc131802905"></a><!-- [if !supportLists]--><span lang="vi" style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; font-weight: normal; mso-bidi-font-weight: bold;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Thanh c&ocirc;ng cụ Ribbon</span></h2>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Excel 2016</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;sử dụng một hệ thống Ribbon gồm c&aacute;c tab thay v&igrave; menu truyền thống. Thanh c&ocirc;ng cụ Ribbon chứa nhiều tab, mỗi nh&oacute;m c&oacute; một số nh&oacute;m lệnh. Bạn sẽ sử dụng c&aacute;c tab n&agrave;y để thực hiện c&aacute;c t&aacute;c vụ phổ biến nhất trong Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l12 level1 lfo3; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Mỗi tab sẽ c&oacute; một hoặc nhiều nh&oacute;m.</span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white; margin: 7.5pt 0cm; text-align: center;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-3.jpg"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l7 level1 lfo4; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Một số nh&oacute;m sẽ c&oacute; mũi t&ecirc;n thả xuống, bạn c&oacute; thể nhấp v&agrave;o để c&oacute; th&ecirc;m t&ugrave;y chọn.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-4.jpg" alt="Một số nh&oacute;m sẽ c&oacute; mũi t&ecirc;n thả xuống, bạn c&oacute; thể nhấp v&agrave;o để c&oacute; th&ecirc;m t&ugrave;y chọn."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l2 level1 lfo5; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Nhấp v&agrave;o tab để xem th&ecirc;m lệnh.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-5.jpg" alt="Nhấp v&agrave;o tab để xem th&ecirc;m lệnh."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l8 level1 lfo6; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Bạn c&oacute; thể điều chỉnh hiển thị thanh c&ocirc;ng cụ Ribbon với&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Ribbon Display Options</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">T&ugrave;y chọn hiển thị Ribbon</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">).</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-6.jpg" alt="Ribbon Display Options"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l5 level1 lfo7; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Một số chương tr&igrave;nh nhất định, chẳng hạn như&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Adobe Acrobat Reader</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">, c&oacute; thể c&agrave;i đặt c&aacute;c tab bổ sung v&agrave;o thanh c&ocirc;ng cụ Ribbon. C&aacute;c tab n&agrave;y được gọi l&agrave; lệnh t&ugrave;y chỉnh</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;add-ins</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">.</span>/n

&nbsp;

<h2 style="margin-left: 35.45pt; text-indent: -18.0pt; mso-list: l4 level1 lfo16;"><a name="_Toc131802906"></a><!-- [if !supportLists]--><span lang="vi" style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; font-weight: normal; mso-bidi-font-weight: bold;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Thay đổi t&ugrave;y chọn hiển thị Ribbon</span></h2>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thanh c&ocirc;ng cụ Ribbon</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;được thiết kế để đ&aacute;p ứng nhiệm vụ hiện tại của bạn, nhưng bạn c&oacute; thể chọn thu nhỏ nếu nhận thấy n&oacute; chiếm qu&aacute; nhiều kh&ocirc;ng gian m&agrave;n h&igrave;nh. Nhấp v&agrave;o mũi t&ecirc;n&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Ribbon Display Options</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">T&ugrave;y chọn hiển thị Ribbon</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">) ở g&oacute;c tr&ecirc;n b&ecirc;n phải của Ribbon để hiển thị menu thả xuống.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-7.jpg" alt="Nhấp v&agrave;o mũi t&ecirc;n Ribbon Display Options "><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">C&oacute; ba chế độ trong tr&igrave;nh đơn&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Ribbon Display Options</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">:</span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l1 level1 lfo8; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Auto-hide Ribbon</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Tự động ẩn thanh c&ocirc;ng cụ Ribbon</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">): Tự động ẩn hiển bảng t&iacute;nh của bạn ở chế độ to&agrave;n m&agrave;n h&igrave;nh v&agrave; ẩn ho&agrave;n to&agrave;n thanh c&ocirc;ng cụ Ribbon. Để hiển thị thanh c&ocirc;ng cụ Ribbon, nhấp v&agrave;o lệnh&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Expand Ribbon</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;ở ph&iacute;a tr&ecirc;n m&agrave;n h&igrave;nh.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-8.jpg" alt="Nhấp v&agrave;o lệnh Expand Ribbon ở ph&iacute;a tr&ecirc;n m&agrave;n h&igrave;nh."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l9 level1 lfo9; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Show Tabs</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Hiển thị Tabs</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">): T&ugrave;y chọn n&agrave;y ẩn tất cả c&aacute;c nh&oacute;m lệnh khi kh&ocirc;ng sử dụng, nhưng c&aacute;c tab sẽ vẫn hiển thị. Để hiển thị thanh Ribbon, chỉ cần nhấp v&agrave;o tab.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-9.jpg" alt="Show Tabs"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l15 level1 lfo10; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: ''Courier New''; mso-fareast-font-family: ''Courier New''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">o<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Show Tabs and Commands</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Hiển thị lệnh Tabs and Commands)</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">: T&ugrave;y chọn n&agrave;y tối đa h&oacute;a thanh c&ocirc;ng cụ Ribbon. Tất cả c&aacute;c tab v&agrave; lệnh sẽ được hiển thị. Tuỳ chọn n&agrave;y được chọn mặc định khi bạn mở Excel.</span>/n

&nbsp;

<h1 style="margin-left: 29.95pt; text-align: left; text-indent: -18.0pt; mso-list: l11 level1 lfo15;" align="left"><a name="_Toc131802907"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">3.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Thanh c&ocirc;ng cụ Quick Access Toolbar</span></h1>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Nằm ngay ph&iacute;a tr&ecirc;n thanh c&ocirc;ng cụ Ribbon, thanh&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Quick Access Toolbar</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;cho ph&eacute;p người d&ugrave;ng truy cập c&aacute;c lệnh phổ biến bất kể bạn chọn tab n&agrave;o. Theo mặc định, n&oacute; bao gồm c&aacute;c lệnh&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Save</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Lưu</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">),&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Undo</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Ho&agrave;n t&aacute;c</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">) v&agrave;&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Repeat</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Lặp lại</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">). Bạn c&oacute; thể th&ecirc;m c&aacute;c lệnh kh&aacute;c t&ugrave;y thuộc v&agrave;o sở th&iacute;ch.</span>/n

&nbsp;

<h2 style="margin-left: 35.45pt; text-indent: -18.0pt; mso-list: l4 level1 lfo16;"><a name="_Toc131802908"></a><!-- [if !supportLists]--><span lang="vi" style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; font-weight: normal; mso-bidi-font-weight: bold;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi" style="border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm;">Th&ecirc;m lệnh v&agrave;o thanh c&ocirc;ng cụ Quick Access Toolbar</span></h2>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">1. Nhấp v&agrave;o mũi t&ecirc;n thả xuống ở b&ecirc;n phải thanh c&ocirc;ng cụ&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Quick Access Toolbar</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">.</span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">2. Chọn lệnh bạn muốn th&ecirc;m từ tr&igrave;nh đơn thả xuống. Để chọn từ nhiều lệnh hơn, chọn&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">More Commands</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-10.jpg" alt="Chọn More Commands"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">3. Lệnh sẽ được th&ecirc;m v&agrave;o&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Quick Access Toolbar</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-11.jpg" alt="Lệnh sẽ được th&ecirc;m v&agrave;o Quick Access Toolbar."><br><!--[endif]--></span>/n

&nbsp;

<h2 style="margin-left: 1.0cm; text-indent: -18.0pt; mso-list: l4 level1 lfo16;"><a name="_Toc131802909"></a><!-- [if !supportLists]--><span lang="vi" style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; font-weight: normal; mso-bidi-font-weight: bold;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi" style="border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm;">L&agrave;m thế n&agrave;o để sử dụng Tell me</span></h2>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Hộp Tell Me hoạt động như một thanh t&igrave;m kiếm để gi&uacute;p bạn nhanh ch&oacute;ng t&igrave;m c&aacute;c c&ocirc;ng cụ hoặc lệnh muốn sử dụng.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-12.jpg" alt=" Tell Me"><br>1. Nhập một cụm từ t&igrave;m kiếm v&agrave;o hộp&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Tell me</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;về những g&igrave; bạn muốn l&agrave;m.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-13.jpg" alt="Nhập một cụm từ t&igrave;m kiếm v&agrave;o hộp Tell me về những g&igrave; bạn muốn l&agrave;m."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">2. Kết quả sẽ cho bạn một v&agrave;i lựa chọn c&oacute; li&ecirc;n quan. Để sử dụng, h&atilde;y nhấp v&agrave;o một lựa chọn.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-14.jpg" alt="Kết quả sẽ cho bạn một v&agrave;i lựa chọn c&oacute; li&ecirc;n quan"><br><!--[endif]--></span>/n

&nbsp;

<h1 style="margin-left: 29.95pt; text-align: left; text-indent: -18.0pt; mso-list: l11 level1 lfo15;" align="left"><a name="_Toc131802910"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">4.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Chế độ xem Worksheet</span></h1>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Excel 2016</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;c&oacute; nhiều t&ugrave;y chọn thay đổi c&aacute;ch xem bảng t&iacute;nh của bạn được hiển thị. C&aacute;c chế độ xem n&agrave;y c&oacute; thể hữu &iacute;ch cho c&aacute;c t&aacute;c vụ kh&aacute;c nhau, đặc biệt nếu bạn đang l&ecirc;n kế hoạch in bảng t&iacute;nh. Để thay đổi chế độ xem worksheet, h&atilde;y t&igrave;m c&aacute;c lệnh ở g&oacute;c dưới c&ugrave;ng b&ecirc;n phải của cửa sổ Excel v&agrave; chọn&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Normal view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chế độ xem b&igrave;nh thường</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">),&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Page Layout view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Giao diện trang</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">) hoặc&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Page Break view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;(</span><em><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chế độ xem ngắt trang</span></em><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">).</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-15.jpg" alt="Chế độ xem worksheet"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l0 level1 lfo11; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chế độ xem th&ocirc;ng thường</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;l&agrave; chế độ xem mặc định cho tất cả c&aacute;c bảng t&iacute;nh trong Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-16.jpg" alt="Chế độ xem th&ocirc;ng thường"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l6 level1 lfo12; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chế độ xem giao diện trang</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;hiển thị c&aacute;ch bảng t&iacute;nh của bạn sẽ xuất hiện khi in. Bạn cũng c&oacute; thể th&ecirc;m ti&ecirc;u đề v&agrave; ch&acirc;n trang trong chế độ xem n&agrave;y.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-17.jpg" alt="Chế độ xem giao diện trang"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l14 level1 lfo13; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chế độ xem ngắt trang</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;cho ph&eacute;p bạn thay đổi vị tr&iacute; ngắt trang, đặc biệt hữu &iacute;ch khi in nhiều dữ liệu từ Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-18.jpg" alt="Chế độ xem ngắt trang"><br><!--[endif]--></span>/n

&nbsp;

<h1 style="margin-left: 29.95pt; text-align: left; text-indent: -18.0pt; mso-list: l11 level1 lfo15;" align="left"><a name="_Toc131802911"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">5.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Chức năng Backstage view</span></h1>
&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chức năng&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Backstage view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;cung cấp cho bạn c&aacute;c t&ugrave;y chọn kh&aacute;c nhau để lưu, mở tệp, in v&agrave; chia sẻ tập tin Workbook trong Excel.</span>/n

&nbsp;

<p class="MsoNormal" style="line-height: 19.5pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">1. Nhấp v&agrave;o tab&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">File</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;tr&ecirc;n Ribbon.&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Backstage view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;sẽ xuất hiện.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-19.jpg" alt="Nhấp v&agrave;o tab File tr&ecirc;n Ribbon. Backstage view sẽ xuất hiện."><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="margin-left: 58.5pt; text-indent: -18.0pt; mso-list: l10 level1 lfo14; tab-stops: list 36.0pt; background: white;"><!-- [if !supportLists]--><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Nhấp v&agrave;o c&aacute;c n&uacute;t minh họa trong tr&igrave;nh tương t&aacute;c b&ecirc;n dưới để t&igrave;m hiểu th&ecirc;m về c&aacute;ch sử dụng&nbsp;</span><strong><span style="font-size: 12.0pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Arial; color: black; mso-color-alt: windowtext; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padding: 0cm; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Backstage view</span></strong><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">.</span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center; line-height: 19.5pt; background: white; margin: 7.5pt 0cm 7.5pt 0cm;" align="center"><span style="font-size: 12.0pt; font-family: ''Arial'',sans-serif; mso-fareast-font-family: ''Times New Roman''; color: black; mso-color-alt: windowtext; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes;"><img src="https://st.quantrimang.com/photos/image/2017/10/30/tim-hieu-excel-2016-20.jpg" alt="Nhấp v&agrave;o c&aacute;c n&uacute;t minh họa trong tr&igrave;nh tương t&aacute;c b&ecirc;n dưới để t&igrave;m hiểu th&ecirc;m về c&aacute;ch sử dụng Backstage view"><br><!--[endif]--></span>/n

&nbsp;

<p class="MsoNormal" style="text-align: center;" align="center"><span lang="EN-US" style="mso-fareast-language: VI;">&nbsp;</span>/n
', N'thu-thuat-excel.jpg', 4, 1, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL, CAST(N'2023-04-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Định dạng dữ liệu toàn tập trong Excel', N'<p class="MsoTocHeading"><span lang="EN-US">Mục Lục</span>/n
<p class="MsoToc1" style="tab-stops: 28.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807973">1.<span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>Định dạng dữ liệu trong Excel:<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807973 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">1</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370033000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc1" style="tab-stops: 28.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807974">2.<span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>Định dạng dữ liệu cơ bản trong Excel:<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807974 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">2</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370034000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc2" style="tab-stops: 55.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807975">2.1.<span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>C&oacute; tới 4 c&aacute;ch để mở hộp thoại Format Cells<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807975 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">2</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370035000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc2" style="tab-stops: 55.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807976">2.2.<span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>C&oacute; tới 6 thẻ cần quan t&acirc;m trong hộp thoại Format Cells<span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807976 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">4</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370036000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807977"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.1.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng số &ndash; Number</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807977 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">5</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370037000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807978"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.2.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng tiền tệ v&agrave; kế to&aacute;n</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;">. </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807978 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">5</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370038000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807979"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.3.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng ng&agrave;y th&aacute;ng v&agrave; thời gian:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807979 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">6</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900370039000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807980"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.4.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng phần trăm trong Excel:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807980 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">7</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900380030000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807981"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.5.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng ph&acirc;n số trong Excel:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807981 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">7</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900380031000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807982"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.6.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng khoa học:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807982 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">8</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900380032000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807983"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.7.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng dữ liệu kiểu chữ:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807983 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">9</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900380033000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoToc3" style="tab-stops: 77.0pt right dotted 450.8pt;"><span class="MsoHyperlink"><span lang="EN-US" style="mso-no-proof: yes;"><a href="#_Toc131807984"><span style="mso-fareast-font-family: ''Times New Roman'';">2.2.8.</span><span lang="VI" style="font-size: 11.0pt; font-family: ''Arial'',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: ''Times New Roman''; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; color: windowtext; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng đặc biệt &ndash; Special:</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><span style="mso-tab-count: 1 dotted;"> </span></span><!-- [if supportFields]><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''><span style=''mso-element:field-begin''></span></span><span
 style=''color:windowtext;display:none;mso-hide:screen;text-decoration:none;
 text-underline:none''> PAGEREF _Toc131807984 \h </span><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-separator''></span></span><![endif]--><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;">9</span><span style="color: windowtext; display: none; mso-hide: screen; text-decoration: none; text-underline: none;"><!-- [if gte mso 9]><xml>
  <w:data>08D0C9EA79F9BACE118C8200AA004BA90B02000000080000000E0000005F0054006F0063003100330031003800300037003900380034000000</w:data>
 </xml><![endif]--></span><!-- [if supportFields]><span style=''color:windowtext;
 display:none;mso-hide:screen;text-decoration:none;text-underline:none''><span
 style=''mso-element:field-end''></span></span><![endif]--></a></span></span>/n
<p class="MsoNormal"><!-- [if supportFields]><b><span lang=EN-US
 style=''mso-no-proof:yes''><span style=''mso-element:field-end''></span></span></b><![endif]--><span lang="EN-US">&nbsp;</span>/n
<p class="MsoNormal"><span lang="EN-US">&nbsp;</span>/n
<h1 style="margin-left: 29.95pt; text-indent: -18.0pt; mso-list: l0 level1 lfo5;"><a name="_Toc131807973"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">1.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Định dạng dữ liệu trong Excel:</span></h1>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Kh&ocirc;ng c&oacute; phụ nữ xấu, chỉ c&oacute; người photoshop kh&ocirc;ng đẹp. Kh&ocirc;ng c&oacute; bảng Excel xấu, chỉ c&oacute; người tr&igrave;nh b&agrave;y kh&ocirc;ng đẹp.</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">H&ocirc;m nay, ch&uacute;ng ta sẽ đi thăm một chủ đề về l&agrave;m đẹp &ndash; định dạng dữ liệu trong Excel. Những thủ thuật n&agrave;y c&aacute;c bạn c&oacute; thể &aacute;p dụng được cho c&aacute;c phi&ecirc;n bản Excel 2003, Excel 2007, Excel 2010, Excel 2013 v&agrave; Excel 2016 trở l&ecirc;n.</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Về cơ bản th&igrave; Excel hỗ trợ ch&uacute;ng ta những kiểu định dạng sau đ&acirc;y:</span></strong>/n
<ol start="1" type="1">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng số (Number)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng chữ (Text)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng tiền tệ (Currency)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng phần trăm (Percentage)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng trong kế to&aacute;n (Accounting)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng số trong khoa học (Scientific)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l2 level1 lfo1; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng người d&ugrave;ng tự định nghĩa (Custom)</span></li>
</ol>
<h1 style="margin-left: 29.95pt; text-indent: -18.0pt; mso-list: l0 level1 lfo5;"><a name="_Toc131807974"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">2.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">Định dạng dữ liệu cơ bản trong Excel:</span></h1>
<p class="MsoNormal" style="text-align: center; background: white;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/Screen-Shot-2016-07-07-at-07.32.39-300x221.png" alt="Định dạng dữ liệu cơ bản">/n
<p class="MsoNormal" style="text-align: center; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng dữ liệu cơ bản</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Mặc định th&igrave; Excel sẽ lu&ocirc;n định dạng bất k&igrave; những g&igrave; bạn g&otilde; v&agrave;o 1 &ocirc; với kiểu&nbsp;<strong>General.&nbsp;</strong>Excel cũng hỗ trợ rất nhiều kiểu định dạng m&agrave; c&aacute;c bạn c&oacute; thể bấm ngay v&agrave;o &ocirc; Format như tr&ecirc;n h&igrave;nh v&agrave; trọn. Trong h&igrave;nh minh hoạ, c&aacute;c bạn c&oacute; thể thấy được, c&ugrave;ng 1 dữ liệu &ndash; con số&nbsp;<strong>0,234</strong>, với mỗi kiểu định dạng ch&uacute;ng ta sẽ thấy con số n&agrave;y được thể hiện kh&aacute;c đi.</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thủ thuật:</span></strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;muốn biết được dữ liệu thực sự đằng sau 1 &ocirc; l&agrave; g&igrave;, ch&uacute;ng ta cần nh&igrave;n v&agrave;o thanh c&ocirc;ng thức.</span>/n
<h2 style="margin-left: 62.95pt; text-indent: -36.0pt; mso-list: l0 level2 lfo5;"><a name="_Toc131807975"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">2.1.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">C&oacute; tới 4 c&aacute;ch để mở hộp thoại Format Cells</span></h2>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Để định dạng dữ liệu một c&aacute;ch chi tiết nhất, ch&uacute;ng ta sẽ sử dụng hộp thoại Format Cells. C&oacute; 4 c&aacute;ch để c&oacute; thể mở được hộp thoại n&agrave;y như sau:</span>/n
<ol start="1" type="1">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l4 level1 lfo2; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chọn v&ugrave;ng cần định dạng v&agrave; bấm ph&iacute;m tắt&nbsp;<strong>CTRL + 1&nbsp;</strong>(Nhẫn giữ CTRL v&agrave; bấm số 1)</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; text-align: center; mso-list: l4 level1 lfo2; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Chuột phải v&agrave;o v&ugrave;ng cần định dạng v&agrave; chọn trong menu n&agrave;y&nbsp;<strong>Format Cells&hellip;</strong></span></li>
</ol>
<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 36.0pt; text-align: center; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/zformat-cells-excel.png" alt="menu chuột phải format cells "></span>/n
<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 36.0pt; text-align: center; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">menu chuột phải format cells</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 36.0pt;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;</span></strong>/n
<ol start="3" type="1">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l4 level1 lfo2; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Bấm v&agrave;o vị tr&iacute; c&aacute;c mũi t&ecirc;n ở đ&atilde; được khoanh tr&ograve;n đỏ như trong h&igrave;nh vẽ</span></li>
</ol>
<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 36.0pt; background: white;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blog.hocexcel.online/wp-content/uploads/2016/07/open-format-cells-dialog.png" alt="Mở hộp thoại Format Cells">/n
<p class="MsoNormal" style="margin-left: 36pt; background: white; text-align: center;"><span lang="EN-US" style="color: black; mso-color-alt: windowtext;"><a href="https://blog.hocexcel.online/wp-content/uploads/2016/07/open-format-cells-dialog.png"><span lang="VI" style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #1991ee; mso-font-kerning: 0pt; mso-ansi-language: VI; mso-fareast-language: VI; mso-no-proof: yes; text-decoration: none; text-underline: none;"><!--[endif]--></span></a></span><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Mở hộp thoại Format Cells</span>/n
<ol start="4" type="1">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; text-align: center; mso-list: l4 level1 lfo2; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Trong thẻ&nbsp;<strong>Home</strong>, &nbsp;chọn&nbsp;<strong>Format&nbsp;</strong>rồi chọn Format Cells &hellip;</span></li>
</ol>
<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 36.0pt; text-align: center; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/open-format-cells-dialog2.png" alt="Mở hộp thoại Format Cells"></span>/n
<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 36.0pt; text-align: center; background: white;" align="center"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Mở hộp thoại Format Cells</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 36.0pt;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">&nbsp;</span>/n
<h2 style="margin-left: 62.95pt; text-indent: -36.0pt; mso-list: l0 level2 lfo5;"><a name="_Toc131807976"></a><!-- [if !supportLists]--><span lang="vi"><span style="mso-list: Ignore;">2.2.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang="vi">C&oacute; tới 6 thẻ cần quan t&acirc;m trong hộp thoại Format Cells</span></h2>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Sau khi đ&atilde; mở hộp thoại Format Cells rồi, ch&uacute;ng ta sẽ thấy 6 thẻ để c&aacute;c bạn c&oacute; thể định dạng hầu như to&agrave;n bộ một v&ugrave;ng trong Excel:</span>/n
<ul type="disc">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Number</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Alignment</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Font</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Border</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Fill</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l3 level1 lfo3; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Thẻ Protection</span></li>
</ul>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Trong b&agrave;i viết n&agrave;y, ch&uacute;ng ta sẽ t&igrave;m hiểu về thẻ&nbsp;<strong>Number</strong>&nbsp;&ndash; định dạng số liệu.</span>/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807977"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.1.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng số &ndash; Number</span></h3>
<p class="MsoNormal" style="text-align: center; background: white; margin: 15.0pt 0cm 15.0pt 0cm;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/excel-number-format.png" alt="excel-number-format">/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Trong thẻ Number, mục Categories b&ecirc;n tay tr&aacute;i, ch&uacute;ng ta c&oacute; thể thấy được lần lượt c&aacute;c lựa chọn để phục vụ c&ocirc;ng việc định dạng dữ liệu trong Excel.</span>/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Trong mục n&agrave;y, mỗi phần b&ecirc;n tay phải lần lượt c&oacute; &yacute; nghĩa l&agrave;:</span>/n
<ol start="1" type="1">
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l1 level1 lfo4; tab-stops: list 36.0pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Sample</span></strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">: cho ch&uacute;ng ta xem trước, sự thay đổi trong định dạng sẽ ảnh hưởng l&ecirc;n dữ liệu thế n&agrave;o</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l1 level1 lfo4; tab-stops: list 36.0pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Decimal places</span></strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">: d&ugrave;ng để chỉ ra ch&uacute;ng ta cần bao nhi&ecirc;u chữ số sau dấu phẩy ở phần thập ph&acirc;n</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l1 level1 lfo4; tab-stops: list 36.0pt; background: white;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Dấu t&iacute;ch ở mục&nbsp;<strong>Use 1000 Separator (,)</strong>: nếu cần ngăn c&aacute;ch h&agrave;ng ngh&igrave;n, bạn cần đ&aacute;nh dấu t&iacute;ch v&agrave;o đ&acirc;y</span></li>
<li class="MsoNormal" style="color: #2d3847; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-list: l1 level1 lfo4; tab-stops: list 36.0pt; background: white;"><strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Negative numbers</span></strong><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">: sẽ gi&uacute;p bạn điều chỉnh một số &acirc;m sẽ tr&ocirc;ng như thế n&agrave;o</span></li>
</ol>
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807978"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.2.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng tiền tệ v&agrave; kế to&aacute;n</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Với kiểu định dạng tiền tệ v&agrave; kế to&aacute;n, bạn c&oacute; 2 sự lựa chọn<br><strong>Decimal places:</strong>&nbsp;như ph&iacute;a tr&ecirc;n đ&atilde; giải th&iacute;ch, phần n&agrave;y cho biết ch&uacute;ng ta cần bao nhi&ecirc;u chữ số đằng sau dấu phẩy<br><strong>Symbol:</strong>&nbsp;K&yacute; hiệu tiền tệ m&agrave; ch&uacute;ng ta muốn sử dụng</span>/n
<p class="MsoNormal" style="text-align: center; background: white; margin: 15.0pt 0cm 15.0pt 0cm;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/accounting-format.png" alt="accounting-format">/n
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Sự kh&aacute;c nhau giữa kiểu định dạng tiền tệ v&agrave; kiểu định dạng kế to&aacute;n l&agrave;: với kiểu định dạng tiền tệ, k&yacute; hiệu đồng tiền sẽ được viết liền ngay ph&iacute;a trước con số, với kiểu định dạng kế to&aacute;n, k&yacute; hiệu tiền tệ sẽ đưọc viết theo 1 h&agrave;ng căn lề ph&iacute;a b&ecirc;n tr&aacute;i</span>/n
<p class="MsoNormal" style="background: white; margin: 15pt 0cm; text-align: center;"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/currency-accounting-format-excel.png" alt="currency-accounting-format-excel">/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807979"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.3.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng ng&agrave;y th&aacute;ng v&agrave; thời gian:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng ng&agrave;y th&aacute;ng v&agrave; thời gian trong Excel rất phong ph&uacute;, l&yacute; do l&agrave; v&igrave; mỗi nước tr&ecirc;n thế giới c&oacute; kiểu định dạng ng&agrave;y th&aacute;ng v&agrave; thời gian ri&ecirc;ng v&agrave; Excel hỗ trợ hầu hết c&aacute;c định dạng đ&oacute;. Việc c&ograve;n lại l&agrave; c&aacute;c bạn sẽ phải t&igrave;m định dạng ph&ugrave; hợp qua sự lựa chọn trong danh s&aacute;ch&nbsp;<strong>Locale (Location)</strong>&nbsp;v&agrave;&nbsp;<strong>Type</strong>&nbsp;của Excel như trong h&igrave;nh m&agrave; th&ocirc;i.</span>/n
<p class="MsoNormal" style="text-align: center; background: white; margin: 15.0pt 0cm 15.0pt 0cm;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/excel-date-format.png.png" alt="excel-date-format.png">/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807980"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.4.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng phần trăm trong Excel:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Kiểu định dạng phần trăm n&agrave;y chỉ cho ph&eacute;p bạn thay đổi 1 lựa chọn, đ&oacute; l&agrave; số chữ số thập ph&acirc;n đằng sau dấu phẩy</span>/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807981"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.5.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng ph&acirc;n số trong Excel:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Kiểu định dạng n&agrave;y sẽ gi&uacute;p c&aacute;c bạn viết ph&acirc;n số trong Excel. Lưu &yacute; l&agrave; khi bạn muốn nhập dữ liệu l&agrave; ph&acirc;n số trong Excel, bạn kh&ocirc;ng thể nhập được trực tiếp ph&acirc;n số đ&oacute;. VD: để nhập ph&acirc;n số &ldquo;<strong>1/4</strong>&rdquo; th&igrave; bạn phải nhập v&agrave;o&nbsp;<strong>0,25</strong>&nbsp;rồi sử dụng t&iacute;nh năng định dạng ph&acirc;n số của Excel.</span>/n
<p class="MsoNormal" style="text-align: center; background: white; margin: 15.0pt 0cm 15.0pt 0cm;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/excel-fraction-format.png" alt="excel-fraction-format">/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807982"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.6.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng khoa học:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Định dạng khoa học l&agrave; c&aacute;ch Excel d&ugrave;ng để gọi khi biểu diễn những con số rất lớn hoặc rất nhỏ. VD: ch&uacute;ng ta c&oacute; 1 con số rất lớn l&agrave; 20 tỉ, 20 tỉ l&agrave; một con số c&oacute; 10 số 0. Thay v&igrave; viết l&agrave;&nbsp;<strong>20,000,000,000</strong>&nbsp;th&igrave; Excel sẽ biểu diễn con số n&agrave;y dưới dạng&nbsp;<strong>2E+10</strong>. Ngo&agrave;i c&aacute;ch đọc l&agrave; 20 tỉ, th&igrave; ch&uacute;ng ta c&oacute; thể đọc con số n&agrave;y l&agrave; 2 nh&acirc;n 10 mũ 10.<br>Lựa chọn duy nhất trong phần n&agrave;y ch&uacute;ng ta c&oacute; thể thay đổi l&agrave; số chữ số thập ph&acirc;n đằng sau dấu phẩy.</span>/n
<p class="MsoNormal" style="background: white; margin: 15pt 0cm; text-align: center;"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/excel-scientific-notation-format.png" alt="excel-scientific-notation-format">/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807983"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.7.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng dữ liệu kiểu chữ:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Bạn c&oacute; thể chuyển nội dung 1 &ocirc; sang định dạng Text, chỉ cần chọn những &ocirc; cần chuyển v&agrave; chọn định dạng Text. Mặc định trong Excel sẽ căn lề tr&aacute;i cho nội dung Text.</span>/n
<h3 style="margin-left: 77.95pt; text-indent: -36.0pt; mso-list: l0 level3 lfo5;"><a name="_Toc131807984"></a><!-- [if !supportLists]--><span style="mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman'';"><span style="mso-list: Ignore;">2.2.8.<span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp; </span></span></span><!--[endif]--><span style="mso-fareast-font-family: ''Times New Roman'';">Định dạng đặc biệt &ndash; Special:</span></h3>
<p class="MsoNormal" style="background: white; margin: 15.0pt 0cm 15.0pt 0cm;"><span style="font-size: 12.0pt; font-family: ''Be Vietnam Pro'',serif; mso-fareast-font-family: ''Times New Roman''; color: #2d3847; mso-font-kerning: 0pt; mso-ligatures: none; mso-ansi-language: VI; mso-fareast-language: VI;">Với mỗi nước, lại c&oacute; 1 số d&atilde;y số đặc trưng như số điện thoại, m&atilde; số bưu điện, số bảo hiểm an sinh x&atilde; hội. Để định dạng c&aacute;c số n&agrave;y, ch&uacute;ng ta sử dụng mục Special</span>/n
<p class="MsoNormal" style="margin-top: 15.0pt; text-align: center; background: white;" align="center"><img src="https://blog.hocexcel.online/wp-content/uploads/2016/07/excel-special-format.png" alt="excel-special-format">/n
<p class="MsoNormal"><span lang="EN-US">&nbsp;</span>/n', N'041446_dinh-dang-du-lieu-chuan-trong-excel_thumb.png', 6, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Hướng dẫn tạo DS theo tên để quản lý trong Excel', N'Bạn đ&atilde; bao giờ phải lập một danh s&aacute;ch theo t&ecirc;n (danh s&aacute;ch lớp, danh s&aacute;ch sinh vi&ecirc;n&hellip;) v&agrave; quản l&yacute; ch&uacute;ng chưa? Nếu c&ograve;n đang băn khoăn về c&aacute;ch tạo một danh s&aacute;ch đơn giản, h&atilde;y đọc b&agrave;i viết sau đ&acirc;y của Học Excel Online: Tạo danh s&aacute;ch theo t&ecirc;n trong Excel. Như thường lệ, ta sẽ bắt đầu từ một bảng trắng v&agrave; c&ocirc;ng việc cần l&agrave;m l&agrave; tạo một&nbsp;<strong>danh s&aacute;ch lớp</strong>./n
<figure id="attachment_23846" class="wp-caption aligncenter" aria-describedby="caption-attachment-23846"><img class="size-large wp-image-23846" style="display: block; margin-left: auto; margin-right: auto;" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1-1024x530.png" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1-1024x530.png 1024w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1-600x311.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1-300x155.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1-768x397.png 768w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-1.png 1366w" alt="" width="1024" height="530">
<figcaption id="caption-attachment-23846" class="wp-caption-text">Tạo danh s&aacute;ch theo t&ecirc;n từ bảng trắng</figcaption>
</figure>
<h3><span id="Tao_danh_sach_theo_ten_trong_Excel" class="ez-toc-section"></span>Tạo danh s&aacute;ch theo t&ecirc;n trong Excel</h3>
<h4><span id="Xay_dung_khung_va_nhap_du_lieu" class="ez-toc-section"></span>X&acirc;y dựng khung v&agrave; nhập dữ liệu</h4>
Tưởng tượng rằng bạn tiếp nhận một tập hồ sơ lộn xộn của học sinh v&agrave;o lớp 10A1 v&agrave; phải l&agrave;m một bảng, trong đ&oacute; bao gồm c&aacute;c th&ocirc;ng tin cơ bản:/n
<ul>
<li>Số thứ tự</li>
<li>M&atilde; số</li>
<li>Họ t&ecirc;n</li>
<li>Giới t&iacute;nh</li>
<li>Ng&agrave;y sinh</li>
</ul>
B&acirc;y giờ, h&atilde;y bắt tay v&agrave;o x&acirc;y dựng khung cho bảng./n
<figure id="attachment_23849" class="wp-caption aligncenter" aria-describedby="caption-attachment-23849"><img class="size-full wp-image-23849" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-2.png" sizes="(max-width: 535px) 100vw, 535px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-2.png 535w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-2-300x69.png 300w" alt="" width="535" height="123">
<figcaption id="caption-attachment-23849" class="wp-caption-text">Thiết lập c&aacute;c ti&ecirc;u đề</figcaption>
</figure>
&nbsp;/n
<figure id="attachment_23850" class="wp-caption aligncenter" aria-describedby="caption-attachment-23850"><img class="size-full wp-image-23850" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-3.png" sizes="(max-width: 536px) 100vw, 536px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-3.png 536w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-3-300x217.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-3-345x250.png 345w" alt="" width="536" height="388">
<figcaption id="caption-attachment-23850" class="wp-caption-text">Tiến h&agrave;nh nhập dữ liệu</figcaption>
</figure>
&nbsp;/n
<figure id="attachment_23852" class="wp-caption aligncenter" aria-describedby="caption-attachment-23852"><img class="size-full wp-image-23852" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-5.png" sizes="(max-width: 160px) 100vw, 160px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-5.png 160w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-5-122x300.png 122w" alt="" width="160" height="394">
<figcaption id="caption-attachment-23852" class="wp-caption-text">Ho&agrave;n th&agrave;nh giới t&iacute;nh v&agrave; ng&agrave;y sinh</figcaption>
</figure>
&nbsp;/n
Tại sao ta chưa l&agrave;m số thứ tự? Bởi v&igrave; trước đ&oacute; cần phải&nbsp;<strong>sắp xếp&nbsp;</strong>đ&atilde;./n
<h3><span id="Sap_xep_du_lieu_bang_tinh_theo_ten" class="ez-toc-section"></span>Sắp xếp dữ liệu bảng t&iacute;nh theo t&ecirc;n</h3>
Để thực hiện sắp xếp, ta sử dụng thao t&aacute;c sort như sau:/n
<strong>Bước 1:&nbsp;</strong>Chọn to&agrave;n bộ bảng t&iacute;nh bằng c&aacute;ch k&eacute;o thả./n
<strong>Bước 2:&nbsp;</strong>Tại thẻ&nbsp;<strong>Data</strong>, nh&oacute;m&nbsp;<strong>Sort &amp; Filter</strong>, chọn&nbsp;<strong>Sort</strong>./n
<strong>Bước 3:&nbsp;</strong>Trong hộp thoại&nbsp;<strong>Sort</strong>, chọn&nbsp;<strong>Sort by&nbsp;</strong>để thiết lập sắp xếp theo danh s&aacute;ch n&agrave;o<strong>, Sort on</strong>&nbsp;để chọn kiểu sắp xếp<strong>, Order</strong>&nbsp;chọn thứ tự sắp xếp./n
Tuy nhi&ecirc;n, khi&nbsp;<strong>Sort by</strong>&nbsp;<em>Họ t&ecirc;n</em>, kết quả trả về sẽ như n&agrave;y:/n
<img class="aligncenter size-full wp-image-23853" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-6.png" sizes="(max-width: 426px) 100vw, 426px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-6.png 426w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-6-283x300.png 283w" alt="" width="426" height="452">/n
L&yacute; do ở đ&acirc;y Excel căn cứ theo thứ tự&nbsp;<strong>tr&aacute;i sang phải</strong>, nghĩa l&agrave; bạn đang l&agrave;m thao t&aacute;c sắp xếp theo&nbsp;<strong>Họ</strong>&nbsp;chứ kh&ocirc;ng phải&nbsp;<strong>T&ecirc;n</strong>./n
Để sắp xếp theo t&ecirc;n, một c&aacute;ch đơn giản l&agrave; ta sẽ d&ugrave;ng trợ gi&uacute;p của cột phụ&nbsp;<strong>T&ecirc;n:</strong>/n
&nbsp;/n
<figure id="attachment_23854" class="wp-caption aligncenter" aria-describedby="caption-attachment-23854"><img class="size-full wp-image-23854" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-7.png" sizes="(max-width: 394px) 100vw, 394px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-7.png 394w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-7-276x300.png 276w" alt="" width="394" height="428">
<figcaption id="caption-attachment-23854" class="wp-caption-text">Click chuột phải, chọn Insert</figcaption>
</figure>
&nbsp;/n
<figure id="attachment_23855" class="wp-caption aligncenter" aria-describedby="caption-attachment-23855"><img class="size-full wp-image-23855" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-8.png" sizes="(max-width: 514px) 100vw, 514px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-8.png 514w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-8-300x264.png 300w" alt="" width="514" height="452">
<figcaption id="caption-attachment-23855" class="wp-caption-text">Copy to&agrave;n bộ họ v&agrave; t&ecirc;n sang</figcaption>
</figure>
Nếu c&aacute;c bạn đ&atilde; từng đọc&nbsp;<a href="https://blog.hocexcel.online/69-%E2%97%8F-tach-ten-ho-va-ten-dem-trong-excel-khong-dung-cong-thuc.html">b&agrave;i viết n&agrave;y</a>, chắc hẳn c&aacute;c bạn sẽ biết l&yacute; do ta copy sang phải kh&ocirc;ng n&agrave;o?/n
Ta sẽ sử dụng chức năng&nbsp;<strong>Replace&nbsp;</strong>trong trường hợp n&agrave;y để&nbsp;<strong>t&aacute;ch t&ecirc;n từ họ v&agrave; t&ecirc;n.</strong>/n
<img class="aligncenter size-large wp-image-23856" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9-1024x534.png" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9-1024x534.png 1024w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9-600x313.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9-300x157.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9-768x401.png 768w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-9.png 1261w" alt="" width="1024" height="534">/n
V&agrave; kết quả:/n
<img class="aligncenter size-full wp-image-23857" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10.png" sizes="(max-width: 463px) 100vw, 463px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10.png 463w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10-100x100.png 100w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10-296x300.png 296w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10-115x115.png 115w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-10-65x65.png 65w" alt="" width="463" height="469">/n
&nbsp;/n
B&acirc;y giờ, ta sẽ sử dụng&nbsp;<strong>SORT</strong>&nbsp;một lần nữa cho cột&nbsp;<strong>T&ecirc;n</strong>. Đ&aacute;p &aacute;n c&aacute;c bạn đều đo&aacute;n ra được rồi phải kh&ocirc;ng?/n
Sau khi&nbsp;<strong>Sort</strong>, h&atilde;y ẩn cột&nbsp;<strong>T&ecirc;n</strong>&nbsp;đi, sau đ&oacute; nhập&nbsp;<strong>Số thứ tự&nbsp;</strong>n&agrave;o./n
<figure id="attachment_23851" class="wp-caption aligncenter" aria-describedby="caption-attachment-23851"><img class="size-full wp-image-23851" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-4.png" sizes="(max-width: 388px) 100vw, 388px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-4.png 388w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-4-300x170.png 300w" alt="" width="388" height="220">
<figcaption id="caption-attachment-23851" class="wp-caption-text">Tiến h&agrave;nh đ&aacute;nh số thứ tự</figcaption>
</figure>
Vậy l&agrave; về cơ bản, ta đ&atilde; c&oacute; một bảng danh s&aacute;ch rồi./n
<img class="aligncenter size-full wp-image-23858" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-11.png" sizes="(max-width: 510px) 100vw, 510px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-11.png 510w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-11-300x267.png 300w" alt="" width="510" height="454">/n
&nbsp;/n
H&atilde;y c&ugrave;ng ho&agrave;n thiện bảng t&iacute;nh!/n
<h3><span id="Dinh_dang_trang_tri_trinh_bay_danh_sach_hoan_chinh" class="ez-toc-section"></span>Định dạng, trang tr&iacute;, tr&igrave;nh b&agrave;y danh s&aacute;ch ho&agrave;n chỉnh</h3>
<img class="aligncenter size-full wp-image-23695" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/countif-lap-so-thu-tu-11.png" sizes="(max-width: 887px) 100vw, 887px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/countif-lap-so-thu-tu-11.png 887w, https://blog.hocexcel.online/wp-content/uploads/2018/11/countif-lap-so-thu-tu-11-600x138.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/11/countif-lap-so-thu-tu-11-300x69.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/11/countif-lap-so-thu-tu-11-768x177.png 768w" alt="" width="887" height="204">/n
H&atilde;y sử dụng những c&ocirc;ng cụ tr&ecirc;n để ho&agrave;n thiện bảng t&iacute;nh nh&eacute;./n
<figure id="attachment_23859" class="wp-caption aligncenter" aria-describedby="caption-attachment-23859"><img class="wp-image-23859 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-12.png" sizes="(max-width: 613px) 100vw, 613px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-12.png 613w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-12-600x142.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/11/bang-danh-sach-12-300x71.png 300w" alt="" width="613" height="145">
<figcaption id="caption-attachment-23859" class="wp-caption-text">Một ti&ecirc;u đề bắt mắt sẽ l&agrave;m bảng t&iacute;nh tr&ocirc;ng đẹp hơn nhiều</figcaption>
</figure>
Tr&ecirc;n đ&acirc;y l&agrave; những bước căn bản nhất để tạo lập một danh s&aacute;ch theo t&ecirc;n ho&agrave;n chỉnh. Hy vọng những kiến thức n&agrave;y sẽ gi&uacute;p &iacute;ch cho c&aacute;c bạn trong qu&aacute; tr&igrave;nh học tập l&agrave;m việc, xử l&iacute; y&ecirc;u cầu một c&aacute;ch dễ d&agrave;ng hơn./n
Ch&uacute;c c&aacute;c bạn học tốt!/n', N'thu-thuat-excel.jpg', 7, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Hướng dẫn cách vẽ biểu đồ trong Excel 2013 2016', N'<h2>C&aacute;c ti&ecirc;u chuẩn về dữ liệu cho biểu&nbsp;đồ</h2>
Một trong những quan niệm sai lầm hay gặp phải khi muốn&nbsp;<strong>vẽ biểu&nbsp;đồ tr&ecirc;n&nbsp;Excel&nbsp;</strong>đ&oacute; l&agrave;: Bất kỳ dữ liệu n&agrave;o cũng vẽ th&agrave;nh biểu&nbsp;đồ&nbsp;được./n
Điều n&agrave;y g&acirc;y ra c&aacute;c lỗi rất kh&oacute; chữa,&nbsp;đ&oacute; l&agrave;:/n
<ul>
<li>Kh&ocirc;ng&nbsp;biết chọn loại biểu&nbsp;đồ n&agrave;o.</li>
<li>Dữ liệu biểu diễn kh&ocirc;ng&nbsp;đ&uacute;ng tr&ecirc;n biểu&nbsp;đồ.</li>
<li>Thiếu hoặc thừa nội dung cần biểu diễn.</li>
<li>Biểu&nbsp;đồ sai m&agrave; kh&ocirc;ng biết nguy&ecirc;n nh&acirc;n, kh&ocirc;ng biết sửa thế n&agrave;o cho&nbsp;đ&uacute;ng.</li>
</ul>
Đ&oacute; l&agrave; l&yacute; do tại sao ch&uacute;ng ta cần phải biết về c&aacute;c ti&ecirc;u chuẩn về dữ liệu cho biểu&nbsp;đồ. Khi tu&acirc;n thủ c&aacute;c ti&ecirc;u chuẩn n&agrave;y, ch&uacute;ng ta c&oacute; thể tự tin vẽ&nbsp;được biểu&nbsp;đồ&nbsp;đ&uacute;ng.&nbsp;Đ&oacute; l&agrave;:/n
<strong>Ti&ecirc;u chuẩn 1: Dữ liệu&nbsp;đ&atilde;&nbsp;được tổng hợp lại, kh&ocirc;ng phải dữ liệu chi tiết.&nbsp;</strong>/n
Dữ liệu chi tiết tức l&agrave;&nbsp;c&ugrave;ng 1&nbsp;đối tượng nhưng xuất hiện nhiều lần, tr&ecirc;n nhiều d&ograve;ng, mỗi d&ograve;ng thể hiện 1 nội dung chi tiết./n
Khi&nbsp;đ&oacute; tr&ecirc;n bảng dữ liệu, ch&uacute;ng ta thấy c&oacute; rất nhiều d&ograve;ng. Mỗi&nbsp;đối tượng lại xuất hiện nhiều lần. Do&nbsp;đ&oacute; nếu vẽ ngay tr&ecirc;n bảng dữ liệu chi tiết, ch&uacute;ng ta rất kh&oacute;&nbsp;để x&aacute;c&nbsp;định&nbsp;đ&uacute;ng&nbsp;được tr&ecirc;n biểu&nbsp;đồ bởi v&igrave; biểu&nbsp;đồ&nbsp;<strong>kh&ocirc;ng c&oacute;</strong> chức năng tự tổng hợp dữ liệu. Việc tổng hợp phải l&agrave;m trước khi vẽ biểu&nbsp;đồ./n
<em>Dựa tr&ecirc;n ti&ecirc;u chuẩn n&agrave;y ch&uacute;ng ta sẽ vẽ&nbsp;được biểu&nbsp;đồ thể hiện đ&uacute;ng v&agrave;&nbsp;đầy&nbsp;đủ nội dung.</em>/n
<strong>Ti&ecirc;u chuẩn 2: Dữ liệu vẽ biểu&nbsp;đồ phải thống nhất về định dạng&nbsp;v&agrave; loại dữ liệu</strong>/n
Ti&ecirc;u chuẩn thứ 2 khi muốn&nbsp;<strong>vẽ biểu đồ trong excel</strong>&nbsp;l&agrave; sự thống nhất bao gồm c&aacute;c ti&ecirc;u ch&iacute;:/n
<ul>
<li>C&aacute;c dữ liệu phải&nbsp;c&ugrave;ng loại: c&ugrave;ng l&agrave; Text hoặc c&ugrave;ng l&agrave; Number, % chứ kh&ocirc;ng&nbsp;được lẫn lộn giữa c&aacute;c loại n&agrave;y.</li>
<li>C&aacute;c dữ liệu c&ugrave;ng loại phải nằm tr&ecirc;n c&ugrave;ng 1 h&agrave;ng hoặc c&ugrave;ng 1 cột.</li>
</ul>
<em>Dựa tr&ecirc;n c&aacute;c dạng dữ liệu n&agrave;y ch&uacute;ng ta c&oacute; thể x&aacute;c&nbsp;định&nbsp;được dạng biểu&nbsp;đồ ph&ugrave; hợp.</em>/n
<strong>Ti&ecirc;u chuẩn 3: C&aacute;c trường dữ liệu (t&ecirc;n cột, t&ecirc;n h&agrave;ng) phải c&oacute; nội dung r&otilde; r&agrave;ng.</strong>/n
Việc n&agrave;y&nbsp;ảnh hưởng khi vẽ l&ecirc;n biểu&nbsp;đồ, ch&uacute;ng ta c&oacute; thể gặp t&igrave;nh trạng: kh&ocirc;ng biết c&aacute;c th&agrave;nh phần của biểu&nbsp;đồ thể hiện nội dung g&igrave;. Phải x&aacute;c&nbsp;định r&otilde; c&aacute;c nội dung th&igrave; mới&nbsp;đọc&nbsp;được&nbsp;&yacute; nghĩa của biểu&nbsp;đồ./n
<em>Dựa tr&ecirc;n ti&ecirc;u chuẩn n&agrave;y ch&uacute;ng ta sẽ x&aacute;c&nbsp;định&nbsp;được&nbsp;&yacute; nghĩa của từng nội dung&nbsp;được thể hiện tr&ecirc;n biểu&nbsp;đồ.</em>/n
<h2><span id="Cac_buoc_ve_bieu_do_trong_Excel" class="ez-toc-section"></span>C&aacute;c bước vẽ biểu&nbsp;đồ trong&nbsp;Excel</h2>
Trong Excel th&igrave; ở mỗi 1 phi&ecirc;n bản c&oacute; một số sự cải tiến trong việc vẽ biểu đồ, đặc biệt từ phi&ecirc;n bản Excel 2013 v&agrave; 2016 trở đi. Trong c&aacute;c phi&ecirc;n bản n&agrave;y c&oacute; hỗ trợ th&ecirc;m nhiều loại biểu đồ mới, c&aacute;ch t&ugrave;y biến biểu đồ đa dạng hơn. Trong phạm vi b&agrave;i viết n&agrave;y, ch&uacute;ng ta sẽ t&igrave;m hiểu<strong>&nbsp;c&aacute;ch vẽ biểu đồ trong Excel</strong>&nbsp;&aacute;p dụng cho mọi phi&ecirc;n bản./n
<strong>Bước 1</strong>: Chọn bảng dữ liệu cần vẽ biểu&nbsp;đồ/n
<strong>Bước 2</strong>: Trong thẻ&nbsp;<strong>Insert</strong>, chọn nh&oacute;m&nbsp;<strong>Chart</strong>&nbsp;v&agrave; chọn loại biểu&nbsp;đồ ph&ugrave; hợp/n
&nbsp;/n
&nbsp;/n
<img class="aligncenter wp-image-23129 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/10/Nhom-chart-trong-the-insert.png" sizes="(max-width: 553px) 100vw, 553px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/10/Nhom-chart-trong-the-insert.png 553w, https://blog.hocexcel.online/wp-content/uploads/2018/10/Nhom-chart-trong-the-insert-300x82.png 300w" alt="cach-ve-bieu-do-trong-excel-1" width="553" height="151">/n
<strong>Bước 3</strong>: Vẽ ra vị tr&iacute; bất kỳ trong Sheet/n
Nếu biểu&nbsp;đồ chưa&nbsp;đ&uacute;ng hoặc&nbsp;cần thay&nbsp;đổi dữ liệu nạp v&agrave;o biểu&nbsp;đồ, chọn thẻ&nbsp;<strong>Chart Tools</strong>&nbsp;(thẻ n&agrave;y xuất hiện khi bấm chọn biểu&nbsp;đồ), chọn tiếp thẻ&nbsp;<strong>Design</strong>, rồi chọn tới chức năng&nbsp;<strong>Select Data</strong>/n
&nbsp;/n
<img class="aligncenter wp-image-23130 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/10/Design-select-data-cho-bieu-do.png" sizes="(max-width: 533px) 100vw, 533px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/10/Design-select-data-cho-bieu-do.png 533w, https://blog.hocexcel.online/wp-content/uploads/2018/10/Design-select-data-cho-bieu-do-300x111.png 300w" alt="cach-ve-bieu-do-trong-excel-2" width="533" height="198">/n
<strong>Bước 4</strong>:&nbsp;Trang tr&iacute; biểu&nbsp;đồ/n
<h2><span id="Cach_thay_doi_du_lieu_nap_vao_bieu_do" class="ez-toc-section"></span>C&aacute;ch thay&nbsp;đổi dữ liệu nạp v&agrave;o biểu&nbsp;đồ</h2>
Trong c&aacute;c bước vẽ biểu&nbsp;đồ&nbsp;ở tr&ecirc;n, ch&uacute;ng ta thấy&nbsp;ở bước 3 c&oacute; n&oacute;i tới việc ch&uacute;ng ta c&oacute; thể thay&nbsp;đổi dữ liệu nạp v&agrave;o biểu&nbsp;đồ, gi&uacute;p biểu&nbsp;đồ thể hiện&nbsp;đ&uacute;ng hơn so với mong muốn. Vậy ch&uacute;ng ta sẽ thực hiện việc n&agrave;y thế n&agrave;o?/n
<img class="aligncenter wp-image-23132 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/10/Cua-so-select-data-chart.png" sizes="(max-width: 712px) 100vw, 712px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/10/Cua-so-select-data-chart.png 712w, https://blog.hocexcel.online/wp-content/uploads/2018/10/Cua-so-select-data-chart-600x342.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/10/Cua-so-select-data-chart-300x171.png 300w" alt="cach-ve-bieu-do-trong-excel-3" width="712" height="406">/n
<strong>Chart Data Source</strong>: Nguồn dữ liệu nạp v&agrave;o biểu&nbsp;đồ: To&agrave;n bộ c&aacute;c dữ liệu&nbsp;được&nbsp;đưa v&agrave;o biểu&nbsp;đồ. C&oacute; thể kh&ocirc;ng c&oacute; t&iacute;nh li&ecirc;n tục m&agrave; từng v&ugrave;ng ri&ecirc;ng/n
<strong>Legend Entries (Series)</strong>: Dữ liệu&nbsp;được biểu diễn theo trục tung: Chiều cao của c&aacute;c cột trong biểu đồ,&nbsp;độ lớn của c&aacute;c mảnh trong biểu&nbsp;đồ&nbsp;h&igrave;nh tr&ograve;n&hellip;&nbsp;được thể hiện qua phần n&agrave;y/n
<strong>Horizontal (category)&nbsp;Axis Labels</strong>: Dữ liệu&nbsp;được biểu diễn theo trục ho&agrave;ng: nội dung&nbsp;đại diện cho&nbsp;&nbsp;c&aacute;c cột, c&aacute;c mảnh&hellip; tr&ecirc;n biểu&nbsp;đồ/n
<img class="aligncenter wp-image-22634 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/10/Change-data-tu-bieu-do.png" sizes="(max-width: 589px) 100vw, 589px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/10/Change-data-tu-bieu-do.png 589w, https://blog.hocexcel.online/wp-content/uploads/2018/10/Change-data-tu-bieu-do-300x284.png 300w" alt="cach-ve-bieu-do-trong-excel-4" width="589" height="558">/n
<em>V&iacute; dụ về việc thiết lập thay đổi dữ liệu trong biểu đồ</em>/n
<h2><span id="Cach_trang_tri_bieu_do_dep_mat" class="ez-toc-section"></span>C&aacute;ch trang tr&iacute; biểu&nbsp;đồ&nbsp;đẹp mắt</h2>
Trang tr&iacute; biểu&nbsp;đồ thường l&agrave; bước cuối c&ugrave;ng, nhưng cũng l&agrave; bước rất quan trọng v&igrave; biểu&nbsp;đồ l&agrave;m ra&nbsp;để người kh&aacute;c xem. Do&nbsp;đ&oacute; hiệu quả thẩm mỹ m&agrave; biểu&nbsp;đồ mang lại sẽ tăng t&iacute;nh thuyết phục người xem. Một biểu&nbsp;đồ&nbsp;đẹp thường bao gồm c&aacute;c yếu tố:/n
<ul>
<li>Nội dung thể hiện&nbsp;đ&uacute;ng</li>
<li>C&oacute; t&ecirc;n biểu&nbsp;đồ v&agrave; t&ecirc;n c&aacute;c mốc tr&ecirc;n trục tọa&nbsp;độ r&otilde; r&agrave;ng</li>
<li>C&aacute;c th&agrave;nh phần&nbsp;được c&aacute;ch&nbsp;đều nhau hoặc theo tỷ lệ&nbsp;c&acirc;n&nbsp;đối</li>
<li>C&aacute;ch phối m&agrave;u&nbsp;đồng nhất, gọn g&agrave;ng, c&agrave;ng&nbsp;đơn giản c&agrave;ng tốt.</li>
</ul>
Để th&ecirc;m c&aacute;c th&agrave;nh phần của biểu&nbsp;đồ như: T&ecirc;n biểu&nbsp;đồ, t&ecirc;n c&aacute;c trục, số liệu k&egrave;m theo với từng phần nội dung biểu&nbsp;đồ&hellip; th&igrave; ch&uacute;ng ta sẽ th&ecirc;m&nbsp;ở mục&nbsp;<strong>Add Chart Element</strong>&nbsp;trong thẻ&nbsp;<strong>Design</strong>&nbsp;của&nbsp;<strong>Chart Tools</strong>/n
<img class="alignnone wp-image-21140 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2018/08/mos-excel-2010-add-element.png" sizes="(max-width: 922px) 100vw, 922px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/08/mos-excel-2010-add-element.png 922w, https://blog.hocexcel.online/wp-content/uploads/2018/08/mos-excel-2010-add-element-600x239.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/08/mos-excel-2010-add-element-300x119.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/08/mos-excel-2010-add-element-768x306.png 768w" alt="cach-ve-bieu-do-trong-excel-5" width="922" height="367">/n
C&aacute;c nội dung trong Chart Element bao gồm:/n
<ul>
<li><strong>Axes</strong>: Chia tỷ lệ tr&ecirc;n c&aacute;c trục tọa&nbsp;độ</li>
<li><strong>Axis Titles</strong>: T&ecirc;n ti&ecirc;u&nbsp;đề của từng phần tr&ecirc;n mỗi trục tọa&nbsp;độ</li>
<li><strong>Chart Title</strong>: T&ecirc;n biểu&nbsp;đồ</li>
<li><strong>Data Labels</strong>: Nh&atilde;n số liệu tr&ecirc;n c&aacute;c nội dung biểu&nbsp;đồ</li>
<li><strong>Data Table</strong>: Dữ liệu của c&aacute;c nội dung biểu&nbsp;đồ thể hiện dưới dạng bảng</li>
<li><strong>Error Bar</strong>: Thanh hiển thị lỗi/độ lệch của biểu&nbsp;đồ</li>
<li><strong>Gridlines</strong>:&nbsp;đường kẻ mờ l&agrave;m nền trong biểu&nbsp;đồ</li>
<li><strong>Legend</strong>: Ghi ch&uacute; cho c&aacute;c&nbsp;đối tượng thể hiện trong biểu&nbsp;đồ</li>
<li><strong>Lines</strong>:&nbsp;Đường kẻ d&oacute;ng xuống trục ho&agrave;nh (chỉ&nbsp;&aacute;p dụng cho biểu&nbsp;đồ dạng Line)</li>
<li><strong>Trendline</strong>:&nbsp;Đường xu hướng của biểu&nbsp;đồ.</li>
</ul>
Trong mỗi nh&oacute;m tr&ecirc;n lại c&oacute; những&nbsp;đối tượng cụ thể, vị tr&iacute; cụ thể&nbsp;để ch&uacute;ng ta chọn cho ph&ugrave; hợp./n', N'huong-dan-ve-bieu-do-trong-excel-don-gian-dep-mat-4-760x367.jpg', 8, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Tìm hiểu về chức năng Khóa và Bảo mật trong Excel', N'Khi l&agrave;m việc tr&ecirc;n&nbsp;Excel, việc thao t&aacute;c tr&ecirc;n nhiều dữ liệu, nhiều sheet, nhiều&nbsp;workbook, nhiều người c&ugrave;ng l&agrave;m việc tr&ecirc;n 1 bảng t&iacute;nh dẫn tới nhu cầu cần&nbsp;được bảo mật dữ liệu, tr&aacute;nh việc tự&nbsp;&yacute; sửa, x&oacute;a, mở&nbsp;workbook. Trong b&agrave;i học n&agrave;y ch&uacute;ng ta c&ugrave;ng t&igrave;m hiểu về&nbsp;<a href="https://blog.hocexcel.online/cach-khoa-va-mo-cac-o-trong-excel.html"><strong>chức năng kh&oacute;a v&agrave; bảo mật trong&nbsp;excel</strong></a> nh&eacute;./n
<h2><span id="Tong_quan" class="ez-toc-section"></span>Tổng quan</h2>
C&oacute; nhiều cấp&nbsp;độ bảo mật&nbsp;trong&nbsp;excel&nbsp;như:/n
<ul>
<li>Bảo vệ khi mở file&nbsp;Excel (Protect an&nbsp;Excel file): ngăn người d&ugrave;ng tự&nbsp;&yacute; mở file&nbsp;Excel, bao gồm mở chỉ để xem nội dung&nbsp;hoặc mở&nbsp;để xem v&agrave; sửa nội dung trong file.</li>
<li>Bảo vệ cấu tr&uacute;c Workbook (Protect&nbsp;Workbook): ngăn người d&ugrave;ng tự&nbsp;&yacute; thay&nbsp;đổi c&aacute;c sheet trong&nbsp;workbook:&nbsp;đổi t&ecirc;n, th&ecirc;m mới, x&oacute;a, ẩn, bỏ ẩn&hellip; m&agrave; những việc&nbsp;đ&oacute;&nbsp;ảnh hưởng tới cấu tr&uacute;c của&nbsp;workbook.</li>
<li>Bảo vệ nội dung trong 1 sheet (Protect Sheet): ngăn người d&ugrave;ng tự&nbsp;&yacute; thay&nbsp;đổi nội dung của 1&nbsp;&ocirc; hay 1 v&ugrave;ng trong&nbsp;&ocirc;, bao gồm nhiều t&ugrave;y chọn&nbsp;để c&oacute; thể cho ph&eacute;p hay kh&ocirc;ng cho ph&eacute;p sử dụng một v&agrave;i t&iacute;nh năng trong khi sheet&nbsp;đang bị kh&oacute;a.</li>
<li>Bảo vệ th&ocirc;ng qua thiết lập bảo vệ trong VBA</li>
</ul>
Tuy c&oacute; nhiều cấp&nbsp;độ bảo mật nhưng t&iacute;nh năng bảo mật trong&nbsp;Excel lại dễ bị ph&aacute;. V&igrave; vậy mục&nbsp;đ&iacute;ch ch&iacute;nh của việc bảo mật trong&nbsp;excel nhằm tr&aacute;nh cho người sử dụng c&oacute; những lỗi v&ocirc;&nbsp;&yacute; l&agrave;m mất dữ liệu hoặc ph&aacute; vỡ t&iacute;nh li&ecirc;n kết sẵn c&oacute; của nội dung trong&nbsp;Excel./n
<h2><span id="Nhung_buoc_bao_ve_co_ban" class="ez-toc-section"></span>Những bước bảo vệ cơ bản</h2>
<h3><span id="Bao_ve_khi_mo_file_Excel_File_Protect" class="ez-toc-section"></span>Bảo vệ khi mở file&nbsp;Excel (File Protect)</h3>
Với phi&ecirc;n bản&nbsp;Excel 2007 trở về sau việc kh&oacute;a file&nbsp;được thực hiện&nbsp;ở cửa sổ Lưu File/n
Bấm&nbsp; chọn Save&nbsp;as (ph&iacute;m tắt F12)&nbsp;để mở cửa sổ Lưu file. Trong cửa sổ Lưu file ch&uacute;ng ta ch&uacute;&nbsp;&yacute; v&agrave;o mục Tools cạnh n&uacute;t Save/n
<img class="size-full wp-image-13150 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-01.png" sizes="(max-width: 942px) 100vw, 942px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-01.png 942w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-01-600x399.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-01-300x199.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-01-768x510.png 768w" alt="" width="942" height="626">/n
Bấm v&agrave;o mục&nbsp;<strong><em>Tool</em></strong>&nbsp;&gt;&nbsp;<strong><em>General Options&hellip;</em></strong>/n
<img class="size-full wp-image-13151 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-02.png" sizes="(max-width: 954px) 100vw, 954px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-02.png 954w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-02-600x205.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-02-300x103.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-02-768x262.png 768w" alt="" width="954" height="326">/n
Trong cửa sổ General Options, ch&uacute;ng ta c&oacute; c&aacute;c chức năng sau:/n
<img class="size-full wp-image-13152 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-03.png" sizes="(max-width: 942px) 100vw, 942px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-03.png 942w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-03-600x397.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-03-300x198.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-03-768x508.png 768w" alt="" width="942" height="623">/n
<ul>
<li>Always creat backup : Lu&ocirc;n tạo 1 bản lưu dự ph&ograve;ng cho file của ch&uacute;ng ta, nhằm mục&nbsp;đ&iacute;ch ch&uacute;ng ta kh&ocirc;ng mở lại&nbsp;được file gốc (qu&ecirc;n mật khẩu)</li>
<li>Password to open: Mật khẩu&nbsp;để mở file. Khi&nbsp;đặt mật khẩu mở file th&igrave; mỗi khi mở file&nbsp;Excel&nbsp;đều sẽ y&ecirc;u cầu phải nhập mật khẩu mới cho ph&eacute;p ch&uacute;ng ta truy cập v&agrave;o nội dung file</li>
<li>Password to modify: Mật khẩu&nbsp;để sửa file. Ngo&agrave;i việc mở file&nbsp;để xem nội dung, ch&uacute;ng ta c&oacute; thể thiết lập&nbsp;để kh&ocirc;ng cho ph&eacute;p người kh&aacute;c tự&nbsp;&yacute; sửa file khi&nbsp;đ&atilde; mở&nbsp;được file, muốn sửa cần phải c&oacute; mật khẩu&nbsp;để mở lớp bảo vệ n&agrave;y.</li>
<li>Read-only recommended: khuyến c&aacute;o file chỉ n&ecirc;n&nbsp;đọc. Khi file&nbsp;excel của ch&uacute;ng ta c&oacute; t&igrave;nh trạng bảo vệ mở v&agrave; sửa file th&igrave; ch&uacute;ng ta c&oacute; thể&nbsp;đặt 1 th&ocirc;ng b&aacute;o tới người mở file rằng chỉ n&ecirc;n&nbsp;đọc chứ kh&ocirc;ng n&ecirc;n sửa nội dung,&nbsp;nhằm tr&aacute;nh g&acirc;y ra những sai s&oacute;t do việc kh&ocirc;ng hiểu cấu tr&uacute;c nội dung của file.</li>
</ul>
<h3><span id="Bao_ve_WorkSheet_Protect_Workbook" class="ez-toc-section"></span>Bảo vệ&nbsp;WorkSheet (Protect&nbsp;Workbook)</h3>
Trong tab Review, ch&uacute;ng ta ch&uacute;&nbsp;&yacute; tới chức năng Protect&nbsp;Workbook. Khi sử dụng chức năng n&agrave;y ch&uacute;ng ta c&oacute; thể thiết lập bảo vệ cho cấu tr&uacute;c của&nbsp;Workbook, tr&aacute;nh việc người d&ugrave;ng tự&nbsp;&yacute; sửa, x&oacute;a sheet, thay&nbsp;đổi vị tr&iacute; c&aacute;c cấu tr&uacute;c trong&nbsp;workbook./n
<img class="alignnone size-full wp-image-13156" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04.png" sizes="(max-width: 1144px) 100vw, 1144px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04.png 1144w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04-600x174.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04-300x87.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04-768x223.png 768w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-04-1024x297.png 1024w" alt="" width="1144" height="332">/n
Khi sử dụng chức năng Protect&nbsp;Workbook, sẽ hiện l&ecirc;n cửa sổ Nhập mật khẩu:/n
<img class="size-full wp-image-13157 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-05.png" sizes="(max-width: 917px) 100vw, 917px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-05.png 917w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-05-600x322.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-05-300x161.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-05-768x412.png 768w" alt="" width="917" height="492">/n
Tại&nbsp;đ&acirc;y bạn c&oacute; thể chọn việc c&oacute; sử dụng mật khẩu hay kh&ocirc;ng. Nếu kh&oacute;a kh&ocirc;ng d&ugrave;ng mật khẩu, bạn c&oacute; thể bấm ngay v&agrave;o n&uacute;t OK&nbsp;để ho&agrave;n tất thủ tục./n
<img class="size-full wp-image-13158 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-06.png" sizes="(max-width: 595px) 100vw, 595px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-06.png 595w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-06-300x169.png 300w" alt="" width="595" height="336">/n
Sau khi&nbsp;đ&atilde;&nbsp;&aacute;p dụng Protect&nbsp;Workbook, c&aacute;c bạn thử click chuột phải v&agrave;o v&ugrave;ng SheetTab sẽ thấy c&aacute;c chức năng trong sheetTab&nbsp;đ&atilde; bị giới hạn kh&ocirc;ng cho ph&eacute;p thực hiện c&aacute;c y&ecirc;u cầu sau:/n
<ul>
<li>Ch&egrave;n th&ecirc;m sheet (Insert)</li>
<li>X&oacute;a sheet (Delete)</li>
<li>Đổi t&ecirc;n sheet (Rename)</li>
<li>Di chuyển hoặc copy sheet (Move&nbsp;or Copy)</li>
<li>T&ocirc; m&agrave;u cho sheet (Tab Color)</li>
<li>Ẩn sheet (Hide)</li>
<li>Mở&nbsp;ẩn sheet (Unhide)</li>
</ul>
Với những giới hạn như vậy ch&uacute;ng ta chỉ c&oacute; thể sử dụng những sheet&nbsp;đ&atilde; cho sẵn m&agrave; kh&ocirc;ng thể&nbsp;l&agrave;m thay&nbsp;đổi cấu tr&uacute;c c&aacute;c sheet trong&nbsp;workbook./n
<h3><span id="Bao_ve_noi_dung_trong_Sheet_Protect_Sheet" class="ez-toc-section"></span>Bảo vệ&nbsp; nội dung trong Sheet (Protect Sheet)</h3>
Chức năng n&agrave;y nằm trong tab Review, b&ecirc;n cạnh chức năng Protect&nbsp;Workbook/n
<img class="size-full wp-image-13159 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-07.png" sizes="(max-width: 900px) 100vw, 900px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-07.png 900w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-07-600x393.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-07-300x197.png 300w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-07-768x503.png 768w" alt="" width="900" height="590">/n
Khi chọn chức năng Protect Sheet =&gt; Hộp thoại Protect Sheet mở ra, bao gồm c&aacute;c nội dung sau:/n
<strong>+Password to unprotect sheet</strong>: M&atilde;&nbsp;để mở kh&oacute;a. Nếu ch&uacute;ng ta nhập m&atilde; v&agrave;o mục n&agrave;y th&igrave; khi muốn mở kh&oacute;a chức năng protect Sheet th&igrave; ch&uacute;ng ta phải nhập&nbsp;đ&uacute;ng m&atilde;&nbsp;đ&atilde; chọn. Tuy nhi&ecirc;n ch&uacute;ng ta c&oacute; thể kh&ocirc;ng cần&nbsp;đặt m&atilde; vẫn sử dụng&nbsp;được chức năng Protect Sheet, khi&nbsp;đ&oacute; việc mở kh&oacute;a sẽ kh&ocirc;ng y&ecirc;u cầu mật khẩu =&gt; Việc&nbsp;đặt mật khẩu l&agrave; kh&ocirc;ng bắt buộc./n
<strong>+Allow all&nbsp;users&nbsp;of this&nbsp;worksheet to</strong>: Cho ph&eacute;p thực hiện những&nbsp;điều sau&nbsp;đ&acirc;y trong khi Sheet&nbsp;đang&nbsp;được Protect bằng việc&nbsp;đ&aacute;nh dấu chọn v&agrave;o mục tương&nbsp;ứng:/n
<ul>
<li><strong><em>Select locked cells</em></strong>: chọn c&aacute;c&nbsp;&ocirc;&nbsp;đang bị kh&oacute;a. Mặc&nbsp;định l&agrave; cho ph&eacute;p chọn tới c&aacute;c&nbsp;&ocirc;&nbsp;đang bị kh&oacute;a. Nếu bỏ chọn mục n&agrave;y th&igrave; ch&uacute;ng ta kh&ocirc;ng thể chọn tới &ocirc; bị kh&oacute;a&nbsp;(d&ugrave;ng chuột click v&agrave;o&nbsp;&ocirc; bị kh&oacute;a, hay d&ugrave;ng n&uacute;t di chuyển tr&ecirc;n b&agrave;n ph&iacute;m tới&nbsp;&ocirc; bị kh&oacute;a). Thường d&ugrave;ng trong trường hợp trong sheet chỉ cho ph&eacute;p chọn tới những&nbsp;&ocirc; nhất&nbsp;định kh&ocirc;ng kh&oacute;a.</li>
<li><strong><em>Select unlocked cells</em></strong>: Chọn tới c&aacute;c&nbsp;&ocirc; kh&ocirc;ng bị kh&oacute;a. Mặc&nbsp;định l&agrave; cho ph&eacute;p chọn tới c&aacute;c&nbsp;&ocirc; kh&ocirc;ng bị kh&oacute;a (hầu hết&nbsp;đều sử dụng nội dung n&agrave;y)</li>
<li><em><strong>Format cells</strong></em>: sử dụng chức năng định dạng&nbsp;&ocirc;. Mặc&nbsp;định l&agrave; kh&ocirc;ng cho ph&eacute;p. Khi kh&oacute;a sheet th&igrave; bạn c&oacute; thể cho ph&eacute;p / kh&ocirc;ng cho ph&eacute;p người d&ugrave;ng thực hiện chức năng&nbsp;định dạng, mục&nbsp;đ&iacute;ch&nbsp;để bảo vệ những thiết lập&nbsp;định dạng ban&nbsp;đầu theo&nbsp;&yacute; muốn của m&igrave;nh, kh&ocirc;ng cho người kh&aacute;c tự&nbsp;&yacute; thay&nbsp;đổi&nbsp;định dạng (font chữ, m&agrave;u sắc,&nbsp;loại dữ liệu&hellip;).&nbsp;&Aacute;p dụng ngay cả với những&nbsp;&ocirc; kh&oacute;a hay kh&ocirc;ng bị kh&oacute;a.</li>
<li><strong><em>Format columns + Format rows</em></strong>: sử dụng chức năng&nbsp;định dạng cột, h&agrave;ng. Mục&nbsp;đ&iacute;ch&nbsp;để ngăn người d&ugrave;ng&nbsp;định dạng c&aacute;c vấn&nbsp;đề về cột, h&agrave;ng (v&iacute; dụ như&nbsp;ẩn cột,&nbsp;ẩn h&agrave;ng, mở&nbsp;ẩn, chỉnh&nbsp;độ rộng, t&ocirc; m&agrave;u&hellip;)</li>
<li><strong><em>Insert columns</em></strong>&nbsp;+&nbsp;<strong><em>Insert rows</em></strong>: Sử dụng chức năng ch&egrave;n th&ecirc;m cột, h&agrave;ng</li>
<li><strong><em>Delete columns</em></strong>&nbsp;+&nbsp;<strong><em>Delete rows</em></strong>: Sử dụng chức năng x&oacute;a cột, h&agrave;ng</li>
<li><em><strong>Sort</strong></em>: Sử dụng chức năng sắp xếp dữ liệu (Data&gt;Sort)</li>
<li><strong><em>Use AutoFilter</em></strong>:&nbsp;Sử dụng chức năng lọc dữ liệu&nbsp;(Data&gt;Filter)</li>
<li><strong><em>Use PivotTable &amp; PivotChart</em></strong>: Sử dụng chức năng pivot (bảng b&aacute;o c&aacute;o&nbsp;động, biểu&nbsp;đồ&nbsp;động)</li>
<li><strong><em>Edit Objects</em></strong>: Sử dụng chức năng chỉnh sửa c&aacute;c&nbsp;đối tượng</li>
<li><strong><em>Edit scenarios</em></strong>: Sử dụng chức năng kịch bản (chức năng scenarios trong&nbsp;excel)</li>
</ul>
Tuy nhi&ecirc;n ch&uacute;ng ta cần ch&uacute;&nbsp;&yacute; th&ecirc;m 1 nội dung nữa l&agrave;: thiết lập Cell n&agrave;o l&agrave; cell bị kh&oacute;a (locked cell), cell n&agrave;o kh&ocirc;ng bị kh&oacute;a (unlocked cell)/n
<ul>
<li>Trong bất kỳ cell n&agrave;o trong sheet&nbsp;đều mặc&nbsp;định l&agrave;&nbsp;ở chế&nbsp;độ lock</li>
<li>Muốn thiết lập cell&nbsp;ở chế&nbsp;độ kh&ocirc;ng kh&oacute;a, bạn chọn cell&nbsp;đ&oacute; rồi v&agrave;o chức năng Format cells&gt;Protection&gt;bỏ chọn&nbsp;ở mục Locked</li>
</ul>
<img class="size-full wp-image-13160 aligncenter" src="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-08.png" sizes="(max-width: 673px) 100vw, 673px" srcset="https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-08.png 673w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-08-600x530.png 600w, https://blog.hocexcel.online/wp-content/uploads/2018/01/Protect-08-300x265.png 300w" alt="" width="673" height="595">/n
Như vậy ch&uacute;ng ta&nbsp;đ&atilde; nắm&nbsp;được những nguy&ecirc;n tắc cơ bản của việc kh&oacute;a bảo vệ chương tr&igrave;nh&nbsp;excel./n
Ch&uacute;c c&aacute;c bạn học tốt c&ugrave;ng Học&nbsp;Excel Online!/n', N'1616488243thumb-800x450-43.jpg', 9, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Sử dụng AutoFit cột/hàng để phù hợp dữ liệu.', N'Trong b&agrave;i viết lần n&agrave;y, Blog Học Excel Online sẽ gi&uacute;p c&aacute;c bạn hiểu một c&aacute;ch đầy đủ về c&aacute;ch thức tự động điều chỉnh c&aacute;c cột v&agrave; h&agrave;ng cũng như phương ph&aacute;p &aacute;p dụng hiệu quả nhất khi sử dụng n&oacute; trong c&aacute;c bảng t&iacute;nh. Giúp các bạn có th&ecirc;̉ tự&nbsp;<a href="https://blog.hocexcel.online/">học excel tại nhà</a>&nbsp;m&ocirc;̣t cách hi&ecirc;̣u quả nh&acirc;́t./n
Với Microsoft Excel, ch&uacute;ng ta c&oacute; rất nhiều c&aacute;ch kh&aacute;c nhau để điều chỉnh chiều rộng cột v&agrave; chiều cao của c&aacute;c h&agrave;ng. Tuy nhi&ecirc;n, c&aacute;ch đơn giản nhất để thay đổi k&iacute;ch thước của một &ocirc; l&agrave; để Excel tự động mở rộng hoặc thu hẹp c&aacute;c cột, h&agrave;ng cho ph&ugrave; hợp với k&iacute;ch thước của dữ liệu. T&iacute;nh năng n&agrave;y được gọi l&agrave;&nbsp;<a href="https://blog.hocexcel.online/huong-dan-can-chinh-do-rong-cot-va-chieu-cao-cua-dong-trong-excel-2010-2013-2016.html" target="_blank" rel="noopener noreferrer">Excel AutoFit</a>. Sau đ&acirc;y chúng t&ocirc;i sẽ hướng dẫn c&aacute;c bạn 3 c&aacute;ch kh&aacute;c nhau để sử dụng t&iacute;nh năng tr&ecirc;n./n
<div id="ez-toc-container" class="ez-toc-v2_0_37 counter-hierarchy ez-toc-counter ez-toc-transparent ez-toc-container-direction">
<div class="ez-toc-title-container">&nbsp;</div>
</div>
<h2><span id="Nhung_kien_thuc_co_ban_ve_Excel_AutoFit" class="ez-toc-section"></span>Những kiến thức cơ bản về Excel AutoFit:</h2>
T&iacute;nh năng AutoFit của Excel được thiết kế để c&oacute; thể tự động thay đổi k&iacute;ch thước của c&aacute;c &ocirc; trong bảng t&iacute;nh gi&uacute;p chứa những dữ liệu c&oacute; k&iacute;ch thước kh&aacute;c nhau m&agrave; kh&ocirc;ng cần thay đổi độ d&agrave;i rộng của c&aacute;c h&agrave;ng v&agrave; cột theo c&aacute;ch thủ c&ocirc;ng. N&oacute;i n&ocirc;m na đ&acirc;y l&agrave; c&ocirc;ng cụ gi&uacute;p bạn căn chỉnh d&ograve;ng tự động, gi&atilde;n d&ograve;ng m&agrave; kh&ocirc;ng phỉa chỉnh tay tưng ch&uacute;t một/n
<ul>
<li><strong>AutoFit Column Width</strong>&nbsp;&ndash; l&agrave; việc tự động thay đổi chiều rộng của c&aacute;c cột để giữa lại gi&aacute; trị lớn nhất trong cột đ&oacute;.</li>
<li><strong>AutoFit Row Height</strong>&nbsp;&ndash; l&agrave; tự động điều chỉnh chiều rộng của c&aacute;c cột để ph&ugrave; hợp với gi&aacute; trị lớn nhất trong h&agrave;ng. T&ugrave;y chọn n&agrave;y gi&uacute;p mở rộng h&agrave;ng theo chiều dọc để lưu được dữ liệu nhiều d&ograve;ng hoặc đoạn văn bản qu&aacute; d&agrave;i.</li>
</ul>
Kh&aacute;c với chiều rộng của cột, Microsoft Excel tự động thay đổi chiều cao của c&aacute;c h&agrave;ng dựa tr&ecirc;n chiều cao của văn bản được nhập v&agrave;o &ocirc;, v&igrave; vậy c&aacute;c bạn sẽ kh&ocirc;ng cần tự điều chỉnh lại c&aacute;c h&agrave;ng hoặc c&aacute;c cột. Tuy nhi&ecirc;n, khi xuất hoặc sao ch&eacute;p dữ liệu từ một nguồn kh&aacute;c th&igrave; chiều cao của h&agrave;ng c&oacute; thể sẽ kh&ocirc;ng tự động điều chỉnh được, trong trường hợp đ&oacute;, sử dụng AutoFit Row Height sẽ l&agrave; lựa chọn hữu &iacute;ch nhất./n
<strong>Lưu &yacute;:</strong>&nbsp;Khi thay đổi k&iacute;ch thước của &ocirc; trong Excel, d&ugrave; l&agrave;m theo c&aacute;c tự động hay thủ c&ocirc;ng th&igrave; cũng kh&ocirc;ng được vượt qu&aacute; giới hạn độ lớn của c&aacute;c h&agrave;ng v&agrave; c&aacute;c cột./n
C&aacute;c cột c&oacute; chiều rộng tối đa l&agrave; 255 k&iacute; tự &ndash; sử dụng k&iacute;ch thước ph&ocirc;ng chữ ti&ecirc;u chuẩn &ndash; đ&acirc;y l&agrave; giới hạn dữ liệu tối đa m&agrave; một cột c&oacute; thể lưu trữ được. Nếu sử dụng k&iacute;ch thước ph&ocirc;ng chữ lớn hoặc sử dụng ph&ocirc;ng chữ in nghi&ecirc;ng hay in đậm th&igrave; c&oacute; thể l&agrave;m giảm đ&aacute;ng kể giới hạn lưu trữ của cột. K&iacute;ch thước mặc định của c&aacute;c cột trong Excel l&agrave; 8,43./n
C&aacute;ch h&agrave;ng c&oacute; chiều cao tối đa l&agrave; 409 điểm point, trong đ&oacute;, 1 điểm point xấp xỉ khoảng 1/72 inch tương đương 0,035cm. Chiều cao mặc định của một h&agrave;ng trong Excel thay đổi từ 15 điểm point (khi dpi đạt 100%) xuống 14,3 điểm point (khi dpi đạt 200%)./n
Khi chiều rộng cột v&agrave; chiều cao h&agrave;ng được đặt l&agrave; 0 th&igrave; cột/h&agrave;ng đ&oacute; sẽ kh&ocirc;ng hiển thị tr&ecirc;n trang t&iacute;nh (ẩn)./n
<h2><span id="Cach_su_dung_AutoFit_trong_Excel" class="ez-toc-section"></span>C&aacute;ch sử dụng AutoFit trong Excel:</h2>
Một điểm đặc biệt của Excel l&agrave; d&ugrave; bạn muốn thực hiện thao t&aacute;c n&agrave;o cũng đều sẽ c&oacute; hơn một c&aacute;ch để thực hiện. Do đ&oacute;, bạn c&oacute; thể lựa chọn c&aacute;ch l&agrave;m ph&ugrave; hợp nhất với bản th&acirc;n để thực hiện việc gi&atilde;n d&ograve;ng trong Excel bằng&nbsp;<a href="https://www.viagrageneric.org/is-there-anything-over-the-counter-that-works-like-viagra/">https://www.viagrageneric.org</a>&nbsp;c&aacute;ch d&ugrave;ng chuột, thanh thực đơn hoặc b&agrave;n ph&iacute;m./n
<h3><span id="Cach_tu_dong_dieu_chinh_cac_hang_va_cot_bang_cach_nhan_dup_chuot" class="ez-toc-section"></span>C&aacute;ch tự động điều chỉnh c&aacute;c h&agrave;ng v&agrave; cột bằng c&aacute;ch nhấn đ&uacute;p chuột:</h3>
C&aacute;ch thực hiện autofit đơn giản nhất trong Excel ch&iacute;nh l&agrave; nhấn đ&uacute;p chuột v&agrave;o đường viền của c&aacute;c h&agrave;ng v&agrave; cột./n
<ul>
<li>Để tự động điều chỉnh một cột, bạn cần đặt con chuột ở vị tr&iacute; đường viền b&ecirc;n phải của cột ti&ecirc;u đề tr&ecirc;n c&ugrave;ng, khi xuất hiện mũi t&ecirc;n hai đầu th&igrave; nhấn đ&uacute;p chuột v&agrave;o đường viền.</li>
<li>Để tự động điều chỉnh một h&agrave;ng, bạn di con trỏ chuột qua đường viền dưới của h&agrave;ng, rồi nhấn đ&uacute;p chuột v&agrave;o đường viền.</li>
<li>Để tự động điều chỉnh nhiều h&agrave;ng/nhiều cột th&igrave; cần chọn to&agrave;n bộ c&aacute;c h&agrave;ng/c&aacute;c cột đ&oacute; rồi nhấn đ&uacute;p chuột v&agrave;o đường ranh giới giữa mỗi hai h&agrave;ng/cột ti&ecirc;u đề trong v&ugrave;ng đ&atilde; chọn.</li>
<li>Để tự động điều chỉnh to&agrave;n bộ trang t&iacute;nh th&igrave; bạn nhấn Ctrl + A hoặc nhấn v&agrave;o n&uacute;t h&igrave;nh tam gi&aacute;c ở b&ecirc;n g&oacute;c tr&ecirc;n c&ugrave;ng b&ecirc;n tr&aacute;i của trang t&iacute;nh (xem trong h&igrave;nh b&ecirc;n dưới) sau đ&oacute;, t&ugrave;y thuộc v&agrave;o mục đ&iacute;ch của bạn m&agrave; nhấn đ&uacute;p chuột v&agrave;o đường viền của c&aacute;c h&agrave;ng, c&aacute;c cột hoặc cả hai.</li>
</ul>
<figure id="attachment_4608" class="wp-caption aligncenter" aria-describedby="caption-attachment-4608"><img class="wp-image-4608" src="https://blog.hocexcel.online/wp-content/uploads/2017/04/j.png" sizes="(max-width: 600px) 100vw, 600px" srcset="https://blog.hocexcel.online/wp-content/uploads/2017/04/j.png 1091w, https://blog.hocexcel.online/wp-content/uploads/2017/04/j-600x134.png 600w, https://blog.hocexcel.online/wp-content/uploads/2017/04/j-300x67.png 300w, https://blog.hocexcel.online/wp-content/uploads/2017/04/j-768x171.png 768w, https://blog.hocexcel.online/wp-content/uploads/2017/04/j-1024x228.png 1024w" alt="tu-dong-dieu-chinh-cot-va-hang-dung-dup-chuot" width="600" height="134">
<figcaption id="caption-attachment-4608" class="wp-caption-text">tu-dong-dieu-chinh-cot-va-hang-dung-dup-chuot</figcaption>
</figure>
<h3><span id="Cach_tu_dong_dieu_chinh_cac_cot_va_cac_hang_su_dung_thanh_thuc_don" class="ez-toc-section"></span>C&aacute;ch tự động điều chỉnh c&aacute;c cột v&agrave; c&aacute;c h&agrave;ng sử dụng thanh thực đơn:</h3>
Một c&aacute;ch kh&aacute;c để tự động điều chỉnh h&agrave;ng v&agrave; cột trong Excel l&agrave; sử dụng c&aacute;c t&ugrave;y chọn tr&ecirc;n thanh thực đơn:/n
Để&nbsp;<strong>tự động điều chỉnh chiều rộng cột</strong>, bạn chọn một, một số hoặc to&agrave;n bộ c&aacute;c cột tr&ecirc;n trang t&iacute;nh rồi chuyển đến&nbsp;<strong><em>Home tab &gt; Cells group</em></strong>, chuột phải v&agrave;o&nbsp;<strong><em>Format &gt; AutoFit Column Width</em></strong>.<br>Để&nbsp;<strong>tự động điều chỉnh chiều cao của h&agrave;ng</strong>, bạn chọn một hoặc nhiều h&agrave;ng bạn cần căn chỉnh rồi chuyển tới&nbsp;<strong><em>Home tab &gt; Cells group</em></strong>, sau đ&oacute; chuột phải v&agrave;o&nbsp;<strong><em>Format &gt; AutoFit Row Height</em></strong>./n
<figure id="attachment_4609" class="wp-caption aligncenter" aria-describedby="caption-attachment-4609"><img class="wp-image-4609 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2017/04/k.png" sizes="(max-width: 444px) 100vw, 444px" srcset="https://blog.hocexcel.online/wp-content/uploads/2017/04/k.png 444w, https://blog.hocexcel.online/wp-content/uploads/2017/04/k-300x266.png 300w" alt="dieu-chinh-cot-va-hang-dung-thanh-thuc-don" width="444" height="393">
<figcaption id="caption-attachment-4609" class="wp-caption-text">dieu-chinh-cot-va-hang-dung-thanh-thuc-don</figcaption>
</figure>
<h3><span id="Tu_dong_dieu_chinh_chieu_rong_cot_va_chieu_cao_hang_su_dung_cum_phim_lenh_thay_the" class="ez-toc-section"></span>Tự động điều chỉnh chiều rộng cột v&agrave; chiều cao h&agrave;ng sử dụng cụm ph&iacute;m lệnh thay thế:</h3>
Những người th&iacute;ch sử dụng b&agrave;n ph&iacute;m c&oacute; thể tự động điều chỉnh c&aacute;c cột v&agrave; h&agrave;ng trong Excel theo những c&aacute;ch sau đ&acirc;y:/n
<ol>
<li>Chọn những &ocirc; trong h&agrave;ng/cột m&agrave; bạn cần căn chỉnh:<br>&ndash; Để tự động chỉnh sửa nhiều cột/h&agrave;ng kh&ocirc;ng liền kề, bạn chọn một cột hoặc h&agrave;ng v&agrave; giữ ph&iacute;m Ctrl v&agrave; chọn tiếp c&aacute;c cột hoặc h&agrave;ng kh&aacute;c.<br>&ndash; Để tự động sửa to&agrave;n bộ trang t&iacute;nh, bạn nhấn Ctrl + A hoặc nhấn n&uacute;t &ldquo;Select all&rdquo;</li>
<li>Nhấn một trong c&aacute;c tổ hợp ph&iacute;m sau:<br>&ndash; Để tự động định cỡ chiều rộng cho cột: Alt + H, sau đ&oacute; nhấn O, rồi đến I<br>&ndash; Để tự động định cỡ chiều cao cho h&agrave;ng: Alt + H, sau đ&oacute; nhấn O, rồi đến A</li>
</ol>
Cần lưu &yacute; l&agrave; bạn kh&ocirc;ng n&ecirc;n nhấn tất cả c&aacute;c ph&iacute;m c&ugrave;ng một l&uacute;c m&agrave; c&aacute;c ph&iacute;m/tổ hợp ph&iacute;m cần phải được nhấn v&agrave; thả lần lượt:<br>Alt + H d&ugrave;ng để chọn tab Trang chủ tr&ecirc;n thanh thực đơn/n
<ul>
<li>O d&ugrave;ng để chọn định dạng</li>
<li>I d&ugrave;ng để tự động căn chỉnh chiều rộng cột</li>
<li>A d&ugrave;ng để tự động căn chỉnh chiều cao h&agrave;ng</li>
</ul>
Nếu bạn kh&ocirc;ng chắc chắn c&oacute; thể nhớ được to&agrave;n bộ quy tr&igrave;nh nhấn tổ hợp ph&iacute;m th&igrave; cũng kh&ocirc;ng cần lo lắng, v&igrave; sau khi bạn nhấn tổ hợp ph&iacute;m Alt + H, Excel sẽ hiển thị c&aacute;c ph&iacute;m để truy cập tất cả c&aacute;c t&ugrave;y chọn tr&ecirc;n thanh thực đơn. Khi bạn mở format menu &ndash; danh s&aacute;ch định dạng, bạn sẽ thấy c&aacute;c ph&iacute;m để lựa chọn c&aacute;c mục:/n
<figure id="attachment_4610" class="wp-caption aligncenter" aria-describedby="caption-attachment-4610"><img class="wp-image-4610 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2017/04/l.png" sizes="(max-width: 463px) 100vw, 463px" srcset="https://blog.hocexcel.online/wp-content/uploads/2017/04/l.png 463w, https://blog.hocexcel.online/wp-content/uploads/2017/04/l-300x291.png 300w" alt="tu-dong-dieu-chinh-cot-va-hang-trong-excel" width="463" height="449">
<figcaption id="caption-attachment-4610" class="wp-caption-text">tu-dong-dieu-chinh-cot-va-hang-trong-excel</figcaption>
</figure>
<h2><span id="Excel_AutoFit_khong_hoat_dong" class="ez-toc-section"></span>Excel AutoFit kh&ocirc;ng hoạt động:</h2>
Trong hầu hết c&aacute;c t&igrave;nh huống, t&iacute;nh năng Excel AutoFit thường sẽ hoạt động m&agrave; kh&ocirc;ng gặp trục trặc g&igrave;. Nhưng đ&ocirc;i khi, t&iacute;nh năng n&agrave;y kh&ocirc;ng thể tự định dạng c&aacute;c h&agrave;ng v&agrave; cột, đặc biệt l&agrave; khi t&iacute;nh năng ngắt d&ograve;ng đang hoạt động./n
Một t&igrave;nh huống điển h&igrave;nh nhất l&agrave;: bạn thiết lập chiều rộng cột theo &yacute; muốn, bật t&iacute;nh năng ngắt h&agrave;ng, chọn c&aacute;c cột cần căn chỉnh rồi đ&uacute;p chuột v&agrave;o một cột để tự động điều chỉnh chiều cao của cột đ&oacute;. Trong nhiều trường hợp, c&aacute;c h&agrave;ng sẽ c&oacute; k&iacute;ch thước ph&ugrave; hợp. Nhưng trong một số trường hợp (c&oacute; thể xảy ra ở bất cứ phi&ecirc;n bản Excel n&agrave;o từ 2007 đến 2016), một khoảng trống sẽ xuất hiện ở b&ecirc;n dưới d&ograve;ng cuối c&ugrave;ng của văn bản giống như h&igrave;nh dưới đ&acirc;y. Ngo&agrave;i ra, c&oacute; thể văn bản được nh&igrave;n thấy r&otilde; r&agrave;ng tr&ecirc;n m&agrave;n h&igrave;nh nhưng khi in ra th&igrave; lại bị cắt mất./n
<figure id="attachment_4612" class="wp-caption aligncenter" aria-describedby="caption-attachment-4612"><img class="wp-image-4612 size-full" src="https://blog.hocexcel.online/wp-content/uploads/2017/04/%C3%A1df.png" sizes="(max-width: 771px) 100vw, 771px" srcset="https://blog.hocexcel.online/wp-content/uploads/2017/04/&aacute;df.png 771w, https://blog.hocexcel.online/wp-content/uploads/2017/04/&aacute;df-600x176.png 600w, https://blog.hocexcel.online/wp-content/uploads/2017/04/&aacute;df-300x88.png 300w, https://blog.hocexcel.online/wp-content/uploads/2017/04/&aacute;df-768x225.png 768w" alt="Loi-excel-autofit-khong-hoat-dong" width="771" height="226">
<figcaption id="caption-attachment-4612" class="wp-caption-text">Loi-excel-autofit-khong-hoat-dong</figcaption>
</figure>
Sau đ&acirc;y l&agrave; c&aacute;ch khắc phục khi xảy ra lỗi vừa n&oacute;i ở tr&ecirc;n:/n
<ul>
<li>Nhấn Ctrl + A để chọn to&agrave;n bộ bảng t&iacute;nh.</li>
<li>Mở rộng cột bất k&igrave; n&agrave;o đ&oacute; bằng c&aacute;ch k&eacute;o đường viền b&ecirc;n ngo&agrave;i của cột ti&ecirc;u đề (v&igrave; đ&atilde; chọn to&agrave;n bộ bảng t&iacute;nh n&ecirc;n k&iacute;ch thước của tất cả c&aacute;c cột đều sẽ được thay đổi).</li>
<li>Đ&uacute;p chuột v&agrave;o bất cứ đường ngăn n&agrave;o giữa c&aacute;c h&agrave;ng để tự động điều ch&iacute;nh chiều cao của h&agrave;ng cho ph&ugrave; hợp.</li>
<li>Đ&uacute;p chuột v&agrave;o bất cứ đường ngăn n&agrave;o giữa c&aacute;c cột để tự động điều chỉnh chiều rộng của cột cho ph&ugrave; hợp.</li>
</ul>
Như vậy l&agrave; ch&uacute;ng ta đ&atilde; sửa lỗi xong!/n
<h3><span id="Cac_lua_chon_thay_the_cho_AutoFit_trong_Excel" class="ez-toc-section"></span>C&aacute;c lựa chọn thay thế cho AutoFit trong Excel:</h3>
T&iacute;nh năng Excel AutoFit thực sự l&agrave; một c&ocirc;ng cụ gi&uacute;p tiết kiệm thời gian khi bạn muốn điều chỉnh k&iacute;ch thước của c&aacute;c cột v&agrave; h&agrave;ng, gi&atilde;n d&ograve;ng trong Excel cho ph&ugrave; hợp với nội dung của dữ liệu. Tuy nhi&ecirc;n, đ&acirc;y cũng kh&ocirc;ng phải l&agrave; lựa chọn ho&agrave;n hảo khi bạn l&agrave;m việc với chuỗi văn bản lớn đến h&agrave;ng chục hay h&agrave;ng trăm k&yacute; tự. Trong trường hợp đ&oacute;, giải ph&aacute;p tốt hơn hết l&agrave; n&ecirc;n gộp văn bản v&agrave; để hiện thị dưới dạng nhiều h&agrave;ng hơn l&agrave; để một d&ograve;ng qu&aacute; d&agrave;i./n
Một c&aacute;ch kh&aacute;c để chứa được đoạn văn bản d&agrave;i l&agrave; để hợp nhất nhiều &ocirc; lại th&agrave;nh một &ocirc; lớn. Muốn l&agrave;m vậy, bạn chỉ cần chọn hai hoặc nhiều &ocirc; liền kề nhau rồi phải chuột v&agrave;o Merge &amp; Center tr&ecirc;n tab Trang Chủ, ở mục Alignment./n
Mong rằng với bài vi&ecirc;́t này sẽ giúp cho các bạn hi&ecirc;̉u và sử dụng AutoFit để điều chỉnh tự động độ rộng cột v&agrave; h&agrave;ng; gi&atilde;n d&ograve;ng trong Excel để ph&ugrave; hợp với dữ liệu m&ocirc;̣t cách thành thạo nh&acirc;́t./n', N'thu-thuat-excel.jpg', 10, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Microsoft Word', N'<h2>Microsoft Word l&agrave; g&igrave;?</h2>
Microsoft Word c&ograve;n được gọi l&agrave; Word, Winword, l&agrave; tr&igrave;nh soạn thảo văn bản của Microsoft, được ph&aacute;t triển bởi Charles Simonyi v&agrave; Richard Brodie, ph&aacute;t h&agrave;nh lần đầu ti&ecirc;n v&agrave;o năm 1983. Word nằm trong bộ ứng dụng văn ph&ograve;ng Microsoft Office, v&agrave; l&agrave; một trong số những ứng dụng được sử dụng phổ biến nhất tr&ecirc;n thế giới, bởi h&agrave;ng triệu nh&acirc;n vi&ecirc;n văn ph&ograve;ng, học sinh, sinh vi&ecirc;n./n
<h2>Chức năng của Word?</h2>
Word được sử dụng để tạo, đọc v&agrave; chỉnh sửa t&agrave;i liệu văn bản. V&agrave; dưới đ&acirc;y l&agrave; những t&iacute;nh năng cơ bản nhất của Word:/n
<ul>
<li><strong>L&agrave;m việc với văn bản v&agrave; định dạng văn bản:</strong>&nbsp;soạn thảo, tr&igrave;nh b&agrave;y văn bản, thay đổi font chữ, cỡ chữ, m&agrave;u chữ, kiểu chữ, hướng văn bản...</li>
<li><strong>Lưu v&agrave; in t&agrave;i liệu:</strong>&nbsp;sau khi soạn thảo v&agrave; định dạng xong bạn c&oacute; thể lưu v&agrave;o m&aacute;y t&iacute;nh dưới định dạng .doc, .docx, xuất dưới dạng .pdf, ảnh hoặc in ra th&agrave;nh bản cứng.</li>
<li><strong>T&iacute;ch hợp t&iacute;nh năng hợp t&aacute;c:</strong>&nbsp;cho ph&eacute;p nhiều người c&ugrave;ng chỉnh sửa tr&ecirc;n một t&agrave;i liệu.</li>
</ul>
Trong chuy&ecirc;n mục n&agrave;y của Quantrimang.com, bạn sẽ học được những thủ thuật Word cơ bản nhất như định dạng văn bản, xử l&yacute; cột, xử l&yacute; văn bản,&nbsp;<a title="Tạo mục lục tự động trong Word" href="https://quantrimang.com/cong-nghe/ms-word-bai-13-tao-muc-luc-tu-dong-61048">tạo mục lục tự động</a>, tạo d&ograve;ng chấm nhanh, in t&agrave;i liệu Word, chuyển Word sang PDF, tr&ecirc;n cả Word 2003, 2007, 2010, 2013 v&agrave; Word 2016, Word 2019 mới nhất./n
<img style="display: block; margin-left: auto; margin-right: auto;" src="https://st.quantrimang.com/photos/image/2017/01/17/Ribbon-1.png" alt="Hướng dẫn to&agrave;n tập Word 2016 (Phần 1): L&agrave;m quen với giao diện Ribbon" width="688" height="177">/n', N'1512_word-la-gi-3.jpg', 11, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Những tính năng cơ bản bạn cần biết', N'<div class="detail-head">
<h1>Phần mềm word l&agrave; g&igrave;?&nbsp;</h1>
</div>
<div class="emtry-detail d-flex">
<div id="find_toc" class="article-detail content nd overflow-hidden">
<strong>Phần mềm word</strong>&nbsp;l&agrave; kh&ocirc;ng c&ograve;n xa lạ g&igrave; với người d&ugrave;ng m&aacute;y t&iacute;nh, hầu như ai cũng đ&atilde; từng d&ugrave;ng qua trong qu&aacute; tr&igrave;nh học tập, l&agrave;m việc hay trong đời sống, đ&acirc;y l&agrave; một trong những phần mềm soạn thảo văn bản phổ biến với nhiều người./n
Phần phềm quen thuộc như vậy nhưng kh&ocirc;ng phải ai cũng thực sự hiểu r&otilde; về phần mềm n&agrave;y. An Ph&aacute;t xin chia sẻ những điều cơ bản về <strong>phần mềm&nbsp; Word</strong>&nbsp;m&agrave; bạn cần biết nh&eacute;!/n
<img src="https://www.anphatpc.com.vn/media/news/1512_word-la-gi-1.jpg" alt="" width="700" height="467">/n
<h2 id="word-la-gi-lich-su-hinh-thanh" class="ftwp-heading"><em id="word-la-gi-lich-su-hinh-thanh">I. Word l&agrave; g&igrave;? Lịch sử h&igrave;nh th&agrave;nh?</em></h2>
<strong>Phần mềm Word</strong>&nbsp;c&oacute; t&ecirc;n đầy đủ l&agrave;&nbsp;<strong>Microsoft Word</strong>, l&agrave; phần mềm soạn thảo văn bản thuộc bộ ứng dụng&nbsp;<strong>Microsoft Office</strong>. Phần mềm cho ph&eacute;p thao t&aacute;c soạn thảo c&aacute;c văn bản th&ocirc;, c&aacute;c hiệu ứng như&nbsp;ph&ocirc;ng chữ,&nbsp;m&agrave;u sắc, c&ugrave;ng với&nbsp;h&igrave;nh ảnh đồ họa&nbsp;v&agrave; đa phương tiện kh&aacute;c. Phần mềm&nbsp;soạn thảo văn bản phổ biến v&agrave; quen thuộc nhất đối với tất cả mọi người d&ugrave;ng m&aacute;y t&iacute;nh tr&ecirc;n to&agrave;n thế giới, tương th&iacute;ch với hầu hết c&aacute;c hệ điều h&agrave;nh, sử dụng được tr&ecirc;n&nbsp;<a href="https://www.anphatpc.com.vn/pcap-theo-nhu-cau.html" target="_blank" rel="noopener">PC</a>,&nbsp;<a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank" rel="noopener">laptop</a>,&nbsp;<a href="https://www.anphatpc.com.vn/macbook-pro_dm2218.html" target="_blank" rel="noopener">Macbook Pro</a>.../n
Bạn c&oacute; thể đế &yacute; thấy c&aacute;c đối với c&aacute;c phi&ecirc;n bản từ Word 2007 trở đi thường lưu t&ecirc;n tập tin với đu&ocirc;i l&agrave;&nbsp;<strong>.doc</strong>, hay&nbsp;<strong>.docx</strong>&nbsp;v&agrave;&nbsp; c&aacute;c phi&ecirc;n bản của Word đều c&oacute; thể mở được c&aacute;c tập tin văn bản th&ocirc; (.txt) v&agrave;&nbsp; c&aacute;c định dạng kh&aacute;c,&nbsp; xử l&yacute;&nbsp;si&ecirc;u văn bản&nbsp;(.html), thiết kế trang web./n
<img src="https://www.anphatpc.com.vn/media/news/1512_word-la-gi-3.jpg" alt="" width="700" height="467">/n
<strong>Phần mềm&nbsp;Word</strong>&nbsp;&aacute;p dụng cho mọi lĩnh vực v&agrave; ng&agrave;nh nghề như đặc biệt l&agrave; c&ocirc;ng việc&nbsp;văn ph&ograve;ng, bạn c&oacute; thể d&ugrave;ng Word để soạn thảo bi&ecirc;n bản l&agrave;m việc, b&aacute;o c&aacute;o, hợp đồng,... Ngo&agrave;i ra, c&ograve;n được sử dụng nhiều trong học tập,&nbsp;bạn c&oacute; thể d&ugrave;ng phần mềm Word để soạn thảo tiểu luận, b&aacute;o c&aacute;o học tập, l&agrave;m b&agrave;i tập,.../n
D&ugrave; bạn đang sử dụng một mẫu&nbsp;<a href="https://www.anphatpc.com.vn/laptop-van-phong-gia-re_dm1613.html" target="_blank" rel="noopener">laptop văn ph&ograve;ng</a>&nbsp;hay mẫu&nbsp;<a href="https://www.anphatpc.com.vn/gaming-laptop.html" target="_blank" rel="noopener">laptop gaming</a>,&nbsp;<a href="https://www.anphatpc.com.vn/laptop-doanh-nhan.html" target="_blank" rel="noopener">laptop doanh nh&acirc;n</a>&nbsp;th&igrave; phần mềm Word cũng l&agrave; phần mềm kh&ocirc;ng thể kh&ocirc;ng c&agrave;i đặt!/n
<img src="https://www.anphatpc.com.vn/media/news/1512_636608798020779494-0509-ynsl-hurston-lib-word-training.jpg" alt="" width="700" height="396">/n
N&oacute;i về qu&aacute; tr&igrave;nh lịch sử&nbsp;<strong>phần mềm Word&nbsp;</strong>phải kể tới ng&agrave;y trước&nbsp;văn bản được tạo ra bởi&nbsp;m&aacute;y đ&aacute;nh chữ, xịn nhất l&agrave;&nbsp;m&aacute;y đ&aacute;nh chữ điện tử, với nhược điểm chỉ với một lỗi đ&aacute;nh m&aacute;y sai sẽ khiến to&agrave;n bộ trang giấy bị hủy bỏ v&agrave; phải đ&aacute;nh lại từ đầu. Cho đến năm 1975, c&ocirc;ng&nbsp;ty phần mềm m&aacute;y t&iacute;nh nhỏ&nbsp;Micro-Soft được th&agrave;nh lập bởi&nbsp;Bill Gates&nbsp;v&agrave;&nbsp;Paul Allen&nbsp;tại&nbsp;Albuquerque, New Mexico, 2 vị nh&agrave; s&aacute;ng laajpt &agrave;i ba&nbsp;đ&atilde;&nbsp;nghĩ tới c&aacute;c hệ thống m&aacute;y t&iacute;nh c&aacute; nh&acirc;n c&oacute; khả năng xử l&yacute; văn bản, họ đ&atilde; cho t&igrave;m kiếm lập&nbsp;/n
Nhưng đến tận gần cuối năm&nbsp;<strong>1985</strong>, phi&ecirc;n bản đầu ti&ecirc;n của d&ograve;ng&nbsp;Microsoft Windows&nbsp;l&agrave;&nbsp;Windows 1.0&nbsp;được ph&aacute;t h&agrave;nh./n
Năm&nbsp;<strong>1990</strong>, bộ ứng dụng văn ph&ograve;ng Microsoft Office được ra mắt, với phần mềm&nbsp;<strong>Microsoft Word</strong>&nbsp;v&agrave;&nbsp;<strong>Microsoft Excel.</strong>/n
Dưới đ&acirc;y l&agrave; chi tiết qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển của&nbsp;<strong>phần mềm Word</strong>&nbsp;nổi danh:&nbsp;/n
<img src="https://www.anphatpc.com.vn/media/news/1512_word.JPG" alt="" width="456" height="736">/n
<h2 id="uu-diem-noi-bat-cua-phan-mem-word"><em id="uu-diem-noi-bat-cua-phan-mem-word">II. Ưu điểm nổi bật của phần mềm Word:</em></h2>
V&igrave; đ&acirc;y l&agrave; một phần mềm văn ph&ograve;ng phổ biến tr&ecirc;n to&agrave;n thế giới n&ecirc;n chắc chắc sẽ c&oacute; rất nhiều ưu điểm hay tiện &iacute;ch m&agrave; người d&ugrave;ng m&aacute;y t&iacute;nh c&oacute; thể nhận thấy trong qu&aacute; tr&igrave;nh trải nghiệm v&agrave; sử dụng l&acirc;u d&agrave;i:/n
<ul>
<li>Đầu ti&ecirc;n, bởi t&iacute;nh th&ocirc;ng th&ocirc;ng v&agrave; phổ biến của n&oacute; n&ecirc;n Microsoft Word c&oacute; thể c&agrave;i đặt tr&ecirc;n hầu hết c&aacute;c bộ PC, laptop, tablet,&hellip;</li>
</ul>
<ul>
<li>Kh&ocirc;ng cần phải tốn thời gian viết l&aacute;ch ra giấy thủ c&ocirc;ng,&nbsp;&nbsp;n&oacute; gi&uacute;p bạn soạn thảo nhanh hơn bao giờ hết, bạn c&oacute; thể dễ d&agrave;ng sửa c&aacute;c lỗi chỉ bằng c&aacute;ch nhấn ph&iacute;m x&oacute;a hoặc n&uacute;t Delete.</li>
<li>Với những t&iacute;nh năng v&ocirc; c&ugrave;ng hấp dẫn, hỗ trợ bạn rất tốt trong qu&aacute; tr&igrave;nh soạn thảo văn bản như: t&iacute;nh năng từ điển đồng nghĩa khi hết từ, ch&egrave;n h&igrave;nh ảnh v&agrave; số liệu, Sao ch&eacute;p t&agrave;i liệu nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng.</li>
</ul>
<ul>
<li>Dễ d&agrave;ng thực hiện c&aacute;c bản sao gi&uacute;p tiết kiệm chi ph&iacute; in ấn v&agrave; dễ thực hiện hơn.</li>
<li>Đa dạng v&agrave; văn bản trở n&ecirc;n hấp dẫn hơn khi c&oacute; thể th&ecirc;m m&agrave;u, đa dạng ph&ocirc;ng chữ v&agrave; k&iacute;ch cỡ kh&aacute;c nhau. Ngo&agrave;i ra&nbsp;&nbsp;sử dụng clip art, bảng, đường viền v&agrave; dấu đầu d&ograve;ng,&hellip; bạn c&oacute; thể t&ugrave;y &yacute; định dạng văn bản, bố cục để khiến sản phẩm của bạn ưng &yacute; nhất theo &yacute; bạn.</li>
</ul>
<img src="https://www.anphatpc.com.vn/media/news/1512_cdn-vietbao-vn_microsoft-word-2021-01-13-19-30.jpg" alt="" width="700" height="394">/n
<h2 id="mot-so-chuc-nang-cua-phan-mem-word"><em id="mot-so-chuc-nang-cua-phan-mem-word"><strong>III. Một số chức năng của phần mềm Word</strong></em></h2>
<em>Ngo&agrave;i chức soạn thảo văn bản như th&ocirc;ng thường mọi người thường sử dụng, bạn c&oacute; biết phần mềm c&ograve;n đem lại cho người d&ugrave;ng nhiều t&iacute;nh năng đặc biệt kh&aacute;c kh&ocirc;ng? Bạn đ&atilde; từng trải nghiệm bao nhiều t&iacute;nh năng của&nbsp;<strong>phần mềm word</strong>? C&ugrave;ng t&igrave;m hiểu nh&eacute;!</em>/n
<h3 id="tao-mail"><strong>1.&nbsp;Tạo Mail</strong></h3>
Mail Merge l&agrave; t&iacute;nh năng&nbsp; gi&uacute;p c&aacute;c bạn giảm thiểu thời gian khi xử l&yacute; c&aacute;c dạng ch&egrave;n danh s&aacute;ch v&agrave;o một mẫu cố định như: thư mời, phiếu điểm, th&ocirc;ng b&aacute;o,&hellip;Đ&acirc;y l&agrave; một t&iacute;nh năng kh&aacute; hữu &iacute;ch nhưng nhiều người d&ugrave;ng chưa quan t&acirc;m nhiều hay đ&atilde; từng sử dụng đến t&iacute;nh năng trộn thư n&agrave;y./n
Bạn h&atilde;y thực hiện: Mailings&nbsp; &ndash;&gt; Start Mail Merge &ndash;&gt; Step by StepMail Merge Wizard, gồm 6 bước:/n
<strong>Bước 1:</strong>&nbsp;Chọn kiểu t&agrave;i liệu sẽ l&agrave;m việc (Letters, Email Messages, Envelopes, Labels, Directory)/n
<strong>Bước 2:</strong>&nbsp;Chọn t&agrave;i liệu mẫu sẽ trộn, bạn c&oacute; thể lựa chọn 3 kiểu tại liệu: t&agrave;i liệu hiện tại,&nbsp; từ mẫu template, t&agrave;i liệu đ&atilde; c&oacute; sẵn/n
<strong>Bước 3:</strong>&nbsp;Chọn người nhận thư&nbsp;/n
<strong>Bước 4:</strong>&nbsp;Viết thư, điều chỉnh lại trang t&agrave;i liệu mẫu ban đầu./n
<strong>Bước 5:</strong>&nbsp;Xem trước thư đ&atilde; được trộn./n
<strong>Bước 6:</strong>&nbsp;Ho&agrave;n tất, trộn v&agrave; xem tất cả t&agrave;i liệu đ&atilde; được tạo ra./n
<h3 id="tinh-nang-kiem-tra-chinh-ta-loi-ngu-phap"><strong>2. T&iacute;nh năng kiểm tra ch&iacute;nh tả, lỗi ngữ ph&aacute;p</strong></h3>
T&iacute;nh năng n&agrave;y cực k&igrave; hữu &iacute;ch với những ai hay bị sai ch&iacute;nh tả hay c&ograve;n băn khoăn kh&ocirc;ng biết văn bản m&igrave;nh soạn thảo c&oacute; sai ch&iacute;nh tả đ&acirc;u kh&ocirc;ng th&igrave;&nbsp; kh&ocirc;ng phải lo lắng nhiều khi&nbsp;<strong>phần mềm Word</strong>&nbsp;c&oacute; t&iacute;ch hợp t&iacute;nh năng tự động kiểm tra ch&iacute;nh tả cho người d&ugrave;ng, đ&acirc;y l&agrave; t&iacute;nh năng thường được t&iacute;ch hợp một phần mềm soạn thảo./n
<img src="https://www.anphatpc.com.vn/media/news/1512_worrd1.JPG" alt="" width="700" height="395">/n
<h3 id=""><strong>3. T&iacute;nh năng t&igrave;m kiếm v&agrave; thay thế.</strong></h3>
T&iacute;nh năng Word Replace với khả năng c&oacute; thể t&igrave;m kiếm tất cả c&aacute;c lần xuất hiện của một từ, cụm từ hoặc tập hợp k&yacute; tự n&agrave;o đ&oacute; sau đ&oacute; sẽ thay thế ch&uacute;ng bằng một từ thay thế. Người d&ugrave;ng&nbsp; được cung cấp t&ugrave;y chọn để thay thế tất cả c&aacute;c lần xuất hiện hoặc chuyển qua từng lần một, chấp nhận hoặc từ chối từng thay đổi./n
<h3 id="tinh-nang-watermarks"><strong>4. T&iacute;nh năng Watermarks</strong></h3>
Watermarks đ&acirc;y l&agrave; t&iacute;nh năng ch&egrave;n h&igrave;nh mờ,&nbsp;bạn muốn c&oacute; thể bảo vệ nội dung&nbsp; khi&nbsp;đang gửi một t&agrave;i liệu quan trọng hoặc mẫu nh&aacute;p. Thao t&aacute;c&nbsp;ch&egrave;n h&igrave;nh mờ cụ thể cho c&aacute;c mục ti&ecirc;u của bạn th&ocirc;ng qua n&uacute;t bố cục trang. Dễ d&agrave;ng l&agrave;m h&igrave;nh mờ của ri&ecirc;ng m&igrave;nh v&agrave; cũng c&oacute; thể ch&egrave;n h&igrave;nh ảnh của ri&ecirc;ng bạn, hữu &iacute;ch trong việc ch&egrave;n logo thương hiệu, cho c&aacute;c b&aacute;o c&aacute;o m&agrave; doanh nghiệp của bạn c&oacute; thể sản xuất hoặc bất kỳ t&agrave;i liệu n&agrave;o kh&aacute;c./n
Để thực hiện chọn chức năng:&nbsp;<strong>Page layout &ndash;&gt; Watermark</strong>/n
Bước 1: Chọn c&aacute;c mẫu c&oacute; sẵn từ danh s&aacute;ch hoặc mở&nbsp;<strong>Custom Watermark&nbsp;</strong>để thiết kế lại nội dung theo &yacute; m&igrave;nh/n
Bước 2:&nbsp;<strong>Remove Watermark</strong>: x&oacute;a Watermark hiện c&oacute;./n
<img src="https://www.anphatpc.com.vn/media/news/1512_word4.JPG" alt="" width="700" height="324">/n
<h3 id="chen-header-and-footer"><em id="chen-header-and-footer"><strong>5. Ch&egrave;n Header and Footer</strong></em></h3>
Sử dụng kh&ocirc;ng gian trong đầu trang v&agrave; ch&acirc;n trang của bạn để tiết kiệm kh&ocirc;ng gian trong c&aacute;c v&ugrave;ng kh&aacute;c trong văn bản bạn đang soạn thảo, sản phẩm văn bản của bạn c&oacute; giao diện chuy&ecirc;n nghiệp, v&iacute; dụ, c&oacute; thể bao gồm số trang tr&ecirc;n to&agrave;n bộ t&agrave;i liệu.&nbsp;/n
<h3 id="su-dung-hyperlinks-mot-cach-toi-uu"><strong>6.&nbsp;Sử dụng Hyperlinks một c&aacute;ch tối ưu</strong></h3>
Muốn c&oacute; một bản Word thực sự hấp dẫn của bạn c&oacute; thể ch&egrave;n c&aacute;c si&ecirc;u li&ecirc;n kết v&agrave;o h&igrave;nh ảnh v&agrave; văn bản để l&agrave;m cho t&agrave;i liệu của bạn c&oacute; t&iacute;nh tương t&aacute;c tốt hơn, c&oacute; thể lấy th&ecirc;m v&iacute; dụ, đưa ra th&ecirc;m nhiều nội dung th&ocirc;ng tin cho người đọc, người xem./n
<img src="https://www.anphatpc.com.vn/media/news/1512_word6.JPG" alt="" width="700" height="348">/n
<h3 id="autocorrect">7. AUTOCORRECT</h3>
Khi soạn thảo văn bản tr&ecirc;n<strong>&nbsp;phần mềm Word</strong>&nbsp;ta thường định nghĩa c&aacute;c từ viết tắt. Qu&aacute; tr&igrave;nh n&agrave;y gi&uacute;p soạn thảo nhanh v&agrave; ch&iacute;nh x&aacute;c hơn./n
Chọn chức năng:&nbsp;<strong>File &ndash;&gt; Options &ndash;&gt; Proofing &ndash;&gt; AutoCorrect Options</strong>/n
Bước 1: Chọn&nbsp;<strong>Tab AutoCorrect&nbsp;</strong>định nghĩa từ viết tắt trong mục Replace v&agrave; từ viết đầy đủ trong mục With/n
Bước 2: Sau đ&oacute; chọn&nbsp;<strong>Add</strong>; để x&oacute;a chọn&nbsp;<strong>Delete</strong>./n
Người d&ugrave;ng chỉ cần g&otilde; từ viết tắt v&agrave; g&otilde; them n&uacute;t&nbsp;<strong>Space</strong>&nbsp;từ đầy đủ sẽ được thay thế./n
<img src="https://www.anphatpc.com.vn/media/news/1512_ighj.JPG" alt="" width="700" height="455">/n
<h3 id="bao-ve-tai-lieu"><strong>8. BẢO VỆ T&Agrave;I LIỆU</strong></h3>
Với những văn bản quan trọng, thậm ch&iacute; l&agrave; những t&agrave;i liệu mật người d&ugrave;ng muốn được phần mềm Word bảo mật, muốn t&agrave;i liệu được mở phải c&oacute; mật khẩu, ta sử dụng chức năng&nbsp;<strong>File &ndash;&gt; Info &ndash;&gt; Protect Document &ndash;&gt; Encrypt with Password</strong>, sau đ&oacute; nhập mật khẩu bảo vệ t&agrave;i liệu v&agrave; chọn&nbsp;<strong>OK</strong>./n
Để hủy chức năng tr&ecirc;n, ta l&agrave;m tương tự nhưng mật khẩu để trống v&agrave; chọn lại OK./n
<img src="https://www.anphatpc.com.vn/media/news/1512_pass.JPG" alt="" width="700" height="491">/n
<h3 id="tinh-nang-dem-tu"><strong>9. T&Iacute;NH NĂNG ĐẾM TỪ</strong></h3>
Khi được giao số lượng từ trong 1 văn bản để soạn thảo tr&ecirc;n phần mềm Word, th&igrave; bạn cần tới chức năng đếm từ, bjan sẽ biết r&otilde; hơn về: tổng số trang (pages), &nbsp;số d&ograve;ng (lines), số từ (words), số đoạn (paragraphs), số k&yacute; tự kh&ocirc;ng t&iacute;nh khoảng trắng (Charaters (no space)), số k&yacute; tự t&iacute;nh cả khoảng trắng (Charater (with space),./n
Nhanh hơn,&nbsp; dưới thanh Status bar của cửa sổ Word bạn cũng c&oacute; thể theo d&otilde;i được./n
<h3 id="thiet-lap-che-do-hien-thi"><strong>10. Thiết lập chế độ hiển thị</strong></h3>
Đ&acirc;y l&agrave; một chức năng bạn cần biết để sử dụng trong qu&aacute; tr&igrave;nh d&ugrave;ng&nbsp;<strong>phần mềm word,</strong>&nbsp;để thiết lập chế độ hiển thị trong Word chọn&nbsp;<strong>Tab View</strong>./n
- Với Nh&oacute;m&nbsp;<strong>Document View</strong>: hiển thị theo c&aacute;c kiểu (Print Layout, Full Screen Reading, Web Layout, Outline, Draft)./n
- Với Nh&oacute;m&nbsp;<strong>Show</strong>&nbsp;gồm: Ruler, Gridlines, Navigation Pane&nbsp;/n
- Với Nh&oacute;m&nbsp;<strong>Zoom</strong>: Ph&oacute;ng to thu nhỏ t&agrave;i liệu./n
- Với Nh&oacute;m&nbsp;<strong>Window</strong>: Thay đổi c&aacute;ch hiển thị của cửa số Word./n
<img src="https://www.anphatpc.com.vn/media/news/1512_Print-Layout-word-21.jpg" alt="" width="700" height="286">/n
&nbsp;/n
<h2 id="su-dung-phan-mem-word-tren-dien-thoai-di-dong-duoc-khong"><em id="su-dung-phan-mem-word-tren-dien-thoai-di-dong-duoc-khong"><strong>IV. Sử dụng phần mềm Word tr&ecirc;n điện thoại di động được kh&ocirc;ng?</strong></em></h2>
Nếu bạn tưởng chỉ c&oacute; thể soạn thảo văn bản ở tr&ecirc;n thiết bị như PC hay laptop th&igrave; giờ đ&acirc;y&nbsp;<strong>phần mềm Word</strong>&nbsp;đ&atilde; hỗ trợ tr&ecirc;n c&aacute;c thiết bị di động như điện thoại, m&aacute;y t&iacute;nh bảng,..Bạn kh&ocirc;ng cần lo ngại khi cần soạn thảo 1 văn bản gấp m&agrave; đang kh&ocirc;ng c&oacute; sẵn PC hay laptop với chiếc điện thoại th&ocirc;ng minh hay m&aacute;y t&iacute;nh bảng nhỏ b&eacute; l&agrave; bạn c&oacute; thể thao t&aacute;c ngay lập tức!/n
<strong>Phần mềm Word</strong>&nbsp;c&oacute; giao diện trực quan, ph&ugrave; hợp với điện thoại th&ocirc;ng minh, Word&nbsp; cung cấp cho bạn c&ocirc;ng cụ đầy đủ t&iacute;nh năng để tận dụng tối đa./n
<h3 id="cach-truy-cap-vao-microsoft-word-tren-iphoneipad"><strong>1. C&aacute;ch truy cập v&agrave;o Microsoft Word tr&ecirc;n iPhone/Ipad</strong></h3>
<strong><img src="https://www.anphatpc.com.vn/media/news/1512_iphone.JPG" alt="" width="700" height="596"></strong>/n
<strong>Bước 1:&nbsp;</strong>V&agrave;o&nbsp;App Store&nbsp;&gt; G&otilde; t&igrave;m kiếm&nbsp;<strong>Phần mềm Word</strong>&nbsp;&gt; Nhấn&nbsp;Tải về./n
<strong>Bước 2</strong>: Mở ứng dụng&nbsp;<strong>Microsoft Word</strong>&nbsp;&gt; Đăng nhập t&agrave;i khoản&nbsp;<strong>Microsoft</strong>/n
<strong>Bước 3:&nbsp;</strong>Nhấp v&agrave;o tạo t&agrave;i khoản bạn c&oacute; thể sử dụng đăng k&yacute; hay bạn cũng c&oacute; thể tạo email mới ngay tr&ecirc;n phần mềm n&agrave;y để sử dụng phần mềm của microsoft./n
<strong>Bước 4</strong>: Tại giao diện lựa chọn&nbsp;<strong>Template&nbsp;</strong>c&oacute; sẵn./n
<strong>Bước 5</strong>: Tại mục t&agrave;i liệu trống bạn c&oacute; thể nhập văn bản/n
<strong>Bước 6</strong>: Sử dụng một số c&ocirc;ng cụ chỉnh sửa/n
Ở b&ecirc;n dưới bạn sẽ thấy một số c&ocirc;ng cụ ch&iacute;nh sửa như Blod, In nghi&ecirc;ng, Gạch ch&acirc;n, Highlight v&agrave; c&oacute; thể mở rộng chỉnh sửa, định dạng theo mong muốn của m&igrave;nh với những c&ocirc;ng cụ&nbsp;c&oacute; sẵn./n
<img src="https://www.anphatpc.com.vn/media/news/1512_word1.JPG" alt="" width="700" height="398">/n
<h3 id="cach-truy-cap-vao-microsoft-word-tren-thiet-bi-di-dong-androi"><strong>2. C&aacute;ch truy cập v&agrave;o Microsoft Word tr&ecirc;n thiết bị di động Androi</strong></h3>
<strong><img src="https://www.anphatpc.com.vn/media/news/1512_kiy.JPG" alt="" width="700" height="538"></strong>/n
<strong>Bước 1:</strong>&nbsp;Để c&agrave;i đặt&nbsp;<strong>Phần mềm Word&nbsp;</strong>h&atilde;y truy cập&nbsp;<strong>Play Store.</strong>/n
<strong>Bước 2:</strong>&nbsp;T&igrave;m kiếm ứng dụng Microsoft Word. Nhấn v&agrave;o&nbsp;<strong>Microsoft Word.</strong>Nhấn v&agrave;o c&agrave;i đặt, nhận hoặc tải xuống./n
<strong>Bước 3:</strong>&nbsp;Từ C&agrave;i đặt &ndash; C&agrave;i đặt bạn chọn Đồng &yacute; .Sau đ&oacute; với c&aacute;c điều khoản v&agrave; điều kiện sẽ hiện ra bạn chọn chấp nhận./n
<strong>Bước 4:</strong>&nbsp;Sau khi ho&agrave;n tất việc tải xuống, h&atilde;y mở ứng dụng di động Word l&ecirc;n bằng c&aacute;ch chạm v&agrave;o ứng dụng biểu tượng Word./n
<strong>Bước 6:</strong>&nbsp;V&agrave;o&nbsp;<strong>Word</strong>&nbsp;&gt; Đăng nhập với t&agrave;i khoản Microsoft &gt; Bấm dấu cộng để tạo văn bản mới &gt; Chọn t&agrave;i liệu trống hoặc c&aacute;c templates c&oacute; sẵn./n
Ngo&agrave;i Home th&igrave;&nbsp;<strong>Phần mềm Word</strong>&nbsp;ở điện thoại Android c&ograve;n c&oacute;&nbsp; th&ecirc;m c&aacute;c t&iacute;nh năng Ch&egrave;n (Insert), Vẽ (Draw), Bố tr&iacute; (Layout),... về cơ bản sử dụng tương tự như tr&ecirc;n m&aacute;y t&iacute;nh nhưng c&oacute; một ch&uacute;t cắt giảm./n
<img src="https://www.anphatpc.com.vn/media/news/1512_wordandroi.JPG" alt="" width="700" height="531">/n
&nbsp;Để sử dụng&nbsp;<strong>Phần mềm Word</strong>&nbsp;một c&aacute;ch thoải m&aacute;i, dễ d&agrave;ng với đầy đủ t&iacute;nh năng nhất th&igrave; bạn n&ecirc;n sắm cho m&igrave;nh một chiếc PC hay laptop nh&eacute;! Nếu bạn hay phải di chuyển, y&ecirc;u th&iacute;ch sử dụng phần mềm Word một c&aacute;ch cơ động th&igrave; c&oacute; thể lựa chọn c&aacute;c sản phẩm laptop c&oacute; tại&nbsp;<strong>An Ph&aacute;t PC</strong>&nbsp;&gt;&gt;&nbsp;<em><strong><a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank" rel="noopener">M&aacute;y t&iacute;nh x&aacute;ch tay-Laptop</a></strong></em>/n
</div>
</div>', N'1512_word-la-gi-3.jpg', 12, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Cách định dạng văn bản trong Word', N'<div id="bxcontentnewsindx" class="bxcontentnews">
<div class="bannerAdNews">
<div class="bannerAdNews__content owl-carousel owl-loaded owl-drag">
<div class="owl-stage-outer owl-height">
<div class="owl-stage">
<div class="owl-item">&nbsp;</div>
</div>
</div>
</div>
</div>
<div class="clrindexknh">
<div id="QuickViewId" class="bxindexknh">
<div class="ctindxknh">
<h3 id="ReadMore" class="ReadMoreItems"><span class="dropcap" data-crown="">1.&nbsp;</span>Định dạng văn bản l&agrave; g&igrave;? Mục đ&iacute;ch của việc định dạng văn bản</h3>
</div>
</div>
</div>
<h4 id="hmenuid2"><strong>Định dạng văn bản l&agrave; g&igrave;?</strong></h4>
Định dạng văn bản l&agrave; tr&igrave;nh b&agrave;y c&aacute;c phần văn bản tr&ecirc;n Word theo từng loại thuộc t&iacute;nh ri&ecirc;ng biệt với nhau./n
<h4 id="hmenuid3"><strong>Mục đ&iacute;ch của việc định dạng văn bản</strong></h4>
<ul>
<li>Gi&uacute;p cho văn bản được tr&igrave;nh b&agrave;y đẹp hơn.</li>
<li>Nội dung tr&igrave;nh b&agrave;y trong văn bản r&otilde; r&agrave;ng, dễ nh&igrave;n.</li>
<li>Nhấn mạnh v&agrave;o những phần nội dung quan trọng, cho người đọc dễ nắm bắt phần cốt l&otilde;i của vấn đề bạn muốn truyền tải trong văn bản.</li>
</ul>
<h4 id="hmenuid4"><strong>C&aacute;c lệnh định dạng văn bản thường gặp</strong></h4>
Định dạng văn bản gồm 2 lệnh chủ yếu:/n
<ul>
<li><strong>Định dạng đoạn văn bản:&nbsp;</strong>Gi&uacute;p nhấn mạnh v&agrave;o những phần nội dung quan trọng, cho người đọc dễ d&agrave;ng b&aacute;m s&aacute;t nội dung cốt l&otilde;i.</li>
<li><strong>Định dạng k&iacute; tự:&nbsp;</strong>L&agrave;m nổi bật những nội dung cần ch&uacute; &yacute; của văn bản, cho người đọc nắm r&otilde;, dễ nh&igrave;n.</li>
</ul>
<h3 id="hmenuid5"><span class="dropcap" data-crown="">2. </span>Căn lề v&agrave; k&iacute;ch thước cho văn bản</h3>
<strong>Bước 1:</strong>&nbsp;Bạn chọn&nbsp;<strong>tab Layout</strong>, sau đ&oacute; chọn&nbsp;<strong>Size&nbsp;</strong>để căn lề chuẩn cho văn bản./n
<img title="Bạn chọn tab Layout, sau đ&oacute; chọn Size để căn lề chuẩn cho văn bản." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c.jpg" alt="Bạn chọn tab Layout, sau đ&oacute; chọn Size để căn lề chuẩn cho văn bản." width="730" height="309" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c.jpg">/n
<strong>Bước 2:&nbsp;</strong>Bảng điều chỉnh căn lề hiện ra, bạn chọn&nbsp;<strong>Margins&nbsp;</strong>v&agrave; tiến h&agrave;nh&nbsp;<strong>điều chỉnh k&iacute;ch thước lề chuẩn theo khổ giấy A4</strong>&nbsp;rồi nhấp&nbsp;<strong>OK&nbsp;</strong>để ho&agrave;n th&agrave;nh. (Top: 2 - 2.5 cm, Bottom: 2 - 2.5 cm, Left: 3 - 3.5 cm, Right: 1.5 - 2 cm)/n
<img title="Bạn điều chỉnh k&iacute;ch thước lề chuẩn theo khổ giấy A4 rồi nhấp OK để ho&agrave;n th&agrave;nh" src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-1.jpg" alt="Bạn chọn Margins v&agrave; tiến h&agrave;nh điều chỉnh k&iacute;ch thước lề chuẩn theo khổ giấy A4 rồi nhấp OK để ho&agrave;n th&agrave;nh" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-1.jpg">/n
<strong>Bước 3:</strong>&nbsp;Bạn chọn&nbsp;<strong>Orientation&nbsp;</strong>để chỉnh sửa khổ giấy của văn bản.&nbsp;/n
<ul>
<li>Portrait để chọn khổ dọc.</li>
<li>Landscape để chọn khổ ngang.</li>
</ul>
<img title="Bạn chọn Orientation để chỉnh sửa khổ giấy của văn bản. (Chọn Portrait để chọn khổ dọc, chọn Landscape để chọn khổ ngang)" src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-2.jpg" alt="Bạn chọn Orientation để chỉnh sửa khổ giấy của văn bản. (Chọn Portrait để chọn khổ dọc, chọn Landscape để chọn khổ ngang)" width="730" height="442" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-2.jpg">/n
<h3 id="hmenuid6"><span class="dropcap" data-crown="">3. </span>Định dạng font chữ trong Word</h3>
<h4 id="hmenuid7">Định dạng font chữ với trang mới</h4>
<strong>Bước 1:</strong>&nbsp;Bạn v&agrave;o thẻ&nbsp;<strong>Home&nbsp;</strong>hoặc bấm&nbsp;<strong>Ctrl+D</strong>&nbsp;để&nbsp;<strong>mở cửa sổ định dạng font chữ</strong>./n
<img title="Bạn v&agrave;o thẻ Home hoặc bấm Ctrl+D để mở cửa sổ định dạng font chữ." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-7.jpg" alt="Bạn v&agrave;o thẻ Home hoặc bấm Ctrl+D để mở cửa sổ định dạng font chữ." width="730" height="510" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-7.jpg">/n
<strong>Bước 2:&nbsp;</strong>Bạn&nbsp;<strong>chọn&nbsp;</strong>font chữ bạn muốn rồi nhấp&nbsp;<strong>OK&nbsp;</strong>để ho&agrave;n th&agrave;nh./n
<img title="Bạn chọn font chữ bạn muốn rồi nhấp OK để ho&agrave;n th&agrave;nh." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-8.jpg" alt="Bạn chọn font chữ bạn muốn rồi nhấp OK để ho&agrave;n th&agrave;nh." width="730" height="572" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-8.jpg">/n
<h4 id="hmenuid8">Định dạng khoảng c&aacute;ch c&aacute;c chữ&nbsp;</h4>
<strong>Bước 1:&nbsp;</strong>Bạn nhấn&nbsp;<strong>Ctrl+D</strong>&nbsp;để mở cửa sổ Font, sau đ&oacute; chọn&nbsp;<strong>Advanced</strong>./n
<img title="Bạn nhấn Ctrl+D để mở cửa sổ Font, sau đ&oacute; chọn Advanced." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-11.jpg" alt="Bạn nhấn Ctrl+D để mở cửa sổ Font, sau đ&oacute; chọn Advanced." width="730" height="677" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-11.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn&nbsp;<strong>thiết lập khoảng c&aacute;ch chữ</strong>&nbsp;trong văn bản tại mục&nbsp;<strong>Spacing</strong>./n
<ul>
<li>Normal: B&igrave;nh thường.</li>
<li>Expanded: Khoảng c&aacute;ch rộng hơn b&igrave;nh thường.</li>
<li>Condensed: Thu hẹp khoảng c&aacute;ch chữ lại.</li>
</ul>
<img title="Bạn thiết lập khoảng c&aacute;ch chữ trong văn bản tại mục Spacing" src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-12.jpg" alt="Bạn thiết lập khoảng c&aacute;ch chữ trong văn bản tại mục Spacing" width="730" height="466" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-12.jpg">/n
<strong>Bước 3:&nbsp;</strong>Bạn nhấp&nbsp;<strong>OK&nbsp;</strong>để ho&agrave;n th&agrave;nh./n
<img title="Bạn nhấp OK để ho&agrave;n th&agrave;nh." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-13.jpg" alt="Bạn nhấp OK để ho&agrave;n th&agrave;nh." width="730" height="638" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-13.jpg">/n
Vậy l&agrave; bạn đ&atilde; điều chỉnh khoảng c&aacute;ch c&aacute;c chữ th&agrave;nh c&ocirc;ng rồi./n
<img title="Vậy l&agrave; bạn đ&atilde; điều chỉnh khoảng c&aacute;ch c&aacute;c chữ th&agrave;nh c&ocirc;ng rồi." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-14.jpg" alt="Vậy l&agrave; bạn đ&atilde; điều chỉnh khoảng c&aacute;ch c&aacute;c chữ th&agrave;nh c&ocirc;ng rồi." width="730" height="271" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-14.jpg">/n
<h4 id="hmenuid9">Sao ch&eacute;p định dạng bằng Format Painter</h4>
<strong>Bước 1:</strong>&nbsp;Bạn&nbsp;<strong>b&ocirc;i đen</strong>&nbsp;v&ugrave;ng văn bản cần định dạng./n
<img title="Bạn b&ocirc;i đen v&ugrave;ng văn bản cần định dạng." src="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-15.jpg" alt="Bạn b&ocirc;i đen v&ugrave;ng văn bản cần định dạng." width="730" height="220" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1387990/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-15.jpg">/n
<strong>Bước 2:</strong>&nbsp;Sau khi đ&atilde; b&ocirc;i đen văn bản, bạn h&atilde;y chọn mục&nbsp;<strong>Format Painter</strong>&nbsp;tại tab&nbsp;<strong>Home</strong>./n
<img title="Sau khi đ&atilde; b&ocirc;i đen văn bản, bạn h&atilde;y chọn mục Format Painter tại tab Home." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-14.jpg" alt="Sau khi đ&atilde; b&ocirc;i đen văn bản, bạn h&atilde;y chọn mục Format Painter tại tab Home." width="730" height="359" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-14.jpg">/n
<strong>Bước 3</strong>: Cuối c&ugrave;ng, văn bản của bạn đ&atilde; được định dạng./n
<img title="Cuối c&ugrave;ng, văn bản của bạn đ&atilde; được định dạng." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-15.jpg" alt="Cuối c&ugrave;ng, văn bản của bạn đ&atilde; được định dạng." width="730" height="240" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-15.jpg">/n
<h3 id="hmenuid10"><span class="dropcap" data-crown="">4. </span>Định dạng văn bản d&ugrave;ng c&aacute;ch ph&iacute;m tắt</h3>
Để c&oacute; thể r&uacute;t ngắn được thời gian trong l&uacute;c định dạng lại văn bản Điện m&aacute;y XANH sẽ hướng dẫn bạn một số ph&iacute;m tắt phổ biến trong định dạng văn bản nh&eacute;!/n
<strong>Ctrl+B</strong>: D&ugrave;ng để in đậm văn bản./n
<img title="Ctrl+B: D&ugrave;ng để in đậm văn bản." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-3.jpg" alt="Ctrl+B: D&ugrave;ng để in đậm văn bản." width="730" height="208" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-3.jpg">/n
<strong>Ctrl+D</strong>: Để mở cửa sổ định dạng font chữ./n
<img title="Ctrl+D: Để mở cửa sổ định dạng font chữ." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-4.jpg" alt="Ctrl+D: Để mở cửa sổ định dạng font chữ." width="730" height="551" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-4.jpg">/n
<strong>Ctrl+I</strong>: D&ugrave;ng để in nghi&ecirc;ng font chữ./n
<img title="Ctrl+I: D&ugrave;ng để in nghi&ecirc;ng font chữ." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-5.jpg" alt="Ctrl+I: D&ugrave;ng để in nghi&ecirc;ng font chữ." width="730" height="198" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-5.jpg">/n
<strong>Ctrl+U</strong>: D&ugrave;ng để gạch ch&acirc;n font chữ./n
<img title="Ctrl+U: D&ugrave;ng để gạch ch&acirc;n font chữ." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-6.jpg" alt="Ctrl+U: D&ugrave;ng để gạch ch&acirc;n font chữ." width="730" height="185" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-6.jpg">/n
<strong>Ctrl + Shift + &gt;</strong>: D&ugrave;ng để tăng k&iacute;ch cỡ văn bản./n
<img style="margin: 10px auto; padding: 0px 0px 10px; border: 0px; display: block; max-width: 100%; height: auto !important; opacity: 1;" title="Ctrl + Shift + &gt;: D&ugrave;ng để tăng k&iacute;ch cỡ văn bản." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-7.jpg" alt="Ctrl + Shift + &gt;: D&ugrave;ng để tăng k&iacute;ch cỡ văn bản." width="730" height="324" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-7.jpg">/n
<strong>Ctrl + Shift + &lt;&gt;</strong>: D&ugrave;ng để giảm k&iacute;ch cỡ văn bản./n
<img title="Ctrl + Shift + &lt; : D&ugrave;ng để giảm k&iacute;ch cỡ văn bản." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-8.jpg" alt="Ctrl + Shift + &lt; : D&ugrave;ng để giảm k&iacute;ch cỡ văn bản." width="730" height="190" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-8.jpg">/n
<h3 id="hmenuid11"><span class="dropcap" data-crown="">5. </span>Định dạng văn bản bằng chức năng Paragraph</h3>
<strong>Bước 1:&nbsp;</strong>Đầu ti&ecirc;n, bạn h&atilde;y mở file Word muốn định dạng v&agrave; b&ocirc;i&nbsp;<strong>đen văn bản.</strong>/n
<img title="Đầu ti&ecirc;n, bạn h&atilde;y mở file Word muốn định dạng v&agrave; b&ocirc;i đen văn bản." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-9.jpg" alt="Đầu ti&ecirc;n, bạn h&atilde;y mở file Word muốn định dạng v&agrave; b&ocirc;i đen văn bản." width="730" height="245" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-9.jpg">/n
<strong>Bước 2:</strong>&nbsp;Sau khi b&ocirc;i đen văn bản, tại tab&nbsp;<strong>Home</strong>, bạn h&atilde;y click chuột v&agrave;o mũi t&ecirc;n &ocirc;&nbsp;<strong>Paragraph</strong>./n
<img title="Sau khi b&ocirc;i đen văn bản, tại tab Home, bạn h&atilde;y click chuột v&agrave;o mũi t&ecirc;n &ocirc; Paragraph." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-11.jpg" alt="Sau khi b&ocirc;i đen văn bản, tại tab Home, bạn h&atilde;y click chuột v&agrave;o mũi t&ecirc;n &ocirc; Paragraph." width="730" height="365" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-11.jpg">/n
<strong>Bước 3:&nbsp;</strong>Tại cửa sổ Paragraph, tại mục General, bạn h&atilde;y chọn&nbsp;<strong>Alignment</strong>&nbsp;(canh lề đoạn văn b&ecirc;n tr&aacute;i hoặc phải),&nbsp;<strong>Outline Level</strong>&nbsp;(chọn k&iacute;ch cỡ của văn bản)./n
Tại&nbsp;<strong>Indentation</strong>&nbsp;bao gồm&nbsp;<strong>Left v&agrave; Right</strong>&nbsp;(chọn khoảng c&aacute;ch đoạn văn lề tr&aacute;i v&agrave; lề phải)./n
Tại&nbsp;<strong>Special</strong>&nbsp;(chọn kiểu thụt đầu d&ograve;ng của đoạn văn),<strong>&nbsp;By&nbsp;</strong>(khoảng c&aacute;ch thụt đầu d&ograve;ng)./n
Ở phần&nbsp;<strong>Spacing</strong>&nbsp;bao gồm:/n
<ul>
<li><strong>Before</strong>: Khoảng c&aacute;ch giữa d&ograve;ng đầu với d&ograve;ng b&ecirc;n tr&ecirc;n).</li>
<li><strong>After</strong>: Khoảng c&aacute;ch giữa d&ograve;ng cuối c&ugrave;ng với d&ograve;ng b&ecirc;n dưới).</li>
<li><strong>Line Spacing</strong>: Khoảng c&aacute;ch giữa c&aacute;c d&ograve;ng trong c&ugrave;ng 1 đoạn văn).</li>
<li><strong>At</strong>: Khoảng c&aacute;ch d&ograve;ng giữa c&aacute;c đoạn văn).</li>
</ul>
<img title="Tại cửa sổ Paragraph, tại mục General, bạn h&atilde;y chọn Alignment (canh lề đoạn văn b&ecirc;n tr&aacute;i hoặc phải), Outline Level (chọn k&iacute;ch cỡ của văn bản)." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-12.jpg" alt="Tại cửa sổ Paragraph, tại mục General, bạn h&atilde;y chọn Alignment (canh lề đoạn văn b&ecirc;n tr&aacute;i hoặc phải), Outline Level (chọn k&iacute;ch cỡ của văn bản)." width="730" height="548" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-12.jpg">/n
<strong>Bước 4:</strong>&nbsp;Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục&nbsp;<strong>OK</strong>&nbsp;để &aacute;p dụng./n
<img title="Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục OK để &aacute;p dụng." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-13.jpg" alt="Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục OK để &aacute;p dụng." width="730" height="672" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-13.jpg">/n
<h3 id="hmenuid12"><span class="dropcap" data-crown="">6. </span>Định dạng văn bản bằng n&uacute;t mũi t&ecirc;n</h3>
<strong>Bước 1:&nbsp;</strong>Bạn v&agrave;o&nbsp;<strong>Layout</strong>, sau đ&oacute; bấm v&agrave;o&nbsp;<strong>biểu tượng mũi t&ecirc;n</strong>&nbsp;trong Page Setup để tiến h&agrave;nh thiết lập trang./n
<img title="Bạn v&agrave;o Layout, sau đ&oacute; bấm v&agrave;o biểu tượng mũi t&ecirc;n trong Page Setup để tiến h&agrave;nh thiết lập trang." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-16.jpg" alt="Bạn v&agrave;o Layout, sau đ&oacute; bấm v&agrave;o biểu tượng mũi t&ecirc;n trong Page Setup để tiến h&agrave;nh thiết lập trang." width="730" height="446" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-16.jpg">/n
<strong>Bước 2:</strong>&nbsp;Tại bảng điều chỉnh lề, bạn chọn&nbsp;<strong>Margins&nbsp;</strong>v&agrave; tiến h&agrave;nh&nbsp;<strong>điều chỉnh lề</strong>&nbsp;theo k&iacute;ch thước chuẩn lề A4./n
<div class="infobox"><strong>Top:</strong>&nbsp;Căn lề tr&ecirc;n
<strong>Bottom:</strong>&nbsp;Căn lề dưới/n
<strong>Left:&nbsp;</strong>Căn lề tr&aacute;i/n
<strong>Right:</strong>&nbsp;Căn lề phải.</div>
<img title="Tại bảng điều chỉnh lề, bạn chọn Margins v&agrave; tiến h&agrave;nh điều chỉnh lề theo k&iacute;ch thước chuẩn lề A4." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-17.jpg" alt="Tại bảng điều chỉnh lề, bạn chọn Margins v&agrave; tiến h&agrave;nh điều chỉnh lề theo k&iacute;ch thước chuẩn lề A4." width="730" height="714" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-17.jpg">/n
<strong>Bước 3:</strong>&nbsp;Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục&nbsp;<strong>OK</strong>&nbsp;để &aacute;p dụng./n
<img title="Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục OK để &aacute;p dụng." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-18.jpg" alt="Sau khi chỉnh sửa xong bạn h&atilde;y nhấp v&agrave;o mục OK để &aacute;p dụng." width="730" height="714" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-18.jpg">/n
<h3 id="hmenuid13"><span class="dropcap" data-crown="">7. </span>Định dạng văn bản bằng thước ngang</h3>
Để định dạng văn bản bằng thước ngang bạn h&atilde;y l&agrave;m c&aacute;c bước dưới đ&acirc;y nh&eacute;!/n
<strong>Bước 1:&nbsp;</strong>Đầu ti&ecirc;n, bạn h&atilde;y mở hiển thị thước ngang bằng c&aacute;ch chọn&nbsp;<strong>tab View</strong>, sau đ&oacute; chọn v&agrave;o&nbsp;<strong>Ruler</strong>./n
<img title="Đầu ti&ecirc;n, bạn h&atilde;y mở hiển thị thước ngang bằng c&aacute;ch chọn tab View, sau đ&oacute; chọn v&agrave;o Ruler." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-19.jpg" alt="Đầu ti&ecirc;n, bạn h&atilde;y mở hiển thị thước ngang bằng c&aacute;ch chọn tab View, sau đ&oacute; chọn v&agrave;o Ruler." width="730" height="512" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-19.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn&nbsp;<strong>k&eacute;o thanh c&ocirc;ng cụ căn chỉnh lề 2 b&ecirc;n</strong>&nbsp;theo mong muốn l&agrave; xong./n
<img title="Bạn k&eacute;o thanh c&ocirc;ng cụ căn chỉnh lề 2 b&ecirc;n theo mong muốn l&agrave; xong." src="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-20.jpg" alt="Bạn k&eacute;o thanh c&ocirc;ng cụ căn chỉnh lề 2 b&ecirc;n theo mong muốn l&agrave; xong." width="730" height="307" data-original="https://cdn.tgdd.vn/Files/2021/10/05/1388058/dinh-dang-van-ban-trong-word-de-co-mot-file-dung-c-20.jpg">/n
</div>', N'044225_dinh-dang-van-ban-chuan-trong-word_thumb.png', 13, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Cách tạo bảng và định dạng trong Word ', N'<h3 id="hmenuid1">1. C&aacute;ch tạo bảng trong Word</h3>
<h4 id="hmenuid2">C&aacute;ch tạo tự động c&oacute; thể t&ugrave;y chỉnh</h4>
<strong>Bước 1:&nbsp;</strong>Bạn mở file Word v&agrave;&nbsp;<strong>đặt vị tr&iacute; con trỏ chuột tại nơi bạn muốn tạo bảng</strong>. Sau đ&oacute;, bạn chọn&nbsp;<strong>Insert&nbsp;</strong>rồi chọn&nbsp;<strong>Table</strong>./n
<img title="Bạn chọn Insert rồi chọn Table." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor.jpg" alt="Bạn chọn Insert rồi chọn Table." width="730" height="536" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn h&atilde;y&nbsp;<strong>k&eacute;o chuột tr&aacute;i v&agrave;o số h&agrave;ng v&agrave; số cột&nbsp;</strong>m&agrave; bạn muốn tạo bảng.&nbsp;/n
<img title="Bạn h&atilde;y k&eacute;o chuột tr&aacute;i v&agrave;o số h&agrave;ng v&agrave; số cột m&agrave; bạn muốn tạo để th&ecirc;m bảng." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-1.jpg" alt="Bạn h&atilde;y k&eacute;o chuột tr&aacute;i v&agrave;o số h&agrave;ng v&agrave; số cột m&agrave; bạn muốn tạo để th&ecirc;m bảng." width="730" height="320" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-1.jpg">/n
<h4 id="hmenuid3">Tạo bảng bằng c&aacute;ch nhập số h&agrave;ng, cột</h4>
<strong>Bước 1:</strong>&nbsp;Bạn mở file Word, sau đ&oacute; v&agrave;o tab&nbsp;<strong>Insert&nbsp;</strong>v&agrave; chọn&nbsp;<strong>Table</strong>./n
<img title="V&agrave;o tab Insert v&agrave; chọn Table" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-2.jpg" alt="V&agrave;o tab Insert v&agrave; chọn Table" width="730" height="711" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-2.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn chọn<strong>&nbsp;Insert Table</strong>./n
<img title="Bạn chọn Insert Table." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-3.jpg" alt="Bạn chọn Insert Table." width="730" height="705" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-3.jpg">/n
<strong>Bước 3:&nbsp;</strong>Hộp thoại<strong>&nbsp;Insert Table&nbsp;</strong>sẽ xuất hiện, bạn chỉ việc&nbsp;<strong>điền số cột v&agrave; số h&agrave;ng</strong>&nbsp;bạn muốn tạo, sau đ&oacute; nhấn&nbsp;<strong>OK</strong>&nbsp;để tạo bảng./n
<div class="infobox"><strong>Cụ thể:</strong>
<strong>Number of columns:&nbsp;</strong>Số cột bạn muốn tạo./n
<strong>Number of rows:&nbsp;</strong>Số h&agrave;ng bạn muốn tạo.</div>
<img title="Điền số cột v&agrave; số h&agrave;ng bạn muốn tạo v&agrave; nhấn OK để tạo bảng." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-4.jpg" alt="Điền số cột v&agrave; số h&agrave;ng bạn muốn tạo v&agrave; nhấn OK để tạo bảng." width="730" height="616" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-4.jpg">/n
<h4 id="hmenuid4">Tạo bảng bằng c&aacute;ch vẽ thủ c&ocirc;ng</h4>
<strong>Bước 1:&nbsp;</strong>Bạn mở file Word muốn chỉnh sửa v&agrave; chọn&nbsp;<strong>Insert</strong>, sau đ&oacute; chọn&nbsp;<strong>Table</strong>./n
<img title="Chọn Insert, sau đ&oacute; chọn Table." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-2.jpg" alt="Chọn Insert, sau đ&oacute; chọn Table." width="730" height="711" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-2.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn chọn&nbsp;<strong>Draw Table</strong>./n
<img title="Bạn chọn Draw Table." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-5.jpg" alt="Bạn chọn Draw Table." width="730" height="680" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-5.jpg">/n
<strong>Bước 3:&nbsp;</strong>Bạn bấm&nbsp;<strong>giữ chuột tr&aacute;i để tiến h&agrave;nh vẽ bảng</strong>. Đồng thời, bạn h&atilde;y r&ecirc; chuột từ tr&aacute;i sang phải theo chiều hướng xuống để tạo ra được c&aacute;c đường khung bảng. Tiếp đến, bạn kẻ c&aacute;c đường dọc, ngang để tạo c&aacute;c cột, h&agrave;ng, &ocirc; cần thiết cho bảng./n
<img title="Bấm giữ chuột tr&aacute;i để tiến h&agrave;nh vẽ bảng" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-6.jpg" alt="Bấm giữ chuột tr&aacute;i để tiến h&agrave;nh vẽ bảng" width="730" height="401" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-6.jpg">/n
Ngo&agrave;i ra, Microsoft Word đ&atilde; hỗ trợ t&iacute;nh năng cho ph&eacute;p bạn tạo bảng từ văn bản. Với t&iacute;nh năng n&agrave;y, bạn chỉ cần th&ecirc;m c&aacute;c k&yacute; tự ph&acirc;n t&aacute;ch v&agrave;o văn bản để chia cột l&agrave; ho&agrave;n tất./n
<h3 id="hmenuid5"><span class="dropcap" data-crown="">2. </span>C&aacute;ch chỉnh sửa bảng trong Word</h3>
<h4 id="hmenuid6">Ph&oacute;ng to, thu nhỏ k&iacute;ch thước trong bảng</h4>
<strong>Chỉnh sửa k&iacute;ch thước &ocirc;</strong>/n
<strong>Bước 1:</strong>&nbsp;Để chỉnh sửa k&iacute;ch thước 1 &ocirc;, bạn click đ&uacute;p chuột để&nbsp;<strong>b&ocirc;i đen &ocirc; cần chỉnh sửa k&iacute;ch thước.&nbsp;</strong>/n
<img title="Click đ&uacute;p chuột để b&ocirc;i đen &ocirc; cần chỉnh sửa k&iacute;ch thước" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-28.jpg" alt="Click đ&uacute;p chuột để b&ocirc;i đen &ocirc; cần chỉnh sửa k&iacute;ch thước" width="730" height="296" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-28.jpg">/n
<strong>Bước 2:</strong>&nbsp;Sau đ&oacute; di chuột đến đường kẻ&nbsp;<strong>tr&aacute;i/phải&nbsp;</strong>của &ocirc; đ&oacute; đến khi thấy xuất hiện&nbsp;<strong>mũi t&ecirc;n 2 chiều</strong>&nbsp;th&igrave; bạn nhấn&nbsp;<strong>giữ chuột tr&aacute;i v&agrave; k&eacute;o sang hai b&ecirc;n</strong>&nbsp;để thay đổi k&iacute;ch thước &ocirc; bạn mong muốn./n
<img title="Nhấn giữ chuột tr&aacute;i v&agrave; k&eacute;o sang hai b&ecirc;n để thay đổi k&iacute;ch thước &ocirc; bạn mong muốn" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-29.jpg" alt="Nhấn giữ chuột tr&aacute;i v&agrave; k&eacute;o sang hai b&ecirc;n để thay đổi k&iacute;ch thước &ocirc; bạn mong muốn" width="730" height="325" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-29.jpg">/n
<strong>Chỉnh sửa k&iacute;ch thước h&agrave;ng, cột</strong>/n
Khi bạn muốn chỉnh sửa&nbsp;<strong>k&iacute;ch thước của một h&agrave;ng/cột&nbsp;</strong>n&agrave;o đ&oacute;, bạn h&atilde;y chọn h&agrave;ng/cột đ&oacute;. Tiếp theo, bạn di chuột đến vị tr&iacute; đường kẻ tr&aacute;i/phải/tr&ecirc;n/dưới của &ocirc; đ&oacute; đến khi thấy&nbsp;<strong>mũi t&ecirc;n 2 chiều</strong>&nbsp;xuất hiện th&igrave; bạn&nbsp;<strong>giữ chuột tr&aacute;i v&agrave; k&eacute;o&nbsp;</strong>đến khi đạt k&iacute;ch thước mong muốn./n
<img title="Di chuột đến vị tr&iacute; đường kẻ tr&aacute;i/phải/tr&ecirc;n/dưới của &ocirc; đ&oacute;, giữ v&agrave; k&eacute;o mũi t&ecirc;n 2 chiều đến khi đạt k&iacute;ch thước mong muốn." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-8.jpg" alt="Di chuột đến vị tr&iacute; đường kẻ tr&aacute;i/phải/tr&ecirc;n/dưới của &ocirc; đ&oacute;, giữ v&agrave; k&eacute;o mũi t&ecirc;n 2 chiều đến khi đạt k&iacute;ch thước mong muốn." width="730" height="319" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-8.jpg">/n
<strong>Chỉnh sửa k&iacute;ch thước bảng</strong>/n
Khi bạn cần chỉnh sửa k&iacute;ch thước bảng, bạn h&atilde;y đặt chuột tại &ocirc; nhỏ ở&nbsp;<strong>g&oacute;c dưới b&ecirc;n phải bảng.&nbsp;</strong>Sau đ&oacute;, bạn nhấn&nbsp;<strong>giữ v&agrave; k&eacute;o chuột sang tr&aacute;i/phải</strong>&nbsp;hoặc<strong>&nbsp;l&ecirc;n/xuống</strong>&nbsp;để thu hẹp hoặc mở rộng k&iacute;ch thước của bảng./n
<img title="Đặt chuột tại g&oacute;c dưới b&ecirc;n phải bảng v&agrave; k&eacute;o mũi t&ecirc;n hai chiều sang tr&aacute;i/phải để thu hẹp hoặc mở rộng k&iacute;ch thước của bảng." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-9.jpg" alt="Đặt chuột tại g&oacute;c dưới b&ecirc;n phải bảng v&agrave; k&eacute;o mũi t&ecirc;n hai chiều sang tr&aacute;i/phải để thu hẹp hoặc mở rộng k&iacute;ch thước của bảng." width="730" height="285" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-9.jpg">/n
<h4 id="hmenuid7">T&ocirc; m&agrave;u cho bảng</h4>
<strong>Bước 1:&nbsp;</strong>B&ocirc;i đen &ocirc;, h&agrave;ng, cột hoặc cả bảng m&agrave; bạn muốn t&ocirc; m&agrave;u./n
<img title="B&ocirc;i đen &ocirc;, h&agrave;ng, cột hoặc cả bảng m&agrave; bạn muốn t&ocirc; m&agrave;u." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-10.jpg" alt="B&ocirc;i đen &ocirc;, h&agrave;ng, cột hoặc cả bảng m&agrave; bạn muốn t&ocirc; m&agrave;u." width="730" height="318" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-10.jpg">/n
<strong>Bước 2:&nbsp;</strong>Tại thanh c&ocirc;ng cụ&nbsp;<strong>Home</strong>, bạn chọn biểu tượng<strong>&nbsp;th&ugrave;ng sơn</strong>&nbsp;v&agrave; lựa chọn&nbsp;<strong>m&agrave;u&nbsp;</strong>bạn muốn t&ocirc; l&agrave; ho&agrave;n tất./n
<img title="Bạn chọn biểu tượng th&ugrave;ng sơn v&agrave; lựa chọn m&agrave;u bạn muốn t&ocirc;." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-11.jpg" alt="Bạn chọn biểu tượng th&ugrave;ng sơn v&agrave; lựa chọn m&agrave;u bạn muốn t&ocirc;." width="730" height="399" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-11.jpg">/n
<h4 id="hmenuid8">Gộp, t&aacute;ch &ocirc; trong bảng</h4>
<strong>Bước 1: B&ocirc;i đen &ocirc;</strong>&nbsp;m&agrave; bạn muốn gộp/t&aacute;ch trong bảng./n
<img title="B&ocirc;i đen &ocirc; m&agrave; bạn muốn gộp trong bảng." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-12.jpg" alt="B&ocirc;i đen &ocirc; m&agrave; bạn muốn gộp trong bảng." width="730" height="345" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-12.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn<strong>&nbsp;click chuột phải&nbsp;</strong>v&agrave; chọn&nbsp;<strong>Merge Cells</strong>&nbsp;để gộp &ocirc;./n
<img title="Bạn click chuột tr&aacute;i v&agrave; chọn Merge Cells." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-13.jpg" alt="Bạn click chuột tr&aacute;i v&agrave; chọn Merge Cells." width="730" height="403" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-13.jpg">/n
Vậy l&agrave; bạn gộp &ocirc; th&agrave;nh c&ocirc;ng rồi./n
<img title="&Ocirc; đ&atilde; được gộp" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-14.jpg" alt="&Ocirc; đ&atilde; được gộp" width="730" height="286" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-14.jpg">/n
<strong>Bước 3:</strong>&nbsp;Nếu bạn muốn t&aacute;ch &ocirc;, bạn v&agrave;o tab&nbsp;<strong>Layout&nbsp;</strong>rồi chọn&nbsp;<strong>Split Cells</strong>&nbsp;v&agrave;<strong>&nbsp;điền số cột/h&agrave;ng&nbsp;</strong>muốn t&aacute;ch, sau đ&oacute; bấm&nbsp;<strong>OK&nbsp;</strong>để ho&agrave;n tất t&aacute;ch &ocirc;./n
<div class="infobox"><strong>Ch&uacute; th&iacute;ch:</strong>
<strong>Number of columns:&nbsp;</strong>Nhập số cột bạn muốn t&aacute;ch./n
<strong>Number of rows:</strong>&nbsp;Nhập số h&agrave;ng bạn muốn t&aacute;ch./n
</div>
<img title="Bạn v&agrave;o tab Layout rồi chọn Split Cells v&agrave; điền số cột/h&agrave;ng muốn t&aacute;ch, sau đ&oacute; bấm OK để ho&agrave;n tất t&aacute;ch &ocirc;." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-15.jpg" alt="Bạn v&agrave;o tab Layout rồi chọn Split Cells v&agrave; điền số cột/h&agrave;ng muốn t&aacute;ch, sau đ&oacute; bấm OK để ho&agrave;n tất t&aacute;ch &ocirc;." width="730" height="425" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-15.jpg">/n
Vậy l&agrave; bạn đ&atilde; t&aacute;ch &ocirc; th&agrave;nh c&ocirc;ng./n
<img title="T&aacute;ch &ocirc; th&agrave;nh c&ocirc;ng" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-16.jpg" alt="T&aacute;ch &ocirc; th&agrave;nh c&ocirc;ng" width="730" height="277" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-16.jpg">/n
<h4 id="hmenuid9">Chỉnh vị tr&iacute; nội dung trong bảng</h4>
<strong>Bước 1:&nbsp;</strong>Bạn tiến h&agrave;nh&nbsp;<strong>b&ocirc;i đen &ocirc;, h&agrave;ng, bảng</strong>&nbsp;m&agrave; bạn muốn chỉnh vị tr&iacute; nội dung./n
<img title="B&ocirc;i đen &ocirc;, h&agrave;ng, bảng m&agrave; bạn muốn chỉnh vị tr&iacute; nội dung." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-18.jpg" alt="B&ocirc;i đen &ocirc;, h&agrave;ng, bảng m&agrave; bạn muốn chỉnh vị tr&iacute; nội dung." width="730" height="318" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-18.jpg">/n
<strong>Bước 2:&nbsp;</strong>Bạn chọn tab&nbsp;<strong>Layout</strong>, sau đ&oacute; chọn kiểu căn chỉnh vị tr&iacute; nội dung trong mục&nbsp;<strong>Alignment</strong>./n
<img title="Bạn chọn tab Layout, sau đ&oacute; chọn kiểu căn chỉnh vị tr&iacute; nội dung trong mục Alignment." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-19.jpg" alt="Bạn chọn tab Layout, sau đ&oacute; chọn kiểu căn chỉnh vị tr&iacute; nội dung trong mục Alignment." width="730" height="290" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-19.jpg">/n
<strong>Xem th&ecirc;m</strong>:&nbsp;<a title="C&aacute;ch chuyển bảng Excel v&agrave;o Word" href="https://www.dienmayxanh.com/kinh-nghiem-hay/cac-cach-chen-bang-vao-word-chi-tiet-tung-buoc-1357896" rel="dofollow noopener">C&aacute;ch chuyển bảng Excel v&agrave;o Word</a>/n
<h3 id="hmenuid10"><span class="dropcap" data-crown="">3</span>C&aacute;ch th&ecirc;m, x&oacute;a cột, h&agrave;ng trong bảng</h3>
<h4 id="hmenuid11">C&aacute;ch th&ecirc;m cột, h&agrave;ng</h4>
<strong>Bước 1:</strong>&nbsp;Bạn<strong>&nbsp;b&ocirc;i đen cột, h&agrave;ng</strong>&nbsp;m&agrave; bạn muốn th&ecirc;m./n
<img title="Bạn b&ocirc;i đen cột, h&agrave;ng m&agrave; bạn muốn th&ecirc;m." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-24.jpg" alt="Bạn b&ocirc;i đen cột, h&agrave;ng m&agrave; bạn muốn th&ecirc;m." width="730" height="300" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-24.jpg">/n
<strong>Bước 2:</strong>&nbsp;Bạn chọn&nbsp;<strong>Insert</strong>, sau đ&oacute; bạn h&atilde;y chọn kiểu th&ecirc;m./n
<div class="infobox"><strong>Trong đ&oacute;:</strong>
<strong>Insert Columns to the Left:</strong>&nbsp;Cho ph&eacute;p bạn ch&egrave;n 1 cột sang b&ecirc;n tr&aacute;i./n
<strong>Insert Columns to the Right:</strong>&nbsp;Cho ph&eacute;p bạn ch&egrave;n 1 cột sang b&ecirc;n phải./n
<strong>Insert Row Above:</strong>&nbsp;Cho ph&eacute;p bạn ch&egrave;n h&agrave;ng ph&iacute;a tr&ecirc;n./n
<strong>Insert Row Below:</strong>&nbsp;Cho ph&eacute;p bạn ch&egrave;n h&agrave;ng ph&iacute;a dưới./n
<strong>Insert Cells:</strong>&nbsp;Ch&egrave;n &ocirc;/n
</div>
<img title="Bạn chọn Insert, sau đ&oacute; bạn h&atilde;y chọn kiểu th&ecirc;m." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-25.jpg" alt="Bạn chọn Insert, sau đ&oacute; bạn h&atilde;y chọn kiểu th&ecirc;m." width="730" height="379" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-25.jpg">/n
<strong>Bước 2:&nbsp;</strong>Ở v&iacute; dụ n&agrave;y l&agrave; th&ecirc;m cột b&ecirc;n tr&aacute;i n&ecirc;n sẽ chọn&nbsp;<strong>Insert Columns to the Left</strong>./n
<img title="Ho&agrave;n tất ch&egrave;n th&ecirc;m một cột b&ecirc;n tr&aacute;i." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-26.jpg" alt="Ho&agrave;n tất ch&egrave;n th&ecirc;m một cột b&ecirc;n tr&aacute;i." width="730" height="279" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-26.jpg">/n
<h4 id="hmenuid12">C&aacute;ch x&oacute;a cột, h&agrave;ng</h4>
<strong>Bước 1:</strong>&nbsp;Bạn&nbsp;<strong>b&ocirc;i đen &ocirc;, cột, h&agrave;ng, bảng</strong>&nbsp;m&agrave; bạn muốn x&oacute;a./n
<img title="Bạn b&ocirc;i đen &ocirc;, cột, h&agrave;ng, bảng m&agrave; bạn muốn x&oacute;a." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-21.jpg" alt="Bạn b&ocirc;i đen &ocirc;, cột, h&agrave;ng, bảng m&agrave; bạn muốn x&oacute;a." width="730" height="352" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-21.jpg">/n
<strong>Bước 2:&nbsp;</strong>Bạn&nbsp;<strong>click chuột tr&aacute;i</strong>&nbsp;rồi chọn&nbsp;<strong>Delete Cells</strong>./n
<img title="Bạn click chuột tr&aacute;i rồi chọn Delete Cells" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-20.jpg" alt="Bạn click chuột tr&aacute;i rồi chọn Delete Cells" width="730" height="402" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-20.jpg">/n
<strong>Bước 3:&nbsp;</strong>Bạn h&atilde;y&nbsp;<strong>chọn kiểu x&oacute;a</strong>./n
<div class="infobox"><strong>Cụ thể:</strong>
<strong>Shift cells left:&nbsp;</strong>Cho ph&eacute;p bạn x&oacute;a v&agrave; đẩy k&yacute; tự từ phải sang tr&aacute;i./n
<strong>Shift cells up:&nbsp;</strong>Cho ph&eacute;p bạn x&oacute;a v&agrave; đẩy k&yacute; tự l&ecirc;n tr&ecirc;n./n
<strong>Delete entire row:</strong>&nbsp;Cho ph&eacute;p bạn x&oacute;a to&agrave;n bộ &ocirc; trong h&agrave;ng./n
<strong>Delete entire column:</strong>&nbsp;Cho ph&eacute;p bạn x&oacute;a to&agrave;n bộ &ocirc; trong cột.</div>
<img title="Bạn h&atilde;y chọn kiểu x&oacute;a sau đ&oacute; nhấp OK để ho&agrave;n tất." src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-22.jpg" alt="Bạn h&atilde;y chọn kiểu x&oacute;a sau đ&oacute; nhấp OK để ho&agrave;n tất." width="730" height="312" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-22.jpg">/n
<strong>Bước 4:</strong>&nbsp;Tại v&iacute; dụ n&agrave;y l&agrave; x&oacute;a h&agrave;ng n&ecirc;n sẽ chọn&nbsp;<strong>Delete entire row</strong>&nbsp;v&agrave; nhấp&nbsp;<strong>OK</strong>&nbsp;để ho&agrave;n tất./n
<img title="X&oacute;a h&agrave;ng th&agrave;nh c&ocirc;ng" src="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-23.jpg" alt="X&oacute;a h&agrave;ng th&agrave;nh c&ocirc;ng" width="730" height="344" data-original="https://cdn.tgdd.vn/Files/2021/09/10/1381601/huong-dan-tao-bang-dinh-dang-va-xoa-ban-trong-wor-23.jpg">/n', N'cach-lam-muc-luc-trong-word-1.jpg', 14, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Hướng dẫn các kiểu tạo danh sách trong Word', N'Tạo danh s&aacute;ch trong&nbsp;<a href="https://www.microsoft.com/vi-vn/microsoft-365/word" target="_blank" rel="noopener">Word</a>&nbsp;l&agrave; thao t&aacute;c rất cần thiết trong việc xử l&yacute; t&agrave;i liệu. Thao t&aacute;c n&agrave;y gi&uacute;p cho văn bản của bạn trở n&ecirc;n mạch lạc, đẹp mắt hơn. Vậy bạn đ&atilde; biết đến c&aacute;c kiểu tạo danh s&aacute;ch n&agrave;o trong Word rồi? H&atilde;y c&ugrave;ng&nbsp;<a href="https://vinaseco.vn/">Vinaseco</a>&nbsp;t&igrave;m hiểu nh&eacute;!/n
<h2><span id="1_Tao_danh_sach_trong_Word_voi_Bullets"><strong>1. Tạo danh s&aacute;ch trong Word với Bullets</strong></span></h2>
<strong><img style="display: block; margin-left: auto; margin-right: auto;" src="https://vinaseco.vn/wp-content/uploads/2021/08/su-dung-chuc-nang-bullet-trong-word-de-tao-diem-nhan-cho-van-ban.jpg" alt="Sử dụng chức năng bullet trong Word để tạo điểm nhấn cho văn bản - Vinaseco"></strong>/n
Với bullets trong Word, bạn c&oacute; thể tạo danh s&aacute;ch với c&aacute;c k&yacute; hiệu ở đầu d&ograve;ng t&ugrave;y chọn. Bao gồm: dấu gạch ngang, dấu cộng, &ocirc; vu&ocirc;ng, dấu t&iacute;ch, h&igrave;nh ảnh&hellip;/n
<h3><span id="Cach_chen_bullets"><strong>C&aacute;ch ch&egrave;n bullets</strong></span></h3>
Để tạo danh s&aacute;ch trong Word với Bullets ch&uacute;ng ta thực hiện theo c&aacute;c bước sau:/n
Bước 1: Chọn đoạn văn bản muốn ch&egrave;n k&yacute; hiệu/n
Bước 2: Chọn Home, click Paragraph v&agrave; tiếp đến l&agrave; Bullets. Bạn cũng c&oacute; thể d&ugrave;ng tổ hợp ph&iacute;m Ctrl + Shift + L/n
<h3><span id="Thay_doi_bullets"><strong>Thay đổi bullets</strong></span></h3>
Bước 1: Chọn đoạn văn bản/n
Bước 2: Chọn Home, sau đ&oacute; chọn Paragraph. Chọn Bullets (dấu mở rộng)/n
Bước 3: Chọn một trong c&aacute;c bullet c&oacute; sẵn tại Bullet Library/n
<h3><span id="Xoa_Bullets"><strong>X&oacute;a Bullets</strong></span></h3>
Để x&oacute;a Bullets rất đơn giản, bạn thực hiện 2 bước sau:/n
Bước 1: Chọn đoạn văn c&oacute; bullets cần x&oacute;a/n
Bước 2: Chọn Home, sau chọn Paragraph, nhấn v&agrave;o Bullets. Cuối c&ugrave;ng chọn None/n
<h2><span id="2_Tao_danh_sach_trong_Word_voi_Numbering"><strong>2. Tạo danh s&aacute;ch trong Word với Numbering</strong></span></h2>
<img class="aligncenter" src="https://st.quantrimang.com/photos/Image/072006/21/numbering1.gif" alt="C&aacute;ch đ&aacute;nh số thứ tự trong word">/n
Đ&acirc;y l&agrave; thao t&aacute;c tự động, rất chuy&ecirc;n nghiệp v&agrave; thực hiện rất nhanh/n
<h3><span id="Dung_Numbering_co_san_tai_Numbering_Library"><strong>D&ugrave;ng Numbering c&oacute; sẵn tại Numbering Library</strong></span></h3>
Với Numbering c&oacute; sẵn, bạn cần thực hiện c&aacute;c bước sau:/n
Bước 1: Chọn đoạn văn bản cần đ&aacute;nh số/n
Bước 2: Chọn Home , chọn&nbsp; Paragraph v&agrave; chọn Numbering/n
Bước 3: Chọn một trong c&aacute;c kiểu đ&aacute;nh số c&oacute; sẵn tại Numbering Library/n
<h3><span id="Tuy_chinh_Numbering"><strong>T&ugrave;y chỉnh Numbering</strong></span></h3>
&ndash; X&oacute;a Numbering/n
Bước 1: Chọn đoạn văn bản c&oacute; Numbering cần x&oacute;a/n
Bước 2: Chọn Home, tiếp đến Paragraph, rồi đến Numbering. Cuối c&ugrave;ng Chọn None/n
&ndash; T&ugrave;y chỉnh số bắt đầu/n
Bước 1: Nhấn chuột tr&aacute;i v&agrave;o Numbering m&agrave; bạn muốn chỉnh sửa/n
Bước 2: Nhấn chuột phải v&agrave;o Numbering đ&atilde; chọn. Sau đ&oacute; Chọn Set Numbering Value&hellip;/n
Bước 3: Chọn Start new List. Tiến h&agrave;nh nhập gi&aacute; trị bắt đầu tại Set value to/n
Bước 4: Chọn OK để lưu thay đổi hoặc Cancel để hủy./n
&ndash; Nếu bạn c&oacute; hai danh s&aacute;ch v&agrave; muốn danh s&aacute;ch sau tiếp tục đ&aacute;nh số từ danh s&aacute;ch trước:/n
Bước 1: Chọn Numbering đầu ti&ecirc;n của danh s&aacute;ch hai/n
Bước 2: Nhấn chuột phải chọn Continue Numbering/n
<h2><span id="3_Tao_danh_sach_trong_Word_voi_Multilevel_List"><strong>3. Tạo danh s&aacute;ch trong Word với Multilevel List</strong></span></h2>
Đ&acirc;y l&agrave; t&iacute;nh năng kh&aacute; hay v&agrave; đặc biệt. Với t&iacute;nh năng n&agrave;y c&aacute;c bạn c&oacute; thể tạo danh s&aacute;ch trong Word c&oacute; nhiều mục lớn, nhỏ kh&aacute;c nhau./n
<img class="aligncenter" src="https://trungtamgiasusaoviet.com/public/files/images/2020/06/14/141/chon-multilevel-list-de-tao-muc-luc-tu-dong-trong-word-2(1).png" alt="Sử Dụng Multilevel List Để Tạo Mục Lục Tự Động Trong Word 7/2021">/n
&nbsp;/n
Bước 1: Chọn vị tr&iacute; muốn th&ecirc;m Multilevel List (vị tr&iacute; con trỏ soạn thảo)/n
Bước 2: Chọn Home, sau đ&oacute; Paragraph v&agrave; chọn Multilevel List/n
Bước 3: Chọn mẫu bạn muốn tại List Library./n
Nhảy đến cấp độ con, bạn chỉ cần: Chọn Home &rarr;Paragraph &rarr; Increase Indent./n
Nhảy đến cấp độ cha, cũng tương tự: &nbsp;Chọn Home &rarr;&nbsp; Paragraph &rarr; Decrease Indent/n', N'cach-lam-muc-luc-trong-word-1.jpg', 15, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Những tính năng mới trên Word 2019 hay nhất', N'<p class="ads_displayed">Microsoft Word từ l&acirc;u đ&atilde; trở th&agrave;nh một trong những c&ocirc;ng cụ rất hữu &iacute;ch cho người d&ugrave;ng. Hầu hết, cứ v&agrave;i&nbsp;năm một lần&nbsp;Microsoft lại&nbsp;ra mắt một phi&ecirc;n bản Word mới v&agrave; năm nay cũng thế. Nếu bạn đang muốn biết Word 2019 đ&atilde; c&oacute; những đổi mới g&igrave; so với phi&ecirc;n bản tiền nhiệm của n&oacute;, th&igrave; đừng bỏ qua b&agrave;i viết sau đ&acirc;y của Freetuts./n
<p class="ads_displayed">&nbsp;/n
<p class="ads_displayed">Trong b&agrave;i viết n&agrave;y, ch&uacute;ng t&ocirc;i sẽ chia sẽ đến c&aacute;c bạn những t&iacute;nh năng mới thực sự hữu &iacute;ch tr&ecirc;n Word 2019, mời bạn c&ugrave;ng theo d&otilde;i nh&eacute;./n
<h2 id="goto-h2-0" data-stt="0">1. Dịch văn bản sang ng&ocirc;n ngữ kh&aacute;c tr&ecirc;n Word</h2>
<p class="ads_displayed">Một trong những t&iacute;nh năng mới tr&ecirc;n Word 2019 đ&oacute; ch&iacute;nh l&agrave; khả năng dịch văn bản sang một ng&ocirc;n ngữ kh&aacute;c&nbsp;ngay tr&ecirc;n Word v&agrave; cả Excel hay PowerPoint ./n
<p class="ads_displayed">Với t&iacute;nh năng năng n&agrave;y, bạn c&oacute; thể dịch văn bản theo 2 c&aacute;ch như sau:/n
B&agrave;i viết n&agrave;y được đăng tại [free tuts .net]/n
<h3 id="goto-h3-0">C&aacute;ch 1: Dịch đoạn văn bản được chọn (<em>Translate Selection</em>)</h3>
<p class="ads_displayed">Để dịch đoạn văn bản được chọn (từ hoặc cụm từ) bạn thực hiện theo c&aacute;c c&aacute;ch sau/n
<p class="ads_displayed"><strong>Bước 1:</strong>&nbsp;Chọn từ hoặc cụm từ cần dịch/n
<p class="ads_displayed"><strong>Bước 2:&nbsp;</strong>Bạn v&agrave;o&nbsp;<em>Review -&gt;&nbsp;chọn&nbsp;Translate --&gt;&nbsp;chọn&nbsp;Translate Selection</em>.&nbsp; L&uacute;c n&agrave;y khung&nbsp;Translator&nbsp;xuất hiện với giao diện như h&igrave;nh b&ecirc;n dưới./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-1.JPG" alt="nhung tinh nang moi tren 20word 2019 1 JPG">/n
<p class="ads_displayed">Tiếp đến, bạn chọn ng&ocirc;n ngữ hiện tại của văn bản v&agrave; ng&ocirc;n ngữ m&agrave; bạn muốn dịch tại mục From v&agrave; To, l&uacute;c n&agrave;y&nbsp; hệ thống Word sẽ tự đọng dịch đoạn văn bản hiện tại cho bạn. &nbsp;/n
<p class="ads_displayed">V&agrave; nếu bạn muốn thay thế đoạn văn bản hiện tại bằng đoạn văn bản đ&atilde; được dịch th&igrave; bạn h&atilde;y bấm chọn n&uacute;t Insert&nbsp;ngay b&ecirc;n dưới./n
<p class="ads_displayed">Ngo&agrave;i&nbsp; ra, bạn cũng c&oacute; thể thưc hiện dịch một đoạn văn bản nhanh hơn bằng c&aacute;ch h&atilde;y chọn từ hoặc cụm từ muốn dịch, sau đ&oacute; nhấp chuột phải v&agrave; chọn Translate. L&uacute;c n&agrave;y, khung Translator sẽ xuất hiện v&agrave; tự động dịch cho bạn./n
<h3 id="goto-h3-1">C&aacute;ch 2: Dịch to&agrave;n bộ t&agrave;i liệu (<em>Translate Document</em>)</h3>
<p class="ads_displayed">Để dịch to&agrave;n bộ t&agrave;i liệu bạn l&agrave;m theo c&aacute;c bước như sau:/n
<strong>Bước 1:</strong>&nbsp;Đầu ti&ecirc;n, bạn h&atilde;y mở trang t&agrave;i liệu cần dịch ra/n
<strong>Bước 2:&nbsp;</strong>Bạn nhấp v&agrave;o&nbsp;<em>Review -&gt;&nbsp;chọn&nbsp;Translate --&gt;&nbsp;chọn&nbsp;Translate Document</em>, th&igrave; khung Translator&nbsp;xuất hiện như sau:/n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019.png" alt="nhung tinh nang moi tren 20word 2019 png">/n
<strong>Bước 3:</strong>&nbsp;Bạn chọn ng&ocirc;n ngữ hiện tại của t&agrave;i liệu v&agrave; chọn ng&ocirc;n ngữ m&agrave; bạn muốn dịch rồi nhấp n&uacute;t&nbsp;Translate l&agrave; mở ra trong cửa sổ Word mới hiển thị nội dung đ&atilde; dịch của cả t&agrave;i liệu.&nbsp; Bạn tiến h&agrave;nh lưu hoặc sao ch&eacute;p phần bản dịch đ&oacute; để phục vụ cho nhu cầu của m&igrave;nh./n
<h2 id="goto-h2-1" data-stt="1">2. Hỗ trợ soạn thảo biểu thức to&aacute;n học bằng phương tr&igrave;nh LaTex</h2>
Một t&iacute;nh&nbsp;năng mới tr&ecirc;n Word 2019 được rất nhiều người ưa chuộng đ&oacute; ch&iacute;nh l&agrave; hỗ trợ soạn thảo biểu thức to&aacute;n học bằng phương tr&igrave;nh LaTex. Với t&iacute;nh năng n&agrave;y, người d&ugrave;ng sẽ kh&ocirc;ng c&ograve;n kh&oacute; khăn khi soạn thảo một biểu thức to&agrave;n học như trước đ&acirc;y&nbsp; m&agrave; thay v&agrave;o đ&oacute; bạn chỉ cần nhập c&ocirc;ng thức bằng c&uacute; ph&aacute;p l&agrave; hệ thống sẽ tự chuyển đổi sang phương tr&igrave;nh LaTex. Thật tuyệt với đ&uacute;ng kh&ocirc;ng n&agrave;o!/n
Bạn c&oacute; thể thực hiện trợ soạn thảo biểu thức to&aacute;n học bằng phương tr&igrave;nh LaTex bằng c&aacute;c bước sau:/n
<strong>Bước 1:&nbsp;</strong>Bạn nhấn v&agrave;o&nbsp;<strong>Ch&egrave;n</strong>&nbsp;(<em>Insert</em>)&nbsp;v&agrave;&nbsp;chọn&nbsp;<strong>Phương tr&igrave;nh</strong>&nbsp;(<em>Equation</em>)/n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-2_600x285.png" alt="nhung tinh nang moi tren 20word 2019 2 600x285 png">/n
<strong>Bước 2:</strong>&nbsp;Bạn chọn tiếp&nbsp;LaTeX&nbsp; v&agrave; tiến h&agrave;nh nhập c&ocirc;ng thức theo chuẩn LaTeX v&agrave;o &ocirc;&nbsp;G&otilde; phương&nbsp; tr&igrave;nh ở đ&acirc;y&nbsp;(Type equation here)/n
<strong>Bước 3:&nbsp;</strong>Chọn&nbsp;Covert&nbsp;=&gt; chọn&nbsp;Current &ndash; Professiont&nbsp;như h&igrave;nh b&ecirc;n dưới l&agrave; xong./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-3.png" alt="nhung tinh nang moi tren 20word 2019 3 png">/n
<h2 id="goto-h2-2" data-stt="2">3. Ch&egrave;n tập tin đồ họa v&eacute;c tơ mở rộng (*.svg) v&agrave;o Word</h2>
Kh&ocirc;ng giống như c&aacute;c tệp tin đồ họa ở c&aacute;c định dạng như *.bmp, *.gif, *.jpg&hellip; &nbsp;c&oacute; dung lượng nặng v&agrave; chất lượng h&igrave;nh ảnh k&eacute;m, tập tin đồ họa v&eacute;c tơ mở rộng&nbsp; c&oacute; đu&ocirc;i l&agrave; *.svg&nbsp;lại c&oacute; dung lượng rất nhẹ v&agrave; bạn c&oacute; thể t&ugrave;y chỉnh ph&oacute;ng to, xoay, đổi m&agrave;u sắc, &hellip; t&ugrave;y &yacute; m&agrave; chất lượng kh&ocirc;ng hề giảm xuống. Vậy n&ecirc;n Word 2019 trang bị th&ecirc;m t&iacute;nh năng ch&egrave;n tập tin n&agrave;y &nbsp;thực sự rất hữu &iacute;ch đối với người d&ugrave;ng./n
Để ch&egrave;n tệp &ldquo;*.svg&rdquo; trong Word từ m&aacute;y t&iacute;nh bạn thực hiện rất đơn giản đ&oacute; l&agrave;: K&eacute;o v&agrave; thả tệp từ file tr&ecirc;n m&aacute;y t&iacute;nh v&agrave;o t&agrave;i liệu của bạn l&agrave; xong.&nbsp; C&ograve;n nếu bạn muốn ch&egrave;n tệp &ldquo;*.svg&rdquo; từ m&aacute;y Mac th&igrave;bạn đi tới&nbsp;Ch&egrave;n&nbsp;&gt;&nbsp;Ảnh&nbsp;&gt;&nbsp;Ảnh từ tệp&nbsp; l&agrave; xong./n
Ban cũng n&ecirc;n lưu &yacute; để sử dụng được t&iacute;nh năng n&agrave;y th&igrave; m&aacute;y t&iacute;nh của bạn cần c&oacute; kết nối internet./n
<h2 id="goto-h2-3" data-stt="3">4. Ch&egrave;n biểu tượng mới</h2>
Được n&acirc;ng cấp hơn so với những phi&ecirc;n bản cũ, Word 2019 trang bị th&ecirc;m rất icon kh&aacute;c nhau theo nhiều chủ đề kh&aacute;c nhau cho bạn lựa chọn. Bạn tiến h&agrave;nh ch&egrave;n biểu tương v&agrave;o t&agrave;i liệu của bạn theo c&aacute;c bước sau:/n
<strong>Bước 1:</strong>&nbsp;Bạn v&agrave;o&nbsp;<em>Ch&egrave;n --&gt;&nbsp;Biểu tượng</em>&nbsp;(<em>Icons</em>)/n
&nbsp;/n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-10.png" alt="nhung tinh nang moi tren 20word 2019 10 png">/n
<strong>Bước 2:&nbsp;</strong>L&uacute;c n&agrave;y Hộp thoại&nbsp;Ch&egrave;n biểu tượng (<em>Insert Icons</em>)&nbsp;xuất hiện&nbsp;, bạn chọn icon cần ch&egrave;n v&agrave;o sau đ&oacute; chọn&nbsp;<strong>Ch&egrave;n</strong>&nbsp;(<em>Insert</em>)&nbsp;ở ph&iacute;a dưới b&ecirc;n phải./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-11.png" alt="nhung tinh nang moi tren 20word 2019 11 png">/n
Nếu bạn muốn ch&egrave;n nhiều biểu tương c&ugrave;ng một l&uacute;c th&igrave; bấm v&agrave;o những biểu tượng bạn cần trước khi bấm chữ Ch&egrave;n l&agrave; được./n
<strong>Bước 3:&nbsp;</strong>Sau khi ch&egrave;n xong, bạn c&oacute; thể chỉnh sửa biểu tượng bằng c&aacute;ch xoay, định dạng m&agrave;u nền, m&agrave;u viền, c&aacute;c hiệu ứng &nbsp;v&agrave; chỉnh cỡ biểu tượng của bạn theo &yacute; của bạn./n
<h2 id="goto-h2-4" data-stt="4">5. Ch&egrave;n m&ocirc; h&igrave;nh đồ họa 3D</h2>
Để đ&aacute;p ứng cho nhu cầu sử dụng ng&agrave;y c&agrave;ng cao của người d&ugrave;ng, ngo&agrave;i t&iacute;nh năng ch&egrave;n biểu tượng mới v&agrave; tập tin đồ họa v&eacute;c tơ mở rộng th&igrave; Word 2019 c&ograve;n được trang bị th&ecirc;m t&iacute;nh năng ch&egrave;n m&ocirc; h&igrave;nh đồ họa 3D ./n
Với t&iacute;nh năng n&agrave;y, bạn c&oacute; thể ch&egrave;n theo 2 t&ugrave;y chọn kh&aacute;c nhau đ&oacute; l&agrave; ch&egrave;n tự tệp tin trong m&aacute;y t&iacute;nh v&agrave; ch&egrave;n từ nguồn trực tuyến/n
<h3 id="goto-h3-2">C&aacute;ch 1: Ch&egrave;n từ tệp tin trong m&aacute;y t&iacute;nh</h3>
Để ch&egrave;n tệp tin từ trong m&aacute;y t&iacute;nh của bạn v&agrave;o chương tr&igrave;nh bạn thực hiện lần lược theo c&aacute;c bước sau:/n
<strong>&nbsp;Bước 1:</strong>&nbsp; Bạn bấm v&agrave;o<em>&nbsp;Ch&egrave;n --&gt; chọn m&ocirc; h&igrave;nh 3D (3D Models) --&gt; Từ tệp ... (From a File&hellip;)</em>/n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-6.png" alt="nhung tinh nang moi tren 20word 2019 6 png">/n
<strong>Bước 2:&nbsp;</strong>Hộp thoại Ch&egrave;n m&ocirc; h&igrave;nh&nbsp;3D&nbsp;xuất hiện bạn chọn tệp tin cần ch&egrave;n sau đ&oacute; chọn Ch&egrave;n/n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-7_600x419.jpg" alt="nhung tinh nang moi tren 20word 2019 7 600x419 jpg">/n
<h3 id="goto-h3-3">C&aacute;ch 2:&nbsp; Ch&egrave;n trực tiếp từ nguồn trực tuyến&nbsp;</h3>
Nếu ban muốn thực hiện ch&egrave;n trực tiếp từ nguồn trực tuyến&nbsp;th&igrave; bạn c&oacute; thể thực hiện theo c&aacute;c bước sau:/n
<strong>Bước 1:</strong>&nbsp;Bạn&nbsp;<em>&nbsp;Ch&egrave;n --&gt; chọn m&ocirc; h&igrave;nh 3D (3D Models) --&gt; Từ nguồn trực tuyến (From Online Sources</em><em>)</em>/n
<strong>Bước 2:&nbsp;</strong>L&uacute;c n&agrave;y, cửa sổ m&ocirc; h&igrave;nh đồ họa 3Donline&nbsp;hiện bạn chọn v&agrave;o nh&oacute;m chủ đề rồi chọn m&ocirc; h&igrave;nh 3D cần ch&egrave;n sau đ&oacute; chọn&nbsp;Insert&nbsp;l&agrave; xong./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-8.png" alt="nhung tinh nang moi tren 20word 2019 8 png">/n
<h2 id="goto-h2-5" data-stt="5">6. T&iacute;nh năng nghi&ecirc;n cứu trực tuyến (&nbsp;Researcher)</h2>
N&oacute;i về những t&iacute;nh năng mới tr&ecirc;n Word 2019 th&igrave; ch&uacute;ng ta kh&ocirc;ng thể bỏ qua t&iacute;nh năng nghi&ecirc;n cứu trực tuyến.&nbsp;T&iacute;nh năng n&agrave;y thực sự rất hiệu quả so với việc bạn t&igrave;m kiếm th&ocirc;ng tin tr&ecirc;n Internet một c&aacute;ch th&ocirc;ng thường.&nbsp;Khi bạn sử dụng chức năng n&agrave;y, nếu bạn muốn t&igrave;m kiếm một th&ocirc;ng tin n&agrave;o đ&oacute; th&igrave; n&oacute; sẽ trả về những t&agrave;i liệu tham khảo đến từ c&aacute;c nguồn đ&aacute;ng tin cậy, được đảm bảo bởi một dịch vụ c&oacute; t&ecirc;n Microsoft Academic Search./n
Để bật t&iacute;nh năng n&agrave;y bạn v&agrave;o References &gt; Researcher&nbsp;v&agrave; khung Researcher sẽ xuất hiện ở b&ecirc;n phải của m&agrave;n h&igrave;nh.&nbsp; L&uacute;c n&agrave;y, bạn muốn t&igrave;m kiếm th&ocirc;ng tin g&igrave; th&igrave; bạn sẽ hập cụm từ t&igrave;m kiếm v&agrave; &nbsp;sau đ&oacute; bạn sẽ nhận được danh s&aacute;ch kết quả đến từ c&aacute;c trang web đ&aacute;ng tin cậy./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-9.png" alt="nhung tinh nang moi tren 20word 2019 9 png">/n
Đ&acirc;y thực sự l&agrave; một trong những t&iacute;nh năng rất hữu &iacute;ch cho người d&ugrave;ng, đặc biệt l&agrave; c&aacute;c nh&agrave; nghi&ecirc;n cứu, c&aacute;c sinh vi&ecirc;n đang t&igrave;m kiếm t&agrave;i liệu chuẩn x&aacute;c ,&hellip;/n
<h2 id="goto-h2-6" data-stt="6">7. Tự động lưu trữ (AutoSave)</h2>
Nếu như trước đ&acirc;y t&iacute;nh năng lưu trữ t&agrave;i liệu được biết đến ở Google Sheet th&igrave; hiện nay Word 2019 cũng đ&atilde; xuất hiện rồi nh&eacute;./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-12.png" alt="nhung tinh nang moi tren 20word 2019 12 png">/n
T&iacute;nh năng n&agrave;y sẽ tự động lưu trữ c&aacute;c file của bạn m&agrave; bạn kh&ocirc;ng cần phải l&agrave;m g&igrave; cả. Vậy n&ecirc;n bạn sẽ kh&ocirc;ng phải lo lắng khi đang sử dụng v&agrave; gặp những trường hợp như mất điện, sự cố internet, sự cố hệ thống v&agrave; c&aacute;c trục trặc kh&aacute;c./n
<h2 id="goto-h2-7" data-stt="7">8. T&iacute;nh năng Inking mới cho Word</h2>
Inking l&agrave; một t&iacute;nh năng mới tr&ecirc;n Word 2019 được&nbsp; Microsoft rất tin tưởng. Đ&acirc;y l&agrave; t&iacute;nh năng cho ph&eacute;p &nbsp;người d&ugrave;ng &nbsp;chỉnh sửa t&agrave;i liệu trong Word bằng c&aacute;ch sử dụng b&uacute;t viết tr&ecirc;n c&aacute;c văn bản ở những thiết bị cảm ứng./n
<img src="https://freetuts.net/upload/tut_post/images/2019/12/12/1986/nhung-tinh-nang-moi-tren%20word-2019-13.jpg" alt="nhung tinh nang moi tren 20word 2019 13 jpg">/n
Với t&iacute;nh năng Inking, bạn c&oacute; thể dễ d&agrave;ng &nbsp;vẽ tr&ecirc;n m&agrave;n h&igrave;nh thiết bị bằng ng&oacute;n tay, b&uacute;t stylus hoặc chuột, chọn từ c&aacute;c b&uacute;t tr&ecirc;n m&agrave;n h&igrave;nh với c&aacute;c m&agrave;u v&agrave; độ đậm kh&aacute;c nhau./n
Ngo&agrave;i tất cả những t&iacute;nh năng mới tr&ecirc;n, Microsoft cũng trang bị th&ecirc;m những t&iacute;nh năng hữu &iacute;ch sau đ&acirc;y cho&nbsp;Word&nbsp;2019:/n
<ul>
<li>Theme tối m&agrave;u</li>
<li>Phụ đề cho c&aacute;c c&ocirc;ng cụ học tập v&agrave; m&ocirc; tả bằng &acirc;m thanh</li>
<li>T&iacute;nh năng Text-to-speech (T&iacute;nh năng chuyển văn bản th&agrave;nh giọng n&oacute;i)</li>
<li>C&aacute;c cải thiện trợ năng kh&aacute;c</li>
</ul>
Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin về 8 t&iacute;nh năng mới nhất tr&ecirc;n Word 2019. Hy vọng với những th&ocirc;ng tin tr&ecirc;n bạn sẽ hiểu r&otilde; hơn về c&aacute;c t&iacute;nh năng mới cũng như c&aacute;ch sử dụng những t&iacute;nh năng đ&oacute;. Ch&uacute;c bạn lu&ocirc;n th&agrave;nh c&ocirc;ng!/n', N'wrd2.png', 16, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'7 TÍNH NĂNG HỖ TRỢ LÀM VIỆC HIỆU QUẢ', N'<div class="elementor-element elementor-element-3c8ce71 elementor-widget elementor-widget-text-editor" data-id="3c8ce71" data-element_type="widget" data-widget_type="text-editor.default">
<div class="elementor-widget-container">
Việc ứng dụng phần mềm Word 365 để hỗ trợ l&agrave;m việc hiệu quả trong doanh nghiệp. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hiểu về 7 t&iacute;nh năng nổi bật c&oacute; trong phần mềm quen thuộc n&agrave;y.&nbsp;&nbsp;/n
<h3><span id="Tao_email_chuyen_nghiep" class="ez-toc-section"></span>Tạo email chuy&ecirc;n nghiệp</h3>
Nếu so s&aacute;nh th&igrave; Word 365 price hợp l&yacute; v&agrave; dễ sử dụng hơn tất cả c&aacute;c phần mềm soạn thảo văn bản kh&aacute;c. Ngo&agrave;i ra, với Word người d&ugrave;ng c&ograve;n c&oacute; thể tạo email ngay tr&ecirc;n ch&iacute;nh nền tảng n&agrave;y./n
Bước 1: Tại giao diện ch&iacute;nh của Word 365, click chọn&nbsp;<strong>Gửi thư</strong>/n
Bước 2: Click chọn&nbsp;<strong>Bắt đầu phối thư</strong>&nbsp;&gt;&gt; tiếp đến chọn&nbsp;<strong>Email</strong>/n
</div>
</div>
<div class="elementor-element elementor-element-8a99843 elementor-widget elementor-widget-image" data-id="8a99843" data-element_type="widget" data-widget_type="image.default">
<div class="elementor-widget-container"><img class="attachment-large size-large wp-image-24725 entered lazyloaded" src="https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word.webp" sizes="(max-width: 777px) 100vw, 777px" srcset="https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word.webp 777w,https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word-300x125.webp 300w,https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word-768x320.webp 768w" alt="tạo email tr&ecirc;n word" width="777" height="324" data-lazy-srcset="https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word.webp 777w,https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word-300x125.webp 300w,https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word-768x320.webp 768w" data-lazy-sizes="(max-width: 777px) 100vw, 777px" data-lazy-src="https://mso.vn/wp-content/uploads/2022/11/tao-email-tren-word.webp" data-ll-status="loaded"></div>
</div>
<div class="elementor-element elementor-element-616e4ac elementor-widget elementor-widget-text-editor" data-id="616e4ac" data-element_type="widget" data-widget_type="text-editor.default">
<div class="elementor-widget-container">
Bước 3: Chọn người nhận thư sau đ&oacute; điều chỉnh v&agrave; ho&agrave;n tất/n
<h3><span id="Phat_hien_loi_sai_chinh_ta_va_ngu_phap" class="ez-toc-section"></span>Ph&aacute;t hiện lỗi sai ch&iacute;nh tả v&agrave; ngữ ph&aacute;p</h3>
Khi người d&ugrave;ng sử dụng Word l&agrave;m việc như s&aacute;ng tạo &yacute; tưởng, tạo c&aacute;c văn bản h&agrave;nh ch&iacute;nh hay thiết lập b&aacute;o c&aacute;o&hellip; hệ thống sẽ tự động ph&aacute;t hiện lỗi sai để người d&ugrave;ng c&oacute; thể điều chỉnh. Với t&iacute;nh năng n&agrave;y, người d&ugrave;ng sẽ kh&ocirc;ng c&ograve;n phải lo lắng c&aacute;c lỗi viết sai ch&iacute;nh tả hoặc sử dụng kh&ocirc;ng đ&uacute;ng ngữ ph&aacute;p.&nbsp;/n
<h3><span id="Tim_kiem_va_thay_the" class="ez-toc-section"></span>T&igrave;m kiếm v&agrave; thay thế</h3>
Trong phần mềm Word 365, người d&ugrave;ng c&ograve;n c&oacute; thể sử dụng th&ecirc;m t&iacute;nh năng Word Replace để t&igrave;m kiếm từ, cụm từ hoặc c&acirc;u trong đoạn văn bản bất kỳ v&agrave; thay thế bằng những c&acirc;u chữ ph&ugrave; hợp hơn. Tại đ&acirc;y, người d&ugrave;ng c&oacute; thể được lựa chọn thay thế t&ugrave;y chọn từng mục hoặc thay thế tất cả chỉ với một lần click duy nhất.&nbsp;/n
<h3><span id="Tinh_nang_Watermarks" class="ez-toc-section"></span>T&iacute;nh năng Watermarks</h3>
C&oacute; thể nhiều người d&ugrave;ng chưa biết về t&iacute;nh năng hữu &iacute;ch n&agrave;y được sử dụng tr&ecirc;n Microsoft Word 365. Tại đ&acirc;y, người d&ugrave;ng c&oacute; thể ch&egrave;n h&igrave;nh mờ v&agrave;o đoạn văn bản đang soạn thảo nhằm mục đ&iacute;ch bảo vệ nội dung tr&aacute;ch t&igrave;nh trạng ăn cắp dữ liệu hoặc gia tăng t&iacute;nh chuy&ecirc;n nghiệp. Th&ocirc;ng thường khi sử dụng t&iacute;nh năng n&agrave;y, c&aacute;c doanh nghiệp sẽ sử dụng h&igrave;nh ảnh mang t&iacute;nh chất thương hiệu như logo, slogan&hellip;/n
<h3><span id="Chen_Header_and_Footer" class="ez-toc-section"></span>Ch&egrave;n Header and Footer</h3>
</div>
</div>
<div class="elementor-element elementor-element-2c7ec13 elementor-widget elementor-widget-image" data-id="2c7ec13" data-element_type="widget" data-widget_type="image.default">
<div class="elementor-widget-container"><img class="attachment-large size-large wp-image-24721 entered lazyloaded" src="https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer.webp" sizes="(max-width: 650px) 100vw, 650px" srcset="https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer.webp 650w,https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer-300x157.webp 300w" alt="ch&egrave;n header v&agrave; footer" width="650" height="340" data-lazy-srcset="https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer.webp 650w,https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer-300x157.webp 300w" data-lazy-sizes="(max-width: 650px) 100vw, 650px" data-lazy-src="https://mso.vn/wp-content/uploads/2022/11/chen-header-va-footer.webp" data-ll-status="loaded"></div>
</div>', N'anh-chen-bai-09_1280x720-800-resize.jpg', 17, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Những thông tin mà bạn nên biết về Powerpoint', N'<div id="bxcontentnewsindx" class="bxcontentnews">
<h3 id="hmenuid1"><span class="dropcap" data-crown="">1. </span>Powerpoint l&agrave; g&igrave;?</h3>
PowerPoint nằm trong bộ c&ocirc;ng cụ&nbsp;<a title="Microsoft Office" href="https://www.dienmayxanh.com/phan-mem-microsoft" rel="dofollow noopener">Microsoft Office</a>, l&agrave; một phần mềm tr&igrave;nh chiếu sử dụng c&aacute;c slide để truyền tải th&ocirc;ng tin. N&oacute; cho ph&eacute;p người d&ugrave;ng tạo ra những slide phục vụ c&aacute;c buổi thuyết tr&igrave;nh để thể hiện những th&ocirc;ng điệp trong c&aacute;c lớp học hoặc buổi họp./n
<img title="Powerpoint l&agrave; g&igrave;?" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet-.jpg" alt="Powerpoint l&agrave; g&igrave;?" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet-.jpg">/n
<h3 id="hmenuid2"><span class="dropcap" data-crown="">2. </span>Những c&ocirc;ng dụng của Powerpoint</h3>
Với những c&ocirc;ng dụng tuyệt vời, PowerPoint l&agrave; c&ocirc;ng cụ v&ocirc; c&ugrave;ng hữu &iacute;ch v&agrave; được sử dụng rộng r&atilde;i trong giảng dạy, học tập, doanh nghiệp./n
<ul>
<li>C&aacute;c doanh nghiệp c&oacute; thể tạo c&aacute;c b&agrave;i thuyết tr&igrave;nh cho sản phẩm v&agrave; dịch vụ của m&igrave;nh.</li>
<li>Gi&uacute;p thầy c&ocirc; gi&aacute;o, giảng vi&ecirc;n trong c&aacute;c tổ chức gi&aacute;o dục tạo b&agrave;i giảng sinh động, trực quan cho lớp học.</li>
<li>Gi&uacute;p tạo file tr&igrave;nh chiếu như tiếp thị, dự &aacute;n, đ&aacute;m cưới, sơ đồ,... với v&ocirc; số định dạng v&agrave; mang dấu ấn ri&ecirc;ng phong ph&uacute;.</li>
<li>C&aacute;c hiệu ứng kết hợp c&ugrave;ng h&igrave;nh ảnh ấn tượng sẽ thu h&uacute;t sự ch&uacute; &yacute; của người xem.</li>
</ul>
<img title="Những c&ocirc;ng dụng của Powerpoint" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--1.jpg" alt="Những c&ocirc;ng dụng của Powerpoint" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--1.jpg">/n
<h3 id="hmenuid3"><span class="dropcap" data-crown="">3. </span>Lịch sử ph&aacute;t triển của Microsoft Powerpoint</h3>
Bản ph&aacute;t h&agrave;nh ban đầu được gọi l&agrave; &ldquo;Presenter&rdquo; thiết kế cho c&aacute;c m&aacute;y t&iacute;nh Macintosh bởi Thomas Rudkin v&agrave; Dennis Austin. N&oacute; được đổi t&ecirc;n th&agrave;nh PowerPoint v&agrave;o năm 1987 do c&aacute;c vấn đề thương hiệu từ Robert Gaskins. C&ugrave;ng th&aacute;ng 8 năm đ&oacute;, Forethought Inc được mua lại bởi Microsoft với gi&aacute; 14.000.000$. Từ đ&acirc;y, PowerPoint ch&iacute;nh thức trở th&agrave;nh đơn vị kinh doanh đồ họa của Microsoft.&nbsp;/n
<img title="Lịch sử ph&aacute;t triển của Microsoft Powerpoint" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--2.jpg" alt="Lịch sử ph&aacute;t triển của Microsoft Powerpoint" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--2.jpg">/n
Qua nhiều năm đ&atilde; c&oacute; nhiều phi&ecirc;n bản của bộ phần mềm Microsoft Office, trong đ&oacute; c&oacute; PowerPoint. Dưới đ&acirc;y l&agrave; c&aacute;c Bộ Microsoft Office gần đ&acirc;y c&oacute; PowerPoint:/n
<ul>
<li>PowerPoint Online (hoặc PowerPoint 365) c&oacute; sẵn v&agrave; được cập nhật thường xuy&ecirc;n trong Office 365</li>
<li>PowerPoint 2016 c&oacute; sẵn trong Office 2016</li>
<li>PowerPoint 2013 đ&atilde; c&oacute; trong Office 2013</li>
<li>PowerPoint 2010 đ&atilde; c&oacute; trong Office 2010</li>
<li>PowerPoint 2007 đ&atilde; được bao gồm trong Office 2007</li>
<li>PowerPoint 2003 được bao gồm trong Office 2003</li>
<li>PowerPoint 2002 đ&atilde; được bao gồm trong Office XP</li>
<li>PowerPoint cũng c&oacute; sẵn cho d&ograve;ng m&aacute;y t&iacute;nh Macintosh, cũng như điện thoại v&agrave; m&aacute;y t&iacute;nh bảng</li>
</ul>
<h3 id="hmenuid4"><span class="dropcap" data-crown="">4. </span>Những t&iacute;nh năng nổi bật nhất của Powerpoint</h3>
Kh&ocirc;ng chỉ d&ugrave;ng để thiết kế v&agrave; tr&igrave;nh chiếu slide m&agrave; PowerPoint c&ograve;n c&oacute; những t&iacute;nh năng nổi bật đ&aacute;nh bật mọi đối thủ./n
<strong>Zoom - L&agrave;m nổi bật</strong>/n
Nhờ t&iacute;nh năng n&agrave;y, bạn c&oacute; thể chọn những trang tr&igrave;nh b&agrave;y muốn l&agrave;m nổi bật để c&ocirc;ng cụ tự động tạo một trang tr&igrave;nh b&agrave;y l&agrave;m menu cho tất cả c&aacute;c trang tr&igrave;nh b&agrave;y kh&aacute;c./n
Kh&ocirc;ng chỉ mang đến sự hấp dẫn cho người xem, n&oacute; gi&uacute;p thể hiện tốt hơn chủ đề v&agrave; bối cảnh tổng thể của tr&igrave;nh chiếu./n
<img title="Zoom powerpoint" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--3.jpg" alt="Zoom powerpoint" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--3.jpg">/n
<strong>Morph</strong>/n
Đ&acirc;y l&agrave; một kiểu chuyển đổi slide mới, PowerPoint sẽ nhận dạng v&ograve;ng tr&ograve;n l&agrave; c&ugrave;ng một nội dung v&agrave; sẽ tự động tăng k&iacute;ch thước trong qu&aacute; tr&igrave;nh chuyển đổi. Sử dụng Morph gi&uacute;p mọi thứ trơn tru v&agrave; liền mạch đồng thời dễ d&agrave;ng nhận biết nội dung tr&ecirc;n c&aacute;c trang tr&igrave;nh b&agrave;y thay đổi từ trang chiếu đầu ti&ecirc;n sang trang tiếp theo./n
<img title="Morph" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--4.jpg" alt="Morph" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--4.jpg">/n
<strong>Design ideas - Những mẫu thiết kế c&oacute; sẵn</strong>/n
Khi bạn ch&egrave;n nội dung, designer sẽ tự động tạo ra một &yacute; tưởng mẫu thiết kế cho file PowerPoint của bạn, đồng thời điều chỉnh để ph&ugrave; hợp với bảng m&agrave;u v&agrave; kiểu d&aacute;ng cụ thể của mẫu./n
<img title="Design ideas" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--5.jpg" alt="Design ideas" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--5.jpg">/n
<strong>Slide hyperlink - Li&ecirc;n kết slide</strong>/n
T&iacute;nh năng n&agrave;y cho ph&eacute;p bạn c&oacute; thể tạo c&aacute;c điểm xoay để chuyển đến c&aacute;c trang tr&igrave;nh b&agrave;y kh&aacute;c nhau trong bản tr&igrave;nh b&agrave;y. Như vậy sẽ gi&uacute;p bạn tạo li&ecirc;n kết trực tiếp đến c&aacute;c slide kh&aacute;c, từ đ&oacute; dễ d&agrave;ng di chuyển giữa c&aacute;c slide mong muốn.&nbsp;/n
<img title="Slide hyperlinking" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--6.jpg" alt="Slide hyperlinking" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--6.jpg">/n
<h3 id="hmenuid5"><span class="dropcap" data-crown="">5. </span>Cấu tr&uacute;c của một trang Powerpoint</h3>
Cấu tr&uacute;c của một trang Powerpoint cơ bản bao gồm giao diện chứa c&aacute;c lệnh v&agrave; điều khiển c&ugrave;ng giao diện ch&iacute;nh./n
<strong>Giao diện chứa c&aacute;c lệnh v&agrave; điều khiển</strong>/n
1. Thanh ti&ecirc;u đề nằm ở tr&ecirc;n c&ugrave;ng hiển thị t&ecirc;n của b&agrave;i thuyết tr&igrave;nh./n
2. Thanh Ribbon nằm b&ecirc;n dưới thanh ti&ecirc;u đề bao gồm c&aacute;c thẻ lệnh./n
3. Menu File nằm b&ecirc;n tr&aacute;i thanh ti&ecirc;u đề chứa chứa c&aacute;c lệnh thường xuy&ecirc;n hay sử dụng nhất như tạo file mới, lưu, in ấn,.../n
4. Ba n&uacute;t điều khiển cửa sổ ph&iacute;a cuối b&ecirc;n phải thanh ti&ecirc;u đề./n
5. Thanh c&ocirc;ng cụ nhanh nằm ở b&ecirc;n phải của thanh ti&ecirc;u đề, hiển thị c&aacute;c n&uacute;t Save, Undo, Redo./n
<img title="Giao diện chứa c&aacute;c lệnh v&agrave; điều khiển" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--16.jpg" alt="Giao diện chứa c&aacute;c lệnh v&agrave; điều khiển" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--16.jpg">/n
<strong>Giao diện ch&iacute;nh</strong>/n
1. Cửa sổ Overview chứa h&igrave;nh thu nhỏ của tất cả c&aacute;c trang chiếu trong b&agrave;i thuyết tr&igrave;nh./n
2. Trang chiếu hiển thị trang hiện tại của b&agrave;i thuyết tr&igrave;nh./n
3. Notes nằm ở ph&iacute;a dưới cửa sổ trang chiếu, cho ph&eacute;p tạo ghi ch&uacute; cho trang chiếu./n
4. C&aacute;c n&uacute;t tắt ph&iacute;a dưới c&ugrave;ng cho ph&eacute;p thay đổi trạng th&aacute;i hiển thị, tr&igrave;nh chiếu trang chiếu, ph&oacute;ng to thu nhỏ./n
<img title="Giao diện ch&iacute;nh" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--15.jpg" alt="Giao diện ch&iacute;nh" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--15.jpg">/n
<h3 id="hmenuid6"><span class="dropcap" data-crown="">6. </span>Thuật ngữ thường nhắc đến khi sử dụng Powerpoint</h3>
Dưới đ&acirc;y l&agrave; những thuật ngữ thường sử dụng nhất li&ecirc;n quan đến Powerpoint:/n
<ul>
<li>Slideshow v&agrave; Presentation (Tr&igrave;nh chiếu v&agrave; Tr&igrave;nh b&agrave;y): Đại diện cho t&agrave;i liệu tổng thể m&agrave; bạn tạo trong ứng dụng.</li>
<li>Slide: Mỗi slideshow trong PowerPoint chứa nhiều slide, c&aacute;c slide n&agrave;y l&agrave; c&aacute;c trang m&agrave; bạn c&oacute; thể th&ecirc;m v&agrave;o bản tr&igrave;nh b&agrave;y của m&igrave;nh.</li>
<li>Animation (Hoạt ảnh): Đ&acirc;y l&agrave; những hiệu ứng h&igrave;nh ảnh cung cấp cho c&aacute;c th&agrave;nh phần trong slide gi&uacute;p bản tr&igrave;nh b&agrave;y th&ecirc;m l&ocirc;i cuốn.</li>
<li>Transition (Hiệu ứng chuyển tiếp): Hiệu ứng khi di chuyển sang slide kế tiếp gi&uacute;p b&agrave;i thuyết tr&igrave;nh th&ecirc;m nổi bật.</li>
</ul>
<img title="Thuật ngữ thường nhắc đến khi sử dụng Powerpoint" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--10.jpg" alt="Thuật ngữ thường nhắc đến khi sử dụng Powerpoint" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--10.jpg">/n
<h3 id="hmenuid7"><span class="dropcap" data-crown="">7. </span>Powerpoint &aacute;p dụng cho những ng&agrave;nh n&agrave;o hiện nay?</h3>
PowerPoint gi&uacute;p mọi người dễ d&agrave;ng tạo, cộng t&aacute;c v&agrave; tr&igrave;nh b&agrave;y &yacute; tưởng theo một c&aacute;ch năng động, s&aacute;ng tạo v&agrave; trực quan. Với những lợi &iacute;ch tuyệt vời, c&ocirc;ng cụ n&agrave;y được sử dụng ở rất nhiều lĩnh vực từ mục đ&iacute;ch c&aacute; nh&acirc;n đến kinh doanh, gi&aacute;o dục./n
<img title="Powerpoint &aacute;p dụng cho những ng&agrave;nh n&agrave;o hiện nay" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--11.jpg" alt="Powerpoint &aacute;p dụng cho những ng&agrave;nh n&agrave;o hiện nay" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--11.jpg">/n
<h3 id="hmenuid8"><span class="dropcap" data-crown="">8. </span>Những đối tượng sử dụng Powerpoint</h3>
Trong gi&aacute;o dục, PowerPoint gi&uacute;p người giảng dạy tr&igrave;nh b&agrave;y b&agrave;i giảng sinh động, thu h&uacute;t hơn. C&ugrave;ng với đ&oacute;, học sinh dễ d&agrave;ng cộng t&aacute;c, từ đ&oacute; tr&igrave;nh b&agrave;y &yacute; tưởng, b&aacute;o c&aacute;o của m&igrave;nh với thầy c&ocirc; v&agrave; bạn b&egrave;./n
Trong doanh nghiệp, PowerPoint hỗ trợ tạo n&ecirc;n c&aacute;c buổi tr&igrave;nh b&agrave;y sản phẩm v&agrave; dịch vụ th&agrave;nh c&ocirc;ng. Th&ecirc;m nữa, n&oacute; c&ograve;n hỗ trợ tạo t&agrave;i liệu, b&agrave;i thuyết tr&igrave;nh cho dự &aacute;n, ng&acirc;n s&aacute;ch v&agrave; t&agrave;i ch&iacute;nh, tạo chứng chỉ, lịch, b&aacute;o c&aacute;o, sơ đồ v&agrave; biểu đồ cho bất kỳ ng&agrave;nh n&agrave;o./n
<img title="Những đối tượng sử dụng Powerpoint" src="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--12.jpg" alt="Những đối tượng sử dụng Powerpoint" width="730" height="400" data-original="https://cdn.tgdd.vn/Files/2021/08/12/1374841/powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet--12.jpg">/n
</div>', N'cach-su-dung-powerpoint.jpg', 18, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Hướng dẫn sử dụng Microsoft Power Point', N'<p align="justify"><a title="Chuy&ecirc;n mục Microsoft PowerPoint" href="https://quantrimang.com/cong-nghe/ms-powerpoint">Microsoft PowerPoint</a>&nbsp;l&agrave; một yếu tố ch&iacute;nh để tạo c&aacute;c bản thuyết tr&igrave;nh trong nhiều năm qua. Nhưng cũng giống như bất kỳ c&ocirc;ng cụ n&agrave;o kh&aacute;c, kh&ocirc;ng phải ai cũng l&agrave; một chuy&ecirc;n gia ngay lập tức. Bạn phải c&oacute; một điểm xuất ph&aacute;t n&agrave;o đ&oacute;, đ&uacute;ng kh&ocirc;ng? V&igrave; vậy, h&atilde;y để hướng dẫn sử dụng PowerPoint cho người mới bắt đầu n&agrave;y l&agrave; bước đầu ti&ecirc;n./n
Đối với những người mới bắt đầu sử dụng PowerPoint lần đầu ti&ecirc;n, kh&ocirc;ng sử dụng PowerPoint trong một thời gian hoặc chỉ muốn tham khảo về c&aacute;c kh&aacute;i niệm cơ bản, th&igrave; đ&acirc;y l&agrave; hướng dẫn d&agrave;nh cho phi&ecirc;n bản desktop. V&agrave;, nhiều t&iacute;nh năng tương tự được &aacute;p dụng nếu bạn sử dụng n&oacute; trực tuyến. V&igrave; vậy, nếu bạn vẫn ph&acirc;n v&acirc;n giữa PowerPoint Online v&agrave; PowerPoint 2016, hướng dẫn n&agrave;y c&oacute; thể hữu &iacute;ch trong việc đưa ra quyết định./n
<h2 id="mcetoc_1cs64nrft0">Microsoft PowerPoint l&agrave; g&igrave;?</h2>
Microsoft PowerPoint về cơ bản l&agrave; một c&ocirc;ng cụ tạo b&agrave;i thuyết tr&igrave;nh. Bạn c&oacute; thể tạo c&aacute;c slideshow với văn bản, h&igrave;nh ảnh, h&igrave;nh dạng, hoạt ảnh, &acirc;m thanh v&agrave; nhiều thứ kh&aacute;c. Sau đ&oacute;, chiếu b&agrave;i thuyết tr&igrave;nh của bạn l&ecirc;n m&agrave;n h&igrave;nh lớn để hiển thị n&oacute; cho người kh&aacute;c hoặc lưu n&oacute; dưới dạng t&agrave;i liệu trực quan cho ch&iacute;nh bạn./n
Đại diện của Microsoft cho biết:/n
&ldquo;PowerPoint l&agrave; một chương tr&igrave;nh tr&igrave;nh chiếu, một phần trong bộ c&ocirc;ng cụ Office của Microsoft. PowerPoint gi&uacute;p dễ d&agrave;ng tạo, cộng t&aacute;c v&agrave; tr&igrave;nh b&agrave;y &yacute; tưởng của bạn theo một c&aacute;ch năng động v&agrave; trực quan&rdquo;./n
Đối với c&aacute;c mục đ&iacute;ch sử dụng cho kinh doanh, gi&aacute;o dục v&agrave; c&aacute; nh&acirc;n, PowerPoint cung cấp sự linh hoạt, gi&uacute;p l&agrave;m cho c&aacute;c b&agrave;i thuyết tr&igrave;nh đơn giản, nổi bật hơn với nhiều t&iacute;nh năng./n
<h3 id="mcetoc_1cs64nrft1">C&ocirc;ng dụng chung của PowerPoint</h3>
<ul>
<li>Gi&uacute;p c&aacute;c doanh nghiệp tạo b&agrave;i thuyết tr&igrave;nh cho c&aacute;c sản phẩm v&agrave; dịch vụ của m&igrave;nh.</li>
<li>Gi&uacute;p c&aacute;c tổ chức gi&aacute;o dục tạo b&agrave;i giảng trực quan cho c&aacute;c lớp học.</li>
<li>Sử dụng cho mục đ&iacute;ch c&aacute; nh&acirc;n như lập bản đồ tư duy v&agrave; tr&igrave;nh chiếu ảnh gia đ&igrave;nh.</li>
<li>Tạo t&agrave;i liệu b&aacute;n h&agrave;ng v&agrave; tiếp thị.</li>
<li>Tạo b&agrave;i tr&igrave;nh b&agrave;y trong c&aacute;c sự kiện như đ&aacute;m cưới, lễ kỷ niệm hoặc cuộc họp mặt gia đ&igrave;nh.</li>
<li>Tạo b&agrave;i thuyết tr&igrave;nh cho dự &aacute;n, ng&acirc;n s&aacute;ch v&agrave; t&agrave;i ch&iacute;nh.</li>
<li>Tạo chứng chỉ, lịch, b&aacute;o c&aacute;o, sơ đồ v&agrave; biểu đồ cho bất kỳ ng&agrave;nh n&agrave;o</li>
</ul>
Bạn c&oacute; thể tạo hầu hết mọi loại h&igrave;nh ảnh trong PowerPoint. Nhưng trước ti&ecirc;n, bạn n&ecirc;n l&agrave;m quen với c&aacute;c thuật ngữ chung của ứng dụng./n
<h2 id="mcetoc_1cs64nrft2">C&aacute;c thuật ngữ cơ bản được sử dụng trong PowerPoint</h2>
Bạn sẽ thấy nhiều từ v&agrave; thuật ngữ được sử dụng thường xuy&ecirc;n trong suốt hướng dẫn n&agrave;y. V&igrave; vậy, việc d&agrave;nh một ch&uacute;t thời gian để xem x&eacute;t ch&uacute;ng sẽ gi&uacute;p bạn thực hiện theo c&aacute;c quy tr&igrave;nh v&agrave; m&ocirc; tả dễ d&agrave;ng hơn nhiều./n
<strong>Slideshow v&agrave; Presentation</strong>&nbsp;(Tr&igrave;nh chiếu v&agrave; Tr&igrave;nh b&agrave;y): Khi n&oacute;i về PowerPoint, bạn c&oacute; thể thấy hai thuật ngữ n&agrave;y c&oacute; khả năng ho&aacute;n đổi cho nhau. Ch&uacute;ng đại diện cho t&agrave;i liệu tổng thể bạn tạo trong ứng dụng./n
<strong>Slide:</strong>&nbsp;Mỗi slideshow trong PowerPoint chứa c&aacute;c slide. Bạn c&oacute; thể nghĩ c&aacute;c slide n&agrave;y giống như c&aacute;c trang m&agrave; bạn c&oacute; thể th&ecirc;m v&agrave;o bản tr&igrave;nh b&agrave;y của m&igrave;nh v&agrave; sau đ&oacute; chuyển qua từng trang một./n
<strong>Animation</strong>&nbsp;(Hoạt ảnh): C&aacute;c animation l&agrave; hiệu ứng h&igrave;nh ảnh c&oacute; thể cung cấp cho slide của bạn một diện mạo độc đ&aacute;o. Ch&uacute;ng cho ph&eacute;p bạn th&ecirc;m chuyển động v&agrave; sự l&ocirc;i cuốn v&agrave;o c&aacute;c phần tử tr&ecirc;n slide./n
<strong>Transition</strong>&nbsp;(Hiệu ứng chuyển tiếp): Transition cũng l&agrave; c&ocirc;ng cụ trực quan, nhưng bạn sẽ chỉ thấy khi di chuyển sang slide kế tiếp. Bằng c&aacute;ch sử dụng một transition, bạn c&oacute; thể l&agrave;m cho b&agrave;i thuyết tr&igrave;nh của m&igrave;nh nổi bật trong mắt kh&aacute;n giả hoặc sử dụng n&oacute; để tạo hiệu ứng ấn tượng./n
<h2 id="mcetoc_1cs64nrft3">Ribbon v&agrave; tab trong PowerPoint</h2>
Cũng giống như c&aacute;c ứng dụng Microsoft Office kh&aacute;c, ribbon của PowerPoint chứa c&aacute;c n&uacute;t m&agrave; bạn sẽ sử dụng b&ecirc;n trong c&aacute;c tab. Bạn c&oacute; thể t&ugrave;y chỉnh ribbon để x&oacute;a hoặc th&ecirc;m cả tab v&agrave; n&uacute;t. Tuy nhi&ecirc;n, bạn c&oacute; thể sẽ thấy c&aacute;c tab b&ecirc;n dưới theo mặc định./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-1.jpg" alt="Ribbon v&agrave; c&aacute;c tab" width="650" height="411" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-1.jpg" data-i="0" data-was-processed="true">/n
Dưới đ&acirc;y l&agrave; m&ocirc; tả ngắn gọn về nội dung của từng nh&oacute;m tab bạn c&oacute; thể xem./n
<ul>
<li><strong>File:</strong>&nbsp;Tạo b&agrave;i thuyết tr&igrave;nh mới, mở b&agrave;i thuyết tr&igrave;nh hiện c&oacute;, lưu, in v&agrave; chia sẻ c&aacute;c slideshow.</li>
<li><strong>Home:</strong>&nbsp;Kiểm so&aacute;t clipboard, slide, ph&ocirc;ng chữ, đoạn, bản vẽ v&agrave; chỉnh sửa.</li>
<li><strong>Insert:</strong>&nbsp;Ch&egrave;n c&aacute;c slide, bảng, h&igrave;nh ảnh, h&igrave;nh minh họa, li&ecirc;n kết, nhận x&eacute;t, văn bản v&agrave; media.</li>
<li><strong>Design:</strong>&nbsp;Chọn theme, chọn biến thể, t&ugrave;y chỉnh slide v&agrave; tạo c&aacute;c &yacute; tưởng thiết kế.</li>
<li><strong>Transitions:</strong>&nbsp;Chọn chuyển đổi, xem trước, điều chỉnh hiệu ứng v&agrave; th&ecirc;m thời gian.</li>
<li><strong>Animations:</strong>&nbsp;Chọn một hoạt ảnh, xem trước, điều chỉnh hiệu ứng, sử dụng c&aacute;c t&iacute;nh năng n&acirc;ng cao v&agrave; th&ecirc;m thời gian.</li>
<li><strong>Slide Show:</strong>&nbsp;Bắt đầu tr&igrave;nh chiếu, thiết lập tr&igrave;nh chiếu, chọn m&agrave;n h&igrave;nh v&agrave; sử dụng chế độ xem b&agrave;i thuyết tr&igrave;nh.</li>
<li><strong>Review:</strong>&nbsp;Sử dụng c&aacute;c c&ocirc;ng cụ cho việc hiệu đ&iacute;nh, khả năng truy cập, ng&ocirc;n ngữ, nhận x&eacute;t v&agrave; so s&aacute;nh.</li>
<li><strong>View:</strong>&nbsp;Thay đổi chế độ xem b&agrave;i thuyết tr&igrave;nh, điều chỉnh chế độ xem ch&iacute;nh, ph&oacute;ng to hoặc thu nhỏ, chọn m&agrave;u, l&agrave;m việc với c&aacute;c cửa sổ v&agrave; macro.</li>
</ul>
Bạn cũng sẽ thấy tab Help v&agrave; hộp Tell me what you want to do. Nếu bạn cần trợ gi&uacute;p hoặc muốn biết th&ecirc;m th&ocirc;ng tin về một t&iacute;nh năng, chỉ cần mở Help hoặc nhập từ kh&oacute;a v&agrave;o hộp Tell me what you want to do, sau đ&oacute; xem kết quả./n
<h2 id="mcetoc_1cs64nrft4">Quick Access Toolbar trong PowerPoint</h2>
Giống như c&aacute;c tab v&agrave; ribbon tr&ecirc;n c&aacute;c sản phẩm Microsoft Office kh&aacute;c, bạn cũng c&oacute;&nbsp;<strong>Quick Access Toolbar</strong>&nbsp;(thanh c&ocirc;ng cụ truy cập nhanh). Bạn c&oacute; thể đ&atilde; quen thuộc với c&ocirc;ng cụ tiện dụng n&agrave;y, c&ograve;n nếu chưa, th&igrave; đ&acirc;y l&agrave; thanh c&ocirc;ng cụ ở ph&iacute;a tr&ecirc;n b&ecirc;n tr&aacute;i của cửa sổ PowerPoint./n
Đ&uacute;ng như t&ecirc;n của n&oacute;, t&iacute;nh năng n&agrave;y cho ph&eacute;p bạn thực hiện c&aacute;c h&agrave;nh động nhanh ch&oacute;ng./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-2.jpg" alt="Quick Access Toolbar" width="650" height="355" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-2.jpg" data-i="1" data-was-processed="true">/n
N&uacute;t&nbsp;<strong>Save</strong>&nbsp;cho ph&eacute;p bạn dễ d&agrave;ng lưu file bạn đang l&agrave;m việc với t&ecirc;n file hiện tại./n
Nếu bạn mắc lỗi v&agrave; muốn ho&agrave;n t&aacute;c, chỉ cần nhấp v&agrave;o n&uacute;t&nbsp;<strong>Undo.</strong>&nbsp;Nếu bạn nhấp v&agrave;o n&oacute; một lần, n&oacute; sẽ ho&agrave;n t&aacute;c h&agrave;nh động gần nhất bạn đ&atilde; thực hiện. Nếu bạn tiếp tục nhấp v&agrave;o n&oacute;, n&oacute; sẽ ho&agrave;n t&aacute;c từng h&agrave;nh động trước đ&oacute; bằng c&aacute;ch l&ugrave;i dần. Ngo&agrave;i ra, bạn c&oacute; thể nhấp v&agrave;o mũi t&ecirc;n b&ecirc;n cạnh n&uacute;t&nbsp;<strong>Undo</strong>&nbsp;v&agrave; đ&aacute;nh dấu tất cả c&aacute;c h&agrave;nh động bạn muốn ho&agrave;n t&aacute;c./n
Nếu bạn ho&agrave;n t&aacute;c một h&agrave;nh động bằng n&uacute;t n&agrave;y, n&uacute;t&nbsp;<strong>Redo</strong>&nbsp;sẽ khả dụng. Điều n&agrave;y cho ph&eacute;p bạn thực hiện lại những g&igrave; bạn vừa ho&agrave;n t&aacute;c. Giống như n&uacute;t&nbsp;<strong>Undo,</strong>&nbsp;bạn c&oacute; thể thực hiện lại h&agrave;nh động gần nhất của m&igrave;nh bằng một lần nhấp chuột hoặc sử dụng mũi t&ecirc;n b&ecirc;n cạnh n&uacute;t&nbsp;<strong>Redo</strong>&nbsp;để thực hiện lại nhiều t&aacute;c vụ./n
N&uacute;t&nbsp;<strong>Presentation</strong>&nbsp;cho ph&eacute;p bạn bắt đầu slideshow của m&igrave;nh (n&oacute; sẽ được tr&igrave;nh chiếu cho người kh&aacute;c xem). Slideshow sẽ chiếm to&agrave;n bộ m&agrave;n h&igrave;nh của bạn, nhằm tạo một giao diện đẹp cho b&agrave;i thuyết tr&igrave;nh, kể cả khi đang trong qu&aacute; tr&igrave;nh tạo hoặc chỉnh sửa./n
Bạn c&oacute; thể chọn mũi t&ecirc;n ở b&ecirc;n phải của Quick Access Toolbar để th&ecirc;m hoặc x&oacute;a c&aacute;c n&uacute;t khỏi n&oacute; một c&aacute;ch dễ d&agrave;ng. Bạn cũng c&oacute; thể xem th&ecirc;m c&aacute;c lệnh c&oacute; sẵn hoặc di chuyển thanh c&ocirc;ng cụ b&ecirc;n dưới ribbon./n
<h2 id="mcetoc_1cs64nrft5">C&aacute;ch l&agrave;m việc với c&aacute;c slide trong PowerPoint</h2>
C&aacute;c slide l&agrave; nền tảng của b&agrave;i thuyết tr&igrave;nh. V&igrave; vậy, việc hiểu biết về c&aacute;ch thức l&agrave;m việc với c&aacute;c slide sao cho hiệu quả c&oacute; thể c&oacute; t&aacute;c động rất lớn đến sự s&aacute;ng tạo của bạn. Dưới đ&acirc;y l&agrave; những điều cơ bản bạn n&ecirc;n biết để l&agrave;m việc với c&aacute;c slide trong PowerPoint./n
<h3 id="mcetoc_1cs64nrft6">Th&ecirc;m một slide trong PowerPoint</h3>
Tr&ecirc;n tab&nbsp;<strong>Home,</strong>&nbsp;bạn sẽ thấy một phần tr&ecirc;n ribbon c&oacute; t&ecirc;n l&agrave;&nbsp;<strong>Slides.</strong>&nbsp;Bạn c&oacute; thể nhanh ch&oacute;ng th&ecirc;m một slide bằng c&aacute;ch nhấp v&agrave;o n&uacute;t&nbsp;<strong>New Slide.</strong>&nbsp;Thao t&aacute;c n&agrave;y sẽ th&ecirc;m một slide giống như slide bạn đ&atilde; chọn./n
Ngo&agrave;i ra, bạn c&oacute; thể nhấp v&agrave;o mũi t&ecirc;n tr&ecirc;n n&uacute;t&nbsp;<strong>New Slide.</strong>&nbsp;Điều n&agrave;y cho ph&eacute;p bạn chọn loại slide bạn muốn th&ecirc;m, chẳng hạn như slide trống, ti&ecirc;u đề c&oacute; nội dung hoặc h&igrave;nh ảnh c&oacute; ch&uacute; th&iacute;ch./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point3.jpg" alt="Th&ecirc;m slide" width="650" height="514" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point3.jpg" data-i="2" data-was-processed="true">/n
<h3 id="mcetoc_1cs64nrft7">Thay đổi bố cục của một slide</h3>
N&uacute;t&nbsp;<strong>Layout</strong>&nbsp;tr&ecirc;n ribbon cho ph&eacute;p bạn thay đổi loại slide hiện được chọn. V&igrave; vậy, bạn c&oacute; thể dễ d&agrave;ng thay đổi một slide ti&ecirc;u đề th&agrave;nh một slide c&oacute; ti&ecirc;u đề v&agrave; nội dung, hoặc slide h&igrave;nh ảnh c&oacute; ch&uacute; th&iacute;ch th&agrave;nh nội dung c&oacute; ch&uacute; th&iacute;ch./n
<h3 id="mcetoc_1cs64nrft8">C&aacute;c biểu tượng trong slide</h3>
Một số loại slide dễ hiểu ngay từ đầu. V&iacute; dụ, nếu bạn chọn slide ti&ecirc;u đề, bạn sẽ thấy c&aacute;c v&ugrave;ng văn bản hướng dẫn bạn nhấp để th&ecirc;m ti&ecirc;u đề lớn v&agrave; ti&ecirc;u đề phụ. Nhưng c&aacute;c bố cục slide kh&aacute;c, chẳng hạn như c&aacute;c bố cục cho ph&eacute;p bạn th&ecirc;m media, chứa c&aacute;c biểu tượng để bạn ch&egrave;n nội dung của m&igrave;nh, th&igrave; đặc biệt hơn./n
Nếu bạn sử dụng loại slide n&agrave;y, chỉ cần nhấp v&agrave;o biểu tượng tương ứng để ch&egrave;n mục của bạn./n
<ul>
<li><strong>Insert Table:</strong>&nbsp;Tạo một bảng bằng c&aacute;ch chọn số cột v&agrave; h&agrave;ng.</li>
<li><strong>Insert Chart:</strong>&nbsp;Tạo biểu đồ với nhiều t&ugrave;y chọn kh&aacute;c nhau như đường kẻ, thanh v&agrave; khu vực.</li>
<li><strong>Insert SmartArt graphic:</strong>&nbsp;Tạo h&igrave;nh ảnh giống như biểu đồ ma trận, kim tự th&aacute;p hoặc sơ đồ quy tr&igrave;nh.</li>
<li><strong>Pictures:</strong>&nbsp;Ch&egrave;n h&igrave;nh ảnh từ m&aacute;y t&iacute;nh của bạn.</li>
<li><strong>Online Pictures:</strong>&nbsp;Ch&egrave;n h&igrave;nh ảnh từ thư viện hoặc t&igrave;m kiếm tr&ecirc;n web cho một h&igrave;nh ảnh.</li>
<li><strong>Insert video:</strong>&nbsp;Ch&egrave;n video từ một file,&nbsp;<a title="Chuy&ecirc;n mục YouTube" href="https://quantrimang.com/cong-nghe/youtube">YouTube</a>&nbsp;hoặc m&atilde; nh&uacute;ng.</li>
</ul>
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-4.jpg" alt="Biểu tượng trong slide" width="650" height="367" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-4.jpg" data-i="3" data-was-processed="true">/n
Bạn cũng c&oacute; thể&nbsp;<a title="Hướng dẫn ch&egrave;n video Youtube v&agrave;o PowerPoint" href="https://quantrimang.com/cong-nghe/huong-dan-chen-video-youtube-vao-powerpoint-presentation-trong-office-2013-96763">nh&uacute;ng video YouTube</a>&nbsp;hoặc&nbsp;<a title="C&aacute;ch ch&egrave;n nhạc v&agrave;o slide Powerpoint" href="https://quantrimang.com/cong-nghe/huong-dan-them-nhac-vao-ban-trinh-chieu-powerpoint-140995">th&ecirc;m nhạc v&agrave;o b&agrave;i thuyết tr&igrave;nh PowerPoint</a>&nbsp;của m&igrave;nh./n
<h3 id="mcetoc_1cs64nrft9">X&oacute;a một slide</h3>
Nếu bạn muốn x&oacute;a một slide, c&aacute;ch đơn giản nhất l&agrave; chọn slide đ&oacute; v&agrave; nhấp v&agrave;o n&uacute;t&nbsp;<strong>Delete</strong>&nbsp;tr&ecirc;n b&agrave;n ph&iacute;m. Bạn cũng c&oacute; thể nhấp chuột phải v&agrave;o slide v&agrave; chọn&nbsp;<strong>Delete Slide</strong>&nbsp;từ menu ngữ cảnh./n
<h3 id="mcetoc_1cs64nrfta">Sử dụng c&aacute;c phần trong PowerPoint</h3>
Bạn c&oacute; thể muốn sắp xếp slideshow của m&igrave;nh th&agrave;nh c&aacute;c phần kh&aacute;c nhau. Nhấp v&agrave;o n&uacute;t&nbsp;<strong>Section,</strong>&nbsp;chọn&nbsp;<strong>Add Section,</strong>&nbsp;v&agrave; sau đ&oacute; đặt t&ecirc;n cho n&oacute;. Sau đ&oacute;, bạn c&oacute; thể th&ecirc;m c&aacute;c slide ri&ecirc;ng trong mỗi phần. Mũi t&ecirc;n b&ecirc;n cạnh n&uacute;t&nbsp;<strong>Section</strong>&nbsp;cho ph&eacute;p bạn loại bỏ, đổi t&ecirc;n, thu gọn v&agrave; mở rộng c&aacute;c phần./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-5.jpg" alt="C&aacute;c phần trong PPt" width="650" height="369" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-5.jpg" data-i="4" data-was-processed="true">/n
<h3 id="mcetoc_1cs64nrftb">C&aacute;c thao t&aacute;c phổ biến kh&aacute;c tr&ecirc;n slide</h3>
<ul>
<li>Dễ d&agrave;ng sắp xếp lại c&aacute;c slide bằng thao t&aacute;c k&eacute;o v&agrave; thả.</li>
<li>Nh&acirc;n bản slide hoặc tạo ch&uacute;ng từ một outline bằng c&aacute;ch sử dụng mũi t&ecirc;n b&ecirc;n cạnh n&uacute;t&nbsp;<strong>New Slide</strong>&nbsp;hoặc nhấp chuột phải v&agrave; sử dụng menu ngữ cảnh.</li>
<li>Trả một slide về bố cục mặc định bằng c&aacute;ch nhấp v&agrave;o n&uacute;t&nbsp;<strong>Reset</strong>&nbsp;hoặc nhấp chuột phải v&agrave; sử dụng menu ngữ cảnh.</li>
</ul>
<h2 id="mcetoc_1cs64nrftc">L&agrave;m việc với c&aacute;c ghi ch&uacute; trong b&agrave;i thuyết tr&igrave;nh</h2>
PowerPoint cung cấp một t&iacute;nh năng ghi ch&uacute; d&agrave;nh cho người thuyết tr&igrave;nh tuyệt vời v&agrave; rất c&oacute; &iacute;ch. Bạn c&oacute; thể th&ecirc;m ghi ch&uacute; v&agrave;o một slide để tự tham chiếu hoặc trao đổi với kh&aacute;n giả trong khi thuyết tr&igrave;nh. Phần ghi ch&uacute; xuất hiện ngay b&ecirc;n dưới mỗi slide trong PowerPoint./n
Nếu bạn kh&ocirc;ng nh&igrave;n thấy n&oacute;, chỉ cần nhấp v&agrave;o n&uacute;t&nbsp;<strong>Notes</strong>&nbsp;trong thanh t&aacute;c vụ ở dưới c&ugrave;ng của cửa sổ PowerPoint, hoặc, mở tab&nbsp;<strong>View</strong>&nbsp;v&agrave; nhấp v&agrave;o n&uacute;t&nbsp;<strong>Notes</strong>&nbsp;tr&ecirc;n ribbon. Sau đ&oacute;, chỉ cần nhấp v&agrave;o b&ecirc;n trong phần ghi ch&uacute; để th&ecirc;m nội dung./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-6.jpg" alt="Ghi ch&uacute;" width="650" height="377" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-6.jpg" data-i="5" data-was-processed="true">/n
<h3 id="mcetoc_1cs64nrftd">Sử dụng ghi ch&uacute; trong b&agrave;i thuyết tr&igrave;nh</h3>
Khi bạn tr&igrave;nh chiếu b&agrave;i thuyết tr&igrave;nh của m&igrave;nh cho một đối tượng, chỉ bạn mới c&oacute; thể xem ghi ch&uacute; của m&igrave;nh. Điều n&agrave;y l&agrave;m cho n&oacute; trở th&agrave;nh một c&ocirc;ng cụ tuyệt vời để giữ c&aacute;c m&ocirc; tả, giải th&iacute;ch hoặc hướng dẫn của bạn khi bạn tr&igrave;nh chiếu slideshow./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-7.jpg" alt="Sử dụng ghi ch&uacute;" width="650" height="382" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-7.jpg" data-i="6" data-was-processed="true">/n
<h3 id="mcetoc_1cs64nrfte">In ghi ch&uacute; cho b&agrave;i thuyết tr&igrave;nh</h3>
Nếu bạn in b&agrave;i thuyết tr&igrave;nh của m&igrave;nh để kh&aacute;n giả c&oacute; tham chiếu, bạn c&oacute; thể đưa cho họ nội dung ghi ch&uacute; của m&igrave;nh nếu muốn. Để xem n&oacute; tr&ocirc;ng như thế n&agrave;o, h&atilde;y k&iacute;ch tab&nbsp;<strong>View</strong>&nbsp;v&agrave; sau đ&oacute; l&agrave;&nbsp;<strong>Notes Page</strong>&nbsp;trong phần&nbsp;<strong>Presentation Views</strong>&nbsp;của ribbon./n
Nếu bạn muốn thay đổi c&aacute;ch ghi ch&uacute; của m&igrave;nh xuất hiện khi bạn in ch&uacute;ng, h&atilde;y nhấp v&agrave;o n&uacute;t&nbsp;<strong>Notes Master</strong>&nbsp;trong phần&nbsp;<strong>Master Views</strong>&nbsp;của ribbon. Điều n&agrave;y cho ph&eacute;p bạn chọn c&aacute;c t&ugrave;y chọn thiết kế, bố cục v&agrave; thiết lập trang. Ngo&agrave;i ra, h&atilde;y lưu &yacute; n&uacute;t&nbsp;<strong>Handout Master</strong>&nbsp;trực tiếp ở b&ecirc;n tr&aacute;i, cho ph&eacute;p bạn t&ugrave;y chỉnh to&agrave;n bộ diện mạo của handout./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-8.jpg" alt="In ghi ch&uacute;" width="650" height="467" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-8.jpg" data-i="7" data-was-processed="true">/n
<h2 id="mcetoc_1cs64nrftf">Th&ecirc;m hoạt ảnh v&agrave;o PowerPoint</h2>
Nếu bạn đang c&acirc;n nhắc việc th&ecirc;m hoạt ảnh v&agrave;o c&aacute;c slide của m&igrave;nh, việc n&agrave;y rất dễ thực hiện. Hoạt ảnh c&oacute; thể hiệu quả cho c&aacute;c b&agrave;i thuyết tr&igrave;nh bạn tạo trong lĩnh vực gi&aacute;o dục, như b&agrave;i thuyết tr&igrave;nh trong lớp học hoặc b&agrave;i giảng ở c&aacute;c trường đại học. Ch&uacute;ng cũng c&oacute; thể cung cấp cho b&agrave;i thuyết tr&igrave;nh của bạn một hiệu ứng th&uacute; vị cho mục đ&iacute;ch tr&igrave;nh chiếu c&aacute; nh&acirc;n, như một cuộc hội ngộ gia đ&igrave;nh hoặc trong đ&aacute;m cưới./n
<h3 id="mcetoc_1cs64nrftg">T&ugrave;y chọn hoạt ảnh</h3>
Đ&acirc;y l&agrave; những t&iacute;nh năng cơ bản c&oacute; sẵn tr&ecirc;n tab&nbsp;<strong>Animations.</strong>/n
<ul>
<li><strong>Animation:</strong>&nbsp;Chọn từ nhiều t&ugrave;y chọn kh&aacute;c nhau bằng c&aacute;ch nhấp v&agrave;o mũi t&ecirc;n trong&nbsp;<strong>Animation.</strong>&nbsp;Bạn c&oacute; thể &aacute;p dụng hoạt ảnh cho một phần tử khi th&ecirc;m hoặc loại bỏ n&oacute; khỏi slide, sử dụng n&oacute; để nhấn mạnh hoặc cho n&oacute; một đường chuyển động.</li>
<li><strong>Effect Options:</strong>&nbsp;C&aacute;c hoạt ảnh kh&aacute;c nhau c&oacute; c&aacute;c t&ugrave;y chọn bổ sung để bạn chọn. V&iacute; dụ, hoạt ảnh&nbsp;<strong>Wheel</strong>&nbsp;cho ph&eacute;p bạn chọn số lượng nan hoa trong khi t&ugrave;y chọn&nbsp;<strong>Spin</strong>&nbsp;cho ph&eacute;p bạn chọn hướng v&agrave; số lượng v&ograve;ng quay.</li>
<li><strong>Advanced Animation:</strong>&nbsp;Tại đ&acirc;y bạn c&oacute; thể th&ecirc;m hoạt ảnh, mở&nbsp;<strong>Animation Pane</strong>&nbsp;để c&oacute; th&ecirc;m kh&ocirc;ng gian l&agrave;m việc, c&agrave;i đặt tr&igrave;nh k&iacute;ch hoạt hoặc sử dụng&nbsp;<strong>Animation Painter.</strong>&nbsp;Nhưng đối với hoạt ảnh slideshow đơn giản, c&aacute;c t&iacute;nh năng cơ bản phải ph&ugrave; hợp với bạn.</li>
<li><strong>Timing:</strong>&nbsp;Quyết định c&aacute;ch bạn muốn hoạt ảnh của m&igrave;nh xuất hiện tr&ecirc;n slide. Ch&uacute;ng c&oacute; thể bắt đầu khi bạn nhấp v&agrave;o trong b&agrave;i thuyết tr&igrave;nh, ngay sau hoặc với hoạt ảnh trước đ&oacute;. Bạn cũng c&oacute; thể chọn thời lượng, thời gian trễ v&agrave; sắp xếp lại c&aacute;c hoạt ảnh của m&igrave;nh.</li>
<li><strong>Preview:</strong>&nbsp;Sau khi bạn th&ecirc;m hoạt ảnh, bạn c&oacute; thể thấy tr&ocirc;ng n&oacute; sẽ như thế n&agrave;o m&agrave; kh&ocirc;ng tho&aacute;t khỏi chế độ chỉnh sửa hoặc mở chế độ tr&igrave;nh chiếu qua chế độ xem nhanh.</li>
</ul>
<h3><img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-9.jpg" alt="T&ugrave;y chọn hoạt ảnh" width="650" height="335" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-9.jpg" data-i="8" data-was-processed="true"></h3>
<h3 id="mcetoc_1cs64nrfth">Tạo hoạt ảnh PowerPoint đầu ti&ecirc;n</h3>
Đầu ti&ecirc;n, chọn slide v&agrave; sau đ&oacute; l&agrave; c&aacute;c phần tử tr&ecirc;n slide m&agrave; bạn muốn tạo hiệu ứng động. Sau đ&oacute;, chỉ cần chọn loại từ hộp&nbsp;<strong>Animation.</strong>&nbsp;Thật l&agrave; dễ d&agrave;ng! Sau đ&oacute;, bạn c&oacute; thể sử dụng c&aacute;c c&ocirc;ng cụ được m&ocirc; tả ở tr&ecirc;n để th&ecirc;m hiệu ứng, c&aacute;c t&ugrave;y chọn n&acirc;ng cao hoặc thời gian nếu bạn muốn./n
Lưu &yacute; rằng khi bạn th&ecirc;m một h&igrave;nh động v&agrave;o một phần tử, một con số sẽ xuất hiện b&ecirc;n cạnh n&oacute;. Mỗi hoạt ảnh bạn th&ecirc;m sẽ được đ&aacute;nh số li&ecirc;n tiếp để bạn c&oacute; thể dễ d&agrave;ng x&aacute;c định n&oacute;, l&agrave;m việc với n&oacute; hoặc sắp xếp lại n&oacute;. Điều n&agrave;y c&oacute; nghĩa l&agrave; bạn c&oacute; thể c&oacute; nhiều hoạt ảnh với hiệu ứng ri&ecirc;ng của ch&uacute;ng tr&ecirc;n c&ugrave;ng một slide./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-10.jpg" alt="Tạo hoạt ảnh" width="650" height="296" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-10.jpg" data-i="9" data-was-processed="true">/n
Nếu bạn sử dụng&nbsp;<strong>Animation Pane</strong>&nbsp;ở b&ecirc;n phải, c&aacute;c số sẽ gi&uacute;p bạn dễ d&agrave;ng xem x&eacute;t c&aacute;c hoạt ảnh c&ugrave;ng một l&uacute;c. Ở đ&oacute;, bạn c&oacute; thể th&ecirc;m c&ugrave;ng một loại hiệu ứng m&agrave; bạn nh&igrave;n thấy tr&ecirc;n ribbon. Chỉ cần nhấp v&agrave;o mũi t&ecirc;n tương ứng với hoạt ảnh v&agrave; menu drop-down sẽ xuất hiện./n
V&agrave; nếu bạn đang&nbsp;<a title="Hướng dẫn tạo biểu đồ tr&ecirc;n PowerPoint" href="https://quantrimang.com/cong-nghe/ms-powerpoint-bai-9-bieu-dien-do-thi-trong-powerpoint-62505">ch&egrave;n biểu đồ Excel v&agrave;o b&agrave;i thuyết tr&igrave;nh</a>&nbsp;của m&igrave;nh, bạn cũng c&oacute; thể tạo hoạt ảnh cho c&aacute;c biểu đồ đ&oacute;./n
<h2 id="mcetoc_1cs64nrfti">&Aacute;p dụng hiệu ứng chuyển tiếp trong PowerPoint</h2>
Ch&egrave;n hiệu ứng chuyển tiếp giữa c&aacute;c slide c&oacute; thể l&agrave; một c&aacute;ch hiệu quả kh&aacute;c để thu h&uacute;t sự ch&uacute; &yacute; của kh&aacute;n giả, tương tự như hoạt ảnh. Bạn c&oacute; thể &aacute;p dụng một h&igrave;nh ảnh độc đ&aacute;o, c&oacute; hoặc kh&ocirc;ng c&oacute; &acirc;m thanh, khi bạn di chuyển qua từng slide trong b&agrave;i thuyết tr&igrave;nh./n
<h3 id="mcetoc_1cs64nrftj">C&aacute;c t&ugrave;y chọn chuyển tiếp</h3>
Đ&acirc;y l&agrave; những t&iacute;nh năng cơ bản c&oacute; sẵn tr&ecirc;n tab&nbsp;<strong>Transitions.</strong>/n
<ul>
<li><strong>Transition to This Slide</strong>: Chọn từ c&aacute;c t&ugrave;y chọn chuyển tiếp bằng c&aacute;ch nhấp v&agrave;o mũi t&ecirc;n trong hộp. Bạn c&oacute; thể &aacute;p dụng một hiệu ứng chuyển tiếp tinh tế, th&uacute; vị hoặc năng động. H&atilde;y nhớ rằng đ&acirc;y l&agrave; hiệu ứng để chuyển sang slide hiện tại.</li>
<li><strong>Effect Options:</strong>&nbsp;C&aacute;c hiệu ứng chuyển tiếp kh&aacute;c nhau c&oacute; c&aacute;c t&ugrave;y chọn bổ sung m&agrave; bạn c&oacute; thể &aacute;p dụng. V&iacute; dụ, c&aacute;c hiệu ứng chuyển tiếp&nbsp;<strong>Wipe, Wind</strong>&nbsp;v&agrave;&nbsp;<strong>Orbit</strong>&nbsp;cho ph&eacute;p bạn chọn hướng.</li>
<li><strong>Timing:</strong>&nbsp;Tại đ&acirc;y, bạn c&oacute; thể th&ecirc;m &acirc;m thanh đi k&egrave;m với hiệu ứng chuyển tiếp, chọn thời lượng v&agrave; &aacute;p dụng c&aacute;c mục n&agrave;y cho tất cả c&aacute;c slide. Ngo&agrave;i ra, bạn c&oacute; thể quyết định chuyển sang slide tiếp theo khi nhấp chuột hoặc tự động chuyển sau một khoảng thời gian nhất định.</li>
<li><strong>Preview:</strong>&nbsp;Sau khi bạn th&ecirc;m một hiệu ứng chuyển tiếp, bạn c&oacute; thể xem n&oacute; tr&ocirc;ng như thế n&agrave;o m&agrave; kh&ocirc;ng tho&aacute;t khỏi chế độ chỉnh sửa hoặc mở chế độ xem b&agrave;i thuyết tr&igrave;nh bằng chế độ xem nhanh.</li>
</ul>
<h3><img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-11.jpg" alt="T&ugrave;y chọn chuyển tiếp" width="650" height="213" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-11.jpg" data-i="10" data-was-processed="true"></h3>
<h3 id="mcetoc_1cs64nrftk">Tạo một hiệu ứng chuyển tiếp slide</h3>
Điều n&agrave;y hoạt động về cơ bản giống như hoạt ảnh (chỉ &iacute;t hơn một bước). Chỉ cần chọn slide v&agrave; hiệu ứng chuyển tiếp. Sau đ&oacute;, bạn c&oacute; thể t&ugrave;y &yacute; &aacute;p dụng bất kỳ hiệu ứng n&agrave;o được m&ocirc; tả ở tr&ecirc;n. Kh&aacute; dễ d&agrave;ng, phải kh&ocirc;ng?/n
Hiệu ứng chuyển tiếp cũng như hoạt ảnh, c&oacute; thể kh&ocirc;ng xuất hiện trong một số slideshow. Nhưng ch&uacute;ng c&oacute; thể tạo cảm gi&aacute;c bắt mắt cho c&aacute;c cuộc họp hoặc c&aacute;c sự kiện th&uacute; vị. Ngay cả đối với c&aacute;c b&agrave;i thuyết tr&igrave;nh kinh doanh, một hiệu ứng mờ dần đơn giản c&oacute; thể loại bỏ sự chuyển tiếp tẻ nhạt giữa c&aacute;c slide./n
<h2 id="mcetoc_1cs64nrftl">Sử dụng c&aacute;c chế độ xem b&agrave;i thuyết tr&igrave;nh kh&aacute;c nhau</h2>
Kh&ocirc;ng phải ai cũng l&agrave;m việc theo c&ugrave;ng một c&aacute;ch giống nhau n&ecirc;n lao động l&agrave; một qu&aacute; tr&igrave;nh s&aacute;ng tạo. May mắn l&agrave; PowerPoint cung cấp c&aacute;c chế độ xem t&iacute;ch hợp kh&aacute;c nhau để ph&ugrave; hợp với điều n&agrave;y. Chỉ cần chọn tab&nbsp;<strong>View</strong>&nbsp;v&agrave; xem c&aacute;c c&aacute;ch bạn c&oacute; thể t&ugrave;y chỉnh slideshow của m&igrave;nh./n
Phần&nbsp;<strong>Presentation Views</strong>&nbsp;chứa năm c&aacute;ch độc đ&aacute;o để tạo hoặc chỉnh sửa slideshow của bạn. Một trong số đ&oacute; l&agrave;&nbsp;<strong>Notes Page</strong>&nbsp;m&agrave; bạn đ&atilde; đọc ở tr&ecirc;n. V&agrave;, đ&acirc;y l&agrave; bốn giải ph&aacute;p c&ograve;n lại k&egrave;m theo giải th&iacute;ch ngắn gọn./n
1.&nbsp;<strong>Normal:</strong>&nbsp;Như bạn c&oacute; thể đo&aacute;n, đ&acirc;y l&agrave; chế độ xem cơ bản, b&igrave;nh thường. Bạn sẽ thấy c&aacute;c slide của m&igrave;nh ở b&ecirc;n tr&aacute;i dưới dạng h&igrave;nh thu nhỏ được đ&aacute;nh số, v&agrave; slide hiện tại ở phần lớn nhất ph&iacute;a b&ecirc;n phải. Chế độ xem n&agrave;y hoạt động tốt nếu bạn muốn chuyển giữa c&aacute;c trang tr&igrave;nh b&agrave;y một c&aacute;ch trực quan./n
2.&nbsp;<strong>Outline View:</strong>&nbsp;Đối với những người th&iacute;ch viết hoặc tạo b&agrave;i thuyết tr&igrave;nh bằng outline, chế độ xem n&agrave;y sẽ rất l&yacute; tưởng. Bạn c&oacute; thể viết trực tiếp trong bảng điều khiển outline ở b&ecirc;n tr&aacute;i hoặc d&aacute;n một outline hiện c&oacute; trực tiếp từ&nbsp;<a title="Chuy&ecirc;n mụcMicrosoft Word" href="https://quantrimang.com/cong-nghe/ms-word">Microsoft Word</a>. Ở đ&acirc;y một lần nữa, slide hiện tại nằm ở phần lớn nhất b&ecirc;n phải./n
3.&nbsp;<strong>Slide Sorter:</strong>&nbsp;Đ&acirc;y l&agrave; một c&aacute;ch tuyệt vời để xem nhanh tất cả c&aacute;c slide của bạn. Chế độ xem n&agrave;y chiếm to&agrave;n bộ cửa sổ trung t&acirc;m, bạn c&oacute; thể xem từng slide v&agrave; sắp xếp lại ch&uacute;ng dễ d&agrave;ng bằng thao t&aacute;c k&eacute;o v&agrave; thả./n
4.&nbsp;<strong>Reading View:</strong>&nbsp;Nếu bạn muốn xem to&agrave;n bộ b&agrave;i thuyết tr&igrave;nh m&agrave; kh&ocirc;ng cần chuyển sang chế độ to&agrave;n m&agrave;n h&igrave;nh, th&igrave; chỉ cần nhấp v&agrave;o n&uacute;t n&agrave;y. Bạn c&oacute; thể xem slideshow của m&igrave;nh với c&aacute;c hoạt ảnh v&agrave; hiệu ứng chuyển tiếp một c&aacute;ch dễ d&agrave;ng./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-12.jpg" alt="Chế độ xem" width="650" height="341" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-12.jpg" data-i="11" data-was-processed="true">/n
C&ugrave;ng với chế độ xem&nbsp;<strong>Slide Sorter,</strong>&nbsp;chế độ xem&nbsp;<strong>Normal</strong>&nbsp;v&agrave;&nbsp;<strong>Outline Views</strong>&nbsp;cũng cho ph&eacute;p bạn nhanh ch&oacute;ng sắp xếp lại c&aacute;c slide của m&igrave;nh. Chỉ cần chọn một slide v&agrave; sau đ&oacute; k&eacute;o n&oacute; đến vị tr&iacute; mới l&agrave; xong./n
<h2 id="mcetoc_1cs64nrftm">Cộng t&aacute;c tr&ecirc;n b&agrave;i thuyết tr&igrave;nh PowerPoint</h2>
Giống như c&aacute;c ứng dụng Microsoft Office kh&aacute;c, cũng c&oacute; c&aacute;c t&iacute;nh năng để dễ d&agrave;ng cộng t&aacute;c với những người kh&aacute;c tr&ecirc;n b&agrave;i thuyết tr&igrave;nh PowerPoint của m&igrave;nh. V&igrave; vậy, nếu nh&oacute;m b&aacute;n h&agrave;ng của bạn, c&aacute;c gi&aacute;o vi&ecirc;n đồng nghiệp hoặc bạn c&ugrave;ng lớp muốn c&ugrave;ng nhau l&agrave;m việc tr&ecirc;n slideshow, bạn c&oacute; một v&agrave;i t&ugrave;y chọn như sau:/n
Chia sẻ slideshow của bạn dưới dạng b&agrave;i thuyết tr&igrave;nh PowerPoint được lưu v&agrave;o&nbsp;<a title="Chuy&ecirc;n mục OneDrive" href="https://quantrimang.com/cong-nghe/microsoft-onedrive">OneDrive</a>&nbsp;hoặc dưới dạng PDF. Chỉ cần nhấp v&agrave;o n&uacute;t&nbsp;<strong>Share</strong>&nbsp;từ tr&igrave;nh đơn ở g&oacute;c tr&ecirc;n b&ecirc;n phải. Sau đ&oacute;, mời những người kh&aacute;c trong sidebar mở ra, gửi tr&igrave;nh chiếu dưới dạng file đ&iacute;nh k&egrave;m hoặc nhận li&ecirc;n kết để chia sẻ./n
Cho ph&eacute;p người kh&aacute;c ghi ch&uacute; tr&ecirc;n b&agrave;i thuyết tr&igrave;nh bằng n&uacute;t&nbsp;<strong>Comments</strong>&nbsp;nằm ngay b&ecirc;n cạnh n&uacute;t Share tr&ecirc;n menu. (Giả sử người cộng t&aacute;c với bạn mở bản tr&igrave;nh b&agrave;y trong PowerPoint). Bạn c&oacute; thể xem nhận x&eacute;t của họ, bật t&iacute;nh năng trả lời, di chuyển v&agrave; x&oacute;a nhận x&eacute;t./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-13.jpg" alt="Cộng t&aacute;c" width="650" height="300" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-13.jpg" data-i="12" data-was-processed="true">/n
Xem lịch sử phi&ecirc;n bản khi bạn bắt đầu cộng t&aacute;c. Nếu người cộng t&aacute;c với bạn c&oacute; thể chỉnh sửa b&agrave;i thuyết tr&igrave;nh, bạn c&oacute; thể xem c&aacute;c phi&ecirc;n bản trước đ&oacute;. Một n&uacute;t sẽ xuất hiện trong menu ở giữa c&aacute;c n&uacute;t&nbsp;<strong>Share</strong>&nbsp;v&agrave;&nbsp;<strong>Comments.</strong>&nbsp;Sau đ&oacute;, bạn c&oacute; thể mở c&aacute;c phi&ecirc;n bản tr&igrave;nh chiếu trước đ&oacute; nếu cần./n
<h2 id="mcetoc_1cs64nrftn">C&aacute;c t&ugrave;y chọn slideshow</h2>
Khi b&agrave;i thuyết tr&igrave;nh của bạn ho&agrave;n tất, đ&atilde; đến l&uacute;c xem lại v&agrave; thiết lập chế độ tr&igrave;nh chiếu. Chuyển sang tab Slide Show v&agrave; xem c&aacute;c t&ugrave;y chọn sau./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-14.jpg" alt="T&ugrave;y chọn slideshow" width="650" height="88" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-14.jpg" data-i="13" data-was-processed="true">/n
<h3 id="mcetoc_1cs64nrfto">Start Slide Show</h3>
<ul>
<li><strong>From Beginning:</strong>&nbsp;Xem slideshow của bạn từ slide đầu ti&ecirc;n.</li>
<li><strong>From Current Slide:</strong>&nbsp;Slideshow sẽ bắt đầu từ slide bạn chọn.</li>
<li><strong>Present Online:</strong>&nbsp;Sử dụng&nbsp;<strong>Office Presentation Service</strong>&nbsp;để xem slideshow của bạn trong tr&igrave;nh duyệt.</li>
<li><strong>Custom Slide Show:</strong>&nbsp;Tạo b&agrave;i thuyết tr&igrave;nh t&ugrave;y chỉnh với c&aacute;c slide theo một thứ tự cụ thể.</li>
</ul>
<h3 id="mcetoc_1cs64nrftp">Set Up</h3>
<ul>
<li><strong>Set Up Slide Show</strong>: Chọn c&aacute;c loại, t&ugrave;y chọn m&agrave; c&aacute;c slide sẽ hiển thị, c&aacute;ch tăng cường cho c&aacute;c slide v&agrave; bất kỳ t&ugrave;y chọn đa m&agrave;n h&igrave;nh n&agrave;o bạn cần.</li>
<li><strong>Hide Slide:</strong>&nbsp;Thao t&aacute;c n&agrave;y ẩn mọi slide m&agrave; bạn chọn từ b&agrave;i thuyết tr&igrave;nh.</li>
<li><strong>Rehearse Timings:</strong>&nbsp;Bạn c&oacute; thể thực h&agrave;nh tr&igrave;nh chiếu slideshow của m&igrave;nh v&agrave; xem thời lượng bạn sử dụng cho mỗi slide v&agrave; to&agrave;n bộ slideshow. Bạn cũng c&oacute; một t&ugrave;y chọn để tiết kiệm thời gian, sẽ rất hữu &iacute;ch để cải thiện thời gian thuyết tr&igrave;nh nếu cần thiết.</li>
<li><strong>Record Slide Show</strong>: Dễ d&agrave;ng ghi lại slideshow của bạn từ đầu hoặc từ một slide cụ thể. Điều n&agrave;y l&agrave; l&yacute; tưởng để gi&uacute;p những người kh&aacute;c kh&ocirc;ng thể tham dự buổi thuyết tr&igrave;nh.</li>
<li>K&iacute;ch hoạt hoặc v&ocirc; hiệu h&oacute;a c&aacute;c t&iacute;nh năng&nbsp;<strong>Play narrations, Use timings,</strong>&nbsp;v&agrave;<strong>&nbsp;Show media controls</strong>&nbsp;bằng c&aacute;c hộp kiểm tiện lợi.</li>
</ul>
<h3 id="mcetoc_1cs64nrftq">Monitors</h3>
Chọn m&agrave;n h&igrave;nh được kết nối từ hộp drop-down để hiển thị b&agrave;i thuyết tr&igrave;nh của bạn. Bạn cũng c&oacute; thể bật hoặc tắt chế độ&nbsp;<strong>Presenter View.</strong>/n
<strong>Presenter View</strong>&nbsp;cung cấp cho bạn một c&aacute;i nh&igrave;n kh&aacute;c về slideshow của m&igrave;nh. Điều n&agrave;y cho ph&eacute;p bạn xem b&agrave;i thuyết tr&igrave;nh của m&igrave;nh với ghi ch&uacute; tr&ecirc;n một m&agrave;n h&igrave;nh ri&ecirc;ng, trong khi slideshow của bạn hiển thị tr&ecirc;n một m&agrave;n h&igrave;nh kh&aacute;c. Ngo&agrave;i ra, bạn cũng c&oacute; thể kiểm so&aacute;t b&agrave;i thuyết tr&igrave;nh của m&igrave;nh trong chế độ xem n&agrave;y./n
<ul>
<li>Thay đổi c&agrave;i đặt hiển thị hoặc sao ch&eacute;p slideshow.</li>
<li>Truy cập c&aacute;c c&ocirc;ng cụ như con trỏ laser, b&uacute;t hoặc b&uacute;t đ&aacute;nh dấu để sử dụng trong suốt b&agrave;i thuyết tr&igrave;nh của bạn.</li>
<li>Ph&oacute;ng to tr&ecirc;n một slide.</li>
<li>T&ocirc; đen hoặc kh&ocirc;ng to&agrave;n bộ slideshow.</li>
<li>Chuyển sang slide kh&aacute;c.</li>
<li>Kết th&uacute;c slideshow.</li>
</ul>
<h2><img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-15.jpg" alt="Monitors" width="650" height="341" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-15.jpg" data-i="14" data-was-processed="true"></h2>
<h2 id="mcetoc_1cs64nrftr">Bắt đầu slideshow trong PowerPoint</h2>
Sau khi bạn đ&atilde; đặt c&aacute;c t&ugrave;y chọn ở tr&ecirc;n cho slideshow của m&igrave;nh, h&atilde;y luyện tập v&agrave; sẵn s&agrave;ng bắt đầu, phần c&ograve;n lại rất dễ d&agrave;ng./n
Mở PowerPoint tr&ecirc;n m&aacute;y t&iacute;nh của bạn, chọn m&agrave;n h&igrave;nh để sử dụng v&agrave; sau đ&oacute; tr&igrave;nh b&agrave;y n&oacute;. Bạn c&oacute; thể bắt đầu slideshow bằng n&uacute;t&nbsp;<strong>From Beginning</strong>&nbsp;tr&ecirc;n tab&nbsp;<strong>Slide Show</strong>&nbsp;hoặc với n&uacute;t&nbsp;<strong>Start from Beginning</strong>&nbsp;tr&ecirc;n&nbsp;<strong>Quick Access Toolbar</strong>. Đ&acirc;y l&agrave; quy tr&igrave;nh tương tự m&agrave; bạn đ&atilde; theo d&otilde;i khi bạn xem lại b&agrave;i thuyết tr&igrave;nh của m&igrave;nh./n
Nếu bạn quyết định sử dụng chế độ&nbsp;<strong>Presenter View</strong>&nbsp;trong slideshow của m&igrave;nh, th&igrave; bạn đ&atilde; biết c&aacute;c c&ocirc;ng cụ bạn c&oacute; trong tay để kiểm so&aacute;t chương tr&igrave;nh. Nhưng nếu bạn kh&ocirc;ng chọn chế độ xem n&agrave;y hoặc chỉ l&agrave;m việc với một m&agrave;n h&igrave;nh, bạn vẫn c&oacute; thể diễn tập b&agrave;i thuyết tr&igrave;nh của m&igrave;nh./n
Chỉ cần nhấp chuột phải v&agrave;o slideshow khi n&oacute; bắt đầu mở menu ngữ cảnh. Sau đ&oacute;, bạn c&oacute; thể xem tất cả c&aacute;c slide, ph&oacute;ng to, điều chỉnh m&agrave;n h&igrave;nh hoặc t&ugrave;y chọn m&aacute;y in v&agrave; kết th&uacute;c việc tr&igrave;nh chiếu./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-16.jpg" alt="B&aacute;t đầu slideshow" width="650" height="334" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-16.jpg" data-i="15" data-was-processed="true">/n
<h2 id="mcetoc_1cs64nrfts">Thiết kế với template trong Powerpoint</h2>
Phần cuối c&ugrave;ng của hướng dẫn cho người mới bắt đầu n&agrave;y l&agrave; c&aacute;c template bạn c&oacute; thể sử dụng để tăng năng suất của m&igrave;nh trong PowerPoint. Khi sử dụng template, bạn c&oacute; thể bắt đầu ngay tr&ecirc;n b&agrave;i thuyết tr&igrave;nh của m&igrave;nh. PowerPoint cung cấp nhiều template được t&iacute;ch hợp sẵn v&agrave; bạn c&oacute; thể t&igrave;m thấy c&aacute;c template n&agrave;y trực tuyến từ c&aacute;c b&ecirc;n thứ ba./n
<h3 id="mcetoc_1cs64nrftt">Sử dụng c&aacute;c template PowerPoint nổi bật</h3>
Để xem c&aacute;c t&ugrave;y chọn trong PowerPoint, h&atilde;y v&agrave;o phần&nbsp;<strong>File &gt; New</strong>. Sau đ&oacute;, bạn sẽ thấy một số template nổi bật sắp xếp theo c&aacute;c danh mục bạn c&oacute; thể chọn hoặc bạn c&oacute; thể nhập t&ecirc;n template bạn chọn v&agrave;o hộp t&igrave;m kiếm, nếu bạn muốn một c&aacute;i g&igrave; đ&oacute; cụ thể./n
<img class="lazy lightbox loaded" src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-17.jpg" alt="Template" width="650" height="339" data-src="https://st.quantrimang.com/photos/image/2018/11/13/microsoft-power-point-17.jpg" data-i="16" data-was-processed="true">/n
C&aacute;c template t&iacute;ch hợp bao gồm từ danh thiếp v&agrave; biểu đồ cơ bản đến c&aacute;c b&agrave;i thuyết tr&igrave;nh d&agrave;i v&agrave; chi tiết cho hầu hết mọi ng&agrave;nh./n
Nếu bạn thấy template bạn muốn xem, h&atilde;y nhấp v&agrave;o template đ&oacute; v&agrave; sau đ&oacute; xem lại m&ocirc; tả v&agrave; k&iacute;ch thước tải xuống trong cửa sổ pop-up. Nếu bạn muốn sử dụng n&oacute;, h&atilde;y nhấp v&agrave;o n&uacute;t&nbsp;<strong>Create.</strong>/n
<h3 id="mcetoc_1cs64nrftu">Sử dụng c&aacute;c template PowerPoint của b&ecirc;n thứ ba</h3>
Mặc d&ugrave; c&aacute;c&nbsp;<a title="Những mẫu slide PowerPoint miễn ph&iacute; tuyệt đẹp d&agrave;nh cho gi&aacute;o vi&ecirc;n" href="https://quantrimang.com/cong-nghe/nhung-mau-slide-powerpoint-mien-phi-tuyet-dep-danh-cho-giao-vien-140147">template c&oacute; sẵn cho Microsoft PowerPoint</a>&nbsp;c&oacute; vẻ phong ph&uacute;, nhưng bạn vẫn c&oacute; thể xem c&aacute;c đề xuất tuyệt vời của b&ecirc;n thứ ba nếu muốn./n
Nếu bạn chưa bao giờ sử dụng Microsoft PowerPoint trước đ&acirc;y, th&igrave; hướng dẫn cho người mới bắt đầu n&agrave;y sẽ mang đến cho bạn một khởi đầu tuyệt vời. Cho d&ugrave; bạn đang chuẩn bị b&agrave;i thuyết tr&igrave;nh chuy&ecirc;n nghiệp đầu ti&ecirc;n của m&igrave;nh hay chỉ muốn thực hiện điều g&igrave; đ&oacute; s&aacute;ng tạo dựa tr&ecirc;n c&aacute;c bức ảnh gia đ&igrave;nh, th&igrave; tất cả những điều cơ bản trong hướng dẫn n&agrave;y cũng sẽ gi&uacute;p &iacute;ch cho bạn./n
Ch&uacute;c bạn th&agrave;nh c&ocirc;ng!/n', N'powerpoint-la-gi-nhung-thong-tin-ma-ban-nen-biet-.jpg', 19, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Cách tạo và quản lý Section trong Powerpoint', N'Powerpoint ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến bởi t&iacute;nh linh hoạt của n&oacute;. Trong một số trường hợp bạn phải sử dụng một lượng lớn Slide trong c&ocirc;ng việc của m&igrave;nh. Bạn cần một giải ph&aacute;p để quản l&yacute; một lượng lớn c&aacute;c Slide đ&oacute;. Với c&ocirc;ng cụ tạo&nbsp;<strong>Section trong Powerpoint</strong> bạn c&oacute; thể quản l&yacute; bao nhi&ecirc;u Slide t&ugrave;y th&iacute;ch m&agrave; kh&ocirc;ng l&agrave;m lộn xộn giữa c&aacute;c Slide./n
<strong>Tạo Section trong Powerpoint</strong>/n
Bạn c&oacute; thể thực hiện c&aacute;c bước dưới đ&acirc;y từ trong chế độ Normal hoặc Slide Sorter view để tạo section./n
<strong>Bước 1</strong>:&nbsp;Bạn c&oacute; thể tạo c&aacute;c Section ở chế độ Normal hoặc Slide Sorter View. Bạn nhấn chuột phải tại vị tr&iacute; Slide m&agrave; bạn muốn tạo khu vực Section (nh&oacute;m) =&gt;&nbsp;<strong>Add Section</strong>./n
<img class="aligncenter size-full wp-image-5658" src="https://daotaotinhoc.vn/wp-content/uploads/2018/12/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-t%E1%BA%A1o-v%C3%A0-qu%E1%BA%A3n-l%C3%BD-Section-trong-Powerpoint-%C4%91%C6%A1n-gi%E1%BA%A3n.jpg" alt="Hướng dẫn tạo v&agrave; quản l&yacute; Section trong Powerpoint đơn giản" width="498" height="449" loading="lazy">/n
<h2><span id="Tao_Section_trong_Powerpoint" class="ez-toc-section"></span><em><strong>Tạo Section trong Powerpoint</strong></em></h2>
&nbsp;/n
<strong>Bước 2</strong>:&nbsp;V&ugrave;ng Section mới n&agrave;y gồm c&aacute;c Slide theo sau được th&ecirc;m v&agrave;o b&agrave;i thuyết tr&igrave;nh./n
<strong>Bước 3</strong>:&nbsp;Theo mặc định th&igrave; khu vực mới n&agrave;y được đặt t&ecirc;n l&agrave; &ldquo;<strong>Untitle Section</strong>&ldquo;. Nhưng bạn cũng c&oacute; thể thay đổi t&ecirc;n của n&oacute; bằng c&aacute;ch nhấn chuột phải v&agrave;o nh&oacute;m =&gt;&nbsp;<strong>Rename Section</strong>./n
<img class="aligncenter wp-image-5659" src="https://daotaotinhoc.vn/wp-content/uploads/2018/12/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-t%E1%BA%A1o-v%C3%A0-qu%E1%BA%A3n-l%C3%BD-Section-trong-Powerpoint-%C4%91%C6%A1n-gi%E1%BA%A3n-1.jpg" alt="Hướng dẫn tạo v&agrave; quản l&yacute; Section trong Powerpoint đơn giản 1" width="600" height="256" loading="lazy">/n
<h2><span id="Tao_Section_trong_Powerpoint-2" class="ez-toc-section"></span><em><strong>Tạo Section trong Powerpoint</strong></em></h2>
&nbsp;/n
<strong>Bước 4</strong>:&nbsp;Tại hộp thoại&nbsp;<strong>Rename Section</strong>, bạn c&oacute; thể nhập t&ecirc;n mới cho v&ugrave;ng Section./n
<strong>Ch&uacute; &yacute;</strong>:/n
Hộp thoại n&agrave;y bạn c&oacute; thể nhập tất cả c&aacute;c k&yacute; tự c&oacute; trong bảng chữ c&aacute;i,&nbsp;<strong>k&yacute; tự số</strong>,&nbsp;<strong>k&yacute;</strong>&nbsp;<strong>tự đặc biệt, c&aacute;c loại dấu&hellip;.</strong>/n
<strong>Bước 5</strong>:&nbsp;Sau khi nhập t&ecirc;n xong, bạn chọn&nbsp;<strong>Rename</strong>&nbsp;tr&ecirc;n hộp thoại để thay t&ecirc;n./n
<strong>Quản l&yacute; c&aacute;c Setion trong Powerpoint</strong>/n
Một trong những lợi &iacute;ch của Section l&agrave; kh&ocirc;ng chỉ gộp c&aacute;c slide lại th&agrave;nh một nh&oacute;m. M&agrave; bạn c&ograve;n c&oacute; thể sắp xếp ch&uacute;ng theo một tr&igrave;nh tự m&agrave; bạn cho l&agrave; hợp l&yacute; nhất. Thay v&igrave; di chuyển từng slide đơn trong nh&oacute;m, bạn c&ograve;n c&oacute; thể di chuyển cả nh&oacute;m sang một vị tr&iacute; kh&aacute;c. Với chế độ di chuyển nh&oacute;m, bạn c&oacute; thể k&eacute;o nh&oacute;m v&agrave; di chuyển tới vị tr&iacute; mới. Như h&igrave;nh b&ecirc;n dưới, bạn nhấn chuột phải v&agrave;o khu vực nh&oacute;m v&agrave; di chuyển n&oacute; l&ecirc;n hay xuống./n
<img class="aligncenter wp-image-5660" src="https://daotaotinhoc.vn/wp-content/uploads/2018/12/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-t%E1%BA%A1o-v%C3%A0-qu%E1%BA%A3n-l%C3%BD-Section-trong-Powerpoint-%C4%91%C6%A1n-gi%E1%BA%A3n-2.jpg" alt="Hướng dẫn tạo v&agrave; quản l&yacute; Section trong Powerpoint đơn giản 2" width="600" height="247" loading="lazy">/n
<h3><span id="Quan_ly_cac_Section_trong_Powerpoint" class="ez-toc-section"></span><em><strong>Quản l&yacute; c&aacute;c Section trong Powerpoint</strong></em></h3>
&nbsp;/n
<strong>Lưu &yacute;:</strong>/n
Nếu c&oacute; nhiều Slide cần di chuyển, bạn chọn Collapse, để thu gọn c&aacute;c nh&oacute;m lại. Như vậy c&ocirc;ng việc sắp xếp của bạn sẽ đơn giản hơn./n
<strong>X&oacute;a Section trong Powerpoint</strong>/n
Powerpoint c&oacute; 3 t&ugrave;y chọn để x&oacute;a Section: Remove Section, Remove Section &amp; Slide, Remove All Sections./n
<img class="aligncenter wp-image-5661" src="https://daotaotinhoc.vn/wp-content/uploads/2018/12/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-t%E1%BA%A1o-v%C3%A0-qu%E1%BA%A3n-l%C3%BD-Section-trong-Powerpoint-%C4%91%C6%A1n-gi%E1%BA%A3n3.jpg" alt="Hướng dẫn tạo v&agrave; quản l&yacute; Section trong Powerpoint đơn giản3" width="600" height="246" loading="lazy">/n
<h3><span id="Quan_ly_cac_Section_trong_Powerpoint-2" class="ez-toc-section"></span><em><strong>Quản l&yacute; c&aacute;c Section trong Powerpoint</strong></em></h3>
&nbsp;/n
<strong>Remove Section</strong>: X&oacute;a Section đ&atilde; chọn v&agrave; hợp nhất c&aacute;c slide với section trước./n
<strong>Remove Section &amp; Slide</strong>: X&oacute;a Section đ&atilde; chọn v&agrave; tất cả slide trong Section đ&oacute;./n
<strong>Remove All Sections</strong>: X&oacute;a tất cả c&aacute;c Section hiện c&oacute; v&agrave; hợp nhất tất cả slide th&agrave;nh một b&agrave;i thuyết tr&igrave;nh kh&ocirc;ng c&oacute; Section./n
Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng!/n', N'slide-la-gi-cach-tao-slide-dep-chuyen-nghiep-de-lai-an-01a-800x450.jpg', 20, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Cách định dạng và trang trí ảnh trong PowerPoint', N'Sau khi ch&egrave;n ảnh v&agrave;o slide trong PowerPoint, để tạo điểm nhấn cho b&agrave;i tr&igrave;nh chiếu cũng như n&eacute;t đặc trưng ri&ecirc;ng cho c&aacute;c slide, bạn c&oacute; thể cắt, trang tr&iacute;, th&ecirc;m hiệu ứng, khung viền &hellip; hoặc n&eacute;n ảnh t&ugrave;y th&iacute;ch. Dưới đ&acirc;y Gitiho sẽ l&agrave; c&aacute;ch thực hiện./n
<h2><span id="Cat_hinh_anh_trong_PPoint"><strong>Cắt h&igrave;nh ảnh trong PPoint</strong></span></h2>
Sau khi ch&egrave;n ảnh v&agrave;o slide, bạn thấy rằng h&igrave;nh ảnh qu&aacute; lớn v&agrave; c&oacute; những v&ugrave;ng ảnh kh&ocirc;ng cần thiết. Trong trường hợp n&agrave;y bạn sẽ phải sử dụng c&ocirc;ng cụ Crop để loại bỏ những v&ugrave;ng ảnh kh&ocirc;ng cần thiết. C&aacute;ch thực hiện như sau:/n
<strong>Bước 1:</strong>&nbsp;K&iacute;ch chọn ảnh trong slide cần crop, ngay lập tức tr&ecirc;n giao diện ribbon xuất hiện thẻ Format thuộc c&ocirc;ng cụ Picture Tools./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_crop_ribbon.png" alt="cach-cat-hinh-anh-trong-powerpoint-01" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_crop_ribbon.png"></figure>
</div>
<strong>Bước 2:</strong>&nbsp;K&iacute;ch chọn thẻ Format rồi bấm n&uacute;t Crop./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_crop_comm2.jpg" alt="cach-cat-hinh-anh-trong-powerpoint-02" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_crop_comm2.jpg"></figure>
</div>
<strong>Bước 3:</strong>&nbsp;Ngay lập tức bo xung quanh ảnh l&agrave; c&aacute;c đường m&agrave;u đen đậm bo ở c&aacute;c g&oacute;c ngo&agrave;i c&ugrave;ng v&agrave; ở giữa c&aacute;c cạnh của anh. K&iacute;ch giữ chuột tr&aacute;i v&agrave;o c&aacute;c điểm đen đ&oacute; rồi k&eacute;o v&agrave;o để cắt c&aacute;c v&ugrave;ng kh&ocirc;ng cần thiết tr&ecirc;n ảnh, sau đ&oacute; thả chuột./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_crop_handles2.jpg" alt="cach-cat-hinh-anh-trong-powerpoint-03" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_crop_handles2.jpg"></figure>
</div>
<strong>Bước 4:&nbsp;</strong>K&iacute;ch chuột ra ngo&agrave;i v&ugrave;ng ảnh đ&atilde; crop v&agrave; h&igrave;nh ảnh sẽ được cắt./n
<h2><span id="Cat_hinh_anh_theo_hinh_dang_bat_ky"><strong>Cắt h&igrave;nh ảnh theo h&igrave;nh dạng bất kỳ</strong></span></h2>
Ngo&agrave;i việc cắt ảnh theo k&iacute;ch thước bạn tự chọn, PPoint c&ograve;n cho ph&eacute;p người d&ugrave;ng cắt ảnh theo những h&igrave;nh dạng c&oacute; sẵn với rất nhiều lựa chọn th&uacute; vị. Đ&acirc;y cũng l&agrave; c&aacute;ch gi&uacute;p h&igrave;nh ảnh trở n&ecirc;n nổi bật trong slide, c&aacute;ch thực hiện như sau:/n
<strong>Bước 1:</strong>&nbsp;K&iacute;ch chọn h&igrave;nh ảnh cần cắt, rồi chọn thẻ Format/n
<strong>Bước 2:</strong>&nbsp;Bấm v&agrave;o biểu tượng mũi t&ecirc;n xổ xuống của n&uacute;t Crop rồi chọn t&ugrave;y chọn Crop to shape, sau đ&oacute; chọn h&igrave;nh dạng bạn muốn cắt ảnh trong menu hiện ra./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_shape_select2.png" alt="cach-cat-hinh-anh-trong-powerpoint-04" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_shape_select2.png"></figure>
</div>
<strong>Bước 3:&nbsp;</strong>Sau khi thả chuột, h&igrave;nh ảnh sẽ được cắt theo đ&uacute;ng h&igrave;nh dạng m&agrave; bạn đ&atilde; chọn./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_shape_after2.jpg" alt="cach-cat-hinh-anh-trong-powerpoint-05" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_shape_after2.jpg"></figure>
</div>
Nếu kh&ocirc;ng ưng với kiểu h&igrave;nh dạng ảnh vừa cắt, bạn bấm Ctrl+Z để Undo lại thao t&aacute;c vừa rồi v&agrave; chọn lại h&igrave;nh ảnh kh&aacute;c./n
<h2><span id="Them_duong_vien_cho_hinh_anh"><strong>Th&ecirc;m đường viền cho h&igrave;nh ảnh</strong></span></h2>
Một c&aacute;ch kh&aacute;c để trang tr&iacute; cho ảnh trong slide đ&oacute; l&agrave; th&ecirc;m đường viền cho h&igrave;nh ảnh với nhiều t&ugrave;y chọn m&agrave;u sắc bắt mắt kh&aacute;c nhau, thực hiện như sau:/n
<strong>Bước 1:</strong>&nbsp;K&iacute;ch chọn h&igrave;nh ảnh cần th&ecirc;m đường viền, rồi chọn thẻ Format./n
<strong>Bước 2:&nbsp;</strong>Bấm v&agrave;o biểu tượng mũi t&ecirc;n xổ xuống của n&uacute;t Picture Border./n
<strong>Bước 3:</strong>&nbsp;Trong menu xổ xuống chọn m&agrave;u sắc cho đường viền bo ảnh dưới mục Theme Colors, chọn độ đậm nhạt của đường viền bo ảnh tại mụ Weight, kiểu đường viền bo ảnh tại mục Dashes./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_border_select2.jpg" alt="them-duong-vien-cho-hinh-anh-trong-powerpoint-01" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_border_select2.jpg"></figure>
</div>
<strong>Bước 4:</strong>&nbsp;Tương ứng với mỗi t&ugrave;y chọn đ&atilde; chọn, h&igrave;nh ảnh sẽ ngay lập tức hiển thị kết quả tr&ecirc;n ảnh./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_border_after2.jpg" alt="them-duong-vien-cho-hinh-anh-trong-powerpoint-02" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_border_after2.jpg"></figure>
</div>
<h2><span id="Cach_chinh_sua_hinh_anh"><strong>C&aacute;ch chỉnh sửa h&igrave;nh ảnh</strong></span></h2>
Trong trường hợp muốn trang tr&iacute; hoặc chỉnh sửa ảnh th&igrave; PPoint cũng cung cấp c&aacute;c c&ocirc;ng cụ cơ bản nhất để bạn c&oacute; thể chỉnh sửa, thay đổi m&agrave;u sắc, độ s&aacute;ng, độ tương phản hay tạo những hiệu ứng cho h&igrave;nh ảnh tại nh&oacute;m t&iacute;nh năng Adjust v&agrave; Picture Styles thuộc thẻ Format./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_ribbon.png" alt="cach-chinh-sua-hinh-anh-trong-powerpoint-01" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_ribbon.png"></figure>
</div>
Khi muốn trang tr&iacute; v&agrave; chỉnh sửa ảnh, bạn c&oacute; thể lựa chọn một trong c&aacute;c t&ugrave;y chọn sau:/n
<ul>
<li><strong>Corrections:</strong>&nbsp;T&iacute;nh năng n&agrave;y thuộc nh&oacute;m Adjust, cho ph&eacute;p bạn l&agrave;m sắc n&eacute;t hoặc l&agrave;m mềm h&igrave;nh ảnh để điều chỉnh độ mờ hoặc độ n&eacute;t của h&igrave;nh ảnh. Bạn cũng c&oacute; thể điều chỉnh độ s&aacute;ng v&agrave; độ tương phản, điều chỉnh độ s&aacute;ng hoặc tối của h&igrave;nh ảnh xuất hiện.</li>
</ul>
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_color_corrections2.png" alt="cach-them-hieu-ung-hinh-anh-trong-powerpoint-01" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_color_corrections2.png"></figure>
</div>
Tương ứng với mỗi t&ugrave;y chọn đều c&oacute; kết quả ảnh xem trước hiển thị để bạn c&oacute; thể dễ d&agrave;ng lựa chọn sao cho ph&ugrave; hợp./n
<ul>
<li><strong>Color:&nbsp;</strong>Kh&ocirc;ng như Corrections ở tr&ecirc;n, t&iacute;nh năng n&agrave;y cho ph&eacute;p điều chỉnh độ b&atilde;o h&ograve;a, t&ocirc;ng m&agrave;u (từ m&aacute;t đến ấm) hay t&ocirc; m&agrave;u để thay đổi m&agrave;u sắc tổng thể của h&igrave;nh ảnh.</li>
</ul>
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/format_color2.jpg" alt="cach-them-hieu-ung-hinh-anh-trong-powerpoint-02" data-src="https://media.gcflearnfree.org/ctassets/topics/235/format_color2.jpg"></figure>
</div>
<ul>
<li><strong>Artistic Effects:&nbsp;</strong>Tại đ&acirc;y bạn c&oacute; thể th&ecirc;m hiệu ứng cho h&igrave;nh ảnh chẳng hạn như phấn m&agrave;u, m&agrave;u nước, chuyển ảnh th&agrave;nh n&eacute;t vẽ v&agrave; c&aacute;c cạnh ph&aacute;t s&aacute;ng&hellip;</li>
</ul>
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_effects.png" alt="cach-them-hieu-ung-hinh-anh-trong-powerpoint-03" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_effects.png"></figure>
</div>
<ul>
<li><strong>Picture Styles Group:</strong>&nbsp;T&ugrave;y chọn n&agrave;y cung cấp sẵn c&aacute;c kiểu ảnh với c&aacute;c thiết kế về khung, viền v&agrave; c&aacute;c cạnh mềm m&agrave; bạn c&oacute; thể lựa chọn để &aacute;p dụng cho ảnh.</li>
</ul>
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_styles.png" alt="cach-them-hieu-ung-hinh-anh-trong-powerpoint-04" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_adjustments_styles.png"></figure>
</div>
<h2><span id="Cach_nen_hinh_anh"><strong>C&aacute;ch n&eacute;n h&igrave;nh ảnh</strong></span></h2>
Nếu như một bản tr&igrave;nh chiếu c&oacute; qu&aacute; nhiều h&igrave;nh ảnh th&igrave; file PPoint sẽ c&oacute; dung lượng kh&aacute; lớn v&agrave; điều n&agrave;y g&acirc;y kh&oacute; khăn trong việc chia sẻ với người d&ugrave;ng kh&aacute;c, chẳng hạn như kh&ocirc;ng đ&iacute;nh k&egrave;m Email được./n
Trong trường hợp n&agrave;y bạn n&ecirc;n n&eacute;n ảnh to&agrave;n bộ ảnh ch&egrave;n v&agrave;o slide để giảm dung lượng file PPoint hay x&oacute;a c&aacute;c v&ugrave;ng thừa của./n
<strong>Bước 1:</strong>&nbsp;K&iacute;ch chọn h&igrave;nh ảnh cần n&eacute;n, chọn thẻ Format/n
<strong>Bước 2:</strong>&nbsp;Bấm n&uacute;t Compress Pictures./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_compress_ribbon.png" alt="cach-nen-hinh-anh-trong-powerpoint-01" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_compress_ribbon.png"></figure>
</div>
<strong>Bước 3:</strong>&nbsp;Trong hộp thoại Compress Pictures hiển thị, k&iacute;ch t&ugrave;y chọn Delete cropped areas of pictures để x&oacute;a c&aacute;c v&ugrave;ng ảnh bị cắt, chọn Apply only to this Picture nếu chỉ muốn &aacute;p dụng thay đổi cho ảnh đ&atilde; chọn, bỏ dấu t&iacute;ch nếu muốn &aacute;p dụng cho tất cả ảnh trong b&agrave;i thuyết tr&igrave;nh./n
<div class="">
<figure class=""><img class="flag flag-img lazyload" src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_compress_dialog.png" alt="cach-nen-hinh-anh-trong-powerpoint-02" data-src="https://media.gcflearnfree.org/content/56bca0a16e7fba119047e9ab_02_11_2016/formatting_pictures_compress_dialog.png"></figure>
</div>
<strong>Bước 4:</strong>&nbsp;Dưới khung Target output, chọn t&ugrave;y chọn muốn n&eacute;n ảnh. Chẳng hạn nếu muốn gửi file PPoint qua email th&igrave; k&iacute;ch v&agrave;o t&ugrave;y chọn E-Mail (96 ppi) &hellip;. Hoặc để chia sẻ tr&ecirc;n web th&igrave; chọn Screen (150 ppi) &hellip; Sau c&ugrave;ng bấm n&uacute;t OK để &aacute;p dụng./n', N'cach-dinh-dang-va-trang-tri-hinh-anh-trong-powerpoint.png', 21, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'Cách tạo bảng trong Powerpoint', N'<h2><strong>C&aacute;ch tạo bảng trong Powerpoint để tr&igrave;nh b&agrave;y số liệu</strong><br>&nbsp;</h2>
<strong>Bước 1:&nbsp;</strong>Mở file Powerpoint, di chuyển đến slide cần ch&egrave;n bảng số liệu rồi truy cập thẻ&nbsp;<strong>Insert</strong>&nbsp;rồi bấm n&uacute;t&nbsp;<strong>Table</strong>./n
<strong>Bước 2:</strong>&nbsp;Trong menu xổ xuống gồm c&aacute;c lưới &ocirc; vu&ocirc;ng, bạn di chuyển chuột qua lưới n&agrave;y để chọn số h&agrave;ng, số cột m&agrave; bạn muốn tạo bảng./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-1.jpg 768w">/n
<strong>Bước 3:</strong>&nbsp;Ngay vị tr&iacute; bạn đặt trỏ chuột, c&aacute;c &ocirc; trong bảng sẽ tự động được ch&egrave;n v&agrave;o vị tr&iacute; bạn chọn./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-2.jpg 768w">/n
Trong trường hợp bạn ch&egrave;n bảng số liệu v&agrave;o một slide mới th&igrave; c&oacute; thể ch&egrave;n bảng bằng c&aacute;ch bấm n&uacute;t&nbsp;<strong>Insert Table</strong>&nbsp;trong<strong>&nbsp;Placeholder.</strong>/n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-3.jpg 768w">/n
<br>&nbsp;/n
<h2 id="5_cach_chinh_sua_bang_trong_powerpoint"><strong>5 c&aacute;ch chỉnh sửa bảng trong Powerpoint</strong></h2>
<h3 id="cach_thay_doi_kich_thuoc_bang_powerpoint"><strong>C&aacute;ch thay đổi k&iacute;ch thước bảng Powerpoint</strong></h3>
Để thay đổi k&iacute;ch thước bảng, bạn chỉ cần k&iacute;ch chuột v&agrave;o bảng rồi bấm giữ chuột tr&aacute;i v&agrave;o một trong bốn g&oacute;c v&agrave; k&eacute;o ra đến k&iacute;ch thước như bạn mong muốn./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-4.jpg 768w">/n
&nbsp;/n
<h3 id="cach_di_chuyen_mot_bang"><strong>C&aacute;ch di chuyển một bảng</strong></h3>
Để di chuyển bảng số liệu sang vị tr&iacute; kh&aacute;c, chỉ cần k&iacute;ch chuột v&agrave;o bảng rồi di chuột ra m&eacute;p ngo&agrave;i viền của bảng, khi trỏ chuột chuyển th&agrave;nh dấu chữ thập th&igrave; k&iacute;ch giữ chuột tr&aacute;i rồi k&eacute;o đến vị tr&iacute; mới trong slide./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-5.jpg 768w"><br>&nbsp;/n
<h3 id="cach_chen_them_hang_hoac_cot"><strong>C&aacute;ch ch&egrave;n th&ecirc;m h&agrave;ng hoặc cột</strong></h3>
<strong>Bước 1:&nbsp;</strong>Bằng c&aacute;ch bấm v&agrave;o &ocirc; liền kề với &ocirc; m&agrave; bạn muốn th&ecirc;m h&agrave;ng hoặc cột./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-6.jpg 768w">/n
<strong>Bước 2:&nbsp;</strong>Tr&ecirc;n thanh c&ocirc;ng cụ ribbon, bấm chọn thẻ&nbsp;<strong>Layout</strong>./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-7.jpg 768w">/n
<strong>Bước 3:&nbsp;</strong>Trong nh&oacute;m t&iacute;nh năng Rows and columns ph&iacute;a dưới, nếu ch&egrave;n th&ecirc;m d&ograve;ng ph&iacute;a tr&ecirc;n th&igrave; bạn bấm n&uacute;t&nbsp;<strong>Insert Above&nbsp;</strong>hoặc ch&egrave;n th&ecirc;m d&ograve;ng ph&iacute;a dưới th&igrave; bấm n&uacute;t&nbsp;<strong>Insert Below.</strong>/n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-8.jpg 768w">/n
Trong trường hợp ch&egrave;n th&ecirc;m cột th&igrave; bạn chọn&nbsp;<strong>Insert Left&nbsp;</strong>để ch&egrave;n th&ecirc;m cột mới b&ecirc;n tr&aacute;i hay<strong>&nbsp;Insert Right</strong>&nbsp;để ch&egrave;n th&ecirc;m cột mới b&ecirc;n phải vị tr&iacute; của &ocirc;./n
<h3 id="cach_xoa_mot_hang_hay_cot_trong_bang"><strong>C&aacute;ch x&oacute;a một h&agrave;ng hay cột trong bảng</strong></h3>
<strong>Bước 1:</strong>&nbsp;K&iacute;ch chuột v&agrave;o &ocirc; trong h&agrave;ng hoặc cột muốn x&oacute;a, rồi chọn thẻ&nbsp;<strong>Layout</strong>./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-9.jpg 768w">/n
<strong>Bước 2:</strong>&nbsp;Trong nh&oacute;m t&iacute;nh năng Rows And Columns, bấm n&uacute;t&nbsp;<strong>Delete</strong>&nbsp;v&agrave; chọn<strong>&nbsp;Delete Row&nbsp;</strong>nếu muốn x&oacute;a h&agrave;ng,&nbsp;<strong>Delete Columns&nbsp;</strong>nếu muốn x&oacute;a cột./n
&nbsp;/n
<h3 id="cach_xoa_bang"><strong>C&aacute;ch x&oacute;a bảng</strong></h3>
Sau khi ch&egrave;n bảng v&agrave;o slide xong, nếu thay đổi v&agrave; kh&ocirc;ng cần sử dụng bảng số liệu nữa. Chỉ cần k&iacute;ch chọn bảng cần x&oacute;a v&agrave; bấm ph&iacute;m Backspace hoặc Delete tr&ecirc;n b&agrave;n ph&iacute;m./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-10.jpg 768w">/n
Hoặc k&iacute;ch chuột phải v&agrave;o bảng v&agrave; chọn Delete &gt; Delete Table./n
<h2 id="cach_tuy_chinh_bang_trong_powerpoint"><strong>C&aacute;ch t&ugrave;y chỉnh bảng trong Powerpoint</strong></h2>
<h3 id="thay_doi_kieu_bang"><strong>Thay đổi kiểu bảng</strong></h3>
<strong>Bước 1:&nbsp;</strong>K&iacute;ch chuột v&agrave;o một &ocirc; bất kỳ trong bảng v&agrave; chọn thẻ Design./n
<strong>Bước 2:</strong>&nbsp;Trong nh&oacute;m t&iacute;nh năng Table Style, k&iacute;ch chuột tr&aacute;i v&agrave;o biểu tượng mũi t&ecirc;n xổ xuống./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-11.jpg 768w">/n
<strong>Bước 3:</strong>&nbsp;Trong menu xổ xuống k&iacute;ch chọn kiểu bảng bạn muốn sử dụng./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-12.jpg 768w"><br>&nbsp;/n
<strong>Bước 4:&nbsp;</strong>Kiểu bảng mới sẽ được &aacute;p dụng cho bảng dữ liệu hiện tại./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-13.jpg 768w">/n
<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gitiho.com/blog/huong-dan-cach-su-dung-do-thi-va-bieu-do-trong-powerpoint.html">Hướng dẫn c&aacute;ch sử dụng đồ thị v&agrave; biểu đồ trong PowerPoint</a>/n
<h3 id="cach_thay_doi_cac_tuy_chon_kieu_bang"><strong>C&aacute;ch thay đổi c&aacute;c t&ugrave;y chọn kiểu bảng</strong></h3>
Bạn c&oacute; thể thay đổi c&aacute;c t&ugrave;y chọn của bảng dữ liệu bằng c&aacute;ch t&iacute;ch v&agrave;o c&aacute;c t&ugrave;y chọn bao gồm: H&agrave;ng ti&ecirc;u đề &ndash; Header Row, Tổng h&agrave;ng-Total Row, Cột đầu ti&ecirc;n- First Column, Cột cuối c&ugrave;ng &ndash; Last Column &hellip;/n
<img class="flag flag-img     lazyload" src="https://media.gcflearnfree.org/ctassets/topics/235/table_style_options.png" alt="Cach-lam-viec-vơi-tablet-trong-PowerPoint-14" data-src="https://media.gcflearnfree.org/ctassets/topics/235/table_style_options.png">/n
Với mỗi t&ugrave;y chọn khi t&iacute;ch chọn th&igrave; những thay đổi sẽ &aacute;p dụng ngay lập tức cho bảng để bạn dễ d&agrave;ng nhận biết./n
<h3 id="cach_them_duong_vien_cho_bang"><strong>C&aacute;ch th&ecirc;m đường viền cho bảng</strong></h3>
C&oacute; thể c&oacute; một số kiểu của bảng sẽ c&oacute; đường viền, nhưng với những kiểu bảng (Table Style) kh&ocirc;ng c&oacute; viền th&igrave; bạn c&oacute; thể th&ecirc;m đường viền thủ c&ocirc;ng cho bảng bằng c&aacute;ch:/n
<strong>Bước 1:&nbsp;</strong>K&iacute;ch chuột v&agrave;o &ocirc; bất kỳ trong bảng muốn th&ecirc;m viền./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-14.jpg 768w">/n
<strong>Bước 2:</strong>&nbsp;Chọn thẻ&nbsp;<strong>Design</strong>, tại nh&oacute;m t&iacute;nh năng&nbsp;<strong>Draw Borders</strong>, bạn k&iacute;ch chuột v&agrave;o biểu tượng mũi t&ecirc;n xổ xuống tại mục&nbsp;<strong>Line Style&nbsp;</strong>để chọn kiểu đường viền, mục&nbsp;<strong>Line Weight&nbsp;</strong>để chọn độ d&agrave;y, mỏng v&agrave; mục&nbsp;<strong>Pen Color</strong>&nbsp;để chọn m&agrave;u cho đường viền./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-15.jpg 768w"><br>&nbsp;/n
<strong>Bước 3:</strong>&nbsp;Sau đ&oacute; k&iacute;ch chuột v&agrave;o biểu tượng mũi t&ecirc;n xổ xuống tại mục Borders v&agrave; chọn loại đường viền bo cho bảng muốn sử dụng./n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-16.jpg 768w">/n
<strong>Bước 4:</strong>&nbsp;Để x&oacute;a đường viền vừa ch&egrave;n v&agrave;o bảng, bạn chỉ cần bấm n&uacute;t&nbsp;<strong>Borders&nbsp;</strong>v&agrave; chọn<strong>&nbsp;No Border.</strong>/n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-17.jpg 768w">/n
&nbsp;/n
<h2 id="chinh_sua_bang_thong_qua_the_layout_trong_powerpoint"><strong>Chỉnh sửa bảng th&ocirc;ng qua thẻ Layout trong Powerpoint</strong></h2>
Mỗi khi bạn k&iacute;ch chuột v&agrave;o bảng dữ liệu được ch&egrave;n v&agrave;o slide th&igrave; thẻ Design v&agrave; Layout sẽ xuất hiện ở ph&iacute;a cuối của thanh c&ocirc;ng cụ ribbon, bạn c&oacute; thể chỉnh sửa bảng dữ liệu th&ocirc;ng qua thẻ Layout với c&aacute;c c&ocirc;ng cụ sau:/n
<img class="image_resized lazyload" src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg" sizes="(max-width: 395px) 395px,768px" srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg 768w" alt="C&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp" data-src="https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg" data-srcset="https://gitiho.com/caches/p_small_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg 395w, https://gitiho.com/caches/p_medium_large//images/article/photos/137862/image_cach-tao-bang-trong-Powerpoint-18.jpg 768w">/n
<ul>
<li><em>Rows and Columns</em>: Cho ph&eacute;p ch&egrave;n, x&oacute;a h&agrave;ng hoặc cột trong bảng khi cần thiết.</li>
<li><em>Merge:</em>&nbsp;Cho ph&eacute;p gộp c&aacute;c &ocirc; dữ liệu lại với nhau.</li>
<li><em>Distribute Rows/Distribute Columns:</em>&nbsp;Căn đều k&iacute;ch thước cho c&aacute;c h&agrave;ng v&agrave; cột trong bảng.</li>
<li><em>Cell Size:</em>&nbsp;Nh&oacute;m c&aacute;c t&iacute;nh năng điều chỉnh chiều cao của h&agrave;ng hoặc chiều rộng của cột.</li>
<li><em>Alignment:</em>&nbsp;Nh&oacute;m c&aacute;c t&iacute;nh năng căn chỉnh vị tr&iacute; của văn bản trong c&aacute;c &ocirc; của bảng.</li>
</ul>
&nbsp;/n
<h2 id="ket_luan">Kết luận</h2>
Hy vọng những kiến thức về c&aacute;ch tạo bảng trong Powerpoint v&agrave; t&ugrave;y chỉnh chuy&ecirc;n nghiệp m&agrave; ch&uacute;ng m&igrave;nh chia sẻ trong b&agrave;i viết n&agrave;y sẽ hữu &iacute;ch với c&aacute;c bạn./n', N'cach-dinh-dang-va-trang-tri-hinh-anh-trong-powerpoint.png', 24, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Top 5 tính năng nổi bật trên PowerPoint', N'Ch&uacute;ng ta c&ugrave;ng t&igrave;m hiểu TOP 5+ t&iacute;nh năng PowerPoint tr&ecirc;n Microsoft 365 th&ocirc;ng minh gi&uacute;p cho HSSV để x&acirc;y dựng những b&agrave;i tr&igrave;nh b&agrave;y chuy&ecirc;n nghiệp trong khoảnh khắc./n
<h2 id="1139653992596"><strong>Template &amp; Quick Starter</strong></h2>
Để x&acirc;y dựng được 1 slide trinh b&agrave;y PowerPoint ấn tượng, Microsoft trang bị cho bạn những c&ocirc;ng cụ tuyệt vời để thiết kế slide: bố cục, h&igrave;nh ảnh, video, m&agrave;u sắc, biểu tượng, nội dung.../n
<div class="ins-wrapper-c557">
<div class="ins-modal-c557">
<h1 class="ins-modal-header-c557">Trở th&agrave;nh người đầu ti&ecirc;n</h1>
<div>
<div class="ins-content-c557"><span class="ins-modal-header-c557">nhận th&ocirc;ng tin ưu đ&atilde;i</span>
<div class="ins-content-item-c557">
<div class="ins-gender-radio-button-c557"><input id="male" name="gender" required="" type="radio" value="Anh"><label for="male">Anh</label><input id="female" name="gender" type="radio" value="Chị"><label for="female">Chị</label></div>
</div>
<div class="ins-input-area-c557"><input class="name-input" required="" type="text" placeholder="Nhập họ v&agrave; t&ecirc;n"><input class="phone-number-input" required="" type="number" placeholder="Nhập số điện thoại"></div>
<div class="ins-email-area-c557"><input class="email-area" type="email" placeholder="Nhập email (kh&ocirc;ng bắt buộc)"></div>
<div class="ins-email-optin-area-c557"><input id="emailOptin" checked="checked" name="emailOptin" type="checkbox"><label for="emailOptin">T&ocirc;i đồng &yacute; nhận th&ocirc;ng tin ưu đ&atilde;i qua Email</label></div>
</div>
<div class="ins-cta-button-c557"><button class="ins-submit-button-c557 sp-custom-c557">ĐĂNG K&Yacute;</button></div>
</div>
</div>
<div class="ins-hotline-c557"><span class="ins-hotline-text-c557">Gọi&nbsp;<span class="ins-hotline-number-text-c557">1800-6601</span>&nbsp;để được tư vấn (Miễn ph&iacute;)</span></div>
</div>
<iframe src="https://www.youtube.com/embed/xXy5W9yFCCM" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Để tận dụng h&agrave;ng ng&agrave;n mẫu Slide Template sẵn c&oacute;, từ File, bạn chọn New. Tiếp đến chọn chủ đề cần thiết kế trong &ocirc; t&igrave;m kiếm c&oacute; biểu tượng k&iacute;nh l&uacute;p./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image1.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Dựa tr&ecirc;n từ kh&oacute;a theo chủ đề, bạn dễ d&agrave;ng chọn lựa những PowerPoint Template sẵn c&oacute;. Tải về, cập nhật lại nội dung theo &yacute; muốn dựa tr&ecirc;n b&agrave;i tr&igrave;nh b&agrave;y của m&igrave;nh. Vậy l&agrave; bạn đ&atilde; c&oacute; 1 slide tr&igrave;nh b&agrave;y Pro nhanh ch&oacute;ng./n
Ngo&agrave;i ra, bạn c&ograve;n c&oacute; thể sử dụng t&iacute;nh năng Quick Starter. Từ File, bạn chọn New để tạo slide mới. Bạn sẽ thấy phần Quick Starter - Start an outline./n
Quick Starter gi&uacute;p bạn nhanh ch&oacute;ng l&ecirc;n được khung slide chuy&ecirc;n nghiệp, với bố cục, h&igrave;nh ảnh li&ecirc;n quan đến chủ đề bạn cần thực hiện./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image2.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Dựa tr&ecirc;n từ kh&oacute;a t&igrave;m kiếm, Microsoft 365 PowerPoint sẽ gợi &yacute; cho bạn c&aacute;c mẫu slide cần c&oacute; trong bố cục tr&igrave;nh b&agrave;y với chủ đề tương ứng./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image3.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Chọn Next để tiếp tục - PowerPoint sẽ gợi &yacute; cho bạn một số mẫu kh&aacute;c nhau cho chủ đề đ&atilde; lựa chọn. Việc của bạn chỉ cần chọn thiết kế ưng &yacute; nhất v&agrave; chọn Create./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image4.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Vậy l&agrave; bạn đ&atilde; ho&agrave;n th&agrave;nh xong x&acirc;y dựng bố cục, c&aacute;c slide cần c&oacute; c&ugrave;ng hướng dẫn chi tiết để bạn ho&agrave;n th&agrave;nh b&agrave;i tr&igrave;nh b&agrave;y của m&igrave;nh. Rất tuyệt vời v&agrave; nhanh ch&oacute;ng phải kh&ocirc;ng n&agrave;o?/n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image5.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
<h2 id="1649147901886"><strong>Design Ideas &ndash; &Yacute; tưởng tr&igrave;nh b&agrave;y</strong></h2>
Bạn đ&atilde; bao giờ gặp kh&oacute; khăn trong việc tr&igrave;nh b&agrave;y c&aacute;c h&igrave;nh ảnh, video v&agrave;o trong slide? H&igrave;nh ảnh th&igrave; c&oacute; rồi, nhưng sắp xếp như thế n&agrave;o cho &ldquo;dễ nh&igrave;n&rdquo;, cho chuy&ecirc;n nghiệp th&igrave; kh&ocirc;ng phải ai cũng biết./n
Microsoft 365 PowerPoint c&oacute; sẵn &nbsp;c&ocirc;ng cụ được trang bị t&iacute;nh năng Design Ideas c&ugrave;ng Tr&iacute; tuệ nh&acirc;n tạo AI./n
<iframe src="https://www.youtube.com/embed/Gxs2zsSmUCw" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Bạn chỉ cần copy ảnh v&agrave;o slide trắng, sau đ&oacute; nhấp chuột v&agrave;o n&uacute;t Design Ideas. Microsoft 365 PowerPoint sẽ gợi &yacute; c&aacute;c c&aacute;ch tr&igrave;nh b&agrave;y h&igrave;nh ảnh sao ph&ugrave; hợp v&agrave; chuy&ecirc;n nghiệp nhất./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image6.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Ngo&agrave;i ra, ngay cả khi chỉ c&oacute; chủ đề được g&otilde; tr&ecirc;n slide, Microsoft 365 PowerPoint sẽ dựa theo từ kh&oacute;a v&agrave; gợi &yacute; cho bạn c&aacute;c h&igrave;nh ảnh li&ecirc;n quan v&agrave; c&aacute;ch tr&igrave;nh b&agrave;y ph&ugrave; hợp./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image7.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
T&iacute;nh năng Design Ideas với tr&iacute; tuệ nh&acirc;n tạo AI c&ograve;n tự động gi&uacute;p bạn c&aacute;ch tr&igrave;nh b&agrave;y slide với Icon, biểu đồ, hay thậm ch&iacute; những slide chuyển động (looping slide) chuy&ecirc;n nghiệp./n
<h2 id="1007099267890"><strong>Icon &amp; 3D mới</strong></h2>
Để bản tr&igrave;nh b&agrave;y trở n&ecirc;n ấn tượng v&agrave; thuyết phục hơn, bạn c&oacute; thể th&ecirc;m v&agrave;o c&aacute;c đầu mục, icon (biểu tượng) hay h&igrave;nh ảnh minh họa b&agrave;i viết./n
Để ch&egrave;n c&aacute;c icon, h&igrave;nh ảnh 3D v&agrave;o slide, từ File, chọn Insert:/n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image8.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
C&oacute; rất nhiều icon tr&ecirc;n PowerPoint theo c&aacute;c chủ đề kh&aacute;c nhau cho người d&ugrave;ng lựa chọn dễ d&agrave;ng từ du lịch, nghệ thuật, phương tiện đi lại, cảm x&uacute;c, nghề nghiệp&hellip;rất đa dạng, sẵn c&oacute;. &nbsp;/n
Khi sử dụng Microsoft 365, bạn c&ograve;n được bổ sung những Icon mới. bao gồm Stock Image - Kho h&igrave;nh ảnh, Cutout People, Sticker v&agrave; c&aacute;c Icon đa dạng, chuy&ecirc;n nghiệp v&agrave; bản quyền hợp ph&aacute;p c&oacute; thể sử dụng tức th&igrave;. Bạn kh&ocirc;ng c&ograve;n phải loay hoay đi t&igrave;m kiếm ảnh nữa./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image9.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Cutout People cho gợi &yacute; h&igrave;nh ảnh người trong nhiều t&igrave;nh huống kh&aacute;c nhau với dạng ảnh đ&atilde; x&oacute;a nền. Bạn chỉ cần t&igrave;m ảnh ph&ugrave; hợp v&agrave; chọn Insert./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image10.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Ngo&agrave;i ra bạn c&ograve;n c&oacute; thể th&ecirc;m c&aacute;c Stickers đầy cảm x&uacute;c v&agrave;o trong slide nữa với tab Stickers!/n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image11.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Ngo&agrave;i ra, bạn cũng c&oacute; thể ch&egrave;n h&igrave;nh ảnh 3D v&agrave;o slide, gồm cả những h&igrave;nh ảnh 3D chuyển động sinh động ấn tượng./n
<iframe src="https://www.youtube.com/embed/wHRfkhCMoOk" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Bạn c&oacute; thể lựa chọn ch&egrave;n h&igrave;nh ảnh 3D c&oacute; sẵn tr&ecirc;n thiết bị hoặc từ kho h&igrave;nh ảnh 3D của Microsoft./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image12.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Bạn c&oacute; thể dễ d&agrave;ng t&igrave;m kiếm h&igrave;nh ảnh m&igrave;nh cần với từ kh&oacute;a nhập trong &ocirc; t&igrave;m kiếm. Những h&igrave;nh ảnh 3D trong nh&oacute;m: All Animated Models l&agrave; c&aacute;c mẫu 3D chuyển động với c&aacute;c nội dung v&ocirc; c&ugrave;ng đa dạng./n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image13.jpeg" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
<h2 id="906184409623"><strong>Zoom &amp; Morph cho chuyển động điện ảnh</strong></h2>
T&iacute;nh năng Zoom tr&ecirc;n Microsoft 365 PowerPoint. Zoom gi&uacute;p cho bản tr&igrave;nh b&agrave;y trở l&ecirc;n sống động./n
<iframe src="https://www.youtube.com/embed/9T3XX7KWbLU" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Với Zoom, bạn kh&ocirc;ng chỉ tr&igrave;nh b&agrave;y nội dung theo tr&igrave;nh tự slide đ&atilde; c&oacute; m&agrave; c&ograve;n c&oacute; thể chuyển đến hoặc từ c&aacute;c trang chiếu cụ thể, c&aacute;c phần của bản tr&igrave;nh b&agrave;y theo thứ tự bạn quyết định trong khi tr&igrave;nh b&agrave;y./n
Để sử dụng t&iacute;nh năng Zoom, bạn cần chỉ định slide Zoom tổng quan (Summary Zoom), Section Zoom v&agrave; c&aacute;c Slide Zoom./n
<strong>Summary zoom</strong>&nbsp;giống như một trang đ&iacute;ch m&agrave; bạn c&oacute; thể nh&igrave;n thấy to&agrave;n bộ c&aacute;c mục tr&ecirc;n slide tr&igrave;nh b&agrave;y c&ugrave;ng một l&uacute;c. Khi đang thuyết tr&igrave;nh, bạn c&oacute; thể sử dụng hiệu ứng zoom trong Powerpoint để chuyển từ mục n&agrave;y n&agrave;y sang mục kh&aacute;c theo bất kỳ thứ tự n&agrave;o m&agrave; bạn muốn./n
<ol>
<li>Bấm chọn&nbsp;Insert &gt; Zoom&nbsp;</li>
<li>Chọn&nbsp;Summary Zoom</li>
<li>Hộp thoại Summary Zoom sẽ mở ra. Chọn c&aacute;c Slide m&agrave; bạn muốn đưa v&agrave;o hiệu ứng Summary zoom. Những slide n&agrave;y trở th&agrave;nh c&aacute;c slide đầu ti&ecirc;n trong&nbsp;phần tr&igrave;nh chiếu t&oacute;m tắt của bạn.</li>
</ol>
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image15.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Bấm chọn c&aacute;c Slide m&agrave; bạn muốn đưa v&agrave;o hiệu ứng Summary zoom, sau đ&oacute; chọn Insert./n
Hiệu ứng Summary zoom sẽ tạo ra cho bạn 1 slide mới được ch&egrave;n v&agrave;o ngay trước slide đầu ti&ecirc;n m&agrave; bạn chọn trong hiệu ứng Summary zoom./n
<strong>Slide Zoom</strong>/n
Slide zoom c&oacute; thể gi&uacute;p bạn l&agrave;m cho bản tr&igrave;nh b&agrave;y của m&igrave;nh th&ecirc;m năng động, cho ph&eacute;p bạn dẫn hướng một c&aacute;ch tự do giữa c&aacute;c Slide theo bất kỳ thứ tự n&agrave;o m&agrave; bạn chọn nhưng kh&ocirc;ng l&agrave;m gi&aacute;n đoạn bản tr&igrave;nh b&agrave;y của bạn. Slide zoom l&agrave; một lựa chọn tốt cho bản tr&igrave;nh b&agrave;y ngắn v&agrave; kh&ocirc;ng c&oacute; nhiều sections, nhưng bạn c&oacute; thể sử dụng slide zoom cho nhiều t&igrave;nh huống bản tr&igrave;nh b&agrave;y kh&aacute;c nhau./n
Slide zoom gi&uacute;p bạn đi s&acirc;u v&agrave;o nội dung Slide./n
<ol>
<li>Bấm chọn&nbsp;Insert &gt; Zoom&nbsp;</li>
<li>Chọn&nbsp;Slide zoom</li>
<li>Hộp thoại Slide zoom sẽ mở ra. Chọn c&aacute;c slide m&agrave; bạn muốn sử dụng với hiệu ứng Slide zoom</li>
<li>Sau khi đ&atilde; chọn c&aacute;c slide, chọn&nbsp;Insert. Hiệu ứng Slide zoom sẽ được &aacute;p dụng</li>
</ol>
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image16.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
<strong>Section zoom</strong>/n
Section zoom gi&uacute;p kết nối đến một nội dung đ&atilde; c&oacute; trong bản tr&igrave;nh b&agrave;y của bạn. Bạn c&oacute; thể sử dụng t&iacute;nh năng n&agrave;y để quay lại c&aacute;c nội dung muốn nhấn mạnh hoặc để l&agrave;m nổi bật trong b&agrave;i tr&igrave;nh b&agrave;y./n
<ol>
<li>Bấm chọn&nbsp;Insert &gt; Zoom&nbsp;</li>
<li>Chọn&nbsp;Section zoom</li>
<li>Hộp thoại section zoom sẽ mở ra. Chọn c&aacute;c nội dung m&agrave; bạn muốn sử dụng hiệu ứng.</li>
<li>Bấm Insert để thực hiện.</li>
</ol>
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image17.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Tiếp đến l&agrave; hiệu ứng Morph. Tr&ecirc;n PowerPoint, bạn c&oacute; thể dễ d&agrave;ng tạo hiệu ứng điện ảnh với c&aacute;c c&ocirc;ng cụ sẵn c&oacute; trong mục Transitions cho c&aacute;c slide hay c&aacute;c chuyển động điện ảnh trong mục Animations./n
Để tạo ra hiệu ứng Morph, bạn cần sử dụng Microsoft 365 hoặc Office 2019./n
Morph:/n
<iframe src="https://www.youtube.com/embed/nPH1CNsEjvU" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Hiệu ứng chuyển tiếp Morph mang đến hiệu ứng hoạt h&igrave;nh di chuyển một c&aacute;ch trơn tru từ slide n&agrave;y sang slide kh&aacute;c.&nbsp;/n
Để sử dụng hiệu ứng chuyển tiếp n&agrave;y một c&aacute;ch hiệu quả, bạn cần &iacute;t nhất hai slide với &iacute;t nhất một đối tượng chung. C&aacute;ch đơn giản nhất l&agrave; nh&acirc;n bản (duplicate) slide, rồi di chuyển đối tượng tr&ecirc;n slide thứ hai tới vị tr&iacute; kh&aacute;c hoặc sao ch&eacute;p v&agrave; d&aacute;n đối tượng từ một slide, rồi th&ecirc;m đối tượng đ&oacute; v&agrave;o slide tiếp theo. Sau đ&oacute;, &aacute;p dụng hiệu ứng cho slide thứ hai. C&aacute;ch thực hiện như sau:/n
<ul>
<li>Trong pane&nbsp;Thumbnail&nbsp;ở ph&iacute;a b&ecirc;n tr&aacute;i, bấm v&agrave;o slide m&agrave; bạn muốn &aacute;p dụng hiệu ứng chuyển tiếp, ch&iacute;nh l&agrave; slide thứ hai bạn đ&atilde; th&ecirc;m đối tượng, ảnh hoặc từ ngữ m&igrave;nh muốn &aacute;p dụng hiệu ứng chuyển tiếp Morph.</li>
<li>Tr&ecirc;n tab&nbsp;Transitions, chọn&nbsp;Morph.</li>
</ul>
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image18.jpeg" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Lưu &yacute;:&nbsp;Trong PowerPoint for Android, chọn&nbsp;Transitions &gt; Transition Effects &gt; Morph./n
<ul>
<li>Chọn&nbsp;Transitions &gt; Effect Options&nbsp;để chọn c&aacute;ch bạn muốn &aacute;p dụng chuyển tiếp Biến đổi. Bạn c&oacute; thể di chuyển đối tượng tr&ecirc;n slide, thay đổi m&agrave;u, di chuyển từ ngữ v&agrave; c&aacute;c k&yacute; tự c&ugrave;ng nhiều thao t&aacute;c kh&aacute;c nhau để tạo cho hiệu ứng sinh động hơn.</li>
</ul>
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image19.jpeg" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
B&acirc;y giờ th&igrave; bạn c&oacute; thể bấm v&agrave;o&nbsp;Preview&nbsp;để thưởng thức hiệu ứng chuyển tiếp Morph transition hoạt động tr&ecirc;n slide của m&igrave;nh./n
<h2 id="1619466331295"><strong>Inking - Mực kỹ thuật số:</strong>&nbsp;&nbsp;</h2>
T&iacute;nh năng cuối trong TOP 5+ t&iacute;nh năng tuyệt vời tr&ecirc;n Microsoft 365 PowerPoint l&agrave; Inking - Mực kỹ thuật số. C&oacute; thể n&oacute;i, Microsoft ti&ecirc;n phong v&agrave; hỗ trợ tốt nhất cho trải nghiệm b&uacute;t v&agrave; mực kỹ thuật số tr&ecirc;n thiết bị, phần mềm./n
<iframe src="https://www.youtube.com/embed/U85n5sltzZw" width="640" height="360" frameborder="0" allowfullscreen="allowfullscreen"></iframe>/n
Tr&ecirc;n PPT, với m&agrave;n h&igrave;nh cảm ứng v&agrave; b&uacute;t số, bạn thỏa sức s&aacute;ng tạo cho trong tr&igrave;nh b&agrave;y &yacute; tưởng. Từ vẽ nguệch ngoạng, vẽ c&aacute;c h&igrave;nh khối, ghi chữ, viết c&ocirc;ng thức to&aacute;n&hellip;/n
<img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/126374/Originals/image20.png" alt="Top 5 t&iacute;nh năng nổi bật tr&ecirc;n PowerPoint của Microsoft 365">/n
Ch&uacute;ng ta vừa đi qua TOP 5 t&iacute;nh năng th&ocirc;ng minh v&agrave; hiệu quả tr&ecirc;n Microsoft 365 PowerPoint hỗ trợ đắc lực cho việc học của HSSV. Đặc biệt, tr&ecirc;n Microsoft 365, người d&ugrave;ng c&ograve;n c&oacute; 1 TB lưu trữ đ&aacute;m m&acirc;y OneDrive. 1 kh&ocirc;ng gian lưu trữ khổng lồ, đủ để c&aacute;c bạn trẻ lưu trữ đồng bộ tất cả những g&igrave; m&igrave;nh c&oacute; trong suốt thời gian học tập hay đi l&agrave;m về sau. Từ h&igrave;nh ảnh, video, t&agrave;i liệu, đến danh bạ./n
Cũng nhờ lưu trữ đ&aacute;m m&acirc;y OneDrive, tr&ecirc;n Microsoft 365 Word, c&aacute;c bạn c&ograve;n c&oacute; thể:/n
<ul>
<li>Tự động lưu tệp (Auto-Save) l&ecirc;n đ&aacute;m m&acirc;y, kh&ocirc;ng lo khi b&agrave;i tr&igrave;nh b&agrave;y bị mất do lỗi, nhưng chưa kịp lưu.</li>
<li>C&ugrave;ng nhau học tập với bạn b&egrave; từ bất kỳ đ&acirc;u, tr&ecirc;n mọi thiết bị qua t&iacute;nh năng Share v&agrave; cộng t&aacute;c theo thời gian thực tuyệt vời tr&ecirc;n Microsoft PowerPoint.</li>
</ul>
Quan trọng nhất l&agrave; ch&uacute;ng ta c&oacute; một kho lưu trữ an to&agrave;n cho tất cả những g&igrave; quan trọng nhất nhờ khả năng bảo mật v&agrave; an to&agrave;n từ OneDrive. H&atilde;y chia sẻ t&iacute;nh năng n&agrave;o trong TOP 5+ t&iacute;nh năng PowerPoint tr&ecirc;n Microsoft 365 m&agrave; bạn y&ecirc;u th&iacute;ch nhất nh&eacute;!/n', N'them-tieu-de-ppt-thumb.jpg', 25, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([IDLesson], [Name], [Describe], [Images], [IDCourse], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'Tổng hợp các phím tắt cơ bản trong Powerpoint', N'<div class="news-item-content-box">
<h2 id="tong-hop-cac-phim-tat-co-ban-trong-powerpoint" class="newsitem-title text-color-news">1. Tổng Hợp C&aacute;c Ph&iacute;m Tắt Cơ Bản Trong Powerpoint</h2>
<div class="newsitem-content">
<p data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1"><span id="docs-internal-guid-a13910de-7fff-94a0-5777-0b0f8e0f6397"></span>/n
<div dir="ltr" align="left">
<div class="table-wrapper">
<div class="table-scroll">
<table><colgroup><col width="220"><col width="367"></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ph&iacute;m tắt/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">C&ocirc;ng dụng/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + N/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Tạo slide thuyết tr&igrave;nh mới/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + O/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở b&agrave;i thuyết tr&igrave;nh đ&atilde; lưu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + S/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Lưu b&agrave;i thuyết tr&igrave;nh/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">F12 hoặc Alt + F2/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở hộp thoại Save As/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + W hoặc Ctrl + F4/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Đ&oacute;ng file thuyết tr&igrave;nh đang l&agrave;m/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + Q/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Lưu v&agrave; đ&oacute;ng trang thuyết tr&igrave;nh/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + Z/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ho&agrave;n t&aacute;c một thao t&aacute;c đ&atilde; thực hiện&nbsp;/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + Y/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Thực hiện lại một một thao t&aacute;c/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + F2/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chế độ xem trước bản in (Preview View)/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">F1/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở hộp thoại Help ( trợ gi&uacute;p)&nbsp;/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">F7/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Kiểm tra ch&iacute;nh tả/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt hoặc F10/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Hiển thị c&aacute;c ph&iacute;m tắt cho c&aacute;c tab tr&ecirc;n Ribbon/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + F1/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Hiển thị hoặc ẩn thanh Ribbon/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + F/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">T&igrave;m kiếm trong b&agrave;i thuyết tr&igrave;nh&nbsp;/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + F/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở thẻ tab&nbsp;/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + H/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Home/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + N/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở tab Insert/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + G/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Mở tab Design/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + K/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Transitions/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + A/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Animations/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + S/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Slide Show/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + R/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Review/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + W/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab View/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + X/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Add-ins/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Alt + Y/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến tab Help/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + Tab/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đổi giữa c&aacute;c b&agrave;i thuyết tr&igrave;nh đang mở/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + P/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">In Slide (Print)/n
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
<div class="news-item-content-box">
<h2 id="cac-phim-tat-thong-dung-khi-soan-thao-van-ban-trong-powerpoint" class="newsitem-title text-color-news">2. C&aacute;c Ph&iacute;m Tắt Th&ocirc;ng Dụng Khi Soạn Thảo Văn Bản Trong Powerpoint</h2>
<div class="newsitem-content">
<ul>
<li>Ctrl + A: Chọn to&agrave;n bộ slide hoặc chọn to&agrave;n bộ nội dung trong slide t&ugrave;y theo vị tr&iacute; con trỏ chuột hiện tại.</li>
<li>Ctrl + M: Th&ecirc;m một slide mới.</li>
<li>Ctrl + B: In đậm đoạn văn bản đ&atilde; được chọn.</li>
<li>Ctrl + I: In nghi&ecirc;ng đoạn văn bản được chọn.</li>
<li>Ctrl + U: Gạch ch&acirc;n đoạn văn bản được chọn.</li>
<li>Ctrl + "+": Chỉ số dưới (h&oacute;a học).</li>
<li>Ctrl + Shift + "+": Chỉ số tr&ecirc;n (lũy thừa).</li>
<li>Ctrl + T: Mở hộp thoại định dạng Font chữ.</li>
<li>Ctrl + F: Mở hộp thoại t&igrave;m kiếm (Find).</li>
<li>Ctrl + H: Mở hộp thoại thay thế (Replace).</li>
<li>Ctrl + K: Ch&egrave;n li&ecirc;n kết (Hyperlink).</li>
<li>Ctrl + C: Sao ch&eacute;p đoạn văn bản đ&atilde; chọn.</li>
<li>Ctrl + V: D&aacute;n đoạn văn bản đ&atilde; chọn.</li>
<li>Ctrl + Z: Kh&ocirc;i phục thao t&aacute;c trước (Undo).</li>
<li>Ctrl + Shift + &gt;: Tăng cỡ chữ.</li>
<li>Ctrl + Shift + &lt;: Giảm cỡ chữ.</li>
<li>F4 hoặc Ctrl + Y: Lặp lại thao t&aacute;c vừa l&agrave;m.</li>
<li>F7: Kiểm tra lỗi ch&iacute;nh tả.</li>
<li>Ctrl + Backspace: X&oacute;a một từ ở ph&iacute;a trước.</li>
<li>Ctrl + Delete: X&oacute;a một từ ở ph&iacute;a sau.</li>
<li>Ctrl + D: Nh&acirc;n đ&ocirc;i đối tượng hoặc slide được chọn.</li>
<li>Ctrl + J: Căn đều một đoạn.</li>
<li>Ctrl + L: Căn tr&aacute;i một đoạn.</li>
<li>Ctrl + R: Căn phải một đoạn.</li>
<li>Ctrl + E: Căn giữa một đoạn.</li>
<li>Delete: X&oacute;a văn bản, đối tượng hoặc slide đ&atilde; chọn.</li>
<li>Ctrl + Alt + V: Mở hộp thoại Paste Special.</li>
<li>Ctrl + X: Cắt văn bản, đối tượng hoặc slide đ&atilde; chọn.</li>
<li>Tab: Chọn v&agrave; di chuyển đến đối tượng tiếp theo trong một slide.</li>
<li>Home hoặc Bấm giữ cả hai n&uacute;t chuột tr&aacute;i v&agrave; phải trong 2 gi&acirc;y: Chuyển đến slide đầu ti&ecirc;n hoặc trong hộp văn bản, đi đến đầu d&ograve;ng.</li>
<li>End: Chuyển đến slide cuối c&ugrave;ng hoặc trong hộp văn bản đi đến cuối d&ograve;ng.</li>
<li>Ph&iacute;m A hoặc =: Ẩn hoặc hiện con trỏ.</li>
<li>Ph&iacute;m H: Đến slide ẩn.</li>
</ul>
</div>
</div>
<div class="news-item-content-box">
<h2 id="cac-phim-tat-su-dung-trong-trinh-chieu-slide" class="newsitem-title text-color-news">3. C&aacute;c Ph&iacute;m Tắt Sử Dụng Trong Tr&igrave;nh Chiếu Slide</h2>
<div class="newsitem-content">
<div dir="ltr" align="left">
<div class="table-wrapper">
<div class="table-scroll">
<table><colgroup><col width="221"><col width="366"></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ph&iacute;m tắt/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">C&ocirc;ng dụng/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">F5/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Bắt đầu b&agrave;i thuyết tr&igrave;nh/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">B hoặc ph&iacute;m dấu chấm (.)/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Thay đổi m&agrave;n h&igrave;nh th&agrave;nh đen trong qu&aacute; tr&igrave;nh tr&igrave;nh chiếu, nhấn B một lần nữa để quay lại tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ph&iacute;m W hoặc ph&iacute;m dấu phẩy (,)/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Để l&agrave;m trắng m&agrave;n h&igrave;nh hoặc trở lại m&agrave;n h&igrave;nh tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Shift+F5/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Bắt đầu tr&igrave;nh chiếu từ slide hiện tại&nbsp;/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ctrl + P/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ch&uacute; th&iacute;ch bằng c&ocirc;ng cụ Pen trong khi tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">N hoặc Page Down/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Chuyển đến slide tiếp theo trong khi tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">P hoặc Page Up/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Quay trở lại slide trước trong khi tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Ecs hoặc ph&iacute;m -/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Kết th&uacute;c tr&igrave;nh chiếu/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Shift + F9/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Bật/ tắt đường kẻ &ocirc; dạng lưới trong slide/n
</td>
</tr>
<tr>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">S hoặc +/n
</td>
<td>
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Để bật/tắt chế độ tự động tr&igrave;nh chiếu&nbsp;/n
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<p data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1"><span id="docs-internal-guid-ec6e6530-7fff-7dd2-3a2e-8ef7232c199b">&nbsp;</span>/n
<p dir="ltr" data-gtm-vis-has-fired-11082105_183="1" data-gtm-vis-has-fired-11082105_181="1">Tr&ecirc;n đ&acirc;y l&agrave; tổng hợp c&aacute;c ph&iacute;m tắt cơ bản, th&ocirc;ng dụng được d&ugrave;ng trong Powerpoint. Hi vọng với b&agrave;i viết chia sẻ tr&ecirc;n đ&acirc;y sẽ hữu &iacute;ch cho bạn trong việc soạn thảo l&agrave;m b&agrave;i thuyết tr&igrave;nh.&nbsp;/n
</div>
</div>', N'them-tieu-de-ppt-thumb.jpg', 26, 1, CAST(N'2023-04-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[PublishingHouse] ON 

INSERT [dbo].[PublishingHouse] ([IDPH], [NamePH], [Address], [Phone], [Describe], [Images]) VALUES (1, N'Thu Dau Mot University
', N'06 Trần Văn Ơn, Phú Hoà, Thủ Dầu Một, Bình Dương', N'0274 3822 518', NULL, NULL)
INSERT [dbo].[PublishingHouse] ([IDPH], [NamePH], [Address], [Phone], [Describe], [Images]) VALUES (2, N'The Royal Melbourne Institute of Technology', N'702 Đ. Nguyễn Văn Linh, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh 700000', N'028 3776 1300', NULL, NULL)
INSERT [dbo].[PublishingHouse] ([IDPH], [NamePH], [Address], [Phone], [Describe], [Images]) VALUES (3, N'University of Information Technology', N'Đường Hàn Thuyên, khu phố 6 P, Thủ Đức, Thành phố Hồ Chí Minh', N'028 372 52002', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PublishingHouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'<p>H&agrave;m n&agrave;o được sử dụng để t&iacute;nh trung b&igrave;nh cộng của c&aacute;c gi&aacute; trị trong một d&atilde;y số?</p>', 0, N'Câu hỏi 2', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-03-31T04:12:52.6086100' AS DateTime2), N'2')
INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'<p>H&agrave;m n&agrave;o được sử dụng để t&igrave;m gi&aacute; trị lớn nhất trong một d&atilde;y số?</p>', 0, N'Câu hỏi 3', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-03-31T04:13:41.2083695' AS DateTime2), N'2')
INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'<p>H&agrave;m n&agrave;o được sử dụng để t&iacute;nh tổng của c&aacute;c gi&aacute; trị trong một d&atilde;y số?</p>', 0, N'Câu hỏi 1', CAST(N'2023-03-06T15:11:55.3150508' AS DateTime2), N'2', CAST(N'2023-03-31T04:12:02.7992370' AS DateTime2), N'2')
INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'<p>Định dạng n&agrave;o được sử dụng để hiển thị số dương v&agrave; số &acirc;m với dấu trừ?</p>', 0, N'Câu hỏi 1', CAST(N'2023-03-31T04:16:24.6255265' AS DateTime2), N'2', NULL, NULL)
INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'<p>Định dạng n&agrave;o được sử dụng để hiển thị gi&aacute; trị dưới dạng tiền tệ?</p>', 0, N'Câu hỏi 2', CAST(N'2023-03-31T04:17:12.3411540' AS DateTime2), N'2', NULL, NULL)
INSERT [dbo].[Question] ([Id], [Content], [Multiple], [Name], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'<p>Định dạng n&agrave;o được sử dụng để hiển thị ng&agrave;y th&aacute;ng theo định dạng cụ thể?</p>', 0, N'Câu hỏi 3', CAST(N'2023-03-31T04:18:05.5029332' AS DateTime2), N'2', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[SessionAnswer] ON 

INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (4, 30, 1, 1, 1, CAST(N'2023-03-06T20:31:42.9263064+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (5, 30, 4, 7, 0, CAST(N'2023-03-06T20:31:42.9363108+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (6, 31, 1, 1, 1, CAST(N'2023-03-06T22:13:01.7054768+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (7, 31, 5, 12, 1, CAST(N'2023-03-06T22:13:01.7114637+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (8, 31, 4, 7, 0, CAST(N'2023-03-06T22:13:01.7124669+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (9, 33, 6, 17, 1, CAST(N'2023-03-31T11:19:22.1443648+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (10, 33, 7, 22, 1, CAST(N'2023-03-31T11:19:22.1565942+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (11, 33, 8, 27, 1, CAST(N'2023-03-31T11:19:22.1575756+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (12, 34, 1, 2, 0, CAST(N'2023-04-07T19:31:49.3243060+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (13, 34, 5, 14, 0, CAST(N'2023-04-07T19:31:49.3407856+07:00' AS DateTimeOffset))
INSERT [dbo].[SessionAnswer] ([Id], [SessionId], [QuestionId], [AnswerId], [IsCorrect], [CreatedAt]) VALUES (14, 34, 4, 9, 0, CAST(N'2023-04-07T19:31:49.3427992+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[SessionAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[TestSession] ON 

INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (28, 5, 1, CAST(N'2023-03-06T19:37:20.1536400+07:00' AS DateTimeOffset), NULL, 0, 0)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (29, 5, 1, CAST(N'2023-03-06T19:46:22.8623702+07:00' AS DateTimeOffset), NULL, 0, 0)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (30, 5, 1, CAST(N'2023-03-06T20:31:37.7621028+07:00' AS DateTimeOffset), CAST(N'2023-03-06T20:31:42.8413134+07:00' AS DateTimeOffset), 2, 1)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (31, 4, 1, CAST(N'2023-03-06T22:12:48.4374711+07:00' AS DateTimeOffset), CAST(N'2023-03-06T22:13:01.6294727+07:00' AS DateTimeOffset), 3, 1)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (32, 4, 1, CAST(N'2023-03-06T22:13:17.4367966+07:00' AS DateTimeOffset), NULL, 0, 0)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (33, 6, 1, CAST(N'2023-03-31T11:19:10.4224715+07:00' AS DateTimeOffset), CAST(N'2023-03-31T11:19:22.0070238+07:00' AS DateTimeOffset), 3, 3)
INSERT [dbo].[TestSession] ([Id], [CourseId], [UserId], [StartTime], [EndTime], [Total], [Correct]) VALUES (34, 4, 1, CAST(N'2023-04-07T19:31:40.2916341+07:00' AS DateTimeOffset), CAST(N'2023-04-07T19:31:49.1923783+07:00' AS DateTimeOffset), 3, 0)
SET IDENTITY_INSERT [dbo].[TestSession] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([IDTopic], [NameTopic], [Describe], [Images], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Word', N'Microsoft Word is a word processor developed by Microsoft. It was first released on October 25, 1983, under the name Multi-Tool Word for Xenix systems.
', N'word-1.jpg', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), NULL, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Topic] ([IDTopic], [NameTopic], [Describe], [Images], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Excel ', N'Microsoft Excel is a spreadsheet developed by Microsoft for Windows, macOS, Android, iOS and iPadOS. It features calculation or computation capabilities, graphing tools, pivot tables, and a macro programming language called Visual Basic for Applications. Excel forms part of the Microsoft 365 suite of software.
', N'excel-1.jpg', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), NULL, CAST(N'2023-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Topic] ([IDTopic], [NameTopic], [Describe], [Images], [IDCreator], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'PowerPoint', N'Microsoft PowerPoint is a presentation program, created by Robert Gaskins and Dennis Austin at a software company named Forethought, Inc. It was released on April 20, 1987, initially for Macintosh computers only. Microsoft acquired PowerPoint for about $14 million three months after it appeared.
', N'PowerPoint.png', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), NULL, CAST(N'2022-11-25T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'hncanh', N'12345', N'Hoàng Ngọc Cảnh', N'66 Huỳnh Văn Nghệ Phú Lợi Thủ Dầu Một Bình Dương', N'hoangngoccanh2@gmail.com', N'0387685282', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'hncanh1', N'11223344,11223344', N'Hoàng Ngọc Cảnh', N'66 Huỳnh Văn Nghệ Phú Hòa TP. Thủ Dầu Một Bình Dươ', N'hoangngoccanh21@gmail.com', N'0387685282', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'hncanh2', N'ngocquyet', N'Hoàng Ngọc Cảnh', N'66 Huỳnh Văn Nghệ Phú Hòa TP. Thủ Dầu Một Bình Dươ', N'hoangngoccanh2as@gmail.com', N'0387685282', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Question] ADD  DEFAULT ((0)) FOR [Multiple]
GO
ALTER TABLE [dbo].[TestSession] ADD  CONSTRAINT [TestSession_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[TestSession] ADD  CONSTRAINT [TestSession_Correct]  DEFAULT ((0)) FOR [Correct]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_ACourse] FOREIGN KEY([IDCreator])
REFERENCES [dbo].[ACourse] ([IDCreator])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_ACourse]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Lesson] FOREIGN KEY([IDLesson])
REFERENCES [dbo].[Lesson] ([IDLesson])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Lesson]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_PublishingHouse] FOREIGN KEY([IDPH])
REFERENCES [dbo].[PublishingHouse] ([IDPH])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_PublishingHouse]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic1] FOREIGN KEY([IDTopic])
REFERENCES [dbo].[Topic] ([IDTopic])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Topic1]
GO
ALTER TABLE [dbo].[CourseQuestion]  WITH CHECK ADD  CONSTRAINT [FK_CourseQuestions_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([IDCourse])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseQuestion] CHECK CONSTRAINT [FK_CourseQuestions_Course]
GO
ALTER TABLE [dbo].[CourseQuestion]  WITH CHECK ADD  CONSTRAINT [FK_CourseQuestions_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseQuestion] CHECK CONSTRAINT [FK_CourseQuestions_Questions]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_ACourse] FOREIGN KEY([IDCreator])
REFERENCES [dbo].[ACourse] ([IDCreator])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_ACourse]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([IDCourse])
REFERENCES [dbo].[Course] ([IDCourse])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[SessionAnswer]  WITH CHECK ADD FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
GO
ALTER TABLE [dbo].[SessionAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[SessionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_SessionAnswer_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[TestSession] ([Id])
GO
ALTER TABLE [dbo].[SessionAnswer] CHECK CONSTRAINT [FK_SessionAnswer_Session]
GO
ALTER TABLE [dbo].[TestSession]  WITH CHECK ADD  CONSTRAINT [FK_TestSession_Cource] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([IDCourse])
GO
ALTER TABLE [dbo].[TestSession] CHECK CONSTRAINT [FK_TestSession_Cource]
GO
ALTER TABLE [dbo].[TestSession]  WITH CHECK ADD  CONSTRAINT [FK_TestSession_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[TestSession] CHECK CONSTRAINT [FK_TestSession_User]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_ACourse] FOREIGN KEY([IDCreator])
REFERENCES [dbo].[ACourse] ([IDCreator])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_ACourse]
GO
USE [master]
GO
ALTER DATABASE [ITSupport] SET  READ_WRITE 
GO
