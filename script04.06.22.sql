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
/****** Object:  Database [ydodb]    Script Date: 04.06.2022 3:47:54 ******/
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
/****** Object:  Login [user1]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user1')
CREATE LOGIN [user1] WITH PASSWORD=N'fSbp1G2bldCxr/lrgcz1/faOpRYxAaC7VaWrxwUO5jY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user1] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\СИСТЕМА')
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DESKTOP-QCJ91CH\Даниил]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-QCJ91CH\Даниил')
CREATE LOGIN [DESKTOP-QCJ91CH\Даниил] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'U/aFFNNoDyN6Ca0I2s8leyYayw0Hc3J7vuBUtzXov1w=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'0ep30xIEiurUxA9DJC7oYctPekFLL6M+eyv0nG7IvuY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
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
/****** Object:  User [user1]    Script Date: 04.06.2022 3:47:54 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user1')
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [user1] AS [dbo]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 04.06.2022 3:47:54 ******/
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
/****** Object:  Table [dbo].[Contracts]    Script Date: 04.06.2022 3:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contracts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Avance] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[First_part] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Parts_count] [int] NULL,
	[Second_part] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Third_part] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Fourth_part] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Avance_date] [date] NOT NULL,
	[First_part_date] [date] NULL,
	[Second_part_date] [date] NULL,
	[Third_part_date] [date] NULL,
	[Fourth_part_date] [date] NULL,
	[Client_id] [int] NOT NULL,
	[Manager_id] [int] NOT NULL,
	[Type_id] [int] NOT NULL,
	[Payded] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Contracts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 04.06.2022 3:47:55 ******/
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
/****** Object:  Table [dbo].[Types]    Script Date: 04.06.2022 3:47:55 ******/
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

INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (4, N'1500000.00', N'500000.00', N'250000.00', NULL, N'250000.00', N'250000.00', N'250000', CAST(N'2022-06-20' AS Date), CAST(N'2022-06-30' AS Date), CAST(N'2022-07-15' AS Date), NULL, CAST(N'2022-07-30' AS Date), 1, 1, 1, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (6, N'1500000.00', N'500000.00', N'250000.00', NULL, N'250000.00', N'250000.00', N'250000', CAST(N'2022-06-20' AS Date), CAST(N'2022-06-30' AS Date), CAST(N'2022-07-15' AS Date), NULL, CAST(N'2022-07-30' AS Date), 1, 1, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (7, N'1500000.00', N'500000.00', N'250000.00', NULL, N'250000.00', N'250000.00', N'250000', CAST(N'2022-06-20' AS Date), CAST(N'2022-06-30' AS Date), CAST(N'2015-07-15' AS Date), NULL, CAST(N'2022-07-30' AS Date), 1, 1, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (13, N'1000', N'1000', N'1000', 2, N'1000', NULL, NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, NULL, 1, 1, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (15, N'100000', N'100000', N'10000000', 2, N'12000000', NULL, NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, NULL, 2, 1, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (16, N'1000000', N'1000000', N'1000000', 2, N'1000000', NULL, NULL, CAST(N'2022-01-01' AS Date), CAST(N'2002-01-20' AS Date), CAST(N'2022-01-05' AS Date), NULL, NULL, 1, 1, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (17, N'120', N'10', N'100', 2, N'10', NULL, NULL, CAST(N'2022-01-31' AS Date), NULL, NULL, NULL, NULL, 2, 2, 1, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (18, N'3', N'1', N'1', 2, N'1', NULL, NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, NULL, 1, 2, 3, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (19, N'3', N'1', N'2', 2, N'3', NULL, NULL, CAST(N'0001-11-11' AS Date), CAST(N'2022-11-11' AS Date), CAST(N'2022-11-11' AS Date), NULL, NULL, 1, 2, 2, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (21, N'100', N'100', N'99', NULL, N'99', N'99', N'99', CAST(N'0001-01-01' AS Date), CAST(N'2022-07-01' AS Date), CAST(N'2022-08-01' AS Date), CAST(N'2022-09-01' AS Date), CAST(N'2022-10-01' AS Date), 2, 1, 1, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (23, N'99', N'99', N'99', 4, N'99', N'99', N'99', CAST(N'2023-02-02' AS Date), CAST(N'2023-02-02' AS Date), CAST(N'2023-02-02' AS Date), CAST(N'2023-02-02' AS Date), CAST(N'2023-02-02' AS Date), 2, 1, 3, NULL)
INSERT [dbo].[Contracts] ([ID], [Price], [Avance], [First_part], [Parts_count], [Second_part], [Third_part], [Fourth_part], [Avance_date], [First_part_date], [Second_part_date], [Third_part_date], [Fourth_part_date], [Client_id], [Manager_id], [Type_id], [Payded]) VALUES (24, N'123', N'123', N'123', 2, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, NULL, 2, 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (1, N'Игнатьев', N'Даниил', N'Александрович', N'+79293691030', N'daniil', N'252525', NULL)
INSERT [dbo].[Manager] ([ID], [First_name], [Second_name], [Last_name], [Phone], [Login], [Password], [Image]) VALUES (2, N'System', N'Server', N'Admin', N'no phone', N'admin', N'admin', NULL)
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([ID], [Name]) VALUES (1, N'Поставка оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (2, N'Поставка и установка оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (3, N'Обслуживание оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (4, N'Замена оборудования')
INSERT [dbo].[Types] ([ID], [Name]) VALUES (5, N'Внеплановое обслуживание')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Contracts_Parts_count]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_Parts_count]  DEFAULT ((1)) FOR [Parts_count]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Clients] FOREIGN KEY([Client_id])
REFERENCES [dbo].[Clients] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Clients]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Manager]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Manager] FOREIGN KEY([Manager_id])
REFERENCES [dbo].[Manager] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Manager]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Manager]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Types]
GO
USE [master]
GO
ALTER DATABASE [ydodb] SET  READ_WRITE 
GO
