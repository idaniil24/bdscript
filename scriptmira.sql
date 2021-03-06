/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2019 (15.0.2080)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Enterprise Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2019
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Enterprise Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [ydodb]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ydodb')
BEGIN
CREATE DATABASE [ydodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ydodb', FILENAME = N'G:\Databasses\ydodb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ydodb_log', FILENAME = N'G:\Databasses\ydodb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Cyrillic_General_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [ydodb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ydodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ydodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ydodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ydodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ydodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ydodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ydodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ydodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ydodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ydodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ydodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ydodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ydodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ydodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ydodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ydodb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ydodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ydodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ydodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ydodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ydodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ydodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ydodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ydodb] SET RECOVERY FULL 
GO
ALTER DATABASE [ydodb] SET  MULTI_USER 
GO
ALTER DATABASE [ydodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ydodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ydodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ydodb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ydodb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ydodb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ydodb', N'ON'
GO
ALTER DATABASE [ydodb] SET QUERY_STORE = OFF
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [user1]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user1')
CREATE LOGIN [user1] WITH PASSWORD=N'gQKd6VrBWpjYyklthBgQ9zcjSjGx5hmAc8IyE9vI0qk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user1] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\СИСТЕМА')
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DESKTOP-QCJ91CH\Даниил]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-QCJ91CH\Даниил')
CREATE LOGIN [DESKTOP-QCJ91CH\Даниил] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'2whRVrtZTH6IZ7vYYq/f2mc4jNK09cnJAh2NGJNo/i4=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'FARFGUs8wBVmeFRN8B6whDuJAfkOls2xv2Ee6iJ+5CQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[ydodb] TO [sa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [user1]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-QCJ91CH\Даниил]
GO
USE [ydodb]
GO
/****** Object:  User [user1]    Script Date: 07.06.2022 4:16:13 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user1')
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [user1] AS [dbo]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Second_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Last_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Company_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[phone_number] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Image] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Clients] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contracts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Parts_count] [int] NULL,
	[Avance] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Avance_date] [date] NOT NULL,
	[Client_id] [int] NULL,
	[Manager_id] [int] NULL,
	[Type_id] [int] NULL,
	[Stasus_id] [int] NULL,
	[Currency_id] [int] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Contracts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currencies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Currencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_currencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Currencies] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Manager]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Second_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Last_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Phone] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Login] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Image] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Manager] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Parts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](16, 2) NULL,
	[Pay_day] [date] NULL,
	[Contract_id] [int] NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Parts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Payded]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payded]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payded](
	[ID] [int] NOT NULL,
	[Sum] [decimal](16, 2) NULL,
	[Contract_id] [int] NOT NULL,
 CONSTRAINT [PK_Payded] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Payded] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Statuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Statuses] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Types]    Script Date: 07.06.2022 4:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Types] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [First_name], [Second_name], [Last_name], [Company_name], [phone_number], [Image]) VALUES (1, N'Федоров', N'Максим', N'Викторович', N'ОмскНТР', N'+79991795959', NULL)
INSERT [dbo].[Clients] ([ID], [First_name], [Second_name], [Last_name], [Company_name], [phone_number], [Image]) VALUES (2, N'Милько', N'Иван', N'Сергеевич', N'OrangeBanch', N'+79136460360', NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (4, N'1500000.00', NULL, N'500000.00', CAST(N'2022-06-20' AS Date), 1, 1, 1, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (6, N'1500000.00', NULL, N'500000.00', CAST(N'2022-06-20' AS Date), 1, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (7, N'1500000.00', NULL, N'500000.00', CAST(N'2022-06-20' AS Date), 1, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (13, N'1000', NULL, N'1000', CAST(N'0001-01-01' AS Date), 1, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (15, N'100000', NULL, N'100000', CAST(N'0001-01-01' AS Date), 2, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (16, N'1000000', NULL, N'1000000', CAST(N'2022-01-01' AS Date), 1, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (17, N'120', NULL, N'10', CAST(N'2022-01-31' AS Date), 2, 2, 1, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (18, N'3', NULL, N'1', CAST(N'0001-01-01' AS Date), 1, 2, 3, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (19, N'3', NULL, N'1', CAST(N'0001-11-11' AS Date), 1, 2, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (21, N'100', NULL, N'100', CAST(N'0001-01-01' AS Date), 2, 1, 1, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (23, N'99', NULL, N'99', CAST(N'2023-02-02' AS Date), 2, 1, 3, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (24, N'123', NULL, N'123', CAST(N'0001-01-01' AS Date), 2, 1, 2, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (25, N'100', NULL, N'100', CAST(N'0001-01-01' AS Date), 2, 1, 1, NULL, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (26, N'123', NULL, N'123', CAST(N'2022-01-01' AS Date), 2, 1, 2, NULL, 1)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (27, N'3', 2, N'1', CAST(N'2022-06-10' AS Date), 1, 1, 1, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (28, N'1', 4, N'12', CAST(N'0001-01-01' AS Date), 1, 1, 5, NULL, 3)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (29, N'1', 4, N'', CAST(N'2022-01-01' AS Date), 2, 1, 1, NULL, 3)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (30, N'100000', 4, N'500', CAST(N'0001-01-01' AS Date), 1, 2, 1, NULL, 1)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (31, N'1000', 2, N'500', CAST(N'0001-01-01' AS Date), 2, 2, 1, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (32, N'1000', 2, N'500', CAST(N'0001-01-01' AS Date), 1, 2, 1, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (33, N'1000', 2, N'500', CAST(N'0001-01-01' AS Date), 2, 1, 2, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (34, N'1000', 2, N'1100', CAST(N'0001-01-01' AS Date), 2, 1, 1, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (35, N'1000', 2, N'1000', CAST(N'0001-01-01' AS Date), 2, 1, 2, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (36, N'1000', 2, N'1000', CAST(N'0001-01-01' AS Date), 2, 1, 2, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (37, N'1', 2, N'1', CAST(N'0001-01-01' AS Date), 1, 1, 2, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (38, N'1', 2, N'1', CAST(N'0001-01-01' AS Date), 2, 1, 1, NULL, 3)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (39, N'100', 2, N'1', CAST(N'2022-01-01' AS Date), 1, 1, 1, NULL, 3)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (40, N'100', 4, N'50', CAST(N'2022-06-06' AS Date), 1, 1, 2, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (41, N'100', 4, N'50', CAST(N'2022-06-06' AS Date), 1, 1, 2, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (42, N'100', 4, N'25', CAST(N'2022-06-06' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (43, N'300', 2, N'100', CAST(N'2022-06-06' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (44, N'300', 2, N'100', CAST(N'2022-06-07' AS Date), 2, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (45, N'301', 2, N'100', CAST(N'2022-06-07' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (46, N'1000', 4, N'500', CAST(N'2022-06-07' AS Date), 2, 1, 1, NULL, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (47, N'1000', 4, N'500', CAST(N'2022-06-07' AS Date), 1, 1, 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 

INSERT [dbo].[Currencies] ([ID], [Name]) VALUES (1, N'RUB')
INSERT [dbo].[Currencies] ([ID], [Name]) VALUES (2, N'USD')
INSERT [dbo].[Currencies] ([ID], [Name]) VALUES (3, N'EUR')
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (1, N'Игнатьев', N'Даниил', N'Александрович', N'+79293691030', N'daniil', N'252525', NULL)
INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (2, N'System', N'Server', N'Admin', N'no phone', N'admin', N'admin', NULL)
INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (3, N'Layer', N'Юрист', N'Компании', N'+79957710360', N'layer', N'layer', NULL)
INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (4, N'1', N'1', N'1', N'1', N'1', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Parts] ON 

INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (1, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 25)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (2, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 25)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (3, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-11' AS Date), 25)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (4, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-12' AS Date), 25)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (5, CAST(123.00 AS Decimal(16, 2)), CAST(N'2022-06-07' AS Date), 26)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (6, CAST(123.00 AS Decimal(16, 2)), CAST(N'2022-06-07' AS Date), 26)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (7, CAST(1.00 AS Decimal(16, 2)), CAST(N'2022-06-11' AS Date), 27)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (8, CAST(1.00 AS Decimal(16, 2)), NULL, 27)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (9, CAST(1.00 AS Decimal(16, 2)), NULL, 28)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (10, CAST(1.00 AS Decimal(16, 2)), NULL, 28)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (11, CAST(1.00 AS Decimal(16, 2)), NULL, 28)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (12, CAST(1.00 AS Decimal(16, 2)), NULL, 28)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (13, CAST(1.00 AS Decimal(16, 2)), NULL, 29)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (14, CAST(1.00 AS Decimal(16, 2)), NULL, 29)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (15, CAST(1.00 AS Decimal(16, 2)), NULL, 29)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (16, CAST(1.00 AS Decimal(16, 2)), NULL, 29)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (17, CAST(250.00 AS Decimal(16, 2)), NULL, 30)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (18, CAST(1.00 AS Decimal(16, 2)), NULL, 30)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (19, CAST(1.00 AS Decimal(16, 2)), NULL, 30)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (20, CAST(1.00 AS Decimal(16, 2)), NULL, 30)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (21, CAST(250.00 AS Decimal(16, 2)), NULL, 31)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (22, CAST(251.00 AS Decimal(16, 2)), NULL, 31)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (23, CAST(500.00 AS Decimal(16, 2)), NULL, 32)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (24, CAST(500.00 AS Decimal(16, 2)), NULL, 32)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (25, CAST(500.00 AS Decimal(16, 2)), NULL, 33)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (26, CAST(500.00 AS Decimal(16, 2)), NULL, 33)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (27, CAST(500.00 AS Decimal(16, 2)), NULL, 34)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (28, CAST(500.00 AS Decimal(16, 2)), NULL, 34)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (29, CAST(2000.00 AS Decimal(16, 2)), NULL, 35)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (30, CAST(2000.00 AS Decimal(16, 2)), NULL, 35)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (31, CAST(1000.00 AS Decimal(16, 2)), NULL, 36)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (32, CAST(1000.00 AS Decimal(16, 2)), NULL, 36)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (33, CAST(1.00 AS Decimal(16, 2)), CAST(N'2022-06-07' AS Date), 37)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (34, CAST(1.00 AS Decimal(16, 2)), CAST(N'2022-06-07' AS Date), 37)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (35, CAST(1.00 AS Decimal(16, 2)), NULL, 38)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (36, CAST(1.00 AS Decimal(16, 2)), NULL, 38)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (37, CAST(98.00 AS Decimal(16, 2)), CAST(N'2022-01-01' AS Date), 39)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (38, CAST(1.00 AS Decimal(16, 2)), CAST(N'2022-01-01' AS Date), 39)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (39, CAST(10.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 40)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (40, CAST(10.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 40)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (41, CAST(10.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 40)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (42, CAST(20.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 40)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (43, CAST(25.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 42)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (44, CAST(25.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 42)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (45, CAST(10.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 42)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (46, CAST(10.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 42)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (47, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 43)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (48, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 43)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (49, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 44)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (50, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 44)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (51, CAST(10000.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 45)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (52, CAST(10000.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 45)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (53, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-07' AS Date), 46)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (54, CAST(50.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 46)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (55, CAST(150.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 46)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (56, CAST(50.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 46)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (57, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (58, CAST(150.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (59, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (60, CAST(5000.00 AS Decimal(16, 2)), CAST(N'2022-06-12' AS Date), 47)
SET IDENTITY_INSERT [dbo].[Parts] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([ID], [name]) VALUES (1, N'На рассмотрении')
INSERT [dbo].[Statuses] ([ID], [name]) VALUES (2, N'Утвержден')
INSERT [dbo].[Statuses] ([ID], [name]) VALUES (3, N'Отклонен')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([ID], [Name]) VALUES (1, N'Поставка оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (2, N'Поставка и установка оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (3, N'Обслуживание оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (4, N'Замена оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (5, N'Внеплановое обслуживание')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Contracts_Stasus_id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_Stasus_id]  DEFAULT ((1)) FOR [Stasus_id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Clients] FOREIGN KEY([Client_id])
REFERENCES [dbo].[Clients] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Clients]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_currencies] FOREIGN KEY([Currency_id])
REFERENCES [dbo].[Currencies] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_currencies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Manager]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Manager] FOREIGN KEY([Manager_id])
REFERENCES [dbo].[Manager] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Manager]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Manager]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Statuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Statuses] FOREIGN KEY([Stasus_id])
REFERENCES [dbo].[Statuses] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Statuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Statuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Parts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Parts]'))
ALTER TABLE [dbo].[Parts]  WITH CHECK ADD  CONSTRAINT [FK_Parts_Contracts] FOREIGN KEY([Contract_id])
REFERENCES [dbo].[Contracts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Parts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Parts]'))
ALTER TABLE [dbo].[Parts] CHECK CONSTRAINT [FK_Parts_Contracts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payded_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Payded]'))
ALTER TABLE [dbo].[Payded]  WITH CHECK ADD  CONSTRAINT [FK_Payded_Contracts] FOREIGN KEY([Contract_id])
REFERENCES [dbo].[Contracts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payded_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Payded]'))
ALTER TABLE [dbo].[Payded] CHECK CONSTRAINT [FK_Payded_Contracts]
GO
USE [master]
GO
ALTER DATABASE [ydodb] SET  READ_WRITE 
GO
