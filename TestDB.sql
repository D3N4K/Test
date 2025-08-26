USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 26.08.2025 3:53:25 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[deps]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deps](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_deps] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[second_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[date_employ] [datetime] NULL,
	[date_uneploy] [datetime] NULL,
	[status] [int] NOT NULL,
	[id_dep] [int] NOT NULL,
	[id_post] [int] NOT NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[deps] ON 
GO
INSERT [dbo].[deps] ([id], [name]) VALUES (1, N'Отдел 1')
GO
INSERT [dbo].[deps] ([id], [name]) VALUES (2, N'Отдел 2')
GO
INSERT [dbo].[deps] ([id], [name]) VALUES (3, N'Отдел 3')
GO
SET IDENTITY_INSERT [dbo].[deps] OFF
GO
SET IDENTITY_INSERT [dbo].[persons] ON 
GO
INSERT [dbo].[persons] ([id], [first_name], [second_name], [last_name], [date_employ], [date_uneploy], [status], [id_dep], [id_post]) VALUES (1, N'Иван', N'Иванович', N'Иванов', CAST(N'2010-01-10T00:00:00.000' AS DateTime), CAST(N'2018-10-01T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[persons] ([id], [first_name], [second_name], [last_name], [date_employ], [date_uneploy], [status], [id_dep], [id_post]) VALUES (2, N'Петр', N'Петрович', N'Петров', CAST(N'2008-08-08T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime), 2, 2, 2)
GO
INSERT [dbo].[persons] ([id], [first_name], [second_name], [last_name], [date_employ], [date_uneploy], [status], [id_dep], [id_post]) VALUES (3, N'Артем', N'Артемович', N'Артемов', CAST(N'2007-02-25T00:00:00.000' AS DateTime), CAST(N'2023-10-30T00:00:00.000' AS DateTime), 3, 3, 3)
GO
INSERT [dbo].[persons] ([id], [first_name], [second_name], [last_name], [date_employ], [date_uneploy], [status], [id_dep], [id_post]) VALUES (5, N'Анна', N'Александровна', N'Иванова', CAST(N'2012-05-03T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 1, 2, 3)
GO
INSERT [dbo].[persons] ([id], [first_name], [second_name], [last_name], [date_employ], [date_uneploy], [status], [id_dep], [id_post]) VALUES (6, N'Евгения', N'Денисовна', N'Петрова', CAST(N'2017-09-15T00:00:00.000' AS DateTime), CAST(N'2024-04-19T00:00:00.000' AS DateTime), 3, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[persons] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 
GO
INSERT [dbo].[posts] ([id], [name]) VALUES (1, N'Должность 1')
GO
INSERT [dbo].[posts] ([id], [name]) VALUES (2, N'Должность 2')
GO
INSERT [dbo].[posts] ([id], [name]) VALUES (3, N'Должность 3')
GO
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 
GO
INSERT [dbo].[status] ([id], [name]) VALUES (1, N'Статус 1')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (2, N'Статус 2')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (3, N'Статус 3')
GO
SET IDENTITY_INSERT [dbo].[status] OFF
GO
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_deps] FOREIGN KEY([id_dep])
REFERENCES [dbo].[deps] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_deps]
GO
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_posts] FOREIGN KEY([id_post])
REFERENCES [dbo].[posts] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_posts]
GO
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_status] FOREIGN KEY([status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_status]
GO
/****** Object:  StoredProcedure [dbo].[LoadAllEmployees]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LoadAllEmployees]
as
select per.[id],
[last_name] + ' ' + left([first_name], 1) + '.' + left([second_name], 1) + '.',
s.[name],
d.[name],
post.[name],
format([date_employ], 'dd/MM/yyyy'),
format([date_uneploy], 'dd/MM/yyyy')
from [dbo].[persons] per join [dbo].[status] s
on per.[status] = s.[id]
join [dbo].[deps] d
on per.[id_dep] = d.[id]
join [dbo].[posts] post
on per.[id_post] = post.[id]
GO
/****** Object:  StoredProcedure [dbo].[LoadDepartment]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadDepartment]
as
select * from [dbo].[deps]
GO
/****** Object:  StoredProcedure [dbo].[LoadPost]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadPost]
as
select * from [dbo].[posts]
GO
/****** Object:  StoredProcedure [dbo].[LoadStatus]    Script Date: 26.08.2025 3:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadStatus]
as
select * from [dbo].[status]
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
