USE [master]
GO
/****** Object:  Database [AromaticWorld]    Script Date: 20.12.2024 11:31:38 ******/
CREATE DATABASE [AromaticWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AromaticWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AromaticWorld.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AromaticWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AromaticWorld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AromaticWorld] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AromaticWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AromaticWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AromaticWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AromaticWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AromaticWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AromaticWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [AromaticWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AromaticWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AromaticWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AromaticWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AromaticWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AromaticWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AromaticWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AromaticWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AromaticWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AromaticWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AromaticWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AromaticWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AromaticWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AromaticWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AromaticWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AromaticWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AromaticWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AromaticWorld] SET RECOVERY FULL 
GO
ALTER DATABASE [AromaticWorld] SET  MULTI_USER 
GO
ALTER DATABASE [AromaticWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AromaticWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AromaticWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AromaticWorld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AromaticWorld] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AromaticWorld] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AromaticWorld', N'ON'
GO
ALTER DATABASE [AromaticWorld] SET QUERY_STORE = OFF
GO
USE [AromaticWorld]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[PickUpPointId] [int] NOT NULL,
	[UserId] [int] NULL,
	[ReceiveCode] [int] NOT NULL,
	[StatusOrderId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductArticleNumber] [nchar](6) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[PickUpPointId] [int] IDENTITY(1,1) NOT NULL,
	[PostalCode] [nchar](6) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Street] [nvarchar](255) NOT NULL,
	[HouseNumber] [int] NULL,
 CONSTRAINT [PK_PickUpPoint] PRIMARY KEY CLUSTERED 
(
	[PickUpPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nchar](6) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductPhoto] [nvarchar](255) NULL,
	[ManufacturerId] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[StatusProductId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Product1] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE3AEE8EAFED] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[StatusOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StatusOrderName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[StatusOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusProduct]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusProduct](
	[StatusProductId] [tinyint] IDENTITY(1,1) NOT NULL,
	[StatusProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusProduct] PRIMARY KEY CLUSTERED 
(
	[StatusProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.12.2024 11:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPatronymic] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Ювелирная продукция')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Парфюмерия')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (1, N'Chanel')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (2, N'Dior')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (3, N'Versace')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (4, N'Gucci')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (1, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2024-12-06T00:00:00.000' AS DateTime), 24, 2, 201, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (2, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2024-11-14T00:00:00.000' AS DateTime), 25, NULL, 202, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (3, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 26, 5, 203, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (4, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, NULL, 204, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (5, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, 10, 205, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (6, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 29, NULL, 206, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (7, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, NULL, 207, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (8, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, NULL, 208, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (9, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2024-12-06T00:00:00.000' AS DateTime), 32, 11, 209, 2)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderDeliveryDate], [PickUpPointId], [UserId], [ReceiveCode], [StatusOrderId]) VALUES (10, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, NULL, 210, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (1, N' E479G', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (1, N'E245R5', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (1, N'E530Y6', 10)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (1, N'J432E4', 4)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N' D344Y', 5)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N' D378D', 4)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N' F346G', 1)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N' F893T', 2)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N' R464G', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (2, N'А112Т4', 5)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (3, N' A436H', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (3, N' E573G', 2)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (3, N'H732R5', 1)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (3, N'K535G6', 1)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (3, N'V472S3', 4)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (4, N' S753T', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (4, N'O875F6', 3)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (5, N'D526R4', 1)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (5, N'G532R5', 1)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [Quantity]) VALUES (6, N' F344S', 3)
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (1, N'344288', N' г. Ангарск', N' ул. Чехова', 1)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (2, N'614164', N' г.Ангарск', N'  ул. Степная', 30)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (3, N'394242', N' г. Ангарск', N' ул. Коммунистическая', 43)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (4, N'660540', N' г. Ангарск', N' ул. Солнечная', 25)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (5, N'125837', N' г. Ангарск', N' ул. Шоссейная', 40)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (6, N'125703', N' г. Ангарск', N' ул. Партизанская', 49)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (7, N'625283', N' г. Ангарск', N' ул. Победы', 46)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (8, N'614611', N' г. Ангарск', N' ул. Молодежная', 50)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (9, N'454311', N' г.Ангарск', N' ул. Новая', 19)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (10, N'660007', N' г.Ангарск', N' ул. Октябрьская', 19)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (11, N'603036', N' г. Ангарск', N' ул. Садовая', 4)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (12, N'450983', N' г.Ангарск', N' ул. Комсомольская', 26)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (13, N'394782', N' г. Ангарск', N' ул. Чехова', 3)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (14, N'603002', N' г. Ангарск', N' ул. Дзержинского', 28)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (15, N'450558', N' г. Ангарск', N' ул. Набережная', 30)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (16, N'394060', N' г.Ангарск', N' ул. Фрунзе', 43)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (17, N'410661', N' г. Ангарск', N' ул. Школьная', 50)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (18, N'625590', N' г. Ангарск', N' ул. Коммунистическая', 20)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (19, N'625683', N' г. Ангарск', N' ул. 8 Марта', NULL)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (20, N'400562', N' г. Ангарск', N' ул. Зеленая', 32)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (21, N'614510', N' г. Ангарск', N' ул. Маяковского', 47)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (22, N'410542', N' г. Ангарск', N' ул. Светлая', 46)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (23, N'620839', N' г. Ангарск', N' ул. Цветочная', 8)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (24, N'443890', N' г. Ангарск', N' ул. Коммунистическая', 1)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (25, N'603379', N' г. Ангарск', N' ул. Спортивная', 46)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (26, N'603721', N' г. Ангарск', N' ул. Гоголя', 41)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (27, N'410172', N' г. Ангарск', N' ул. Северная', 13)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (28, N'420151', N' г. Ангарск', N' ул. Вишневая', 32)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (29, N'125061', N' г. Ангарск', N' ул. Подгорная', 8)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (30, N'630370', N' г. Ангарск', N' ул. Шоссейная', 24)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (31, N'614753', N' г. Ангарск', N' ул. Полевая', 35)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (32, N'426030', N' г. Ангарск', N' ул. Маяковского', 44)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (33, N'450375', N' г. Ангарск ', N'ул. Клубная', 44)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (34, N'625560', N' г. Ангарск', N' ул. Некрасова', 12)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (35, N'630201', N' г. Ангарск', N' ул. Комсомольская', 17)
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [PostalCode], [City], [Street], [HouseNumber]) VALUES (36, N'190949', N' г. Ангарск', N' ул. Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' A436H', N'Подвеска', N'Подвеска из красного золота П142-4547', 1, NULL, 4, CAST(2400.0000 AS Decimal(19, 4)), 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' D344Y', N'Серьги', N'Серьги из золота с эмалью', 1, NULL, 2, CAST(890.0000 AS Decimal(19, 4)), 6, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' D378D', N'Духи', N'Розовая Заря, цветочные', 1, NULL, 2, CAST(7100.0000 AS Decimal(19, 4)), 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' E479G', N'Серьги', N'Серьги из золота 029038', 1, NULL, 4, CAST(590.0000 AS Decimal(19, 4)), 0, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' E573G', N'Духи', N'Кедровый Лес, древесные', 1, NULL, 1, CAST(14000.0000 AS Decimal(19, 4)), 0, 0, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' F344S', N'Серьги', N'Платина Серьги из красного золота без камней', 1, NULL, 2, CAST(24000.0000 AS Decimal(19, 4)), 5, 0, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' F346G', N'Серьги', N'Серьги серебряные в позолоте продёвки на цепочке "Звезда"', 1, NULL, 3, CAST(79000.0000 AS Decimal(19, 4)), 0, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' F893T', N'Серьги', N'Серьги из серебра с позолотой', 1, NULL, 4, CAST(590000.0000 AS Decimal(19, 4)), 30, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' R464G', N'Духи', N'Жасмин и Ваниль, цветочные', 1, NULL, 1, CAST(12000.0000 AS Decimal(19, 4)), 25, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N' S753T', N'Духи', N'Ветивер и Сандал, древесные', 1, NULL, 3, CAST(7800.0000 AS Decimal(19, 4)), 30, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'D526R4', N'Подвеска', N'Подвеска серебряная в позолоте с фианитами 2139189/9п Ювелир Карат', 1, NULL, 1, CAST(17500.0000 AS Decimal(19, 4)), 3, 9, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'E245R5', N'Ожерелье', N'Ожерелье Cordelia (муассанит, 11шт, 3,5мм, круг, BS Regular, 40см)', 1, NULL, 3, CAST(6666.0000 AS Decimal(19, 4)), 50, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'E530Y6', N'Подвеска', N'Подвеска из красного золота', 1, NULL, 1, CAST(8000.0000 AS Decimal(19, 4)), 45, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'G532R5', N'Серьги', N'Серьги из золота с эмалью', 1, NULL, 2, CAST(5900.0000 AS Decimal(19, 4)), 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'H732R5', N'Серьги', N'Серьги со стразами Swarovski 2129919/96П Ювелир Карат', 1, NULL, 4, CAST(2600.0000 AS Decimal(19, 4)), 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'J432E4', N'Ожерелье', N'Ожерелье Lace (муассанит, круг, BS Regular, 6,5мм, 2 муассанит Кр-57 6мм)', 1, NULL, 2, CAST(1000.0000 AS Decimal(19, 4)), 30, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'K535G6', N'Брошь', N'Брошь PLATINA jewelry из серебра 925 пробы с эмалью', 1, NULL, 4, CAST(5200.0000 AS Decimal(19, 4)), 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'O875F6', N'Кольцо', N'Кольцо из золота', 1, NULL, 3, CAST(5300.0000 AS Decimal(19, 4)), 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'V472S3', N'Подвеска', N'Подвеска серебряная с фианитами 2138729/9 Ювелир Карат', 1, NULL, 1, CAST(5350.0000 AS Decimal(19, 4)), 2, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [CategoryId], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [StatusProductId]) VALUES (N'А112Т4', N'Подвеска', N'Подвеска с 1 бриллиантом из красного золота', 1, NULL, 1, CAST(1110.0000 AS Decimal(19, 4)), 40, 11, 1)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusOrder] ON 

INSERT [dbo].[StatusOrder] ([StatusOrderId], [StatusOrderName]) VALUES (1, N'Новый')
INSERT [dbo].[StatusOrder] ([StatusOrderId], [StatusOrderName]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[StatusOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusProduct] ON 

INSERT [dbo].[StatusProduct] ([StatusProductId], [StatusProductName]) VALUES (1, N'В наличии')
INSERT [dbo].[StatusProduct] ([StatusProductId], [StatusProductName]) VALUES (2, N'Отсутствует')
SET IDENTITY_INSERT [dbo].[StatusProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (1, N'Константинова', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (2, N'Меркушев', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (3, N'Казаков', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (4, N'Карпов', N'Глеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (5, N'Королёв', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (6, N'Юдин', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (7, N'Беляева', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (8, N'Беляев', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (9, N'Семёнов', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (10, N'Шестаков', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (11, N'Власов', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (12, N'Савельев', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (13, N'Ефимов', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (14, N'Бурова', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (15, N'Селезнёв', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (16, N'Кулакова', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'8cI7vq8', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (17, N'Дорофеева', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (18, N'Сафонова', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (19, N'Ситникова', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (20, N'Медведев', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (21, N'Суханова', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (22, N'Игнатьев', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (23, N'Ефремов', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (24, N'Кошелев', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (25, N'Галкина', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (26, N'Журавлёва', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (27, N'Савина', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (28, N'Иванов', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (29, N'Лыткин', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (30, N'Логинов', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (31, N'Русакова', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (32, N'Константинов', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (33, N'Поляков', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (34, N'Панфилова', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (35, N'Воробьёв', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (36, N'Андреев', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (37, N'Бобров', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (38, N'Лапин', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (39, N'Шестаков', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (40, N'Гаврилова', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (41, N'Жуков', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (42, N'Пономарёв', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (43, N'Зиновьева', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (44, N'Осипов', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (45, N'Лапин', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (46, N'Зуев', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (47, N'Коновалова', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (48, N'Исаев', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (49, N'Белозёрова', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [RoleId]) VALUES (50, N'Самсонов', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF_OrderProduct_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([PickUpPointId])
REFERENCES [dbo].[PickUpPoint] ([PickUpPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatusOrder] FOREIGN KEY([StatusOrderId])
REFERENCES [dbo].[StatusOrder] ([StatusOrderId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatusOrder]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_StatusProduct] FOREIGN KEY([StatusProductId])
REFERENCES [dbo].[StatusProduct] ([StatusProductId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_StatusProduct]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [AromaticWorld] SET  READ_WRITE 
GO
