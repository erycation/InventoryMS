USE [master]
GO
/****** Object:  Database [InventorymsPreprod]    Script Date: 28/06/2022 14:25:51 PM ******/
CREATE DATABASE [InventorymsPreprod]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventorymsPreprod', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InventorymsPreprod.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventorymsPreprod_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InventorymsPreprod_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InventorymsPreprod] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventorymsPreprod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventorymsPreprod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventorymsPreprod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventorymsPreprod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventorymsPreprod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventorymsPreprod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventorymsPreprod] SET  MULTI_USER 
GO
ALTER DATABASE [InventorymsPreprod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventorymsPreprod] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventorymsPreprod] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventorymsPreprod] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventorymsPreprod] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventorymsPreprod] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventorymsPreprod] SET QUERY_STORE = OFF
GO
USE [InventorymsPreprod]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateInserted] [datetime] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[CellphoneNo] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[LocationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpectedInventory]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpectedInventory](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ReferenceNo] [varchar](50) NOT NULL,
	[DateInserted] [datetime] NOT NULL,
	[Supervisor] [varchar](50) NOT NULL,
	[AdminId] [uniqueidentifier] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[InventoryId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Count1] [int] NOT NULL,
	[Counted] [bit] NOT NULL,
	[CountedDate] [datetime] NULL,
	[VarianceReason] [varchar](50) NULL,
	[SendToVendor] [bit] NOT NULL,
 CONSTRAINT [PK_ExpectedInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inv_User]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_User](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[RoleDescription] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Inv_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Image] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryBalance]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryBalance](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[InventoryCertificateId] [uniqueidentifier] NOT NULL,
	[InventoryId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InventoryBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryCertificate]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryCertificate](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OpeningDate] [datetime] NOT NULL,
	[ClosingDate] [datetime] NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[GeneratedById] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InventoryCertificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryPath]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryPath](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ImagePath] [varchar](250) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_InventoryPath] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryPrice]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryPrice](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransaction]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransaction](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateInserted] [datetime] NOT NULL,
	[EntryType] [varchar](50) NOT NULL,
	[TransactionType] [varchar](50) NOT NULL,
	[TrackingStatus] [varchar](50) NOT NULL,
	[InventoryId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Accepted] [bit] NOT NULL,
	[AcceptedByUserId] [uniqueidentifier] NULL,
	[VerifiedStatus] [varchar](50) NOT NULL,
	[ProcessById] [uniqueidentifier] NOT NULL,
	[LocationVendorId] [uniqueidentifier] NOT NULL,
	[DestinationVendorId] [uniqueidentifier] NOT NULL,
	[OrderItemId] [uniqueidentifier] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedById] [uniqueidentifier] NULL,
	[TrackingNumber] [varchar](50) NULL,
	[InventoryCertificateId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InventoryTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateInserted] [datetime] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[OrderNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[ContactNumber] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Inv_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorLocation]    Script Date: 28/06/2022 14:25:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorLocation](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[ReceivingArea] [bit] NOT NULL,
 CONSTRAINT [PK_Inv_BranchLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'df3004cf-f456-43a1-a991-3005d884fc54', CAST(N'2022-06-25T11:49:38.110' AS DateTime), N'20220625114938', N'121', N'121', N'07614350856', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'bd8d52b8-d8fd-416d-8e87-302a544c153b', CAST(N'2022-06-25T11:47:44.557' AS DateTime), N'20220625114744', N'xzxzxzx', N'xxx', N'0656', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'70e7c2f8-4d41-4a70-aa49-3cf6e1ffc754', CAST(N'2022-06-25T12:38:09.460' AS DateTime), N'20220625123809', N'sas', N'sasas', N'04587481', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'3fabe2ec-f6e7-4ff2-b72d-712410a3ea1e', CAST(N'2022-06-25T09:27:25.150' AS DateTime), N'20220625092725', N'ery', N'sdsds', N'0761435086', N'dsds', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'902f586d-6100-4fc1-94b0-82096a77e547', CAST(N'2022-06-24T23:23:50.463' AS DateTime), N'20220624232350', N'eric', N'malekutu', N'0761435085', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'6c458b69-a1b3-418e-8b67-8f57da647948', CAST(N'2022-06-25T11:42:00.130' AS DateTime), N'20220625114200', N'sddsd', N'dsdsd', N'0764512', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'98c8187d-83cf-475b-b331-98c6de6cd2c0', CAST(N'2022-06-25T09:30:47.343' AS DateTime), N'20220625093047', N'test', N'test', N'0761850025', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'647ce6e0-e426-4c46-a3b4-f09f670c20ad', CAST(N'2022-06-25T09:43:11.413' AS DateTime), N'20220625094311', N'test', N'Eric', N'0761425380', N'noemail@m2esolution.com', N'370b8eba-7151-4f6e-a0db-eed976687f85')
GO
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'105df8e1-50b0-464a-b84b-09c3bae83c47', N'01090eb8-6350-4899-b39a-0eeac885b2b6', CAST(N'2022-06-24T11:43:59.853' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 80, 80, 1, CAST(N'2022-06-24T11:49:52.043' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'2e62f91f-1f7b-44a4-8923-1182c3e92496', N'4ab0f560-199c-46a1-91ba-b4387af61793', CAST(N'2022-06-24T11:44:24.363' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'67b87e50-5a12-4771-8527-9f2e5f7f7640', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 6, 6, 1, CAST(N'2022-06-24T19:22:54.633' AS DateTime), N'None', 0)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'927c4b97-9d70-4512-a79f-3a6e59446e6f', N'7c02e235-0e71-4c66-a5da-f7c2a2f0ecf5', CAST(N'2022-06-24T11:43:20.773' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 50, 50, 1, CAST(N'2022-06-24T19:54:57.120' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'693b670c-3bc4-4e91-82d9-59a0ad2ffd51', N'34005115-fa29-4002-ab89-308c4c508271', CAST(N'2022-06-24T11:43:07.383' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 20, 20, 1, CAST(N'2022-06-24T19:55:03.383' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'f34938f9-4c8e-48d2-8ff0-7b2c371da342', N'0fe51849-2880-4c6a-afe6-d13b6f25bd28', CAST(N'2022-06-24T11:44:15.110' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'67b87e50-5a12-4771-8527-9f2e5f7f7640', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 5, 5, 1, CAST(N'2022-06-24T19:55:08.803' AS DateTime), N'None', 0)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'5cea2d12-4e9c-46de-84f4-87074950152d', N'cdb39197-8a37-4b3a-b3a1-523d8e89cb2c', CAST(N'2022-06-24T11:42:28.810' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 10, 10, 1, CAST(N'2022-06-24T19:55:14.153' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'f2d3046f-2e57-45dd-8ceb-9d38affe8f51', N'd967bc12-01b0-4dc2-b5a6-dd149a7bcddb', CAST(N'2022-06-24T11:43:51.457' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'e4191640-be34-49e9-8c99-c0ed9add604e', 80, 80, 1, CAST(N'2022-06-24T19:55:19.340' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'0291561a-ab5f-4a44-832c-c1a7a997373f', N'0a51d4de-ba1d-44c9-bf83-1d6bd70fbdea', CAST(N'2022-06-24T11:43:42.940' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'e4191640-be34-49e9-8c99-c0ed9add604e', 60, 60, 1, CAST(N'2022-06-24T19:55:27.447' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'97a2b2f6-4412-403a-a0d1-c992cb215d9e', N'1321c54e-7e7e-486b-bcac-648a5f30b006', CAST(N'2022-06-24T11:43:34.653' AS DateTime), N'Superuser', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 30, 30, 1, CAST(N'2022-06-24T19:55:37.797' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'e2065673-9c81-4bfd-b17b-db7e27653e8f', N'6987c376-ca25-4877-82b5-ae8aea455141', CAST(N'2022-06-10T03:10:56.207' AS DateTime), N'Ndhlandhla', N'7f6843c2-3281-4273-bd69-206bb409a059', N'812eda8d-f1df-4462-ac02-3ce048375d07', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 5, 5, 1, CAST(N'2022-06-24T19:55:44.543' AS DateTime), N'None', 0)
GO
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'22f23f3d-c063-417a-ba35-097ac5843746', N'Malekutu', N'$2a$11$XpGljZAtMJ81MZHyjps8yu9aS52Yxl8SLkddiKchVLQFduxg5F0m.', N'testAdmin', N'AdminTest', N'Admin', 1, N'd93306e6-beac-4fd4-b9d2-e79a05f10200')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'4e9cbb6a-347a-487f-94b9-1e9a2522ace4', N'AdminTestProd', N'$2a$11$hWqr84zX.HVYTUc65olzf.kHnMPcfkhmWo7nTzL49RosY.7UE.1km', N'AdminTestProd', N'AdminTestProd', N'AdminProduction', 1, N'22589cbe-a810-4e04-a2c8-8f9480143b2e')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'7f6843c2-3281-4273-bd69-206bb409a059', N'Whitney', N'$2a$11$hOps2dw7bN65Ezx5Hi626OIgIqfFT6.hqnELlX2bTAlU6NcCGXmbi', N'Whitney', N'Mahlare', N'Admin', 1, N'd93306e6-beac-4fd4-b9d2-e79a05f10200')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'SalesSilver', N'$2a$11$CafUMjltHYiP1sQG78A/J.WuiEDm93pgp7i7vyhFEs05hOsIDmk3u', N'UserS', N'UserS', N'Sales', 1, N'995b5808-12e9-4bd3-be9e-14ac88d979bc')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'f2e9e159-d048-49ae-9a1d-9e3099d929a4', N'SalesMams', N'$2a$11$fekBm8/dRrdbnWt0n6nVO.W.vPr8ZDHjm0UPFuAP0V.z30va6POeG', N'Mams', N'Mams', N'Sales', 1, N'3c25cfb4-6135-43a7-a142-5929306b8eb0')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'705dfb86-ed64-493a-9cf8-d4a5a977a055', N'Superuser', N'$2a$11$hOps2dw7bN65Ezx5Hi626OIgIqfFT6.hqnELlX2bTAlU6NcCGXmbi', N'Superuser', N'Superuser', N'Supervisor', 1, N'd93306e6-beac-4fd4-b9d2-e79a05f10200')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'f4177ca2-7f2b-4cbd-b03f-da10d9ffbd1d', N'Ndhlandhla', N'$2a$11$A6jaHGwtORXCvfIAzFofPeYPjC0me1yUvT80JoRgi3Kmi35N0hJwa', N'Ndhlandhla', N'Ndhlandhla', N'Supervisor', 1, N'd93306e6-beac-4fd4-b9d2-e79a05f10200')
GO
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', N'Toner ', N'WCleansingFoam.jpeg', CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', N'Exfoliation Mask', NULL, CAST(109.25 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', N'Pigmentation Cream ', N'WCleansingFoam.jpeg', CAST(172.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'b104a143-5557-4f0b-9db9-29852f847960', N'Consultation Fee', N'WCleansingFoam.jpeg', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'dc57bdbb-f747-4b52-a926-432eb4cbb131', N'Cleansing Gel -Pink', N'WCleansingFoam.jpeg', CAST(172.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'dbeec944-5bc7-41d3-860c-49ab46e14133', N'Gluta Bright Cream ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'd54863a9-1f46-4d38-841a-52643b64a99d', N'Cleansing Foam -Green', N'WCleansingFoam.jpeg', CAST(109.25 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', N'Tissue Oil ', N'WCleansingFoam.jpeg', CAST(168.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'17dab944-257f-4e31-90db-63d1857b4b4e', N'Clear Soap.', N'WCleansingFoam.jpeg', CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'20ac1793-305d-480f-955f-782784127424', N'Body Butter ', N'WCleansingFoam.jpeg', CAST(160.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'6d8d974d-5bb5-485c-b24f-849acf32c070', N'Argon Oil Mixture', N'WCleansingFoam.jpeg', CAST(85.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'f9e46cd2-bba1-43f5-a961-916d4c914b17', N'Chemical Peel Home Kit-Treatment ', N'WCleansingFoam.jpeg', CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', N'Mild Peel Serum ', N'WCleansingFoam.jpeg', CAST(218.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', N'Black Soap ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'1d5666ae-0016-45f9-9db8-adce224838d9', N'Pigmentation Serum ', N'WCleansingFoam.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'e4191640-be34-49e9-8c99-c0ed9add604e', N'Pimple Cream ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', N'Pimple Serum ', N'WCleansingFoam.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', N'Hydrating Cream ', N'WCleansingFoam.jpeg', CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'5469b9d6-283a-454d-8af0-e9c5addd5d13', N'Gift Voucher ', N'WCleansingFoam.jpeg', CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'942701b3-522b-445d-aa0a-efff92f30b83', N'Hydrating Serum ', N'WCleansingFoam.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'be0d0d77-58f6-4f76-a576-f959dec02e4c', N'Sunscreen 30ml', N'WCleansingFoam.jpeg', CAST(52.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c6527c15-0b07-4e6b-9e92-003b2cb62582', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'713458d7-0817-4b6a-b42c-015b67a47119', N'd5a67bef-d02e-4017-9e27-0f35609b45da', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4e022445-21dc-40c0-8b3a-027d079c63f3', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'62985a25-12c8-4b3f-afab-03500bea3ada', N'a09b7154-2b78-483d-bb60-ace835186a56', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f03554ed-8239-4de8-8987-0423dd375e2c', N'a09b7154-2b78-483d-bb60-ace835186a56', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 2)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'741b4250-a418-4ba8-bf04-0521a54e98b2', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'66704b9e-c867-4e6d-9200-054a378f6076', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'da489fec-0332-487d-8788-059042a84c52', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd5f37389-7f59-4e74-a7ba-068ef0adb524', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'16887885-1422-4561-9cbb-076a8ef061d1', N'7d2bcf2a-25f3-451e-9c02-81bdc41730f9', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6015634e-564f-4c09-b22a-09a3361e1e98', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'96d7a0d4-17b0-444e-b981-0a04e973986b', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'63e93c36-d2f0-4305-a373-0a6eaf07a959', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'e4191640-be34-49e9-8c99-c0ed9add604e', 81)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'cf40a422-24bc-49b8-8640-0b24967957e4', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'cd429a16-b339-4060-88a2-0d20d6ab6f94', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'12c6d649-e2fa-4425-af73-0e18902860b3', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'df2e933a-68fc-438e-bf3c-10e011810261', N'bfc3b3de-0fa2-459e-a468-74af8ec7ae31', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f7d110a4-d7bc-48ec-a7e2-13b3bb112ced', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'28dd16a7-ca06-4c61-9c62-149da6214f12', N'a09b7154-2b78-483d-bb60-ace835186a56', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'2d8e6751-4a76-4018-ae0d-15117bb7f057', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'38d6762e-86fc-4371-b156-16257eb7cc46', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'736210cd-b497-4d86-b38f-165b7d1a595c', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a6d56cc6-2ba5-4a34-ada1-167831e70608', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'dd9e9b4a-26a7-4042-a352-172845136f34', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6bf91567-e207-436d-b634-178b331bfb76', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6cea9fbe-9ebb-4e03-aaf9-17da52f629df', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c5ba544c-61ea-4277-bb0c-194c7d4b9cbe', N'a09b7154-2b78-483d-bb60-ace835186a56', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a4801357-9827-4258-9e7a-195c3c19c712', N'31f14369-d047-47b8-9c88-3b882a7c5fa4', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ade8467f-6d7b-423e-877c-19a77e0b6bdc', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'278a6e0f-be50-4d2a-bd22-1a07bd5c13e8', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c82dc51c-8338-4c6d-8d0f-1a80c5672e4f', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'be552ecc-9c59-4f2c-876e-1bb33e00709c', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'05caab0d-a19f-4955-a81c-1e57069f3858', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3bbdf60a-e5ad-450a-939b-1e6bcb1b5c0f', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a2349774-d83f-4848-b92a-20210462308c', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1ead11d2-6cf5-4d94-868d-2359f84f0ecd', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5bbb953d-e0ac-4ae3-aec5-2399d400f8d1', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ac5197c1-c9f8-4660-b5ad-23b5d4472153', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'07d3958c-08c8-485c-8d5c-248b2150a741', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'166699a9-9142-46fc-a237-2512732891eb', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6c8f1263-9f9b-44ad-8271-2515545e88cf', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'52c0820b-e8f0-4a11-8a38-25937aab0417', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'866d63bc-1740-4127-bff4-25a66c033f28', N'8f8ba492-dff1-403a-80a2-5739870be3fa', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3763d44e-ec5d-42d0-9490-260ea75edf48', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6cf80fad-efc4-4dbd-a77b-2695724af9a2', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1b928229-be6b-440a-a1a0-292aacbaf72d', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 48)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6ce4ff1d-b865-48ea-ae6a-2b6e55619192', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a36fc837-da04-46ff-98ac-2d75d0c68dde', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ed6d9c50-aceb-49b8-b598-2e6b687d4a88', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0fd08efc-4659-4234-91c3-2feb40badd47', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'54ff00b5-ccd2-4d19-aa8b-3054687eb9c8', N'b47f1307-1d92-40c0-b3e1-66728cd004a2', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'2162c66e-9e75-4f0a-910a-3105677a9e79', N'a09b7154-2b78-483d-bb60-ace835186a56', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 5)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7cbd9b8b-116c-41c2-8db3-3199069ba98c', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'59b1136e-eb8c-470f-9933-31fff11360f0', N'1e77516b-63b3-410a-8798-f6b9d140ecd5', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3341fdef-8a87-4946-81ab-38af2f8a6c66', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c35c4c15-d157-4e5a-8a19-3baa64dc4695', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ed7e7e09-cbe5-406f-acd5-3bf69d0fcb13', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c0b1d163-08cc-4f9c-8625-3cab09011eee', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4292fcd1-4438-494d-ba49-3e362172cb09', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'877c993d-e461-44b8-ac42-412f27c6dfd3', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3d0123f2-7e9f-41f9-8a93-41fb25fe930e', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'369138a5-f9a3-4ca7-967a-4301fde797d6', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a6d11baa-5ef2-44eb-b418-435062cebbde', N'b47f1307-1d92-40c0-b3e1-66728cd004a2', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'dfd0c5db-35b2-4d3b-b973-43a2dd48e86a', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'd54863a9-1f46-4d38-841a-52643b64a99d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'24191863-53ee-49a2-bbf9-44cebc43db93', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bfe030cb-a9d8-4930-bb0f-45b7d211785d', N'5ff5ec1f-ae43-4112-8c9c-abd9f6e95c97', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6c52f531-5dab-484e-beb3-48db055cd4a4', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'48db9e1b-dc5c-42e6-b31f-4bdb394f4ced', N'a09b7154-2b78-483d-bb60-ace835186a56', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6d192572-87c1-4be7-acaa-4bf368387ebc', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a5e5dd47-780b-48cd-80e4-4c124dc0c7e5', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'927863bc-9453-4f73-a300-4cbcbd2388d2', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'31dcf225-ab5e-47db-ab25-4d9ab7b9a43a', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ae20e62f-f725-4ba9-9c69-4da956ea6c0c', N'a09b7154-2b78-483d-bb60-ace835186a56', N'e4191640-be34-49e9-8c99-c0ed9add604e', 2)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'89f5e5d2-dbc2-4c50-a40e-4dc12e9b9cc6', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bd9b246e-e30f-4940-8e16-50a201a68d23', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd4c1b0c3-cd50-4ce5-b2eb-5164c1fe71d4', N'a09b7154-2b78-483d-bb60-ace835186a56', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f27a46c6-46d8-44cf-bdbb-5220981886dd', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'e4191640-be34-49e9-8c99-c0ed9add604e', 81)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f0c2491f-c6d6-4581-913e-53b8061f6e85', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'feae55ea-a161-46f4-91cf-5894896c0072', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd463c8e5-d624-4d2c-b1e0-58a39170e2e2', N'7d2bcf2a-25f3-451e-9c02-81bdc41730f9', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ab025ad7-841d-4e33-aed5-59d90eaa1236', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7e753636-4da6-4b1a-8fbc-5a1ce04bac3a', N'ff3b299f-03f1-4d4b-b94d-25e91829e774', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a6d4dace-0807-48b1-960e-5bff14a2d715', N'df607d78-ed19-4b09-b922-544e59684eed', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0fef703a-5ce1-4e74-83f9-5c4726d9f082', N'bfc3b3de-0fa2-459e-a468-74af8ec7ae31', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4c234383-702c-41e1-a8e4-5eb508774fdd', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bc0f34b2-18b4-4887-a108-5fc1d695c9a6', N'ccf49d0e-256c-4a5b-9131-791204fb702d', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ad66816a-cbfa-4cc1-a055-6191933deb8c', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c82588aa-6830-4fc8-ac70-6245f03a1ef3', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c1c82599-d0db-4ea2-b2a2-626906717842', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'35a2fade-25f6-4eb8-bc21-6317352ee527', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f59ee76c-c941-4c7e-92c9-63d349b6aee4', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ef31e62a-8caf-41ed-8e1e-643d247a521a', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'35786eaa-7d72-4f11-b7cd-6441e14d10ca', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'93fdd016-a56b-4c68-98e5-662a600d1d30', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0cc05b0c-581c-4e90-b808-67619976d20b', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f6de52b5-e34c-48d2-884d-68112deffe3f', N'a09b7154-2b78-483d-bb60-ace835186a56', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'9dd1b1a2-be12-49f9-a4d7-68c7d2f1ff34', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b597e20f-897b-4e62-b386-690078f12ee5', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'78539ac2-b927-42a6-ad34-6b98e00f4c65', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5f8df3f6-27a2-4f34-a1cf-6c784e9900cf', N'a09b7154-2b78-483d-bb60-ace835186a56', N'20ac1793-305d-480f-955f-782784127424', 0)
GO
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'98c9ea09-8944-405d-9d55-6cb4f17c5d98', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'21387f62-b762-4713-a81a-6dd35b8d6632', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'83aea5f9-172b-4ec9-a555-6fd451591200', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'94f74d7a-54e0-417a-90b6-71a2d3d39fe6', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'85a4e6f8-8edb-4640-b02d-76fd25f03bda', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3433b657-c236-4d59-ae97-788815dd9a49', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'8c875e8f-0807-4da3-a49f-78bc2774f322', N'a09b7154-2b78-483d-bb60-ace835186a56', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd718e382-acdc-4672-b903-7b9557f738d8', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'aea3752a-5a79-43f5-b13f-7bbaef397214', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4a0a22c3-4824-4056-8397-7bdd8cf0af87', N'a09b7154-2b78-483d-bb60-ace835186a56', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1cf9a217-ff1e-4914-91ea-7c86b7a1a681', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'336c0e92-332b-4df4-bfab-7cced3869489', N'82b2b7cd-b14d-40c2-8145-88d7c747fb59', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b33bca03-43c2-4267-8fe0-7d3d5afcad26', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'248f959f-e3d0-430e-8cec-7f391a066d5a', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'77e6e2a2-ed5c-4769-b454-7fdacf7b5fda', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'132a4e8e-dd73-4562-954e-80d3329aadea', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4870cbfc-c596-4dbf-bb69-8296e281f0c6', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'979aa009-af0e-436d-9fd8-83a17023e675', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5f408492-16bb-4eaa-9ca5-85d4684b2446', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bc649d48-5fb2-4eb6-9f24-86da256352be', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bfe879c5-2974-4c3e-84d9-8a84ae23cc33', N'fb7dbd0c-6870-4a15-8f96-50cf2d8570b5', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7c6434d7-28af-475c-9a6e-8aa4271d7ae0', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'396e86b4-2f28-4090-b028-8af62b58deff', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7a0b1119-76e4-40a9-adc1-8f94b6bc815b', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'da7c3144-f768-4f4d-9176-9147bf0706cf', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7cf17569-b148-45f6-80a7-9239f9f78385', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7f1a0c40-68c5-4b4e-8cb4-9324a3928182', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4a0def8f-995f-4377-ae83-93ce857dc106', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ad0f6a54-0545-481f-b790-93fec86a612c', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'2844e3e9-5978-440f-a6a3-94128c83d03d', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'535e487e-2602-4390-94d9-96d9f49dc852', N'5d289641-6f75-4b43-b348-93c2ee18c194', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'564bc410-a753-44f7-99aa-981353f8b02a', N'a09b7154-2b78-483d-bb60-ace835186a56', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f9974433-1048-4aba-97d9-98846dbc281c', N'c7f31262-616e-41b7-834f-2c88611d5ba4', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c29d247c-34cf-423b-ba5d-99197d2f9018', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 5)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6e5a17d3-e1ed-490b-bbc7-9bbdb4a70de2', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1f0cc673-6a26-4db4-9ea1-9f580fd829eb', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 48)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'41a96bd6-b126-4f7a-a468-a0154ee681b8', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'dca35cf6-f59f-4e01-988a-a0c5211b42bf', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'641df3d7-1229-460d-b0cd-a1ea41f89fba', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'dad6e72d-dfaf-496d-800c-a1fa922121cd', N'a09b7154-2b78-483d-bb60-ace835186a56', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ab79424a-4d5c-4602-97e7-a5a000a4c8a5', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'2c66aba6-a983-46a7-8dc5-a5e5fe81d9c9', N'ff3b299f-03f1-4d4b-b94d-25e91829e774', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a00620e3-083d-4ed4-a18a-a6672747af8b', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'736c1fc6-075f-4127-9c42-a7d4176f6c36', N'e62956cf-7ce5-4253-a2f9-ac334d848c41', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'95868bca-d220-4953-b5f1-a7e4efb3dba9', N'a09b7154-2b78-483d-bb60-ace835186a56', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f60dfbb1-2d0c-4a7d-9b38-a8418b727464', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'23d8a6f7-c64f-44ae-91a8-a9a7776e0e9d', N'c7f31262-616e-41b7-834f-2c88611d5ba4', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'16f31813-6451-4381-961a-aa6cdd68ecab', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'957d64c7-c9af-4795-9336-aad4ede59dcc', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6b9cd74a-88fd-4986-8052-ab3c2a0a65f3', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7e4a6e21-df9e-47ad-9711-ad6e39200a0b', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'be74e411-3b78-4ba7-a3b4-ada2e1e54a38', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f1173275-b0ba-4802-a876-aeea212c37f4', N'df607d78-ed19-4b09-b922-544e59684eed', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'43fed631-39ae-47ad-9142-b09061358c07', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b767f4bc-ab57-4408-8544-b3c4baff8550', N'571ce91c-f05e-4879-ba51-70d55aaf8c78', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5ba6b0a8-a4da-4b96-9adb-b47ae23b7bea', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'578ab2e7-6f6c-41ea-a2b4-b523d7f46c6f', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c1af0e3c-8c0e-4ac2-adf3-b57a6237a8a1', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ddcc820e-1e27-4577-9f51-b69fde2fbff5', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'41778432-663d-431c-9f67-b761e1af3c83', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'8cba401d-918d-416a-9a6c-b790fa421280', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 5)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'98473cdd-d363-4628-8b56-ba007454b5e6', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b3fe94c6-4827-4a31-a438-bbb7c9433044', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'61974950-6789-4d56-a40e-bc78c14f5740', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a8cc8091-2627-42c4-83d7-bd523b724db9', N'5ff5ec1f-ae43-4112-8c9c-abd9f6e95c97', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4f93d498-b912-484a-9bf8-bdd1fbc95c06', N'fb7dbd0c-6870-4a15-8f96-50cf2d8570b5', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'83a82e9e-52ae-4edc-8e66-be77016fc946', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'aa5c306e-583a-444f-a580-bed3a4ccc301', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'03254fa8-363e-49c2-825b-c0879077d81f', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5f7c9ceb-52e4-4f73-841b-c0905f8fcc1e', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'110f2787-c413-4309-9a06-c32d33fd00e5', N'82b2b7cd-b14d-40c2-8145-88d7c747fb59', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'48281b94-20de-4c3d-bd2d-c653fc9380de', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd94d5f1d-6b75-4096-943c-c668b5105441', N'5d289641-6f75-4b43-b348-93c2ee18c194', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'f6fe26c6-f354-43ef-be4a-c8920a8dbfb6', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'dc564b87-4548-4635-b729-c915f337a9fb', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'646f8cc5-0781-4a6a-93de-c9649a85987c', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'31ed9c8b-bc2a-47f3-a3d3-ca09cdcf29ca', N'd5a67bef-d02e-4017-9e27-0f35609b45da', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'53bd246a-bf4f-4666-aade-cb27a5d9fe08', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'87a4e8d8-fcbb-43fc-84ac-cc9c1d4db6c8', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ff821e6a-5d60-4758-b608-ccff7170b047', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bbfa5428-5800-4812-a244-cd7f6754dda6', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'47818fb5-9348-469a-8453-ce08519b5f8e', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5b62e886-a8fc-4def-ae22-cee1ccb70ef2', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'42321597-c3a5-40e9-9464-cf243ffd78a4', N'31f14369-d047-47b8-9c88-3b882a7c5fa4', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'9727458c-8ae3-493d-974c-d06a7eb20908', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'cda4fc18-e29f-4700-b429-d0f8109a8a56', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'627037ac-01b1-4d6d-ae14-d2d407259887', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'92322516-eb69-48e3-bf1e-d5a7b32d9ed7', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1efbb3b8-9d1c-44d3-aa8e-d7da75ecb1a3', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'90c1f797-ff5e-46aa-bac0-d88e500cc510', N'a09b7154-2b78-483d-bb60-ace835186a56', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a0b194f8-b12a-4b52-8423-db059b341496', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'966766a1-e9e7-4045-90b6-dcf67fa8dc3f', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ef816964-4d76-4af7-a9a7-df24577f5d19', N'ccf49d0e-256c-4a5b-9131-791204fb702d', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'71f758e0-d820-4bd5-af59-e250efc79e92', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'2fc16cbe-0acc-47a9-8900-e2bd6fb47e8b', N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'70682b7f-66d8-4428-9b60-e3cc729884d3', N'1e77516b-63b3-410a-8798-f6b9d140ecd5', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'63d67423-b294-45a6-8e08-e3f79dd4ff3d', N'd0e29a99-1deb-4726-96de-fabe4fbca02b', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ee544396-95cc-47e3-8f7b-e4237b81b114', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a28f79ab-a1db-493c-b1a2-e53a6b486c09', N'571ce91c-f05e-4879-ba51-70d55aaf8c78', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'407e7586-f163-4720-8650-e55842594e0d', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
GO
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b8887409-e502-4b35-8acc-e679bcdadb08', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a3f881ea-3200-4b07-84c0-e6c4a5d23b9e', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5600c02d-8d8a-428d-a866-e7d5f1ab02eb', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'fd7573f3-8983-4c6c-8a87-e92d2b775d3a', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'22ecd2bb-31f8-4a2b-9a9c-ea0915c95444', N'2269bf8e-612c-444d-964a-5c0ec930a332', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e7bd05d8-e3ac-41e7-a7cd-ebdbc299b86f', N'd0e29a99-1deb-4726-96de-fabe4fbca02b', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 29)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5c885b96-bda5-445d-bec1-ed661b752bdd', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'773df5db-c2a8-432d-b9af-ee3cfd063122', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 46)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'34968e8e-5a9e-425f-a731-ef909c9cc4e0', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 35)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1056a0cb-43f2-4756-8d2f-efbef2a6a25d', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'be69d0f9-cf45-450a-b64a-efe9b5f67149', N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'eba41c42-cdda-400a-8b1a-f03dbe225d78', N'150193ad-2caa-4a92-995e-b2f6ec568f97', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b2200fad-9c77-409d-a929-f28fa30fcdd7', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6e4ab849-b6b1-46ed-982a-f2ce2a0a5ee2', N'a09b7154-2b78-483d-bb60-ace835186a56', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0eead2e8-70c3-4120-b458-f40e89f216b8', N'a09b7154-2b78-483d-bb60-ace835186a56', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ebeba3e6-35bb-4588-9aa9-f53b5a5588ba', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ab3ae38d-de7a-4a03-b456-f565fe2480fc', N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', N'e4191640-be34-49e9-8c99-c0ed9add604e', 141)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'9c38545e-4add-459f-9371-f57a73d8788e', N'a09b7154-2b78-483d-bb60-ace835186a56', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'8adb35b7-3777-4b20-a0f5-f621b0daeb9c', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'56ebf200-d2a4-4dd4-9af6-f684073bec9b', N'f03974e5-6736-489a-8b88-4be6ecbaffad', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c703be69-bb86-4954-9e80-f7ed423fdae3', N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', N'1d5666ae-0016-45f9-9db8-adce224838d9', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e8148cca-c94f-434a-ae8e-f8dabe704ff5', N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'7e5968d6-15e3-4823-b78d-fb8b30df5188', N'83988d51-b4af-4542-ba10-d1046b4abe2a', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd0947315-3ebc-4a2b-8988-fbf5fc057d19', N'624e0541-8651-4760-b26a-47ad8b8647ee', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
GO
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'90ac59e7-c065-42b2-9cfe-0111848cf08f', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'3c25cfb4-6135-43a7-a142-5929306b8eb0', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'fd08f548-1aeb-48cb-93c5-0bc2cfb06ec5', CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, N'40d0e9b8-d4d3-413c-90e1-96c1ea21074d', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'd5a67bef-d02e-4017-9e27-0f35609b45da', CAST(N'2022-06-28T09:07:33.007' AS DateTime), CAST(N'2022-06-28T09:09:40.170' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'dcf8aad7-aa67-4ac3-bdcd-1d26dabe9f54', CAST(N'2022-06-28T08:45:56.807' AS DateTime), CAST(N'2022-06-28T08:46:39.380' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'501e24d1-9d6e-41c6-8d69-2458957db404', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'4182b035-80fe-41c3-bc4a-e7b2b019dd0d', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'ff3b299f-03f1-4d4b-b94d-25e91829e774', CAST(N'2022-06-28T09:06:19.227' AS DateTime), CAST(N'2022-06-28T09:07:33.007' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'562a6fe2-fe08-4294-89e7-2c34152f9aa9', CAST(N'2022-06-28T08:43:10.783' AS DateTime), CAST(N'2022-06-28T08:44:17.647' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'c7f31262-616e-41b7-834f-2c88611d5ba4', CAST(N'2022-06-28T09:15:01.583' AS DateTime), NULL, N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'31f14369-d047-47b8-9c88-3b882a7c5fa4', CAST(N'2022-06-28T09:05:17.630' AS DateTime), CAST(N'2022-06-28T09:05:26.873' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'624e0541-8651-4760-b26a-47ad8b8647ee', CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2022-06-25T17:46:05.527' AS DateTime), N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'7f6843c2-3281-4273-bd69-206bb409a059')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'f03974e5-6736-489a-8b88-4be6ecbaffad', CAST(N'2022-06-28T08:46:39.383' AS DateTime), CAST(N'2022-06-28T08:49:38.407' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'fb7dbd0c-6870-4a15-8f96-50cf2d8570b5', CAST(N'2022-06-28T09:05:26.873' AS DateTime), CAST(N'2022-06-28T09:06:19.227' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'df607d78-ed19-4b09-b922-544e59684eed', CAST(N'2022-06-28T08:53:39.980' AS DateTime), CAST(N'2022-06-28T08:54:55.783' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'6597428a-46ed-4457-8bf6-5546af6d132c', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'812eda8d-f1df-4462-ac02-3ce048375d07', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'8f8ba492-dff1-403a-80a2-5739870be3fa', CAST(N'2022-06-25T17:46:05.530' AS DateTime), NULL, N'd93306e6-beac-4fd4-b9d2-e79a05f10200', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'2269bf8e-612c-444d-964a-5c0ec930a332', CAST(N'2022-06-28T08:44:32.487' AS DateTime), CAST(N'2022-06-28T08:45:56.807' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'b47f1307-1d92-40c0-b3e1-66728cd004a2', CAST(N'2022-06-28T09:04:20.957' AS DateTime), CAST(N'2022-06-28T09:04:33.880' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'571ce91c-f05e-4879-ba51-70d55aaf8c78', CAST(N'2022-06-28T09:09:40.170' AS DateTime), CAST(N'2022-06-28T09:15:01.583' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'bfc3b3de-0fa2-459e-a468-74af8ec7ae31', CAST(N'2022-06-28T08:52:03.573' AS DateTime), CAST(N'2022-06-28T08:52:37.523' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'ccf49d0e-256c-4a5b-9131-791204fb702d', CAST(N'2022-06-28T08:49:38.407' AS DateTime), CAST(N'2022-06-28T08:52:03.573' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'7d2bcf2a-25f3-451e-9c02-81bdc41730f9', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'67b87e50-5a12-4771-8527-9f2e5f7f7640', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'82b2b7cd-b14d-40c2-8145-88d7c747fb59', CAST(N'2022-06-28T08:56:06.063' AS DateTime), CAST(N'2022-06-28T09:04:20.953' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'ea189502-46fb-4f60-80f4-8de45868944f', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'03238c20-5083-4f01-aab0-459f59cbd82c', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'5d289641-6f75-4b43-b348-93c2ee18c194', CAST(N'2022-06-28T09:04:33.880' AS DateTime), CAST(N'2022-06-28T09:05:17.630' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0', CAST(N'2022-06-25T18:13:07.403' AS DateTime), CAST(N'2022-06-28T08:41:33.087' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'5ff5ec1f-ae43-4112-8c9c-abd9f6e95c97', CAST(N'2022-06-28T08:54:55.783' AS DateTime), CAST(N'2022-06-28T08:56:06.063' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'e62956cf-7ce5-4253-a2f9-ac334d848c41', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'd996ac8a-b383-46d0-b7b4-1edd8453f082', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'a09b7154-2b78-483d-bb60-ace835186a56', CAST(N'2022-06-09T00:00:00.000' AS DateTime), CAST(N'2022-06-25T17:59:25.497' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'150193ad-2caa-4a92-995e-b2f6ec568f97', CAST(N'2022-06-25T17:59:25.497' AS DateTime), CAST(N'2022-06-25T18:13:07.390' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'1a3d3327-c636-4e0c-b36b-cd72d6f5e81e', CAST(N'2022-06-28T08:41:33.087' AS DateTime), CAST(N'2022-06-28T08:43:10.783' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'83988d51-b4af-4542-ba10-d1046b4abe2a', CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, N'22589cbe-a810-4e04-a2c8-8f9480143b2e', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'1bf1714b-ea7b-4e71-b21b-d9f6b5a54eb1', CAST(N'2022-06-28T08:44:17.647' AS DateTime), CAST(N'2022-06-28T08:44:32.487' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'1e77516b-63b3-410a-8798-f6b9d140ecd5', CAST(N'2022-06-28T08:53:28.417' AS DateTime), CAST(N'2022-06-28T08:53:39.980' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'd0e29a99-1deb-4726-96de-fabe4fbca02b', CAST(N'2022-06-28T08:52:37.523' AS DateTime), CAST(N'2022-06-28T08:53:28.417' AS DateTime), N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'bf34a6eb-8313-4eda-a171-2af9fcde832d')
GO
INSERT [dbo].[InventoryPath] ([Id], [ImagePath], [Type]) VALUES (N'0dad1547-229f-4174-b77e-742b6d07b429', N'https://localhost:44385/api/FileEnvironment/getfile/', N'ImageUrl')
GO
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'ce664d5d-2b86-402d-9690-00aabbb13246', CAST(N'2022-06-25T16:37:26.423' AS DateTime), N'Debit', N'Inventory', N'Customer', N'e4191640-be34-49e9-8c99-c0ed9add604e', -1, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'26ce7f72-122a-4524-9bf2-cc6e72f120e8', 0, NULL, N'CUST20220625163726_096a2', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'0c84d04e-5dca-41da-b882-029d65dc816e', CAST(N'2022-06-24T20:00:14.230' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', -50, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'1300018c-0225-4161-b1b6-04ae3987ff0f', CAST(N'2022-06-24T22:40:43.447' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 10, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'dd1526e0-2c54-417b-8fa8-07a6ce8078a2', CAST(N'2022-06-27T16:20:36.787' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 30, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'ad566bde-5f67-470b-9a28-1a50f946e983', CAST(N'2022-06-24T22:40:43.407' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', -10, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'70d5f680-1b21-4ed1-811f-31bfc4fbb78d', CAST(N'2022-06-27T16:20:36.770' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', -60, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'f9efc809-9709-43ca-aadf-3c1fb9fa9e66', CAST(N'2022-06-24T22:46:04.263' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 20, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'47692bfb-7fb2-45c4-9728-48a6bcb17125', CAST(N'2022-06-24T20:00:14.203' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', -80, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2caaf33f-1a54-46a1-8dce-4e204589db30', CAST(N'2022-06-24T20:00:14.187' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 10, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'6f37021c-407c-4671-b564-5820d0e0ae2d', CAST(N'2022-06-27T16:21:48.460' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', -60, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'e4dbd2a7-b236-4d2d-8a0a-5a934920a1fe', CAST(N'2022-06-25T16:37:26.500' AS DateTime), N'Credit', N'Inventory', N'Customer', N'e4191640-be34-49e9-8c99-c0ed9add604e', 1, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'26ce7f72-122a-4524-9bf2-cc6e72f120e8', 0, NULL, N'CUST20220625163726_096a2', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2eb727f5-4862-4a48-a27e-6813b7308fe3', CAST(N'2022-06-25T18:44:59.593' AS DateTime), N'Credit', N'Inventory', N'Customer', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 2, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'd5479374-8b04-4133-aa55-4cbc32cea655', 0, NULL, N'CUST20220625184459_ac9a9', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'c709c257-8b3c-436c-b4e7-6b43507d6c4c', CAST(N'2022-06-24T20:00:14.027' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', -20, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'be4b0b46-8ed5-44f0-af19-73ad1ff47aeb', CAST(N'2022-06-24T22:45:17.847' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'e4191640-be34-49e9-8c99-c0ed9add604e', 80, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'0af17825-8dc2-45aa-b1e5-89cc65229661', CAST(N'2022-06-27T16:20:36.773' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', 60, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'4b279850-ed4e-4297-bc5b-8bc2c6946b74', CAST(N'2022-06-24T20:00:14.277' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 50, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'253ea01e-eee1-4f3e-8f65-8e800fbd53f0', CAST(N'2022-06-28T09:46:05.833' AS DateTime), N'Credit', N'Inventory', N'Production', N'd54863a9-1f46-4d38-841a-52643b64a99d', 20, 0, NULL, N'Unverified', N'4e9cbb6a-347a-487f-94b9-1e9a2522ace4', N'22589cbe-a810-4e04-a2c8-8f9480143b2e', N'22589cbe-a810-4e04-a2c8-8f9480143b2e', NULL, 0, NULL, N'PROD20220628094605_0de6a', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'b0ba2dac-e496-466e-9054-8f9aaa801577', CAST(N'2022-06-25T16:39:43.613' AS DateTime), N'Debit', N'Inventory', N'Customer', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', -3, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'9fceee56-0fb4-4d6c-8b22-b4c548895e74', 0, NULL, N'CUST20220625163943_1e759', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'6d8c54f7-f1ea-4373-9617-91acf9ea7dea', CAST(N'2022-06-24T22:46:04.253' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', -20, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'82276324-ba17-4887-92aa-94f2587cc614', CAST(N'2022-06-25T18:44:59.583' AS DateTime), N'Debit', N'Inventory', N'Customer', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', -2, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'd5479374-8b04-4133-aa55-4cbc32cea655', 0, NULL, N'CUST20220625184459_ac9a9', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'fb4e25b2-020a-479f-a8ca-9890c64bc7e1', CAST(N'2022-06-27T16:21:48.463' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'e4191640-be34-49e9-8c99-c0ed9add604e', 60, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'78635bdf-bfcb-4a44-b576-ab2bb5e6264c', CAST(N'2022-06-25T16:37:26.513' AS DateTime), N'Credit', N'Inventory', N'Customer', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 2, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'a8ad5395-6b2c-4b34-85d2-c33da0ae8461', 0, NULL, N'CUST20220625163726_096a2', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'3072a976-9aa2-45d9-84b2-ad6275a83fb6', CAST(N'2022-06-24T20:00:14.210' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', 80, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'452f87b5-2822-4248-88cd-b72cd69b9cd2', CAST(N'2022-06-24T20:00:14.143' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 20, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'891403a8-1c00-4090-a638-bb3054a11319', CAST(N'2022-06-24T22:45:17.843' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'e4191640-be34-49e9-8c99-c0ed9add604e', -80, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'17a8dd71-ecae-4f81-9a2d-c43410b6f39a', CAST(N'2022-06-25T16:37:26.510' AS DateTime), N'Debit', N'Inventory', N'Customer', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', -2, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'a8ad5395-6b2c-4b34-85d2-c33da0ae8461', 0, NULL, N'CUST20220625163726_096a2', N'a09b7154-2b78-483d-bb60-ace835186a56')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'edad4a33-7f86-483a-88ae-c76367fe193d', CAST(N'2022-06-27T16:20:36.757' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 80, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'20f77833-42c5-4b06-9c4b-c8c3c76b7632', CAST(N'2022-06-24T22:40:43.480' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', -50, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'f935c05f-6fed-47ec-b712-c8fc8509c33c', CAST(N'2022-06-28T09:42:55.580' AS DateTime), N'Credit', N'Inventory', N'Production', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 2, 0, NULL, N'Unverified', N'4e9cbb6a-347a-487f-94b9-1e9a2522ace4', N'22589cbe-a810-4e04-a2c8-8f9480143b2e', N'22589cbe-a810-4e04-a2c8-8f9480143b2e', NULL, 0, NULL, N'PROD20220628094255_7547c', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'81072f1f-813f-4271-83ee-d8759b5e5c18', CAST(N'2022-06-24T20:00:14.183' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', -10, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'7547bb6a-2971-44e8-b45d-d915b2726007', CAST(N'2022-06-27T16:20:36.783' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', -30, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'9d4e64c0-4767-4187-90eb-de8abaef60aa', CAST(N'2022-06-27T16:21:48.420' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', -30, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'4482ef96-af04-49c3-8dc9-e20e1a397848', CAST(N'2022-06-25T16:39:43.623' AS DateTime), N'Credit', N'Inventory', N'Customer', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 3, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'370b8eba-7151-4f6e-a0db-eed976687f85', N'9fceee56-0fb4-4d6c-8b22-b4c548895e74', 0, NULL, N'CUST20220625163943_1e759', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'a1e03110-5bef-4702-adc7-e343da7b43a7', CAST(N'2022-06-27T16:20:36.680' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -80, 0, NULL, N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'18bd7db4-d588-4150-ab97-f3d8c56ab0df', CAST(N'2022-06-27T16:21:48.430' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 30, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220627162036_a4ffe', N'cf30ec1e-8298-4813-ac64-a0f6ed8893f0')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'484c721e-de69-4455-8887-f6a1b1886450', CAST(N'2022-06-24T22:40:43.483' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 50, 1, N'bf34a6eb-8313-4eda-a171-2af9fcde832d', N'Verified', N'7f6843c2-3281-4273-bd69-206bb409a059', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL, 0, NULL, N'AEON_20220624200013_8d396', N'a09b7154-2b78-483d-bb60-ace835186a56')
GO
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'd8d32dc9-1a58-4ee7-8410-13a8e44d9807', CAST(N'2022-06-25T16:39:43.607' AS DateTime), N'902f586d-6100-4fc1-94b0-82096a77e547', N'AEON_20220625163943_5776f')
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'660d1076-cd60-4248-b09d-9c84654ff3bc', CAST(N'2022-06-25T16:37:26.360' AS DateTime), N'98c8187d-83cf-475b-b331-98c6de6cd2c0', N'AEON_20220625163726_d526b')
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'f351a166-e558-42ed-821e-c2005fb129e6', CAST(N'2022-06-25T18:44:59.573' AS DateTime), N'6c458b69-a1b3-418e-8b67-8f57da647948', N'AEON_20220625184459_a1ebc')
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'd5479374-8b04-4133-aa55-4cbc32cea655', N'f351a166-e558-42ed-821e-c2005fb129e6')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'9fceee56-0fb4-4d6c-8b22-b4c548895e74', N'd8d32dc9-1a58-4ee7-8410-13a8e44d9807')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'a8ad5395-6b2c-4b34-85d2-c33da0ae8461', N'660d1076-cd60-4248-b09d-9c84654ff3bc')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'26ce7f72-122a-4524-9bf2-cc6e72f120e8', N'660d1076-cd60-4248-b09d-9c84654ff3bc')
GO
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'Silverton-SilverMall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'd996ac8a-b383-46d0-b7b4-1edd8453f082', N'Quagga Center ', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'be45b0bf-3eeb-42ec-bec2-2030ef180738', N'Production', NULL, NULL, N'Production')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'd36935f1-b74a-4590-8a01-3225cbca0012', N'Administration', NULL, NULL, N'Administrator')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'812eda8d-f1df-4462-ac02-3ce048375d07', N'Tshwane Regional Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'03238c20-5083-4f01-aab0-459f59cbd82c', N'Distributor - Praise ', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'3c25cfb4-6135-43a7-a142-5929306b8eb0', N'Bloed Street Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'4c4add40-ce7f-4050-8d3a-72bce70537da', N'Support Vendor', NULL, NULL, N'Administrator')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'22589cbe-a810-4e04-a2c8-8f9480143b2e', N'TestProductionFinal', NULL, N'082505', N'Production')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'40d0e9b8-d4d3-413c-90e1-96c1ea21074d', N'TestProd', NULL, N'01245605', N'Production')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'67b87e50-5a12-4771-8527-9f2e5f7f7640', N'Mams Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'd93306e6-beac-4fd4-b9d2-e79a05f10200', N'Warehouse', N'012', NULL, N'Warehouse')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'4182b035-80fe-41c3-bc4a-e7b2b019dd0d', N'Mams Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'370b8eba-7151-4f6e-a0db-eed976687f85', N'Customer', NULL, NULL, N'Customer')
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ExpectedInventory] ADD  CONSTRAINT [DF_ExpectedInventory_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Inv_User] ADD  CONSTRAINT [DF_Inv_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF_Product_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryCertificate] ADD  CONSTRAINT [DF_InventoryCertificate_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryPath] ADD  CONSTRAINT [DF_InventoryPath_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryPrice] ADD  CONSTRAINT [DF_ProductPrice_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryTransaction] ADD  CONSTRAINT [DF_InventoryTransaction_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[OrderItem] ADD  CONSTRAINT [DF_OrderItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_Inv_Branch_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[VendorLocation] ADD  CONSTRAINT [DF_Inv_BranchLocation_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ExpectedInventory]  WITH CHECK ADD  CONSTRAINT [FK314FFF2E3E72] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[ExpectedInventory] CHECK CONSTRAINT [FK314FFF2E3E72]
GO
ALTER TABLE [dbo].[ExpectedInventory]  WITH CHECK ADD  CONSTRAINT [FK5B204EAE0861] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Inv_User] ([Id])
GO
ALTER TABLE [dbo].[ExpectedInventory] CHECK CONSTRAINT [FK5B204EAE0861]
GO
ALTER TABLE [dbo].[ExpectedInventory]  WITH CHECK ADD  CONSTRAINT [FKF6F631167DAF] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[ExpectedInventory] CHECK CONSTRAINT [FKF6F631167DAF]
GO
ALTER TABLE [dbo].[Inv_User]  WITH CHECK ADD  CONSTRAINT [FK7E3F2A22FDB6] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Inv_User] CHECK CONSTRAINT [FK7E3F2A22FDB6]
GO
ALTER TABLE [dbo].[InventoryBalance]  WITH CHECK ADD  CONSTRAINT [FK1D4148B85532] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[InventoryBalance] CHECK CONSTRAINT [FK1D4148B85532]
GO
ALTER TABLE [dbo].[InventoryBalance]  WITH CHECK ADD  CONSTRAINT [FK1D4148B85603] FOREIGN KEY([InventoryCertificateId])
REFERENCES [dbo].[InventoryCertificate] ([Id])
GO
ALTER TABLE [dbo].[InventoryBalance] CHECK CONSTRAINT [FK1D4148B85603]
GO
ALTER TABLE [dbo].[InventoryCertificate]  WITH CHECK ADD  CONSTRAINT [FK685E3D6C292F] FOREIGN KEY([GeneratedById])
REFERENCES [dbo].[Inv_User] ([Id])
GO
ALTER TABLE [dbo].[InventoryCertificate] CHECK CONSTRAINT [FK685E3D6C292F]
GO
ALTER TABLE [dbo].[InventoryCertificate]  WITH CHECK ADD  CONSTRAINT [FK8F9121FE7895] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[InventoryCertificate] CHECK CONSTRAINT [FK8F9121FE7895]
GO
ALTER TABLE [dbo].[InventoryPrice]  WITH CHECK ADD  CONSTRAINT [FK508459716FB7] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[InventoryPrice] CHECK CONSTRAINT [FK508459716FB7]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK23DD5DCF720C] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[Inv_User] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK23DD5DCF720C]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK2B331FAE7247] FOREIGN KEY([AcceptedByUserId])
REFERENCES [dbo].[Inv_User] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK2B331FAE7247]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK3E687D15B926] FOREIGN KEY([LocationVendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK3E687D15B926]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FKC014006B47B9] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItem] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FKC014006B47B9]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FKCEBE55EB5C07] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FKCEBE55EB5C07]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FKD5E9738761F0] FOREIGN KEY([DestinationVendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FKD5E9738761F0]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FKF6AC1C741DCA] FOREIGN KEY([ProcessById])
REFERENCES [dbo].[Inv_User] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FKF6AC1C741DCA]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKD87954795F60] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKD87954795F60]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK69F84379E4AE] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK69F84379E4AE]
GO
ALTER TABLE [dbo].[VendorLocation]  WITH CHECK ADD  CONSTRAINT [FKDB33CBFDAB18] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorLocation] CHECK CONSTRAINT [FKDB33CBFDAB18]
GO
/****** Object:  StoredProcedure [dbo].[get_VendorInvoice]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[get_VendorInvoice]

@InvoiceNumber varchar(50)

AS
BEGIN

	SET NOCOUNT ON;

    SELECT InvT.TrackingNumber AS InvoiceNumber, FORMAT(InvT.DateInserted,'yyyy/MM/dd') AS TransactionDate, d.Name AS VendorName,
			inv.ProductName,inv.Price, InvT.Quantity, (inv.Price * InvT.Quantity) AS Amount, (u.Firstname + ' ' + u.Surname) AS ProcessedBy
			FROM InventoryTransaction InvT WITH(NOLOCK) INNER JOIN
				Inventory inv WITH(NOLOCK) ON (inv.Id = InvT.InventoryId) INNER JOIN
				Vendor d WITH(NOLOCK) ON (d.Id = InvT.DestinationVendorId) INNER JOIN
				Inv_User u WITH(NOLOCK) ON (u.Id = InvT.ProcessById)
				WHERE InvT.EntryType = 'Credit' AND
						InvT.TransactionType = 'Inventory' AND
						InvT.TrackingStatus = 'Intransit' AND 
						InvT.LocationVendorId <> InvT.DestinationVendorId AND
						InvT.VerifiedStatus = 'Verified' AND
						InvT.Deleted = 0 AND
						InvT.DeletedById IS NULL AND
						InvT.TrackingNumber = @InvoiceNumber --'AEON_20220615103540_099cf'

END
GO
/****** Object:  StoredProcedure [dbo].[get_VendorInvoiceByVendorId]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_VendorInvoiceByVendorId]

@VendorId uniqueidentifier,
@StartDate datetime,
@EndDate datetime

AS
BEGIN

	SET NOCOUNT ON;

    SELECT DISTINCT InvT.TrackingNumber AS InvoiceNumber, FORMAT(InvT.DateInserted,'yyyy/MM/dd') AS TransactionDate, d.Name AS VendorName,
			(u.Firstname + ' ' + u.Surname) AS ProcessedBy
			FROM InventoryTransaction InvT WITH(NOLOCK) INNER JOIN
				Inventory inv WITH(NOLOCK) ON (inv.Id = InvT.InventoryId) INNER JOIN
				Vendor d WITH(NOLOCK) ON (d.Id = InvT.DestinationVendorId) INNER JOIN
				Inv_User u WITH(NOLOCK) ON (u.Id = InvT.ProcessById)
				WHERE InvT.EntryType = 'Credit' AND
						InvT.TransactionType = 'Inventory' AND
						InvT.TrackingStatus = 'Intransit' AND 
						InvT.LocationVendorId <> InvT.DestinationVendorId AND
						InvT.VerifiedStatus = 'Verified' AND
						InvT.Deleted = 0 AND
						InvT.DeletedById IS NULL AND
						InvT.DestinationVendorId = @VendorId AND
						FORMAT(InvT.DateInserted,'yyyy/MM/dd') >= FORMAT(@StartDate,'yyyy/MM/dd') AND
						FORMAT(InvT.DateInserted,'yyyy/MM/dd') <= FORMAT(@EndDate,'yyyy/MM/dd') 
			

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CurrentStockTakingByVendorId]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CurrentStockTakingByVendorId] 	
	@LocationVendorId uniqueidentifier
AS
BEGIN

	DECLARE @totalRecords INT
	DECLARE @countIncrement INT
	DECLARE @CurrentQuantityStock INT
	DECLARE @OpeningBalance INT
	DECLARE @UnitPriceValue DECIMAL
	DECLARE @InventoryIn INT
	DECLARE @InventoryOut INT
	DECLARE @ClosingQuantity INT
	DECLARE @InventoryId UNIQUEIDENTIFIER 
	DECLARE @InventoryName VARCHAR(200)
	
	DECLARE @InventoryCertificateId UNIQUEIDENTIFIER  = (SELECT top(1) Id FROM [InventoryCertificate] WITH(NOLOCK) 
															WHERE ClosingDate IS NULL AND VendorId = @LocationVendorId ORDER BY OpeningDate DESC)
	DECLARE @OpeningDate DATETIME = (SELECT OpeningDate FROM [InventoryCertificate] WITH(NOLOCK) WHERE Id = @InventoryCertificateId)

	CREATE TABLE #tempInventory(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,InventoryId uniqueidentifier,
								InvName varchar(200),OpeningQty int, UnitPrice decimal)

	CREATE TABLE #tempStockCount(InventoryId UNIQUEIDENTIFIER,InvName VARCHAR(200),UnitPriceValue varchar(50),OpeningBalance INT,
									InventoryIn INT,InventoryOut INT,ClosingQuantity int)

		INSERT INTO #tempInventory (InventoryId, InvName, OpeningQty, UnitPrice)
					SELECT Inv.Id, ProductName,ib.Quantity, Inv.Price FROM Inventory Inv with(nolock) 
						INNER JOIN InventoryBalance ib with(nolock) on (ib.InventoryId = Inv.Id)
							WHERE ib.InventoryCertificateId = @InventoryCertificateId
								ORDER BY ProductName DESC

		SELECT @countIncrement = 1
		SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventory

			WHILE (@countIncrement <= @totalRecords)
				BEGIN

					SELECT @InventoryId =InventoryId, @InventoryName = InvName, @OpeningBalance = OpeningQty,
						@UnitPriceValue = UnitPrice	FROM #tempInventory WITH(NOLOCK) WHERE countInventoryId = @countIncrement
	
					--get current available stock
					SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' AND I.LocationVendorId = @LocationVendorId
								  AND I.DestinationVendorId = @LocationVendorId 
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' 
								  AND I.LocationVendorId <> @LocationVendorId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					INSERT INTO #tempStockCount (InventoryId,InvName,UnitPriceValue,OpeningBalance,InventoryIn,InventoryOut,ClosingQuantity)
					VALUES(@InventoryId, @InventoryName,'R ' + CONVERT(varchar(10),ISNULL(@UnitPriceValue,0)), @OpeningBalance, ISNULL(@InventoryIn, 0),ISNULL(@InventoryOut, 0),
					((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) - ISNULL(@InventoryOut, 0)))

				SELECT @countIncrement = @countIncrement + 1 

			END

		SELECT * FROM #tempStockCount WITH(NOLOCK)
		DROP TABLE #tempStockCount
		DROP TABLE #tempInventory
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ExistingStockCountSheet]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExistingStockCountSheet] 	
	@InventoryCertificateId uniqueidentifier,
	@LocationVendorId uniqueidentifier
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @totalRecords INT
	DECLARE @countIncrement INT
	DECLARE @CurrentQuantityStock INT
	DECLARE @OpeningBalance INT
	DECLARE @InventoryIn INT
	DECLARE @InventoryOut INT
	DECLARE @ClosingQuantity INT
	DECLARE @InventoryId UNIQUEIDENTIFIER 
	DECLARE @InventoryName VARCHAR(200)
	DECLARE @OpeningDate DATETIME 

	CREATE TABLE #tempInventory(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,
								InventoryId uniqueidentifier, 
								InvName varchar(200))

	CREATE TABLE #tempStockCount(InventoryId UNIQUEIDENTIFIER, 
									InvName VARCHAR(200),
									OpeningBalance INT,
									InventoryIn INT, --from ware house
									InventoryOut INT,
									ClosingQuantity int)

INSERT INTO #tempInventory (InventoryId, InvName)
	SELECT Id, ProductName FROM [Inventory] WITH(NOLOCK) ORDER BY ProductName DESC

SELECT @countIncrement = 1
SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventory

SELECT top(1) @OpeningDate = OpeningDate FROM [InventoryCertificate] WITH(NOLOCK) 
		WHERE Id = @InventoryCertificateId ORDER BY OpeningDate DESC


--SET @InventoryCertificateId = (SELECT top(1) FROM [InventoryMS].[dbo].[InventoryCertificate] WITH(NOLOCK) WHERE OpeningDate  <= @OpeningDate ORDER BY OpeningDate DESC); 

	WHILE (@countIncrement <= @totalRecords)
	BEGIN

	SELECT @InventoryId =InventoryId, @InventoryName = InvName FROM #tempInventory WITH(NOLOCK) WHERE countInventoryId = @countIncrement
	SET @OpeningBalance = 0


	--get current available stock
	SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' AND I.LocationVendorId = @LocationVendorId
								  AND I.DestinationVendorId = @LocationVendorId 
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

	SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' 
								  AND I.LocationVendorId <> @LocationVendorId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

	INSERT INTO #tempStockCount (InventoryId,InvName,OpeningBalance,InventoryIn,InventoryOut,ClosingQuantity)
	VALUES(@InventoryId, @InventoryName, @OpeningBalance, ISNULL(@InventoryIn, 0),ISNULL(@InventoryOut, 0),
	((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) - ISNULL(@InventoryOut, 0)))

	SELECT @countIncrement = @countIncrement + 1 

END

SELECT * FROM #tempStockCount WITH(NOLOCK)
DROP TABLE #tempStockCount
DROP TABLE #tempInventory
END
GO
/****** Object:  StoredProcedure [dbo].[sp_generateInventoryCertificate]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Generate Inventory certificate

*/

CREATE PROCEDURE [dbo].[sp_generateInventoryCertificate]
	@vendorId uniqueidentifier,
	@generateById uniqueidentifier
AS
BEGIN

	DECLARE @totalRecords INT;
	DECLARE @countIncrement INT;
	DECLARE @InventoryId UNIQUEIDENTIFIER; 
	DECLARE @OpeningBalance INT;
	DECLARE @InventoryIn INT;
	DECLARE @InventoryOut INT;
	DECLARE @NewInventoryCertificateId UNIQUEIDENTIFIER; 

   BEGIN TRANSACTION
   BEGIN TRY

   
		--Get Current Opening CertId
		DECLARE @InventoryCertificateId UNIQUEIDENTIFIER = 
			(SELECT top(1) Id FROM [InventoryCertificate] WITH(NOLOCK) 
					WHERE ClosingDate IS NULL AND VendorId = @vendorId ORDER BY OpeningDate DESC);

		--Get Opening Date
		DECLARE @OpeningDate DATETIME = (SELECT OpeningDate FROM [InventoryCertificate] WITH(NOLOCK) WHERE Id = @InventoryCertificateId);

		SET @NewInventoryCertificateId = NEWID(); 
		
		--Stamped Incoming Verified Transactions  (Warehouse)
		UPDATE InventoryTransaction set InventoryCertificateId = @InventoryCertificateId
				 WHERE Id IN (SELECT [Id] FROM [InventoryTransaction] WITH(NOLOCK)
								WHERE destinationVendorId = @vendorId
								AND locationVendorId = @vendorId
								AND InventoryCertificateId IS NULL
								AND DateInserted >= @OpeningDate
								AND VerifiedStatus = 'Verified'
								AND trackingstatus = 'Delivered')

		--Stamped Outgoing Transactions (Customer)
		 UPDATE InventoryTransaction set InventoryCertificateId = @InventoryCertificateId
				 WHERE Id IN (SELECT [Id] FROM [InventoryTransaction] WITH(NOLOCK)
								WHERE DestinationVendorId IN (SELECT ID  FROM [Vendor] Where name = 'Customer')
															  AND VerifiedStatus = 'Verified'
															  AND InventoryCertificateId IS NULL
															  AND locationVendorId = @vendorId
															  AND DateInserted >= @OpeningDate);

		--Generate certificate
		UPDATE [InventoryCertificate] set ClosingDate = getdate(), GeneratedById = @generateById WHERE id = @InventoryCertificateId

		--Generate new certificate
		INSERT INTO [InventoryCertificate](id, OpeningDate,VendorId)
		VALUES(@NewInventoryCertificateId, getdate(), @vendorId)
	
		--ADD Opening Balance

		CREATE TABLE #tempInventoryBalance(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,InventoryId uniqueidentifier, OpeningBalance int)

		INSERT INTO #tempInventoryBalance(InventoryId, OpeningBalance)
					SELECT InventoryId, Quantity FROM InventoryBalance 
						WITH(NOLOCK) WHERE InventoryCertificateId = @InventoryCertificateId

		SELECT @countIncrement = 1;

		SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventoryBalance

		WHILE (@countIncrement <= @totalRecords)
				
			BEGIN

				SELECT @InventoryId =InventoryId, @OpeningBalance = OpeningBalance FROM #tempInventoryBalance WITH(NOLOCK) WHERE countInventoryId = @countIncrement
				
				SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' AND I.LocationVendorId = @vendorId
								  AND I.DestinationVendorId = @vendorId 
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' 
								  AND I.LocationVendorId <> @vendorId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)


				--create opening for new certificate
				 INSERT INTO [InventoryBalance]([InventoryCertificateId],[InventoryId],[Quantity])
					VALUES(@NewInventoryCertificateId,@InventoryId,((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) - ISNULL(@InventoryOut, 0)))

				SELECT @countIncrement = @countIncrement + 1; 

			END

		SELECT 0 AS ReturnCode,@InventoryCertificateId AS InventoryCertificateId, 'Recon certifiate is succcessfully generated' as ReturnMessage
		COMMIT TRANSACTION

	END TRY  
	BEGIN CATCH  
		SELECT 1 AS ReturnCode,NULL AS InventoryCertificateId, 'Failed to generate Recon certifiate' as ReturnMessage
		ROLLBACK TRANSACTION
	END CATCH  

	DROP TABLE #tempInventoryBalance


END
GO
/****** Object:  StoredProcedure [dbo].[sp_getInventoryInStockByVendor]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getInventoryInStockByVendor]
	@vendorId uniqueidentifier
AS
BEGIN
	
	DECLARE @InventoryCertificateId UNIQUEIDENTIFIER = (SELECT top(1) Id FROM [InventoryCertificate] WITH(NOLOCK) 
															WHERE ClosingDate IS NULL AND VendorId = @vendorId ORDER BY OpeningDate DESC)

    DECLARE @ImagePathUrl VARCHAR(255) = (SELECT [ImagePath] FROM [InventoryPath] WITH(NOLOCK) WHERE Type = 'ImageUrl');

	SELECT Inv.Id AS InventoryId, ProductName,Inv.Image, 0 AS InventoryQuantity, Inv.Price,(@ImagePathUrl + '' + Inv.Image) AS ImageUrl
		FROM Inventory Inv with(nolock) INNER JOIN 
			 InventoryBalance ib with(nolock) on (ib.InventoryId = Inv.Id)
							WHERE ib.InventoryCertificateId = @InventoryCertificateId
								ORDER BY ProductName DESC

	END
GO
/****** Object:  StoredProcedure [dbo].[sp_getPrevStockTakingByCertificateId]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getPrevStockTakingByCertificateId] 	
	@InventoryCertificateId uniqueidentifier
AS
BEGIN

	DECLARE @totalRecords INT
	DECLARE @countIncrement INT
	DECLARE @CurrentQuantityStock INT
	DECLARE @OpeningBalance INT
	DECLARE @UnitPriceValue DECIMAL
	DECLARE @InventoryIn INT
	DECLARE @InventoryOut INT
	DECLARE @ClosingQuantityValue INT
	DECLARE @InventoryId UNIQUEIDENTIFIER 
	DECLARE @InventoryName VARCHAR(200)
	
	DECLARE @OpeningDate DATETIME = (SELECT OpeningDate FROM [InventoryCertificate] WITH(NOLOCK) WHERE Id = @InventoryCertificateId);
	DECLARE @ClosingDate DATETIME = (SELECT ClosingDate FROM [InventoryCertificate] WITH(NOLOCK) WHERE Id = @InventoryCertificateId)
	DECLARE @VendorName VARCHAR(250) = (SELECT top(1) Name FROM [Vendor] v WITH(NOLOCK) INNER JOIN
										[InventoryCertificate] inc  WITH(NOLOCK) on (inc.vendorId = v.Id) WHERE inc.Id = @InventoryCertificateId)
	DECLARE @ConfirmedBy VARCHAR(250) = (SELECT top(1) Firstname + ' ' + Surname as ConfirmedBy FROM [Inv_User] WHERE id = (SELECT GeneratedById FROm [InventoryCertificate] WHERE Id = @InventoryCertificateId))
									


	CREATE TABLE #tempInventory(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,InventoryId uniqueidentifier,
								InvName varchar(200),OpeningQty int, UnitPrice decimal)

	CREATE TABLE #tempStockCount(InventoryId UNIQUEIDENTIFIER,InvName VARCHAR(200),UnitPriceValue decimal,OpeningBalance INT,TotalAmountOpeningBalance decimal,
									InventoryIn INT,TotalAmountInventoryIn decimal,InventoryOut INT,TotalAmountInventoryOut decimal,ClosingQuantity int,TotalAmountClosingQuantity decimal,
									VendorName varchar(255), OpeningDate DateTime, ClosingDate DateTime,ConfirmedBy varchar(255))

		INSERT INTO #tempInventory (InventoryId, InvName, OpeningQty, UnitPrice)
					SELECT Inv.Id, ProductName,ib.Quantity, Inv.Price FROM Inventory Inv with(nolock) 
						INNER JOIN InventoryBalance ib with(nolock) on (ib.InventoryId = Inv.Id)
							WHERE ib.InventoryCertificateId = @InventoryCertificateId
								ORDER BY ProductName DESC

		SELECT @countIncrement = 1
		SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventory

			WHILE (@countIncrement <= @totalRecords)
				BEGIN

					SELECT @InventoryId =InventoryId, @InventoryName = InvName, @OpeningBalance = OpeningQty,
						  @UnitPriceValue = UnitPrice	FROM #tempInventory WITH(NOLOCK) WHERE countInventoryId = @countIncrement
	
					--get current available stock
					SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit'
								  AND I.InventoryCertificateId = @InventoryCertificateId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Debit' 
								  AND I.InventoryCertificateId = @InventoryCertificateId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					SET @ClosingQuantityValue = ((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) + ISNULL(@InventoryOut, 0));

					INSERT INTO #tempStockCount (InventoryId,InvName,UnitPriceValue,OpeningBalance,TotalAmountOpeningBalance,
												InventoryIn,TotalAmountInventoryIn,InventoryOut,TotalAmountInventoryOut,
												ClosingQuantity,TotalAmountClosingQuantity,
												VendorName, OpeningDate, ClosingDate, ConfirmedBy)
					VALUES(@InventoryId, @InventoryName,ISNULL(@UnitPriceValue,0), @OpeningBalance,(ISNULL(@OpeningBalance, 0) * ISNULL(@UnitPriceValue,0)), 
						  ISNULL(@InventoryIn, 0),(ISNULL(@InventoryIn, 0) * ISNULL(@UnitPriceValue,0)),ISNULL(@InventoryOut, 0),(ISNULL(@InventoryOut, 0) * ISNULL(@UnitPriceValue,0)),
						  @ClosingQuantityValue,(ISNULL(@ClosingQuantityValue, 0) * ISNULL(@UnitPriceValue,0)),
						  @VendorName,@OpeningDate, @ClosingDate, @ConfirmedBy)

				SELECT @countIncrement = @countIncrement + 1 

			END

		SELECT InventoryId,InvName,CAST(UnitPriceValue AS DECIMAL(16,2)) UnitPriceValue,OpeningBalance,
			   CAST(TotalAmountOpeningBalance AS DECIMAL(16,2)) AS TotalAmountOpeningBalance,
			   InventoryIn,CAST(TotalAmountInventoryIn AS DECIMAL(16,2)) AS TotalAmountInventoryIn,InventoryOut, 
			   CAST(TotalAmountInventoryOut AS DECIMAL(16,2)) AS TotalAmountInventoryOut,
			   ClosingQuantity,CAST(TotalAmountClosingQuantity AS DECIMAL(16,2)) AS TotalAmountClosingQuantity,
			   VendorName, OpeningDate, ClosingDate, ConfirmedBy FROM #tempStockCount WITH(NOLOCK)

		DROP TABLE #tempStockCount
		DROP TABLE #tempInventory
END
GO
/****** Object:  StoredProcedure [dbo].[sp_StockCountSheet]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_StockCountSheet] 	
	@LocationVendorId uniqueidentifier,
	@OpeningBalanceDate datetime
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @totalRecords INT
	DECLARE @countIncrement INT
	DECLARE @CurrentQuantityStock INT
	DECLARE @OpeningBalance INT
	DECLARE @InventoryIn INT
	DECLARE @InventoryOut INT
	DECLARE @ClosingQuantity INT
	DECLARE @InventoryId UNIQUEIDENTIFIER 
	DECLARE @InventoryName VARCHAR(200)
	DECLARE @InventoryCertificateId UNIQUEIDENTIFIER 
	DECLARE @OpeningDate DATETIME 

	CREATE TABLE #tempInventory(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,
								InventoryId uniqueidentifier, 
								InvName varchar(200))

	CREATE TABLE #tempStockCount(InventoryId UNIQUEIDENTIFIER, 
									InvName VARCHAR(200),
									OpeningBalance INT,
									InventoryIn INT, --from ware house
									InventoryOut INT,
									ClosingQuantity int)

INSERT INTO #tempInventory (InventoryId, InvName)
	SELECT Id, ProductName FROM [InventoryMS].[dbo].[Inventory] WITH(NOLOCK) ORDER BY ProductName DESC

SELECT @countIncrement = 1
SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventory

SELECT top(1) @InventoryCertificateId = Id, @OpeningDate = OpeningDate 
	FROM [InventoryMS].[dbo].[InventoryCertificate] WITH(NOLOCK) 
		WHERE OpeningDate = @OpeningBalanceDate 
		AND VendorId = @LocationVendorId ORDER BY OpeningDate DESC

IF @InventoryCertificateId IS NULL 
BEGIN
	SELECT top(1) @InventoryCertificateId = Id, @OpeningDate = OpeningDate 
		FROM [InventoryMS].[dbo].[InventoryCertificate] WITH(NOLOCK) 
			WHERE ClosingDate IS NULL 
				AND VendorId = @LocationVendorId ORDER BY OpeningDate DESC
END

--SET @InventoryCertificateId = (SELECT top(1) FROM [InventoryMS].[dbo].[InventoryCertificate] WITH(NOLOCK) WHERE OpeningDate  <= @OpeningDate ORDER BY OpeningDate DESC); 

	WHILE (@countIncrement <= @totalRecords)
	BEGIN

	SELECT @InventoryId =InventoryId, @InventoryName = InvName FROM #tempInventory WITH(NOLOCK) WHERE countInventoryId = @countIncrement
	
	
	/*SET @OpeningBalance = (SELECT SUM(ISNULL(Quantity, 0)) FROM [InventoryMS].[dbo].[InventoryBalance] WITH(NOLOCK) WHERE 
																InventoryCertificateId = @InventoryCertificateId 
																AND InventoryId = @InventoryId)
																*/
SET @OpeningBalance = 0;-- to be removed

	--get current available stock
	SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryMS].[dbo].[InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [InventoryMS].[dbo].[Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' AND I.LocationVendorId = @LocationVendorId
								  AND I.DestinationVendorId = @LocationVendorId 
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

	SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryMS].[dbo].[InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [InventoryMS].[dbo].[Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' 
								  AND I.LocationVendorId <> @LocationVendorId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

	INSERT INTO #tempStockCount (InventoryId,InvName,OpeningBalance,InventoryIn,InventoryOut,ClosingQuantity)
	VALUES(@InventoryId, @InventoryName, @OpeningBalance, ISNULL(@InventoryIn, 0),ISNULL(@InventoryOut, 0),
	((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) - ISNULL(@InventoryOut, 0)))

	SELECT @countIncrement = @countIncrement + 1 

END

SELECT * FROM #tempStockCount WITH(NOLOCK)
DROP TABLE #tempStockCount
DROP TABLE #tempInventory
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VendorStockCountSheetByVendorId]    Script Date: 28/06/2022 14:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_VendorStockCountSheetByVendorId] 	
	@LocationVendorId uniqueidentifier
AS
BEGIN

	DECLARE @totalRecords INT
	DECLARE @countIncrement INT
	DECLARE @CurrentQuantityStock INT
	DECLARE @OpeningBalance INT
	DECLARE @InventoryIn INT
	DECLARE @InventoryOut INT
	DECLARE @ClosingQuantity INT
	DECLARE @InventoryId UNIQUEIDENTIFIER 
	DECLARE @InventoryName VARCHAR(200)
	
	DECLARE @InventoryCertificateId UNIQUEIDENTIFIER  = (SELECT top(1) Id FROM [InventoryCertificate] WITH(NOLOCK) 
															WHERE ClosingDate is null AND VendorId = @LocationVendorId ORDER BY OpeningDate DESC)
	DECLARE @OpeningDate DATETIME = (SELECT OpeningDate FROM [InventoryCertificate] WITH(NOLOCK) WHERE Id = @InventoryCertificateId)

	CREATE TABLE #tempInventory(countInventoryId INT IDENTITY(1,1) PRIMARY KEY,InventoryId uniqueidentifier, InvName varchar(200),OpeningQty int)

	CREATE TABLE #tempStockCount(InventoryId UNIQUEIDENTIFIER,InvName VARCHAR(200),OpeningBalance INT,
									InventoryIn INT,InventoryOut INT,ClosingQuantity int)

		INSERT INTO #tempInventory (InventoryId, InvName, OpeningQty)
					SELECT Inv.Id, ProductName,ib.Quantity FROM Inventory Inv with(nolock) 
						INNER JOIN InventoryBalance ib with(nolock) on (ib.InventoryId = Inv.Id)
							WHERE ib.InventoryCertificateId = @InventoryCertificateId
								ORDER BY ProductName DESC

		SELECT @countIncrement = 1
		SELECT @totalRecords = COUNT(countInventoryId) FROM #tempInventory

			WHILE (@countIncrement <= @totalRecords)
				BEGIN

					SELECT @InventoryId =InventoryId, @InventoryName = InvName, @OpeningBalance = OpeningQty 
						FROM #tempInventory WITH(NOLOCK) WHERE countInventoryId = @countIncrement
	
					--get current available stock
					SET @InventoryIn = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [InventoryMS].[dbo].[Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' AND I.LocationVendorId = @LocationVendorId
								  AND I.DestinationVendorId = @LocationVendorId 
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Delivered'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NULL 
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					SET @InventoryOut = (SELECT SUM(ISNULL(I.Quantity, 0)) AS Qualtity FROM [InventoryTransaction] I WITH(NOLOCK)
								  INNER JOIN [InventoryMS].[dbo].[Inventory] Inv WITH(NOLOCK) ON (I.InventoryId = Inv.Id)
								  WHERE I.EntryType = 'Credit' 
								  AND I.LocationVendorId <> @LocationVendorId
								  AND I.TransactionType = 'Inventory'
								  AND I.TrackingStatus = 'Customer'  
								  AND I.InventoryId = @InventoryId
								  AND I.OrderItemId IS NOT NULL
								  AND Deleted = 0
								  AND I.DateInserted >= @OpeningDate
								  GROUP BY Inv.ProductName, I.InventoryId)

					INSERT INTO #tempStockCount (InventoryId,InvName,OpeningBalance,InventoryIn,InventoryOut,ClosingQuantity)
					VALUES(@InventoryId, @InventoryName, @OpeningBalance, ISNULL(@InventoryIn, 0),ISNULL(@InventoryOut, 0),
					((ISNULL(@OpeningBalance, 0) + ISNULL(@InventoryIn, 0)) - ISNULL(@InventoryOut, 0)))

				SELECT @countIncrement = @countIncrement + 1 

			END

		SELECT * FROM #tempStockCount WITH(NOLOCK)
		DROP TABLE #tempStockCount
		DROP TABLE #tempInventory
END
GO
USE [master]
GO
ALTER DATABASE [InventorymsPreprod] SET  READ_WRITE 
GO
