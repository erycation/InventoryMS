USE [mesolut2_InventoryMS]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28/06/2022 13:53:39 PM ******/
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
/****** Object:  Table [dbo].[ExpectedInventory]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[Inv_User]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[Inventory]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[InventoryBalance]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[InventoryCertificate]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[InventoryPath]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[InventoryPrice]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[InventoryTransaction]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[OrderItem]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 28/06/2022 13:53:44 PM ******/
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
/****** Object:  Table [dbo].[VendorLocation]    Script Date: 28/06/2022 13:53:44 PM ******/
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
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'84b8474d-2c5e-4d9c-b663-3c3847124514', CAST(N'2022-06-28T03:09:16.433' AS DateTime), N'20220628030916', N'CustomerDemo', N'Demo', N'0761435085', N'demo@gmail.com', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0')
INSERT [dbo].[Customer] ([Id], [DateInserted], [Code], [FirstName], [Surname], [CellphoneNo], [EmailAddress], [LocationId]) VALUES (N'9f798fc5-2191-4b72-a2f3-7e05fb104237', CAST(N'2022-06-28T03:30:07.050' AS DateTime), N'20220628033007', N'Test', N'Test', N'08532456889', N'test@gmail.com', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0')
GO
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'93503e0e-f066-4292-aafd-4a9a81955c0c', N'f5637f8b-631f-4124-b980-d96de8450498', CAST(N'2022-06-28T03:01:48.263' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 20, 20, 1, CAST(N'2022-06-28T03:05:06.923' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'222d0f40-f827-4264-8685-50760d2e3aee', N'7a571674-e058-400c-91f5-b78a12fedd53', CAST(N'2022-06-28T03:04:16.577' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 19, 19, 1, CAST(N'2022-06-28T03:05:13.587' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'd07356a9-90fb-4872-b895-595885507713', N'691c7340-8e89-4e4c-b88b-5c6e22237aa9', CAST(N'2022-06-28T03:04:35.903' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 5, 5, 1, CAST(N'2022-06-28T03:05:18.440' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'ce193ec9-c610-4438-abaa-6275ae005efe', N'1c82a1dc-9bc2-41ce-b8df-f41f6e7cfdcf', CAST(N'2022-06-28T03:02:25.353' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'17dab944-257f-4e31-90db-63d1857b4b4e', 8, 8, 1, CAST(N'2022-06-28T03:05:24.213' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'eef0a5b8-a259-4d74-a2df-6bfe9be3677e', N'8e4408ad-9136-4ab1-84bd-e12ec723360d', CAST(N'2022-06-28T03:02:08.047' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'942701b3-522b-445d-aa0a-efff92f30b83', 15, 15, 1, CAST(N'2022-06-28T03:05:30.573' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'1af85f07-8864-4ec0-9bb8-85733eedcfc2', N'608da232-dc1c-4c1b-a6fa-b68a7af5b707', CAST(N'2022-06-28T03:03:07.193' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 12, 12, 1, CAST(N'2022-06-28T03:05:36.590' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'426e9763-a49c-44ff-b780-b390201aa37f', N'5edc6427-7424-4a2b-9c5b-3f5d4bce4450', CAST(N'2022-06-28T03:02:46.897' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 9, 9, 1, CAST(N'2022-06-28T03:05:44.137' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'3ab569ec-d1fa-4bae-a202-b59b1695feb1', N'0dd5e6b3-e55d-4f2d-b8c4-e1c6a909e6ac', CAST(N'2022-06-28T03:03:57.100' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 6, 6, 1, CAST(N'2022-06-28T03:05:51.993' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'c0009b54-0b62-4c4d-9579-c8f46b332c53', N'42ba7c23-b429-4a98-80e6-d487509cee85', CAST(N'2022-06-28T03:03:30.960' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'1d5666ae-0016-45f9-9db8-adce224838d9', 19, 19, 1, CAST(N'2022-06-28T03:05:59.433' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'e2065673-9c81-4bfd-b17b-db7e27653e8f', N'6987c376-ca25-4877-82b5-ae8aea455141', CAST(N'2022-06-10T03:10:56.207' AS DateTime), N'Ndhlandhla', N'7f6843c2-3281-4273-bd69-206bb409a059', N'812eda8d-f1df-4462-ac02-3ce048375d07', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 5, 0, 0, NULL, N'None', 0)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'4f1c4951-7cc0-4882-90d7-efceaa84341e', N'81955036-627b-43a4-b52d-f48b37cf60c4', CAST(N'2022-06-28T03:01:15.530' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'20ac1793-305d-480f-955f-782784127424', 10, 10, 1, CAST(N'2022-06-28T03:06:27.963' AS DateTime), N'None', 1)
INSERT [dbo].[ExpectedInventory] ([Id], [ReferenceNo], [DateInserted], [Supervisor], [AdminId], [VendorId], [InventoryId], [Quantity], [Count1], [Counted], [CountedDate], [VarianceReason], [SendToVendor]) VALUES (N'4c92d8c0-da09-4c9b-b24c-f0b5598a3f6e', N'77dc0b85-c188-4a99-abc9-7b19226cbfe8', CAST(N'2022-06-28T03:01:32.257' AS DateTime), N'Superuser', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 12, 12, 1, CAST(N'2022-06-28T03:06:35.403' AS DateTime), N'None', 1)
GO
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'7f6843c2-3281-4273-bd69-206bb409a059', N'Admin1', N'$2a$11$lW5LrPb8dnADFf1jOFYw6eQNuoYzQtIX2/3d6VdU/JlyXcBYiC0Ba', N'Whitney', N'Mahlare', N'Admin', 1, N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'DemoSales', N'$2a$11$O/1nkwUmLzoAPsI6YQzo5Or/nrCjiNe7IFOgAKIiCU/dnKwSfvi5G', N'Demo', N'Sales', N'Sales', 1, N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'DemoAdmin', N'$2a$11$SgMtr4EM/7uq1dqxJxFyVeEgsI5nVX9Xo009rYVjJGoy6nTDW5noO', N'Demo', N'Admin', N'Admin', 1, N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'705dfb86-ed64-493a-9cf8-d4a5a977a055', N'Superuser', N'$2a$11$hOps2dw7bN65Ezx5Hi626OIgIqfFT6.hqnELlX2bTAlU6NcCGXmbi', N'Superuser', N'Superuser', N'Supervisor', 1, N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf')
INSERT [dbo].[Inv_User] ([Id], [Username], [Password], [Firstname], [Surname], [RoleDescription], [Active], [VendorId]) VALUES (N'f4177ca2-7f2b-4cbd-b03f-da10d9ffbd1d', N'Ndhlandhla', N'$2a$11$A6jaHGwtORXCvfIAzFofPeYPjC0me1yUvT80JoRgi3Kmi35N0hJwa', N'Ndhlandhla', N'Ndhlandhla', N'Supervisor', 1, N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf')
GO
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', N'Toner ', N'WToner.jpeg', CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', N'Exfoliation Mask', N'WCleansingFoam.jpeg', CAST(109.25 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', N'Pigmentation Cream ', N'WPegmentationDarkSpotsCream.jpeg', CAST(172.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'b104a143-5557-4f0b-9db9-29852f847960', N'Consultation Fee', N'WCleansingFoam.jpeg', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'dc57bdbb-f747-4b52-a926-432eb4cbb131', N'Cleansing Gel -Pink', N'WCleansingFoam.jpeg', CAST(172.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'dbeec944-5bc7-41d3-860c-49ab46e14133', N'Gluta Bright Cream ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'd54863a9-1f46-4d38-841a-52643b64a99d', N'Cleansing Foam -Green', N'WCleansingFoam.jpeg', CAST(109.25 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', N'Tissue Oil ', N'WTissueOil.jpeg', CAST(168.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'17dab944-257f-4e31-90db-63d1857b4b4e', N'Clear Soap.', N'WCleansingFoam.jpeg', CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'20ac1793-305d-480f-955f-782784127424', N'Body Butter ', N'WBodyButter.jpeg', CAST(160.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'6d8d974d-5bb5-485c-b24f-849acf32c070', N'Argon Oil Mixture', N'WCleansingFoam.jpeg', CAST(85.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'f9e46cd2-bba1-43f5-a961-916d4c914b17', N'Chemical Peel Home Kit-Treatment ', N'WCleansingFoam.jpeg', CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', N'Mild Peel Serum ', N'WCleansingFoam.jpeg', CAST(218.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', N'Black Soap ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'1d5666ae-0016-45f9-9db8-adce224838d9', N'Pigmentation Serum ', N'WPigmentationSerum.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'e78459c1-e632-4372-8760-b9a76f76cb1b', N'Peeling Serum', N'WPeelingSerum.jpeg', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'e4191640-be34-49e9-8c99-c0ed9add604e', N'Pimple Cream ', N'WCleansingFoam.jpeg', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', N'Pimple Serum ', N'WPimpleSerum.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', N'Hydrating Cream ', N'WCleansingFoam.jpeg', CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'5469b9d6-283a-454d-8af0-e9c5addd5d13', N'Gift Voucher ', N'WCleansingFoam.jpeg', CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'942701b3-522b-445d-aa0a-efff92f30b83', N'Hydrating Serum ', N'WHydratingSerum.jpeg', CAST(103.50 AS Decimal(18, 2)))
INSERT [dbo].[Inventory] ([Id], [ProductName], [Image], [Price]) VALUES (N'be0d0d77-58f6-4f76-a576-f959dec02e4c', N'Sunscreen 30ml', N'WCleansingFoam.jpeg', CAST(52.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0e1f98dc-5784-40d0-96d9-04cd76dd54f6', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'e4191640-be34-49e9-8c99-c0ed9add604e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'58a59570-032f-4ff9-874c-0721c4c9066e', N'653be428-6f11-4394-babe-628d2b494d22', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 12)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'8ae5ea2f-8475-4692-8590-0b9fbcc50835', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3060028e-85ae-4e47-9945-0db5d3c611cc', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'9b59a61e-6a6f-40c6-ad9d-0e1b45d3aeff', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ed0fc7f0-fb9b-4b55-810b-1264a99b897a', N'4315cd17-58ec-48c4-9fcb-612824177884', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'61d06552-b0ad-410f-a466-133af2b45e59', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'a54bfc82-e3f9-4a27-80da-16a4801b6e32', N'4315cd17-58ec-48c4-9fcb-612824177884', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5ccf3811-34b6-4ca4-83eb-16b74cc0d4b8', N'4315cd17-58ec-48c4-9fcb-612824177884', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5fd33fe1-66e9-4059-8349-193942e8820e', N'653be428-6f11-4394-babe-628d2b494d22', N'1d5666ae-0016-45f9-9db8-adce224838d9', 19)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3ef10fbd-4e6f-43ca-8db3-1bf7db8bf072', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'4555b0ec-1bbd-4543-8363-205050aeb34d', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd2656236-26bd-40b0-8ffe-229f4abb0553', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'99acec86-a71c-4a61-8da2-2377bfc217dd', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'19d08e48-2d3c-4e60-9908-27d76f02abd7', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'7f5d3edb-46fa-498b-be7e-d4fbd0c7b2b7', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'3a2208b0-2863-4bf3-96af-3332f8c4ea57', N'653be428-6f11-4394-babe-628d2b494d22', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 20)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bd009388-1898-41aa-ad49-3417a3bb1e31', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'775f7f32-5314-4ee4-b8ff-3559ce389ea3', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'63793b6d-e2fd-41c1-af6b-35e339fb8dd4', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'657bbe14-601b-45c7-aecb-3620c7adffbf', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'be0d0d77-58f6-4f76-a576-f959dec02e4c', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bac7e6eb-0f02-4da5-b2d0-37fbd1406665', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'86e1bb53-545e-4334-818a-3845987ded75', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e932b179-49b8-4a1a-a031-3be8de24a42a', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5b268372-1ed7-4bde-9a82-3cb4182db58a', N'653be428-6f11-4394-babe-628d2b494d22', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 4)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'36a09819-bbb4-47c0-bdd7-3f705195cac9', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'bfb4680b-84f5-44c8-8037-44cb79c469cc', N'653be428-6f11-4394-babe-628d2b494d22', N'942701b3-522b-445d-aa0a-efff92f30b83', 15)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'8b5ed27e-5830-4852-86b1-46734f678bc1', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e6caed8b-1f4f-4098-8e1c-4c086bd58a25', N'653be428-6f11-4394-babe-628d2b494d22', N'17dab944-257f-4e31-90db-63d1857b4b4e', 8)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'020fa0a9-6016-4011-b1c4-4f1b2b22976f', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'1d5666ae-0016-45f9-9db8-adce224838d9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0ee39e04-c854-47e0-bd10-5012384f82d5', N'4315cd17-58ec-48c4-9fcb-612824177884', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'39de46cc-111c-46e1-b091-50ad7bdf9de7', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'61c6d77d-350f-401a-b4b7-5214c3cde488', N'653be428-6f11-4394-babe-628d2b494d22', N'20ac1793-305d-480f-955f-782784127424', 10)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e3d021e6-20c7-4d51-9938-54361aab7efe', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'20ac1793-305d-480f-955f-782784127424', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'53a7193f-58a7-4783-be07-5c3d94c1a41c', N'4315cd17-58ec-48c4-9fcb-612824177884', N'17dab944-257f-4e31-90db-63d1857b4b4e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1c14b482-ae77-4ba4-a6a8-6731dc976045', N'653be428-6f11-4394-babe-628d2b494d22', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 3)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ef53dc0d-e4dd-4197-8313-6a8f0a40abfc', N'4315cd17-58ec-48c4-9fcb-612824177884', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'320b466c-c7bc-4f64-9791-6eec2789ed4c', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'52e8d064-bea8-48c8-a719-768174008509', N'4315cd17-58ec-48c4-9fcb-612824177884', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1ac63e7b-d7c6-4c05-a7fe-7e52bf5a3f18', N'4315cd17-58ec-48c4-9fcb-612824177884', N'1d5666ae-0016-45f9-9db8-adce224838d9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'0a1429c8-785c-40d3-bfd6-86215c85246a', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'57094937-d379-49c6-873d-8806f8a15ccf', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'f15c0bfb-c3f5-4336-95e1-a20c180fd47d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'9c939d0f-16fd-4d81-aa04-89ecbbc8da1d', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'55707a77-effe-4230-8aac-8ab657c6526b', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'c8facbe3-cf5e-4432-b865-a0f5817228cd', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'f9e46cd2-bba1-43f5-a961-916d4c914b17', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'1baf3ab0-7f36-48af-85df-a2f429a20197', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'b3431498-b53e-4a36-a035-a3e097aec57d', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'1d5666ae-0016-45f9-9db8-adce224838d9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'39c321c6-f1f7-4030-b423-a4647248d2d0', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5afbfba6-8949-4e82-ad7f-a5cb9d70274f', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'e4191640-be34-49e9-8c99-c0ed9add604e', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'06ff2f7c-7f67-4674-a8a5-affa16bc1be5', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'be0d0d77-58f6-4f76-a576-f959dec02e4c', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'72f18e56-28af-4c64-8d89-b42353891ae7', N'4315cd17-58ec-48c4-9fcb-612824177884', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'03a66e67-f271-414a-83d5-b5abb17eb91b', N'653be428-6f11-4394-babe-628d2b494d22', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 12)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e450e7d5-8f2b-406c-a839-b64d052d1712', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'b104a143-5557-4f0b-9db9-29852f847960', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'ee4daa60-01ab-43c4-bc6f-b66d0527fda5', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'd54863a9-1f46-4d38-841a-52643b64a99d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'325b8734-ef8a-4841-86db-b791bff902d1', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'dbeec944-5bc7-41d3-860c-49ab46e14133', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'373187e0-1c41-4550-9bbf-c0346a6135da', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'9ab15677-f4bd-4d57-99e4-a7e63112bf06', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'd6be83a2-6f54-4923-aa02-cb3cfad9cd25', N'4315cd17-58ec-48c4-9fcb-612824177884', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'58480433-ab95-4f29-a615-d076a07575fe', N'653be428-6f11-4394-babe-628d2b494d22', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 18)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'99a1660b-ad1f-4efa-b4e1-d3ca9cf9333d', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'942701b3-522b-445d-aa0a-efff92f30b83', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'10e3b221-06cf-47b3-8319-da075949a680', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'840b9491-e2f8-4540-9b16-e4b3d84f197c', N'4315cd17-58ec-48c4-9fcb-612824177884', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'cb26981e-8f1b-4da7-86f8-e53f1d93a566', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'6d8d974d-5bb5-485c-b24f-849acf32c070', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'5801db76-1da0-465b-a377-e7b5365f6459', N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'6cc1554d-b322-4d36-9980-ebc98fadc7a3', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'5469b9d6-283a-454d-8af0-e9c5addd5d13', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'e8c0c125-9631-483a-aa64-f0d58edf0981', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'd54863a9-1f46-4d38-841a-52643b64a99d', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'19b836ed-421c-448a-9d38-f6b3bfb3ee95', N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 0)
INSERT [dbo].[InventoryBalance] ([Id], [InventoryCertificateId], [InventoryId], [Quantity]) VALUES (N'106b5886-fbfc-4c97-b8e5-faeceb62f790', N'653be428-6f11-4394-babe-628d2b494d22', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 8)
GO
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'90ac59e7-c065-42b2-9cfe-0111848cf08f', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'3c25cfb4-6135-43a7-a142-5929306b8eb0', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'6597428a-46ed-4457-8bf6-5546af6d132c', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'812eda8d-f1df-4462-ac02-3ce048375d07', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'4315cd17-58ec-48c4-9fcb-612824177884', CAST(N'2022-06-28T00:00:00.000' AS DateTime), CAST(N'2022-06-28T03:24:06.313' AS DateTime), N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'138dd8b4-6465-471f-bfde-313d7d54c7fa')
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'653be428-6f11-4394-babe-628d2b494d22', CAST(N'2022-06-28T03:24:06.313' AS DateTime), NULL, N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'e5c260bb-8a7f-4a60-8f2e-6dfaa10f0aec', CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'7d2bcf2a-25f3-451e-9c02-81bdc41730f9', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'67b87e50-5a12-4771-8527-9f2e5f7f7640', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'ea189502-46fb-4f60-80f4-8de45868944f', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'03238c20-5083-4f01-aab0-459f59cbd82c', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'e62956cf-7ce5-4253-a2f9-ac334d848c41', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'd996ac8a-b383-46d0-b7b4-1edd8453f082', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'a09b7154-2b78-483d-bb60-ace835186a56', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'995b5808-12e9-4bd3-be9e-14ac88d979bc', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'd40cb0ed-7c55-483b-9261-b3240c8a3df5', CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', NULL)
INSERT [dbo].[InventoryCertificate] ([Id], [OpeningDate], [ClosingDate], [VendorId], [GeneratedById]) VALUES (N'bbca3052-f5a8-4b1c-a0d5-f3b6cfc779ae', CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, N'4837f3be-1bcd-44d6-99ed-74f52bd967b0', NULL)
GO
INSERT [dbo].[InventoryPath] ([Id], [ImagePath], [Type]) VALUES (N'9baa1ea4-9aa4-4972-99e7-8c192df91a50', N'https://aeonapi.m2esolution.com/api/FileEnvironment/getfile/', N'ImageUrl')
GO
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'cbf569e9-2c98-47cb-b0bf-05cecd19e441', CAST(N'2022-06-28T03:06:58.147' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'50e94032-bbf1-4174-8eac-061b4ca70f3a', CAST(N'2022-06-28T03:08:29.810' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'17dab944-257f-4e31-90db-63d1857b4b4e', -8, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'89eb1319-d332-4bf0-b325-0af7d4275728', CAST(N'2022-06-28T03:17:44.190' AS DateTime), N'Debit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'489ff1d2-ffd0-4e53-9a12-ae272a88aeba', 0, NULL, N'CUST20220628031744_26e78', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'0ec44710-6bed-44fe-88db-0ef4a2449819', CAST(N'2022-06-28T03:08:29.853' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'9b3b068e-edab-41d6-b917-14cefdb7197f', CAST(N'2022-06-28T03:30:58.927' AS DateTime), N'Credit', N'Inventory', N'Customer', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'f02f2db6-4b0d-463b-9ad3-2e167b24d288', 0, NULL, N'CUST20220628033058_aa384', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'9ba73a11-a556-4f6f-b135-1a397bbab2ed', CAST(N'2022-06-28T03:08:29.773' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'20ac1793-305d-480f-955f-782784127424', -10, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'd93eb857-69e1-4de7-a827-1b6fd1163d5d', CAST(N'2022-06-28T03:08:29.793' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 5, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'b7d21402-cd4e-4d06-99a4-20b95f9015c0', CAST(N'2022-06-28T03:17:44.207' AS DateTime), N'Debit', N'Inventory', N'Customer', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', -1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'5ae16cff-14c8-4d1c-90db-8aa7bb066c7e', 0, NULL, N'CUST20220628031744_26e78', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'f79d0d70-a0ee-4d7e-a427-230a98144759', CAST(N'2022-06-28T03:06:58.250' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'6ca7b263-cde8-4538-a8b6-2f185b96057e', CAST(N'2022-06-28T03:06:58.207' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'942701b3-522b-445d-aa0a-efff92f30b83', 15, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'433feac4-5cdd-447d-898a-38e074f57338', CAST(N'2022-06-28T03:06:58.227' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 9, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'5ecebc97-0b4a-45d1-9dc3-39297daf21cc', CAST(N'2022-06-28T03:08:29.837' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'1d5666ae-0016-45f9-9db8-adce224838d9', 19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'701db1fd-f618-43df-9f76-4054f5a45bed', CAST(N'2022-06-28T03:08:29.780' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'20ac1793-305d-480f-955f-782784127424', 10, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'db76843b-55bc-45f4-89eb-40cadd4c2f22', CAST(N'2022-06-28T03:30:58.917' AS DateTime), N'Debit', N'Inventory', N'Customer', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', -2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'f02f2db6-4b0d-463b-9ad3-2e167b24d288', 0, NULL, N'CUST20220628033058_aa384', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'9481ff8a-85e2-4970-8da8-40cbac049bb6', CAST(N'2022-06-28T03:06:58.260' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -6, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'fdbbfc17-3db1-4e0b-9890-43f5ec06556e', CAST(N'2022-06-28T03:06:58.243' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'e78459c1-e632-4372-8760-b9a76f76cb1b', -12, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'df0e6065-343f-46f3-b2b0-4e5ec5742c02', CAST(N'2022-06-28T03:17:44.197' AS DateTime), N'Credit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'489ff1d2-ffd0-4e53-9a12-ae272a88aeba', 0, NULL, N'CUST20220628031744_26e78', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2036ab72-4314-4829-ab36-514d3a441ff4', CAST(N'2022-06-28T03:23:46.873' AS DateTime), N'Credit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'ca2ff066-5498-4193-8d4d-2357207fe793', 0, NULL, N'CUST20220628032346_8c7ae', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'b2a137e9-6113-4c29-a5c8-53b0d5364d73', CAST(N'2022-06-28T03:08:29.680' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', -19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'1812e9ca-a89f-4901-b32b-58771ed3611d', CAST(N'2022-06-28T03:08:29.833' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'1d5666ae-0016-45f9-9db8-adce224838d9', -19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'b0576f2f-0763-435b-bdec-58a3b5b10b6e', CAST(N'2022-06-28T03:08:29.847' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', -12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'1a16c13f-37e8-4a2d-99aa-5962ce1fbd28', CAST(N'2022-06-28T03:08:29.737' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', -9, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'657f6d82-c7c9-4e58-9792-5d3e68cc731a', CAST(N'2022-06-28T03:06:58.070' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', -20, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'e7e57a6d-733f-4e86-b786-5d8ded2381c6', CAST(N'2022-06-28T03:08:29.760' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 20, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'5a29cb4c-4b11-4b55-ab84-5f5a1412f671', CAST(N'2022-06-28T03:06:58.160' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', -5, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'19126c0a-271b-4389-95de-6274209a5b42', CAST(N'2022-06-28T03:06:58.130' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', 20, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'6e2a3adb-422a-4f46-a2cc-673baf8f5653', CAST(N'2022-06-28T03:06:58.203' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'942701b3-522b-445d-aa0a-efff92f30b83', -15, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'69434253-02cd-4627-9b9e-6be043e92f80', CAST(N'2022-06-28T03:06:58.343' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'20ac1793-305d-480f-955f-782784127424', -10, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'26307a41-ba63-40c2-a31a-6c8bd16cd1a0', CAST(N'2022-06-28T03:06:58.347' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'20ac1793-305d-480f-955f-782784127424', 10, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'84026431-69d6-4162-84e4-738882c51170', CAST(N'2022-06-28T03:23:46.783' AS DateTime), N'Debit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'ca2ff066-5498-4193-8d4d-2357207fe793', 0, NULL, N'CUST20220628032346_8c7ae', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'70a46e3f-5baf-4d6c-87ec-8548cd1cff16', CAST(N'2022-06-28T03:06:58.223' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', -9, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'254cf369-04ce-467c-9cf6-864e40341071', CAST(N'2022-06-28T03:06:58.167' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 5, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'f4d0e5a9-3a6a-4797-9e54-873498c1348a', CAST(N'2022-06-28T03:08:29.790' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', -5, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'be12fecb-9f90-4e9f-bfef-8eab71165ac4', CAST(N'2022-06-28T03:08:29.873' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 6, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'9ce23542-594d-48af-99dd-91667b64edf7', CAST(N'2022-06-28T03:06:58.280' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'1d5666ae-0016-45f9-9db8-adce224838d9', -19, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'5259af76-6510-4dc2-9975-923da39903a2', CAST(N'2022-06-28T03:17:44.277' AS DateTime), N'Debit', N'Inventory', N'Customer', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', -1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'22b53ede-7593-43e8-92b6-ce1a63076bfc', 0, NULL, N'CUST20220628031744_26e78', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2e501bb6-c3ae-4115-a3fa-93f1dce39a33', CAST(N'2022-06-28T03:06:58.367' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', -12, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'adb0fd74-b906-410e-9106-948ebf0630ee', CAST(N'2022-06-28T03:30:59.003' AS DateTime), N'Credit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'5e73e5b0-e06d-47a8-9048-544a1ffc01e5', 0, NULL, N'CUST20220628033058_aa384', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'22bc086d-c458-4862-82c8-97d4c4ca1204', CAST(N'2022-06-28T03:06:58.187' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'17dab944-257f-4e31-90db-63d1857b4b4e', 8, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'530cd879-c416-4ca3-88c9-9c020d23a4d0', CAST(N'2022-06-28T03:08:29.817' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'17dab944-257f-4e31-90db-63d1857b4b4e', 8, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'44bca613-c15d-4b8d-a1bc-a118716cc8f4', CAST(N'2022-06-28T03:23:46.900' AS DateTime), N'Debit', N'Inventory', N'Customer', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', -1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'b3cc6720-1f08-4b80-98f1-4120f77be279', 0, NULL, N'CUST20220628032346_8c7ae', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'0eeed27a-91a9-40de-945d-a267c84ec568', CAST(N'2022-06-28T03:08:29.753' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'905dc5ba-a5d4-4d46-898c-115ae9c239c9', -20, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'bc764515-f20d-45bb-9cb7-aac0a1be2e8d', CAST(N'2022-06-28T03:06:58.307' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'1d5666ae-0016-45f9-9db8-adce224838d9', 19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2caad959-25dc-4f56-8520-b7e7d373dabc', CAST(N'2022-06-28T03:23:46.903' AS DateTime), N'Credit', N'Inventory', N'Customer', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'b3cc6720-1f08-4b80-98f1-4120f77be279', 0, NULL, N'CUST20220628032346_8c7ae', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'01770c07-0e22-42e0-9668-bc60cc766f71', CAST(N'2022-06-28T03:08:29.723' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'942701b3-522b-445d-aa0a-efff92f30b83', 15, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'2a0035cf-1971-4639-8c67-be47ba6fdea0', CAST(N'2022-06-28T03:08:29.867' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -6, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'c8491430-9b72-4a86-a17a-cc64a6b235fe', CAST(N'2022-06-28T03:08:29.717' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'942701b3-522b-445d-aa0a-efff92f30b83', -15, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'f44e4ef3-efa7-4ae4-8b46-d5f14fb9c2e0', CAST(N'2022-06-28T03:08:29.740' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'd18545c7-9f0c-41a4-bb9d-d228e66cbd30', 9, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'8c728982-b176-41b9-916e-d75d29ac79e1', CAST(N'2022-06-28T03:06:58.373' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'dc57bdbb-f747-4b52-a926-432eb4cbb131', 12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'ca072f8e-022b-49ef-9984-da49d7e69277', CAST(N'2022-06-28T03:06:58.180' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'17dab944-257f-4e31-90db-63d1857b4b4e', -8, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'b736ed26-e363-4d5d-8d87-db8f12c9fd78', CAST(N'2022-06-28T03:08:29.683' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 19, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'6daaa3a7-6dfc-4b09-af0d-dca774e8b49c', CAST(N'2022-06-28T03:08:29.697' AS DateTime), N'Debit', N'Inventory', N'Intransit', N'e78459c1-e632-4372-8760-b9a76f76cb1b', -12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'71836276-da45-4de3-ae6f-e342083fcd4f', CAST(N'2022-06-28T03:06:58.263' AS DateTime), N'Credit', N'Inventory', N'Intransit', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', 6, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'23c2c639-06a2-447a-af95-e39ccda5d1f3', CAST(N'2022-06-28T03:08:29.700' AS DateTime), N'Credit', N'Inventory', N'Delivered', N'e78459c1-e632-4372-8760-b9a76f76cb1b', 12, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', N'4315cd17-58ec-48c4-9fcb-612824177884')
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'27e83edf-adf2-4925-a416-f9c6051d1f9c', CAST(N'2022-06-28T03:17:44.213' AS DateTime), N'Credit', N'Inventory', N'Customer', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', 1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'5ae16cff-14c8-4d1c-90db-8aa7bb066c7e', 0, NULL, N'CUST20220628031744_26e78', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'a93d5667-219f-4a47-89a9-fa5280f64c73', CAST(N'2022-06-28T03:30:58.977' AS DateTime), N'Debit', N'Inventory', N'Customer', N'c4e99c99-66e4-4547-b1b7-03e30e71d7e9', -2, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'5e73e5b0-e06d-47a8-9048-544a1ffc01e5', 0, NULL, N'CUST20220628033058_aa384', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'89929ee0-3433-4698-b3ef-fe8c84744ac4', CAST(N'2022-06-28T03:17:44.287' AS DateTime), N'Credit', N'Inventory', N'Customer', N'6f8b159e-6f49-45ae-8c0c-239cae5996e0', 1, 1, N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'Verified', N'138dd8b4-6465-471f-bfde-313d7d54c7fa', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'22b53ede-7593-43e8-92b6-ce1a63076bfc', 0, NULL, N'CUST20220628031744_26e78', NULL)
INSERT [dbo].[InventoryTransaction] ([Id], [DateInserted], [EntryType], [TransactionType], [TrackingStatus], [InventoryId], [Quantity], [Accepted], [AcceptedByUserId], [VerifiedStatus], [ProcessById], [LocationVendorId], [DestinationVendorId], [OrderItemId], [Deleted], [DeletedById], [TrackingNumber], [InventoryCertificateId]) VALUES (N'5b3c7807-4750-455f-8a62-ff0389c3bbaa', CAST(N'2022-06-28T03:06:58.143' AS DateTime), N'Debit', N'Inventory', N'PreTransit', N'871d1ede-bbc8-4dd8-a73c-5b6d45739f73', -19, 0, NULL, N'Verified', N'ffc86668-e800-49b0-8de7-cdd843ddce9e', N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', NULL, 0, NULL, N'AEON_20220628030658_46f73', NULL)
GO
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'fd1334de-5420-4b73-a201-aad9df1e9f75', CAST(N'2022-06-28T03:23:46.603' AS DateTime), N'84b8474d-2c5e-4d9c-b663-3c3847124514', N'AEON_20220628032346_9b5f3')
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'dc1e060d-3170-47fc-8163-c7df1a4076ec', CAST(N'2022-06-28T03:17:44.150' AS DateTime), N'84b8474d-2c5e-4d9c-b663-3c3847124514', N'AEON_20220628031744_4c6eb')
INSERT [dbo].[Order] ([Id], [DateInserted], [CustomerId], [OrderNumber]) VALUES (N'a9e4dba7-6069-472b-88e8-caac795cd06c', CAST(N'2022-06-28T03:30:58.890' AS DateTime), N'9f798fc5-2191-4b72-a2f3-7e05fb104237', N'AEON_20220628033058_c727b')
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'ca2ff066-5498-4193-8d4d-2357207fe793', N'fd1334de-5420-4b73-a201-aad9df1e9f75')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'f02f2db6-4b0d-463b-9ad3-2e167b24d288', N'a9e4dba7-6069-472b-88e8-caac795cd06c')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'b3cc6720-1f08-4b80-98f1-4120f77be279', N'fd1334de-5420-4b73-a201-aad9df1e9f75')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'5e73e5b0-e06d-47a8-9048-544a1ffc01e5', N'a9e4dba7-6069-472b-88e8-caac795cd06c')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'5ae16cff-14c8-4d1c-90db-8aa7bb066c7e', N'dc1e060d-3170-47fc-8163-c7df1a4076ec')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'489ff1d2-ffd0-4e53-9a12-ae272a88aeba', N'dc1e060d-3170-47fc-8163-c7df1a4076ec')
INSERT [dbo].[OrderItem] ([Id], [OrderId]) VALUES (N'22b53ede-7593-43e8-92b6-ce1a63076bfc', N'dc1e060d-3170-47fc-8163-c7df1a4076ec')
GO
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'995b5808-12e9-4bd3-be9e-14ac88d979bc', N'Silverton-SilverMall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'd996ac8a-b383-46d0-b7b4-1edd8453f082', N'Quagga Center ', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'279df98c-bbdf-4863-9bc9-2dc647ff44c0', N'Customer', NULL, N'012265', N'Customer')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'812eda8d-f1df-4462-ac02-3ce048375d07', N'Tshwane Regional Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'03238c20-5083-4f01-aab0-459f59cbd82c', N'Distributor - Praise ', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'3c25cfb4-6135-43a7-a142-5929306b8eb0', N'Bloed Street Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'4837f3be-1bcd-44d6-99ed-74f52bd967b0', N'Production', NULL, N'012012012', N'Production')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'67b87e50-5a12-4771-8527-9f2e5f7f7640', N'Mams Mall', NULL, NULL, N'Vendor')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'5464ffd8-ec46-4ea8-b6de-bb4f5e39eacf', N'Main Warehouse', NULL, N'01223865', N'Warehouse')
INSERT [dbo].[Vendor] ([Id], [Name], [Code], [ContactNumber], [Type]) VALUES (N'855c30f2-b8fd-4f80-b47a-f2724ee4c87e', N'DemoVendor', NULL, N'0761435085', N'Vendor')
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
/****** Object:  StoredProcedure [dbo].[get_VendorInvoice]    Script Date: 28/06/2022 13:57:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_VendorInvoice]

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
/****** Object:  StoredProcedure [dbo].[get_VendorInvoiceByVendorId]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CurrentStockTakingByVendorId]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExistingStockCountSheet]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_generateInventoryCertificate]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getInventoryInStockByVendor]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getPrevStockTakingByCertificateId]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_StockCountSheet]    Script Date: 28/06/2022 13:57:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VendorStockCountSheetByVendorId]    Script Date: 28/06/2022 13:57:10 PM ******/
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
