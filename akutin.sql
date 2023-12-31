USE [master]
GO
/****** Object:  Database [Practic05]    Script Date: 23.11.2023 9:33:06 ******/
CREATE DATABASE [Practic05]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Practic05] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practic05].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practic05] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practic05] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practic05] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practic05] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practic05] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practic05] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practic05] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practic05] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practic05] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practic05] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practic05] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practic05] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practic05] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practic05] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practic05] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practic05] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practic05] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practic05] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practic05] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practic05] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practic05] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practic05] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practic05] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practic05] SET  MULTI_USER 
GO
ALTER DATABASE [Practic05] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practic05] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practic05] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practic05] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practic05] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practic05] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Practic05] SET QUERY_STORE = OFF
GO
USE [Practic05]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[CountInPack] [int] NULL,
	[Unit] [nvarchar](10) NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](15) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.11.2023 9:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
	[Password] [nchar](25) NULL,
	[IDRole] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Шина для легкого самолета 26126', 3, N'м', 77, 44, NULL, CAST(8334.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета 26126.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Грунтовка АК-069', 8, N'кг', 414, 33, NULL, CAST(24447.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Покрытие\Грунтовка АК-069.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Шина для легкого самолета Aero Classic', 8, N'кг', 727, 46, NULL, CAST(42751.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета Aero Classic®.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Грунтовка АК-070', 9, N'кг', 576, 7, NULL, CAST(52716.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Покрытие\Грунтовка АК-070.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Шина для легкого самолета MICHELIN® AIR X®', 8, N'кг', 110, 47, NULL, CAST(1053.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета MICHELIN® AIR X®.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Шина для легкого самолета MICHELIN® AVIATOR®', 3, N'м', 129, 11, NULL, CAST(46084.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета MICHELIN® AVIATOR®.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Шина для легкого самолета MICHELIN® PILOT®', 5, N'м', 7, 9, NULL, CAST(17063.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета MICHELIN® PILOT®.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'ДИСКИ ТОРМОЗНЫЕ САМОЛЕТА СУ-24', 7, N'шт', 687, 45, NULL, CAST(54740.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Тормозные диски\ДИСКИ ТОРМОЗНЫЕ САМОЛЕТА СУ-24.jpg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Шина для легкого самолета MICHELIN® PILOT®', 6, N'шт', 672, 14, NULL, CAST(27626.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\резина\Шина для легкого самолета MICHELIN® PILOT®.jpg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'ДИСКИ ТОРМОЗНЫЕ САМОЛЕТОВ СУ-25', 10, N'шт', 886, 7, NULL, CAST(36226.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Тормозные диски\ДИСКИ ТОРМОЗНЫЕ САМОЛЕТОВ СУ-25.jpg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Эмаль АК-512 ', 9, N'л', 801, 28, NULL, CAST(48813.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Покрытие\Эмаль АК-512 .jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'ДИСКИ ТОРМОЗНЫЕ САМОЛЕТА, АН-28', 9, N'шт', 50, 11, NULL, CAST(52328.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Тормозные диски\ДИСКИ ТОРМОЗНЫЕ САМОЛЕТА, АН-28.jpg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'ДИСКИ ТОРМОЗНЫЕ САМОЛЕТОВ АН-24, АН-26, АН-30', 8, N'шт', 950, 14, NULL, CAST(6286.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Тормозные диски\ДИСКИ ТОРМОЗНЫЕ САМОЛЕТОВ АН-24, АН-26, АН-30.jpg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Эмаль КО-84', 5, N'кг', 34, 13, NULL, CAST(38060.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Покрытие\Эмаль КО-84.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Эмаль КО-813', 9, N'кг', 542, 32, NULL, CAST(29855.00 AS Decimal(10, 2)), N'C:\Users\Student\Desktop\Покрытие\Эмаль КО-813.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (102, N'Шина', NULL, NULL, NULL, 4, NULL, CAST(350000.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Тормозные диски', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Покрытие', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Шина', NULL)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Guest          ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Manager        ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Storekeeper    ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (1, N'ГаражТелекомГор', N'1718185951', CAST(N'2023-11-26' AS Date), 18, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (2, N'Компания Омск', N'1878504395', CAST(N'2012-05-10' AS Date), 49, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (3, N'ГорМонтаж', N'1564667734', CAST(N'2013-07-10' AS Date), 39, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (4, N'Микро', N'2293562756', CAST(N'2014-07-15' AS Date), 25, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (5, N'Электро', N'1755853973', CAST(N'2012-05-14' AS Date), 43, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (6, N'Компания Мотор', N'1429908355', CAST(N'2010-09-16' AS Date), 85, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (7, N'Асбоцем', N'1944834477', CAST(N'2012-09-07' AS Date), 23, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (8, N'ВостокМети', N'1488487851', CAST(N'2019-04-08' AS Date), 51, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (9, N'МясКрепТеле', N'2152486844', CAST(N'2013-03-17' AS Date), 78, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (10, N'Софт', N'1036521658', CAST(N'2017-10-13' AS Date), 84, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (11, N'Компания СервисМикроО', N'1178826599', CAST(N'2013-04-14' AS Date), 27, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (12, N'ИнфоГазМотор', N'1954050214', CAST(N'2011-02-10' AS Date), 92, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (13, N'Монтаж', N'1163880101', CAST(N'2019-06-01' AS Date), 66, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (14, N'ЭлектроХром', N'1654184411', CAST(N'2014-08-17' AS Date), 13, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (15, N'Компания НефтьITИнф', N'1685247455', CAST(N'2014-09-26' AS Date), 56, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (16, N'ТомскНефть', N'1002996016', CAST(N'2010-01-13' AS Date), 44, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (17, N'ТомскТяжРеч', N'1102143492', CAST(N'2010-09-11' AS Date), 59, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (18, N'УралХме', N'2291253256', CAST(N'2010-06-15' AS Date), 40, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (19, N'ВодРыб', N'1113468466', CAST(N'2016-09-20' AS Date), 38, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (20, N'УралСервисМон', N'1892306757', CAST(N'2015-04-22' AS Date), 77, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (21, N'Казань', N'1965011544', CAST(N'2017-04-21' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (22, N'Cиб', N'1949139718', CAST(N'2010-10-26' AS Date), 89, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (23, N'ГаражГазМ', N'1740623312', CAST(N'2017-10-07' AS Date), 99, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (24, N'МобайлДизайнОмск', N'1014490629', CAST(N'2011-05-10' AS Date), 99, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (25, N'ЖелДорГаз', N'1255275062', CAST(N'2017-09-07' AS Date), 25, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (26, N'ТверьБухГаз', N'2167673760', CAST(N'2014-03-26' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (27, N'ТелекомТранс', N'2200735978', CAST(N'2019-02-17' AS Date), 87, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (28, N'ГаражГлав', N'1404774111', CAST(N'2014-11-20' AS Date), 1, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (29, N'Компания К', N'1468114280', CAST(N'2014-08-09' AS Date), 54, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (30, N'ТяжЛифтВостокС', N'1032089879', CAST(N'2018-03-01' AS Date), 70, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (31, N'Компания Во', N'2027005945', CAST(N'2014-04-08' AS Date), 23, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (32, N'МоторКаз', N'1076279398', CAST(N'2015-08-27' AS Date), 37, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (33, N'Сервис', N'2031832854', CAST(N'2014-03-11' AS Date), 5, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (34, N'ЮпитерТомс', N'1551173338', CAST(N'2010-06-05' AS Date), 11, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (35, N'Мор', N'1906157177', CAST(N'2010-10-14' AS Date), 38, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (36, N'СеверТехВостокЛизинг', N'1846812080', CAST(N'2010-12-26' AS Date), 34, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (37, N'ЦементОбл', N'2021607106', CAST(N'2012-11-14' AS Date), 46, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (38, N'Компания КазаньАвтоCиб', N'1371692583', CAST(N'2010-04-16' AS Date), 72, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (39, N'ГаражХозФлот', N'2164720385', CAST(N'2019-01-03' AS Date), 19, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (40, N'Компания МорМетал', N'1947163072', CAST(N'2010-02-25' AS Date), 93, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (41, N'ГлавРыб', N'1426268088', CAST(N'2013-12-07' AS Date), 59, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (42, N'CибCибОрио', N'1988313615', CAST(N'2019-02-22' AS Date), 1, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (43, N'ТелеРыбХм', N'2299034130', CAST(N'2019-02-21' AS Date), 51, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (44, N'ГлавАвтоГазТрест', N'2059691335', CAST(N'2013-07-17' AS Date), 28, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (45, N'ТяжКазаньБашкир', N'1794419510', CAST(N'2016-06-01' AS Date), 55, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (46, N'Асбоцемент', N'1650212184', CAST(N'2018-12-08' AS Date), 32, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (47, N'Мотор', N'1019917089', CAST(N'2017-09-09' AS Date), 59, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (48, N'МорФинансФинансМаш', N'1549496316', CAST(N'2016-04-15' AS Date), 50, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (49, N'РыбВектор', N'2275526397', CAST(N'2010-11-25' AS Date), 72, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (50, N'Теле', N'2170198203', CAST(N'2010-04-13' AS Date), 96, N' ПАО')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Password], [IDRole]) VALUES (1, N'Guest               ', N'12345                    ', 3)
INSERT [dbo].[User] ([ID], [Name], [Password], [IDRole]) VALUES (2, N'Manager             ', N'12345                    ', 2)
INSERT [dbo].[User] ([ID], [Name], [Password], [IDRole]) VALUES (3, N'Storekeeper         ', N'12345                    ', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Practic05] SET  READ_WRITE 
GO
