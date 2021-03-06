USE [InventoryMS]
GO
/****** Object:  Table [dbo].[ExpectedInventory]    Script Date: 2022/05/11 18:30:47 ******/
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
	[Counted] [bit] NOT NULL,
	[CountedDate] [datetime] NULL,
	[SendToVendor] [bit] NOT NULL,
 CONSTRAINT [PK_ExpectedInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inv_User]    Script Date: 2022/05/11 18:30:47 ******/
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
/****** Object:  Table [dbo].[Inventory]    Script Date: 2022/05/11 18:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryPrice]    Script Date: 2022/05/11 18:30:47 ******/
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 2022/05/11 18:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Inv_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorLocation]    Script Date: 2022/05/11 18:30:47 ******/
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
ALTER TABLE [dbo].[ExpectedInventory] ADD  CONSTRAINT [DF_ExpectedInventory_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Inv_User] ADD  CONSTRAINT [DF_Inv_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF_Product_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InventoryPrice] ADD  CONSTRAINT [DF_ProductPrice_Id]  DEFAULT (newid()) FOR [Id]
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
ALTER TABLE [dbo].[InventoryPrice]  WITH CHECK ADD  CONSTRAINT [FK508459716FB7] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[InventoryPrice] CHECK CONSTRAINT [FK508459716FB7]
GO
ALTER TABLE [dbo].[VendorLocation]  WITH CHECK ADD  CONSTRAINT [FKDB33CBFDAB18] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorLocation] CHECK CONSTRAINT [FKDB33CBFDAB18]
GO
