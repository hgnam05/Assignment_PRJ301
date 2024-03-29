USE [master]
GO
/****** Object:  Database [ATTENDANCE]    Script Date: 12/14/2021 11:37:22 PM ******/
CREATE DATABASE [ATTENDANCE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATTENDANCE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATTENDANCE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATTENDANCE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATTENDANCE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATTENDANCE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATTENDANCE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATTENDANCE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATTENDANCE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATTENDANCE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATTENDANCE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATTENDANCE] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATTENDANCE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATTENDANCE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATTENDANCE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATTENDANCE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATTENDANCE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATTENDANCE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATTENDANCE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATTENDANCE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATTENDANCE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATTENDANCE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ATTENDANCE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATTENDANCE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATTENDANCE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATTENDANCE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATTENDANCE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATTENDANCE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATTENDANCE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATTENDANCE] SET RECOVERY FULL 
GO
ALTER DATABASE [ATTENDANCE] SET  MULTI_USER 
GO
ALTER DATABASE [ATTENDANCE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATTENDANCE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATTENDANCE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATTENDANCE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATTENDANCE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATTENDANCE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATTENDANCE', N'ON'
GO
ALTER DATABASE [ATTENDANCE] SET QUERY_STORE = OFF
GO
USE [ATTENDANCE]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/14/2021 11:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 12/14/2021 11:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[adate] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[cid] [int] NULL,
	[present] [bit] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 12/14/2021 11:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/14/2021 11:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [varchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 12/14/2021 11:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[tname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'hoangnam', N'123')
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (9, 4, CAST(N'2021-12-13' AS Date), 2, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (10, 5, CAST(N'2021-12-13' AS Date), 2, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (11, 6, CAST(N'2021-12-13' AS Date), 2, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (12, 7, CAST(N'2021-12-12' AS Date), 5, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (13, 8, CAST(N'2021-12-12' AS Date), 5, 3, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (14, 9, CAST(N'2021-12-12' AS Date), 5, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (15, 7, CAST(N'2021-12-12' AS Date), 1, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (16, 8, CAST(N'2021-12-12' AS Date), 1, 3, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (17, 9, CAST(N'2021-12-12' AS Date), 1, 3, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (18, 7, CAST(N'2021-12-13' AS Date), 3, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (19, 8, CAST(N'2021-12-13' AS Date), 3, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (20, 9, CAST(N'2021-12-13' AS Date), 3, 3, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (21, 1, CAST(N'2021-12-13' AS Date), 6, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (22, 2, CAST(N'2021-12-13' AS Date), 6, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (23, 3, CAST(N'2021-12-13' AS Date), 6, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (24, 1, CAST(N'2021-12-14' AS Date), 3, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (25, 2, CAST(N'2021-12-14' AS Date), 3, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (26, 3, CAST(N'2021-12-14' AS Date), 3, 1, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (27, 4, CAST(N'2021-12-13' AS Date), 3, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (28, 5, CAST(N'2021-12-13' AS Date), 3, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (29, 6, CAST(N'2021-12-13' AS Date), 3, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (30, 4, CAST(N'2021-12-16' AS Date), 5, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (31, 5, CAST(N'2021-12-16' AS Date), 5, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (32, 6, CAST(N'2021-12-16' AS Date), 5, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (33, 4, CAST(N'2021-12-16' AS Date), 4, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (34, 5, CAST(N'2021-12-16' AS Date), 4, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (35, 6, CAST(N'2021-12-16' AS Date), 4, 2, 0)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (36, 4, CAST(N'2021-12-18' AS Date), 3, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (37, 5, CAST(N'2021-12-18' AS Date), 3, 2, 1)
INSERT [dbo].[Attendance] ([aid], [sid], [adate], [tid], [cid], [present]) VALUES (38, 6, CAST(N'2021-12-18' AS Date), 3, 2, 0)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([cid], [name]) VALUES (1, N'SE1322')
INSERT [dbo].[Class] ([cid], [name]) VALUES (2, N'SE1321')
INSERT [dbo].[Class] ([cid], [name]) VALUES (3, N'SE1323')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (1, N'Do Hoang Nam', CAST(N'1999-05-27' AS Date), 1, 1)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (2, N'Dao Ngoc Anh', CAST(N'1999-03-04' AS Date), 0, 1)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (3, N'Dao Ngoc Mai', CAST(N'1999-02-17' AS Date), 0, 1)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (4, N'Chu Nguyen Nhat Minh', CAST(N'1999-06-12' AS Date), 1, 2)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (5, N'Tran Khai', CAST(N'1999-06-06' AS Date), 1, 2)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (6, N'Tran Dan', CAST(N'1999-09-05' AS Date), 1, 2)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (7, N'Do Phuong Thao', CAST(N'1999-10-26' AS Date), 0, 3)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (8, N'Do Quang Huy', CAST(N'1999-12-01' AS Date), 1, 3)
INSERT [dbo].[Student] ([sid], [sname], [dob], [gender], [cid]) VALUES (9, N'Chu Nguyen Nhat Long', CAST(N'1999-06-12' AS Date), 1, 3)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Time] ON 

INSERT [dbo].[Time] ([tid], [tname]) VALUES (1, N'Slot 1')
INSERT [dbo].[Time] ([tid], [tname]) VALUES (2, N'Slot 2')
INSERT [dbo].[Time] ([tid], [tname]) VALUES (3, N'Slot 3')
INSERT [dbo].[Time] ([tid], [tname]) VALUES (4, N'Slot 4')
INSERT [dbo].[Time] ([tid], [tname]) VALUES (5, N'Slot 5')
INSERT [dbo].[Time] ([tid], [tname]) VALUES (6, N'Slot 6')
SET IDENTITY_INSERT [dbo].[Time] OFF
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([cid])
REFERENCES [dbo].[Class] ([cid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student1] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student1]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Time] FOREIGN KEY([tid])
REFERENCES [dbo].[Time] ([tid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Time]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([cid])
REFERENCES [dbo].[Class] ([cid])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
USE [master]
GO
ALTER DATABASE [ATTENDANCE] SET  READ_WRITE 
GO
