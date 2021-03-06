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
/****** Object:  Database [ydodb]    Script Date: 11.06.2022 4:55:06 ******/
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
/****** Object:  Login [user1]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user1')
CREATE LOGIN [user1] WITH PASSWORD=N'3DdIpkKmFTI5Rp88BTK0CCiekpBBmFzGFwn5OcQXcUU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user1] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\СИСТЕМА')
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DESKTOP-QCJ91CH\Даниил]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-QCJ91CH\Даниил')
CREATE LOGIN [DESKTOP-QCJ91CH\Даниил] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Y+koFkDv9fA/DxKvCS98/yMhd5+4H9/OQTuZ22BSAR8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'dTiIlMTEgnMxhEYhcAZShHmBFLA+okIjh2uwSt6Opvk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
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
USE [ydodb]
GO
/****** Object:  User [user1]    Script Date: 11.06.2022 4:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user1')
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [user1] AS [dbo]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Clients] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Contracts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Currencies] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Manager] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Parts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Payded]    Script Date: 11.06.2022 4:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payded]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payded](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sum] [decimal](16, 2) NULL,
	[Contract_id] [int] NOT NULL,
 CONSTRAINT [PK_Payded] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Payded] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Statuses] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Types]    Script Date: 11.06.2022 4:55:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Types] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [First_name], [Second_name], [Last_name], [Company_name], [phone_number], [Image]) VALUES (1, N'Федоров', N'Максим', N'Викторович', N'ОмскНТР', N'+79991795959', NULL)
INSERT [dbo].[Clients] ([ID], [First_name], [Second_name], [Last_name], [Company_name], [phone_number], [Image]) VALUES (2, N'Милько', N'Иван', N'Сергеевич', N'OrangeBanch', N'+79136460360', NULL)
INSERT [dbo].[Clients] ([ID], [First_name], [Second_name], [Last_name], [Company_name], [phone_number], [Image]) VALUES (3, N'Ступин', N'Алексей', N'Владимирович', N'МЧС', N'+79048200360', N'/res/menedzher.gif')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (40, N'100', 4, N'50', CAST(N'2022-06-06' AS Date), 1, 1, 2, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (42, N'100', 4, N'25', CAST(N'2022-06-06' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (43, N'300', 2, N'100', CAST(N'2022-06-06' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (44, N'300', 2, N'100', CAST(N'2022-06-07' AS Date), 2, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (45, N'301', 2, N'100', CAST(N'2022-06-07' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (46, N'1000', 4, N'500', CAST(N'2022-06-07' AS Date), 2, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (47, N'1000', 4, N'500', CAST(N'2022-06-07' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (48, N'1500', 2, N'500', CAST(N'2022-06-13' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (49, N'1000', 1, N'500', CAST(N'2022-06-08' AS Date), 2, 1, 1, 1, 1)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (50, N'1000', 2, N'500', CAST(N'2022-06-08' AS Date), 2, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (51, N'1000', 2, N'500', CAST(N'2022-06-08' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (52, N'1000', 2, N'500', CAST(N'2022-06-08' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (53, N'1000', 2, N'500', CAST(N'2022-06-08' AS Date), 1, 1, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (54, N'1500000', 4, N'250000', CAST(N'2022-06-08' AS Date), 1, 1, 1, 1, 1)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (55, N'1000', 2, N'250', CAST(N'2022-06-09' AS Date), 2, 1, 1, 1, 3)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (56, N'1000000', 2, N'100', CAST(N'2022-06-09' AS Date), 3, 1, 5, 1, 1)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (57, N'10000', 2, N'2000', CAST(N'2022-06-13' AS Date), 3, 4, 1, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (58, N'1500', 2, N'250', CAST(N'2022-06-09' AS Date), 1, 4, 1, 2, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (59, N'1000', 1, N'100', CAST(N'2022-06-11' AS Date), 3, 1, 3, 1, 2)
INSERT [dbo].[Contracts] ([ID], [Price], [Parts_count], [Avance], [Avance_date], [Client_id], [Manager_id], [Type_id], [Stasus_id], [Currency_id]) VALUES (60, N'1000', 4, N'600', CAST(N'2022-06-02' AS Date), 3, 1, 1, 1, 2)
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
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (57, CAST(25000.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (58, CAST(15000.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (59, CAST(50000.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (60, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-12' AS Date), 47)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (61, CAST(550.00 AS Decimal(16, 2)), CAST(N'2022-06-20' AS Date), 48)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (62, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-27' AS Date), 48)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (63, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 49)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (64, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 50)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (65, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-11' AS Date), 50)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (66, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-13' AS Date), 51)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (67, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-20' AS Date), 51)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (68, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 52)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (69, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 52)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (70, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-08' AS Date), 53)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (71, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 53)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (72, CAST(250000.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 54)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (73, CAST(250000.00 AS Decimal(16, 2)), CAST(N'2022-06-13' AS Date), 54)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (74, CAST(250000.00 AS Decimal(16, 2)), CAST(N'2022-06-16' AS Date), 54)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (75, CAST(5000000.00 AS Decimal(16, 2)), CAST(N'2022-06-19' AS Date), 54)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (76, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 55)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (77, CAST(500.00 AS Decimal(16, 2)), CAST(N'2022-06-20' AS Date), 55)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (78, CAST(40000.00 AS Decimal(16, 2)), CAST(N'2022-06-09' AS Date), 56)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (79, CAST(959900.00 AS Decimal(16, 2)), CAST(N'2022-06-10' AS Date), 56)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (80, CAST(5000.00 AS Decimal(16, 2)), CAST(N'2022-06-23' AS Date), 57)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (81, CAST(3000.00 AS Decimal(16, 2)), CAST(N'2022-06-30' AS Date), 57)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (82, CAST(1000.00 AS Decimal(16, 2)), CAST(N'2022-06-13' AS Date), 58)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (83, CAST(250.00 AS Decimal(16, 2)), CAST(N'2022-06-20' AS Date), 58)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (84, CAST(900.00 AS Decimal(16, 2)), CAST(N'2022-06-13' AS Date), 59)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (85, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 60)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (86, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 60)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (87, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 60)
INSERT [dbo].[Parts] ([ID], [Price], [Pay_day], [Contract_id]) VALUES (88, CAST(100.00 AS Decimal(16, 2)), CAST(N'2022-06-06' AS Date), 60)
SET IDENTITY_INSERT [dbo].[Parts] OFF
GO
SET IDENTITY_INSERT [dbo].[Payded] ON 

INSERT [dbo].[Payded] ([ID], [Sum], [Contract_id]) VALUES (1, CAST(2000.00 AS Decimal(16, 2)), 55)
INSERT [dbo].[Payded] ([ID], [Sum], [Contract_id]) VALUES (2, CAST(2500.00 AS Decimal(16, 2)), 55)
INSERT [dbo].[Payded] ([ID], [Sum], [Contract_id]) VALUES (3, CAST(100.00 AS Decimal(16, 2)), 60)
INSERT [dbo].[Payded] ([ID], [Sum], [Contract_id]) VALUES (4, CAST(100.00 AS Decimal(16, 2)), 60)
SET IDENTITY_INSERT [dbo].[Payded] OFF
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
