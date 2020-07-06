USE [master]
GO
/****** Object:  Database [XMUA]    Script Date: 2020/7/7 0:21:52 ******/
CREATE DATABASE [XMUA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XMUA', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\XMUA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XMUA_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\XMUA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XMUA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XMUA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XMUA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XMUA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XMUA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XMUA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XMUA] SET ARITHABORT OFF 
GO
ALTER DATABASE [XMUA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XMUA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XMUA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XMUA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XMUA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XMUA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XMUA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XMUA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XMUA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XMUA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XMUA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XMUA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XMUA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XMUA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XMUA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XMUA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XMUA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XMUA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XMUA] SET  MULTI_USER 
GO
ALTER DATABASE [XMUA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XMUA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XMUA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XMUA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XMUA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XMUA] SET QUERY_STORE = OFF
GO
USE [XMUA]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[lecturer] [nvarchar](50) NULL,
	[venue] [nvarchar](50) NULL,
	[timeline] [nvarchar](50) NULL,
	[capacity] [int] NULL,
	[exist] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [nvarchar](50) NOT NULL,
	[couse_name] [nvarchar](50) NULL,
	[time] [varchar](50) NULL,
	[venue] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Health]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Health](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [int] NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[temperature] [nchar](10) NOT NULL,
	[student_id] [nvarchar](50) NOT NULL,
	[symptom] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leave]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_number] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[matter] [nvarchar](50) NULL,
	[start_date] [date] NOT NULL,
	[duration] [int] NULL,
	[approve] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [nchar](10) NOT NULL,
	[teacher_name] [nvarchar](50) NOT NULL,
	[course_name] [nvarchar](50) NOT NULL,
	[student_id] [nchar](10) NOT NULL,
	[mark] [float] NOT NULL,
	[time] [nvarchar](50) NULL,
	[venue] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [nvarchar](50) NOT NULL,
	[course_name] [nvarchar](50) NOT NULL,
	[day] [int] NOT NULL,
	[start_time] [int] NOT NULL,
	[end_time] [int] NOT NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020/7/7 0:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[password] [nchar](10) NOT NULL,
	[type] [int] NOT NULL,
	[IDnumber] [nchar](10) NOT NULL,
	[phonenumber] [nchar](20) NULL,
	[programme] [nchar](50) NULL,
	[intake] [nchar](10) NULL,
	[nationality] [nchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (2, N'SWE310    ', N'Programming Elective II (2)', N'Xiao', N'A1#G10', N'Wed. 10.am-12.00pm', 30, 1)
INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (3, N'SWE305    ', N'Data Structure', N'Xiao', N'A2#G03', N'Fri. 2.00pm-4.00pm', 30, 1)
INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (4, N'SWE303    ', N'Advanced Mathematics', N'Xiao', N'A5#102', N'Mon. 8.00am-10.00am', 30, 1)
INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (5, N'SWE308    ', N'Information Security', NULL, N'A1#G11', N'Mon. 4.00pm-6.00pm', 20, 1)
INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (6, N'SWE307    ', N'Software Requirement Enginering', NULL, N'A1#110', N'Tus. 10.00am-12.00pm', 40, 1)
INSERT [dbo].[Course] ([id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist]) VALUES (7, N'SWE311    ', N'Mobile Application System Design', NULL, N'A1#210', N'Thus. 2.00pm-4.00pm', 10, 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([id], [course_id], [couse_name], [time], [venue]) VALUES (1, N'SWE310', N'Programming Elective II (2)', N'2020-8-12', N'LY3')
INSERT [dbo].[Exam] ([id], [course_id], [couse_name], [time], [venue]) VALUES (2, N'SWE305', N'Data Structure', N'2020-8-13', N'A2#G01')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[Health] ON 

INSERT [dbo].[Health] ([id], [date], [country], [temperature], [student_id], [symptom]) VALUES (1, 187, N'China', N'Normal    ', N'SWE100', N'Unhealth  ')
INSERT [dbo].[Health] ([id], [date], [country], [temperature], [student_id], [symptom]) VALUES (2, 188, N'China', N'Normal    ', N'SWE100', N'Health    ')
SET IDENTITY_INSERT [dbo].[Health] OFF
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([id], [course_id], [teacher_name], [course_name], [student_id], [mark], [time], [venue]) VALUES (4, N'SWE310    ', N'Xiao', N'Programming Elective II (2)', N'SWE100    ', 3.3, N'2020-8-12', N'LY3')
INSERT [dbo].[Score] ([id], [course_id], [teacher_name], [course_name], [student_id], [mark], [time], [venue]) VALUES (5, N'SWE305    ', N'Xiao', N'Data Structure', N'SWE100    ', 4, N'2020-8-13', N'A2#G01')
INSERT [dbo].[Score] ([id], [course_id], [teacher_name], [course_name], [student_id], [mark], [time], [venue]) VALUES (6, N'SWE303    ', N'Xiao', N'Advanced Mathematics', N'SWE100    ', 3, N'2020-8-14', N'A1#G11')
INSERT [dbo].[Score] ([id], [course_id], [teacher_name], [course_name], [student_id], [mark], [time], [venue]) VALUES (7, N'SWE308    ', N'', N'Information Security', N'SWE100    ', 0, N'2020-8-11', N'B1#G')
INSERT [dbo].[Score] ([id], [course_id], [teacher_name], [course_name], [student_id], [mark], [time], [venue]) VALUES (8, N'SWE307    ', N'', N'Software Requirement Enginering', N'SWE100    ', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (2, N'SWE310', N'Programming Elective II (2)', 3, 10, 12)
INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (3, N'SWE305    ', N'Data Structure', 5, 2, 4)
INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (4, N'SWE303    ', N'Advanced Mathematics', 1, 8, 10)
INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (5, N'SWE308    ', N'Information Security', 1, 4, 6)
INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (6, N'SWE307    ', N'Software Requirement Enginering', 2, 10, 12)
INSERT [dbo].[Timetable] ([id], [course_id], [course_name], [day], [start_time], [end_time]) VALUES (7, N'SWE311    ', N'Mobile Application System Design', 4, 2, 4)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [type], [IDnumber], [phonenumber], [programme], [intake], [nationality]) VALUES (1, N'GAO HONGXU                                        ', N'1         ', 1, N'SWE100    ', N'0130000000          ', N'Software Engineering                              ', N'1709      ', N'Chinese             ')
INSERT [dbo].[Users] ([id], [username], [password], [type], [IDnumber], [phonenumber], [programme], [intake], [nationality]) VALUES (2, N'Xiao                                              ', N'TCH100    ', 2, N'TCH100    ', N'0170000000          ', NULL, NULL, N'Chinese             ')
INSERT [dbo].[Users] ([id], [username], [password], [type], [IDnumber], [phonenumber], [programme], [intake], [nationality]) VALUES (3, N'Huang                                             ', N'ADM100    ', 3, N'ADM100    ', N'0140000000          ', NULL, NULL, N'Chinese             ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Leave] ADD  CONSTRAINT [DF_Leave_approve]  DEFAULT ((0)) FOR [approve]
GO
ALTER TABLE [dbo].[Score] ADD  CONSTRAINT [DF_Score_mark]  DEFAULT ((0)) FOR [mark]
GO
USE [master]
GO
ALTER DATABASE [XMUA] SET  READ_WRITE 
GO
