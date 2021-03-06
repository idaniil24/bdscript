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
/****** Object:  Database [testdb2]    Script Date: 31.05.2022 0:38:48 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'testdb2')
BEGIN
CREATE DATABASE [testdb2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdb2', FILENAME = N'G:\Databasses\testdb2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testdb2_log', FILENAME = N'G:\Databasses\testdb2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Cyrillic_General_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [testdb2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb2] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdb2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdb2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [testdb2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdb2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdb2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdb2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdb2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdb2] SET RECOVERY FULL 
GO
ALTER DATABASE [testdb2] SET  MULTI_USER 
GO
ALTER DATABASE [testdb2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdb2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdb2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdb2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testdb2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testdb2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'testdb2', N'ON'
GO
ALTER DATABASE [testdb2] SET QUERY_STORE = OFF
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [user1]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user1')
CREATE LOGIN [user1] WITH PASSWORD=N'Ce6D3xiwE/hhqqoxFQZ+tv0jG3kvUcmfdlibqDhdv9g=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user1] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\СИСТЕМА')
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DESKTOP-QCJ91CH\Даниил]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-QCJ91CH\Даниил')
CREATE LOGIN [DESKTOP-QCJ91CH\Даниил] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'o73W1S9N0JOqoN1xOOb3VvBjEdz8GOhRvHTUGNUB+T0=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'HIL+FjiR7buKxBXfBYtS9owto0Yuw7XSuYjNVVNgC7A=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[testdb2] TO [sa]
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
USE [testdb2]
GO
/****** Object:  User [user1]    Script Date: 31.05.2022 0:38:49 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user1')
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [user1] AS [dbo]
GO
USE [master]
GO
ALTER DATABASE [testdb2] SET  READ_WRITE 
GO
