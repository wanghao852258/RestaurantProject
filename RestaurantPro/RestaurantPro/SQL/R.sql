USE [master]
GO
/****** Object:  Database [RestaurantDB]    Script Date: 11/16/2017 4:43:16 PM ******/
CREATE DATABASE [RestaurantDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RestaurantDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RestaurantDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RestaurantDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RestaurantDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantDB] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RestaurantDB]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dishes](
	[DishesId] [int] IDENTITY(100,1) NOT NULL,
	[DishesName] [varchar](100) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DishesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DishesBook]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DishesBook](
	[BookId] [int] IDENTITY(10000,1) NOT NULL,
	[HotelName] [varchar](50) NULL,
	[ConsumeTime] [datetime] NULL,
	[ConsumePersons] [int] NULL,
	[RoomType] [varchar](20) NULL,
	[CustomerName] [varchar](20) NULL,
	[CustomerPhone] [varchar](100) NULL,
	[CustomerEmail] [varchar](100) NULL,
	[Comments] [nvarchar](500) NULL,
	[BookTime] [datetime] NULL DEFAULT (getdate()),
	[OrderStatus] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DishesCategory]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DishesCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1000,1) NOT NULL,
	[NewsTitle] [varchar](100) NULL,
	[NewsContents] [text] NULL,
	[PublishTime] [datetime] NULL DEFAULT (getdate()),
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recruitment](
	[PostId] [int] IDENTITY(100000,1) NOT NULL,
	[PostName] [nvarchar](50) NULL,
	[PostType] [nvarchar](50) NULL,
	[PostPlace] [nvarchar](50) NULL,
	[PostDesc] [text] NULL,
	[PostRequire] [text] NULL,
	[Experience] [nvarchar](100) NULL,
	[EduBackground] [nvarchar](100) NULL,
	[RequireCount] [int] NULL,
	[PublishTime] [datetime] NULL CONSTRAINT [DF__Recruitme__Publi__20C1E124]  DEFAULT (getdate()),
	[Manager] [varchar](50) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__Recruitm__AA126018380BECD3] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suggestion]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suggestion](
	[SuggestionId] [int] IDENTITY(100000,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[ConsumeDesc] [text] NULL,
	[SuggestionDesc] [text] NULL,
	[SuggestionTime] [datetime] NULL DEFAULT (getdate()),
	[PhoneNumber] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[StatusId] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SuggestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SysAdmins]    Script Date: 11/16/2017 4:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysAdmins](
	[LoginId] [int] NOT NULL,
	[LoginName] [varchar](20) NULL,
	[LoginPwd] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[DishesCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[NewsCategory] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [RestaurantDB] SET  READ_WRITE 
GO
