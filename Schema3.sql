USE [master]
GO
/****** Object:  Database [URMDB]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE DATABASE [URMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'URMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\URMDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'URMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\URMDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [URMDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [URMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [URMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [URMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [URMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [URMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [URMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [URMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [URMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [URMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [URMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [URMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [URMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [URMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [URMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [URMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [URMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [URMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [URMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [URMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [URMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [URMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [URMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [URMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [URMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [URMDB] SET  MULTI_USER 
GO
ALTER DATABASE [URMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [URMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [URMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [URMDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [URMDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'URMDB', N'ON'
GO
USE [URMDB]
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_Card]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[CIM_Card] AS TABLE(
	[CardId] [int] NULL,
	[CardName] [varchar](100) NOT NULL,
	[ShortName] [varchar](100) NOT NULL,
	[CardTypeId] [int] NOT NULL,
	[CardPaymentTypeId] [int] NOT NULL,
	[PlasticTypeId] [int] NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_CardPaymentType]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[CIM_CardPaymentType] AS TABLE(
	[CardPaymentTypeId] [int] NULL,
	[CardpaymentTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_CardType]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[CIM_CardType] AS TABLE(
	[CardTypeId] [int] NULL,
	[CardTypeName] [nvarchar](10) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_PlasticType]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[CIM_PlasticType] AS TABLE(
	[PlasticTypeId] [int] NULL,
	[PlasticTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Stock]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[Stock] AS TABLE(
	[StockId] [int] NULL,
	[CardId] [int] NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_Role]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[URM_Role] AS TABLE(
	[RoleId] [int] NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_User]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[URM_User] AS TABLE(
	[UserId] [int] NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [bit] NULL,
	[CNIC] [varchar](20) NULL,
	[FullPic] [varchar](500) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[PassHint] [varchar](50) NULL,
	[RemMe] [bit] NULL,
	[RoleId] [int] NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_UserRole]    Script Date: 1/10/2020 8:03:03 PM ******/
CREATE TYPE [dbo].[URM_UserRole] AS TABLE(
	[UserRoleID] [int] NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  Table [dbo].[tbl_CIM_Card]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [varchar](100) NOT NULL,
	[ShortName] [varchar](100) NOT NULL,
	[CardTypeId] [int] NOT NULL,
	[CardPaymentTypeId] [int] NOT NULL,
	[PlasticTypeId] [int] NOT NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_CIM_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CIM_CardPaymentType]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_CardPaymentType](
	[CardPaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CardpaymentTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_CardPaymentType] PRIMARY KEY CLUSTERED 
(
	[CardPaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CIM_CardType]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_CardType](
	[CardTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CardTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CIM_PlasticType]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_PlasticType](
	[PlasticTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PlasticTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PlasticType] PRIMARY KEY CLUSTERED 
(
	[PlasticTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Stock]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_Role]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_URM_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_User]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CNIC] [varchar](20) NULL,
	[FullPic] [varchar](500) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[PassHint] [varchar](50) NULL,
	[RemMe] [bit] NULL,
	[RoleId] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_URM_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_UserRole]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_URM_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_CIM_Card] ON 

INSERT [dbo].[tbl_CIM_Card] ([CardId], [CardName], [ShortName], [CardTypeId], [CardPaymentTypeId], [PlasticTypeId], [Status], [CreatedOn], [ModifiedOn]) VALUES (1, N'Visa Gold', N'VD1 ', 1, 1, 1, 1, CAST(N'2020-01-09T20:13:42.317' AS DateTime), CAST(N'2020-01-09T20:13:42.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_CIM_Card] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardPaymentType] ON 

INSERT [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId], [CardpaymentTypeName], [Status]) VALUES (1, N'Credit', 1)
INSERT [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId], [CardpaymentTypeName], [Status]) VALUES (2, N'Debit', 1)
INSERT [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId], [CardpaymentTypeName], [Status]) VALUES (3, N'WTF', 0)
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardPaymentType] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardType] ON 

INSERT [dbo].[tbl_CIM_CardType] ([CardTypeId], [CardTypeName], [Status]) VALUES (1, N'Visa', 1)
INSERT [dbo].[tbl_CIM_CardType] ([CardTypeId], [CardTypeName], [Status]) VALUES (2, N'Master', 1)
INSERT [dbo].[tbl_CIM_CardType] ([CardTypeId], [CardTypeName], [Status]) VALUES (3, N'Local', 0)
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardType] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_PlasticType] ON 

INSERT [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId], [PlasticTypeName], [Status]) VALUES (1, N'Chip', 1)
INSERT [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId], [PlasticTypeName], [Status]) VALUES (2, N'Master Chip', 1)
INSERT [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId], [PlasticTypeName], [Status]) VALUES (3, N'Local', 0)
SET IDENTITY_INSERT [dbo].[tbl_CIM_PlasticType] OFF
SET IDENTITY_INSERT [dbo].[tbl_Stock] ON 

INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (1, 1, 13, CAST(N'2020-01-10T13:22:24.800' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (2, 1, 20, CAST(N'2020-01-10T13:22:34.017' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (3, 1, 12, CAST(N'2020-01-10T16:46:21.567' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (4, 1, 12, CAST(N'2020-01-10T16:46:54.327' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (5, 1, 12, CAST(N'2020-01-10T16:47:59.390' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (6, 1, 13, CAST(N'2020-01-10T16:48:45.627' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (7, 1, 14, CAST(N'2020-01-10T16:49:19.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Stock] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_Role] ON 

INSERT [dbo].[tbl_URM_Role] ([RoleId], [RoleName], [RoleDescription], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, N'Admin', N'Administator', NULL, NULL, 1)
INSERT [dbo].[tbl_URM_Role] ([RoleId], [RoleName], [RoleDescription], [CreatedOn], [ModifiedOn], [Status]) VALUES (2, N'User', N'Normal User', NULL, NULL, 1)
INSERT [dbo].[tbl_URM_Role] ([RoleId], [RoleName], [RoleDescription], [CreatedOn], [ModifiedOn], [Status]) VALUES (3, N'Temp', N'Temp', CAST(N'2020-01-09T16:00:35.480' AS DateTime), CAST(N'2020-01-09T16:00:35.480' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_Role] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_User] ON 

INSERT [dbo].[tbl_URM_User] ([UserId], [FirstName], [LastName], [Gender], [CNIC], [FullPic], [UserName], [Password], [PassHint], [RemMe], [RoleId], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, N'vif', N'tech', 1, N'121', NULL, N'vif', N'vif', N'vif', 0, 1, CAST(N'2020-01-09T15:48:31.310' AS DateTime), CAST(N'2020-01-09T15:48:31.310' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_User] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_UserRole] ON 

INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [UserId], [RoleId], [Type], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, 1, 1, N'Model', N'User', NULL, NULL, 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [UserId], [RoleId], [Type], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (2, 1, 1, N'Model', N'Role', NULL, NULL, 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [UserId], [RoleId], [Type], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (9, 1, 1, N'Model', N'Card', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_UserRole] OFF
ALTER TABLE [dbo].[tbl_CIM_Card]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_CardPaymentType_tbl_CIM_Card] FOREIGN KEY([CardPaymentTypeId])
REFERENCES [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId])
GO
ALTER TABLE [dbo].[tbl_CIM_Card] CHECK CONSTRAINT [FK_tbl_CIM_CardPaymentType_tbl_CIM_Card]
GO
ALTER TABLE [dbo].[tbl_CIM_Card]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_CardType_tbl_CIM_Card] FOREIGN KEY([CardTypeId])
REFERENCES [dbo].[tbl_CIM_CardType] ([CardTypeId])
GO
ALTER TABLE [dbo].[tbl_CIM_Card] CHECK CONSTRAINT [FK_tbl_CIM_CardType_tbl_CIM_Card]
GO
ALTER TABLE [dbo].[tbl_CIM_Card]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_PlasticType_tbl_CIM_Card] FOREIGN KEY([PlasticTypeId])
REFERENCES [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId])
GO
ALTER TABLE [dbo].[tbl_CIM_Card] CHECK CONSTRAINT [FK_tbl_CIM_PlasticType_tbl_CIM_Card]
GO
ALTER TABLE [dbo].[tbl_URM_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_URM_Role_tbl_URM_User] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_URM_Role] ([RoleId])
GO
ALTER TABLE [dbo].[tbl_URM_User] CHECK CONSTRAINT [FK_tbl_URM_Role_tbl_URM_User]
GO
ALTER TABLE [dbo].[tbl_URM_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_tbl_URM_User_tbl_URM_UserRole] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_URM_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_URM_UserRole] CHECK CONSTRAINT [FK_tbl_URM_User_tbl_URM_UserRole]
GO
ALTER TABLE [dbo].[tbl_URM_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_tbl_URM_UserRole_tbl_URM_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_URM_Role] ([RoleId])
GO
ALTER TABLE [dbo].[tbl_URM_UserRole] CHECK CONSTRAINT [FK_tbl_URM_UserRole_tbl_URM_Role]
GO
/****** Object:  StoredProcedure [dbo].[CIM_CardDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_Card t WHERE t.CardId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[CIM_CardInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CIM_CardInsert] 
	@ParamTable1 CIM_Card READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardName FROM tbl_CIM_Card WHERE LOWER(CardName) = (SELECT LOWER(p.CardName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_CIM_Card SELECT CardName,ShortName,CardTypeId,CardPaymentTypeId,PlasticTypeId,1,GETDATE(), GETDATE()
		FROM  @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_CardPaymentType t WHERE t.CardPaymentTypeId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CIM_CardPaymentTypeInsert] 
	@ParamTable1 CIM_CardPaymentType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardPaymentTypeName FROM tbl_CIM_CardPaymentType WHERE LOWER(CardPaymentTypeName) = (SELECT LOWER(p.CardPaymentTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_CIM_CardPaymentType SELECT p.CardPaymentTypeName, 1 FROM  @ParamTable1 p
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CIM_CardPaymentTypeSelectAll] 
	AS
	BEGIN 
		SELECT t.CardPaymentTypeId,t.CardPaymentTypeName FROM tbl_CIM_CardPaymentType t WHERE  t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.CardPaymentTypeId,t.CardPaymentTypeName FROM tbl_CIM_CardPaymentType t WHERE t.CardPaymentTypeId = @ParamTable1 AND t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeUpdate] 
		@ParamTable1 CIM_CardPaymentType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardPaymentTypeName  FROM tbl_CIM_CardPaymentType WHERE LOWER(CardPaymentTypeName) = (SELECT LOWER(p.CardPaymentTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET t.CardPaymentTypeName = p.CardPaymentTypeName FROM tbl_CIM_CardPaymentType t INNER JOIN @ParamTable1 p ON t.CardPaymentTypeId = p.CardPaymentTypeId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardSelectAll] 
	AS
	BEGIN 
		SELECT t.CardId,t.CardName,t.ShortName,t.CardTypeId,ct.CardTypeName,
		t.CardPaymentTypeId,cpt.CardPaymentTypeName,
		t.PlasticTypeId,pt.PlasticTypeName
		FROM tbl_CIM_Card t
		INNER JOIN tbl_CIM_CardType ct On ct.CardTypeId=t.CardTypeId
		INNER JOIN tbl_CIM_CardPaymentType cpt On cpt.CardPaymentTypeId=t.CardPaymentTypeId
		INNER JOIN tbl_CIM_PlasticType pt On pt.PlasticTypeId=t.PlasticTypeId
		 WHERE  t.Status = 1
	END

GO
/****** Object:  StoredProcedure [dbo].[CIM_CardSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.CardId,t.CardName,t.ShortName,t.CardTypeId,t.CardPaymentTypeId,t.PlasticTypeId 
		FROM tbl_CIM_Card t WHERE t.CardId = @ParamTable1 AND t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardTypeDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_CardType t WHERE t.CardTypeId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CIM_CardTypeInsert] 
	@ParamTable1 CIM_CardType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardTypeName FROM tbl_CIM_CardType WHERE LOWER(CardTypeName) = (SELECT LOWER(p.CardTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_CIM_CardType SELECT p.CardTypeName, 1 FROM  @ParamTable1 p
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CIM_CardTypeSelectAll] 
	AS
	BEGIN 
		SELECT t.CardTypeId,t.CardTypeName FROM tbl_CIM_CardType t WHERE  t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardTypeSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.CardTypeId,t.CardTypeName FROM tbl_CIM_CardType t WHERE t.CardTypeId = @ParamTable1 AND t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardTypeUpdate] 
		@ParamTable1 CIM_CardType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardTypeName  FROM tbl_CIM_CardType WHERE LOWER(CardTypeName) = (SELECT LOWER(p.CardTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET t.CardTypeName = p.CardTypeName FROM tbl_CIM_CardType t INNER JOIN @ParamTable1 p ON t.CardTypeId = p.CardTypeId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_CardUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_CardUpdate] 
		@ParamTable1 CIM_Card READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT CardName FROM tbl_CIM_Card WHERE LOWER(CardName) = (SELECT LOWER(p.CardName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET 
		t.CardName = p.CardName,
		t.ShortName = p.ShortName,
		t.CardTypeId = p.CardTypeId,
		t.CardPaymentTypeId = p.CardPaymentTypeId,
		t.PlasticTypeId = p.PlasticTypeId
		FROM tbl_CIM_Card t INNER JOIN @ParamTable1 p ON t.CardId = p.CardId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_PlasticTypeDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_PlasticType t WHERE t.PlasticTypeId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CIM_PlasticTypeInsert] 
	@ParamTable1 CIM_PlasticType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT PlasticTypeName FROM tbl_CIM_PlasticType WHERE LOWER(PlasticTypeName) = (SELECT LOWER(p.PlasticTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_CIM_PlasticType SELECT p.PlasticTypeName, 1 FROM  @ParamTable1 p
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CIM_PlasticTypeSelectAll] 
	AS
	BEGIN 
		SELECT t.PlasticTypeId,t.PlasticTypeName FROM tbl_CIM_PlasticType t WHERE  t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_PlasticTypeSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.PlasticTypeId,t.PlasticTypeName FROM tbl_CIM_PlasticType t WHERE t.PlasticTypeId = @ParamTable1 AND t.Status = 1
	END


GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CIM_PlasticTypeUpdate] 
		@ParamTable1 CIM_PlasticType READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT PlasticTypeName  FROM tbl_CIM_PlasticType WHERE LOWER(PlasticTypeName) = (SELECT LOWER(p.PlasticTypeName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET t.PlasticTypeName = p.PlasticTypeName FROM tbl_CIM_PlasticType t INNER JOIN @ParamTable1 p ON t.PlasticTypeId = p.PlasticTypeId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[StockInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[StockInsert] 

		@ParamTable1	Stock READONLY

	AS
	BEGIN
	INSERT INTO tbl_Stock SELECT CardId,Quantity,GETDATE() FROM @ParamTable1 

			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[StockSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSelectAll] 

	AS

	BEGIN 

		SELECT t.StockId,t.CardId,c.CardName,t.Quantity,t.LastUpdate FROM tbl_Stock t 
		INNER JOIN tbl_CIM_Card c on c.CardId=t.CardId
	END

GO
/****** Object:  StoredProcedure [dbo].[StockSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StockSelectById] 
		@ParamTable1	int 
	AS
	BEGIN 
		SELECT t.StockId,t.CardId,t.Quantity,t.LastUpdate FROM tbl_Stock t 
		WHERE t.StockId = @ParamTable1
	END
GO
/****** Object:  StoredProcedure [dbo].[StockUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockUpdate] 

		@ParamTable1	Stock READONLY

	AS

	BEGIN
		UPDATE t SET t.CardId = p.CardId,t.Quantity = p.Quantity,t.LastUpdate = GETDATE() FROM tbl_Stock t INNER JOIN @ParamTable1 p ON t.StockId = p.StockId 

			SELECT 'OK' [ReturnMessage]
		END

GO
/****** Object:  StoredProcedure [dbo].[System_ClassGenerator]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[System_ClassGenerator]
	@Name	nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	--from SO: http://stackoverflow.com/questions/5873170/generate-class-from-database-table

declare @TableName sysname = @Name

declare @Result varchar(max) = 'public class ' + @TableName + '
{'

select @Result = @Result + '
    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }
'
from
(
    select 
        replace(col.name, ' ', '_') ColumnName,
        column_id ColumnId,
        case typ.name 
            when 'bigint' then 'long'
            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'string'
            when 'date' then 'DateTime'
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'float'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'char'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'double'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'DateTime'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
            else 'UNKNOWN_' + typ.name
        end ColumnType,
        case 
            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
            then '?' 
            else '' 
        end NullableSign
    from sys.columns col
        join sys.types typ on
            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
    where object_id = object_id(@TableName)
) t
order by ColumnId

set @Result = @Result  + '
}'

print @Result 

END





GO
/****** Object:  StoredProcedure [dbo].[System_CreateDeleteProcedure]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateDeleteProcedure]
	@TableName nvarchar(100),
	@TVPName nvarchar(100)	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Query varchar(MAX);
	SET @Query = 'UPDATE t SET t.Status = 0 FROM '+ @TableName +' t WHERE t.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +' = @ParamTable1'
			

	DECLARE @FQuery varchar(MAX);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'Delete] ' + CHAR(13)  + '
		@ParamTable1	int' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN
		'+  @Query +' ' + CHAR(13)  + '
			SELECT ''OK'' [ReturnMessage]
		END'
	
	EXEC  (@FQuery)

END

GO
/****** Object:  StoredProcedure [dbo].[System_CreateSaveProcedure]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSaveProcedure]
	@TableName nvarchar(100),
	@TVPName	nvarchar(100)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Insert_Query nvarchar(MAX) ;
	DECLARE @Validation_Query nvarchar(MAX) ;
	SELECT @Insert_Query = 'INSERT INTO '+ @TableName +' SELECT ';
	SET @Validation_Query = 'SELECT * FROM ' +@TableName+ ' WHERE ';
	DECLARE @Counter int;
	SELECT @Counter = 2;

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)-3)
	BEGIN 
		SELECT @Insert_Query = @Insert_Query + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		
		--For Validation of Data
		SELECT @Validation_Query = @Validation_Query + 'LOWER('+ COLUMN_NAME +') = (SELECT LOWER(p.'+ COLUMN_NAME +') FROM @ParamTable1 p) AND ' 
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Insert_Query = @Insert_Query + 'GETDATE(),GETDATE(),1 FROM  @ParamTable1'
	SELECT @Validation_Query = SUBSTRING(@Validation_Query, 0, LEN(@Validation_Query)-3)


	DECLARE @FQuery varchar(MAX);
	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'Insert] ' + CHAR(13)  + '
		@ParamTable1	'+ @TVPName +' READONLY' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		IF EXISTS ( '+ @Validation_Query +' )
		BEGIN
			SELECT ''Record Already Exists'' [ReturnMessage]
		END
		ELSE
		BEGIN
		'+  @Insert_Query +' ' + CHAR(13)  + '
			SELECT ''OK'' [ReturnMessage]
		END
	END'

	EXEC  (@FQuery)

END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateSaveProcedureNoStatus]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSaveProcedureNoStatus]
	@TableName nvarchar(100),
	@TVPName	nvarchar(100)	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Insert_Query nvarchar(MAX) ;
	DECLARE @Validation_Query nvarchar(MAX) ;
	SELECT @Insert_Query = 'INSERT INTO '+ @TableName +' SELECT ';
	SET @Validation_Query = 'SELECT * FROM ' +@TableName+ ' WHERE ';
	DECLARE @Counter int;
	SELECT @Counter = 2;

	WHILE @Counter <= (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)
	BEGIN 
		SELECT @Insert_Query = @Insert_Query + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		
		--For Validation of Data
		SELECT @Validation_Query = @Validation_Query + 'LOWER('+ COLUMN_NAME +') = (SELECT LOWER(p.'+ COLUMN_NAME +') FROM @ParamTable1 p) AND ' 
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Insert_Query = SUBSTRING(@Insert_Query,0,Len(@Insert_Query)) + ' FROM @ParamTable1'
	SELECT @Validation_Query = SUBSTRING(@Validation_Query, 0, LEN(@Validation_Query)-3)


	DECLARE @FQuery varchar(MAX);
	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'Insert] ' + CHAR(13)  + '
		@ParamTable1	'+ @TVPName +' READONLY' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		IF EXISTS ( '+ @Validation_Query +' )
		BEGIN
			SELECT ''Record Already Exists'' [ReturnMessage]
		END
		ELSE
		BEGIN
		'+  @Insert_Query +' ' + CHAR(13)  + '
			SELECT ''OK'' [ReturnMessage]
		END
	END'
	Print(@FQUERY)
	EXEC  (@FQuery)

END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectAllProcedure]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSelectAllProcedure]
	@TableName	nvarchar(100),
	@TVPName	nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Select_Query nvarchar(MAX) ;
	SELECT @Select_Query = 'SELECT ';
	DECLARE @Counter int;
	SELECT @Counter = 1;

	WHILE @Counter <= (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t WHERE t.Status = 1'

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName+ 'SelectAll' +'] ' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'

	EXEC  (@FQuery)

END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectAllProcedureNoStatus]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSelectAllProcedureNoStatus]
	@TableName	nvarchar(100),
	@TVPName	nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Select_Query nvarchar(MAX) ;
	SELECT @Select_Query = 'SELECT ';
	DECLARE @Counter int;
	SELECT @Counter = 1;

	WHILE @Counter <= (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t '

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName+ 'SelectAll' +'] ' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'

	EXEC  (@FQuery)

END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectByIdProcedure]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSelectByIdProcedure]
	@TableName	nvarchar(100),
	@TVPName	nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Select_Query nvarchar(MAX) ;
	SELECT @Select_Query = 'SELECT ';
	DECLARE @Counter int;
	SELECT @Counter = 1;

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName))
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END
	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t WHERE t.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +' = @ParamTable1 AND t.Status = 1'

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'SelectById] ' + CHAR(13)  + '
		@ParamTable1	int ' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'
	--SELECT @FQuery
	EXEC  (@FQuery)
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectByIdProcedureNoStatus]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSelectByIdProcedureNoStatus]
	@TableName	nvarchar(100),
	@TVPName	nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Select_Query nvarchar(MAX) ;
	SELECT @Select_Query = 'SELECT ';
	DECLARE @Counter int;
	SELECT @Counter = 1;

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName))
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END
	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t WHERE t.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +' = @ParamTable1'

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'SelectById] ' + CHAR(13)  + '
		@ParamTable1	int ' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'
	--SELECT @FQuery
	EXEC  (@FQuery)
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateTableBasicImplmentation]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateTableBasicImplmentation]
	@TableName		varchar(MAX),
	@TVPName		varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			--For Creation of TVP
			EXEC [System_CreateTVPForTable] @TableName, @TVPName

			--For Save Stored Procedure
			EXEC [System_CreateSaveProcedureWithValidation] @TableName, @TVPName

			--For GetAll Stored Procedure
			EXEC [System_CreateSelectAllProcedure] @TableName, @TVPName

			--For Single Record By Id StoreProcedure
			EXEC [System_CreateSelectByIdProcedure] @TableName, @TVPName

			--For Update rows by ID StoredProcedure
			EXEC [System_CreateUpdateProcedureWithValidation] @TableName, @TVPName
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRAN
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateTableBasicImplmentationNoStatus]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateTableBasicImplmentationNoStatus]
	@TableName		varchar(MAX),
	@TVPName		varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			--For Creation of TVP
			EXEC [System_CreateTVPForTableNoStatus] @TableName, @TVPName

			--For Save Stored Procedure
			EXEC [System_CreateSaveProcedureWithValidationNoStatus] @TableName, @TVPName

			--For GetAll Stored Procedure
			EXEC [System_CreateSelectAllProcedureNoStatus] @TableName, @TVPName

			--For Single Record By Id StoreProcedure
			EXEC [System_CreateSelectByIdProcedureNoStatus] @TableName, @TVPName

			--For Update rows by ID StoredProcedure
			EXEC [System_CreateUpdateProcedureWithValidation] @TableName, @TVPName
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRAN
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateTVPForTable]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[System_CreateTVPForTable] 
	@TableName			nvarchar(100),
	@TVPName			nvarchar(100)
AS
BEGIN

	DECLARE @ColumnTable TABLE (RNumber int, CNames nvarchar(40), CTypes nvarchar(40));
	INSERT INTO @ColumnTable
	SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)), c.name, [ColumnType] = 
	CASE WHEN t.name = 'nvarchar' OR t.name = 'varchar'  THEN t.name+'('+ CASE WHEN c.max_length < 0 THEN 'MAX' ELSE CONVERT(nvarchar(10),c.max_length) END +')' ELSE t.name END
	FROM sys.columns c
	INNER JOIN sys.types t ON t.user_type_id = c.user_type_id
	LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
	LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
	WHERE
    c.object_id = OBJECT_ID(@TableName) 	
	

	DECLARE @FinalQuery nvarchar(MAX) = ''; 
	DECLARE @count int = 0;
	WHILE @count < ((SELECT COUNT(*) FROM @ColumnTable))
	BEGIN
		SELECT @FinalQuery = @FinalQuery + ',' + CNames +' '+ CTypes FROM @ColumnTable WHERE RNumber  = (@count+1);
		SELECT @count = @count + 1;
	END
	
	SELECT @FinalQuery = SUBSTRING(@FinalQuery, 2, LEN(@FinalQuery))
	
		--EXECUTE ('CREATE TYPE TVPTable AS TABLE ' + '(' + @FinalQuery+ ')')
	EXECUTE ('CREATE TYPE ' + @TVPName +  ' AS TABLE ' + '(' + @FinalQuery + ')')
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateTVPForTableNoStatus]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[System_CreateTVPForTableNoStatus] 
	@TableName			nvarchar(100),
	@TVPName			nvarchar(100)
AS
BEGIN

	DECLARE @ColumnTable TABLE (RNumber int, CNames nvarchar(40), CTypes nvarchar(40));
	INSERT INTO @ColumnTable
	SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)), c.name, [ColumnType] = 
	CASE WHEN t.name = 'nvarchar' OR t.name = 'varchar'  THEN t.name+'('+ CASE WHEN c.max_length < 0 THEN 'MAX' ELSE CONVERT(nvarchar(10),c.max_length) END +')' ELSE t.name END
	FROM sys.columns c
	INNER JOIN sys.types t ON t.user_type_id = c.user_type_id
	LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
	LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
	WHERE
    c.object_id = OBJECT_ID(@TableName) 	
	

	DECLARE @FinalQuery nvarchar(MAX) = ''; 
	DECLARE @count int = 0;
	WHILE @count < ((SELECT COUNT(*) FROM @ColumnTable))
	BEGIN
		SELECT @FinalQuery = @FinalQuery + ',' + CNames +' '+ CTypes FROM @ColumnTable WHERE RNumber  = (@count+1);
		SELECT @count = @count + 1;
	END
	
	SELECT @FinalQuery = SUBSTRING(@FinalQuery, 2, LEN(@FinalQuery))
	
		--EXECUTE ('CREATE TYPE TVPTable AS TABLE ' + '(' + @FinalQuery+ ')')
	EXECUTE ('CREATE TYPE ' + @TVPName +  ' AS TABLE ' + '(' + @FinalQuery + ')')
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateUpdateProcedure]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateUpdateProcedure]
	@TableName nvarchar(100),
	@TVPName	nvarchar(100)	
AS
BEGIN 

	SET NOCOUNT ON;
	
	DECLARE @Update_Query nvarchar(MAX) ;
	DECLARE @Validation_Query nvarchar(MAX) ;
	SELECT @Update_Query = 'UPDATE t SET ';
	SET @Validation_Query = 'SELECT * FROM ' +@TableName+ ' WHERE ';
	DECLARE @Counter int;
	SELECT @Counter = 2;

	WHILE @Counter <= (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName) 
	BEGIN 
		SELECT @Update_Query = @Update_Query + 't.'+COLUMN_NAME + ' = p.'+ COLUMN_NAME +','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Update_Query = SUBSTRING(@Update_Query, 0, LEN(@Update_Query))
	SELECT @Update_Query = @Update_Query + ' FROM '+ @TableName +' t INNER JOIN @ParamTable1 p ON t.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +' = p.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +''
	
	DECLARE @FQuery varchar(MAX);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'Update] ' + CHAR(13)  + '
		@ParamTable1	'+ @TVPName +' READONLY' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN
		'+  @Update_Query +' ' + CHAR(13)  + '
			SELECT ''OK'' [ReturnMessage]
		END'
	print(@FQuery)
	EXEC  (@FQuery)

END
GO
/****** Object:  StoredProcedure [dbo].[URM_IsAuthenticated]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_IsAuthenticated]  
	@ParamTable1		int,		--UserId
	@ParamTable2		varchar(100), --Type
	@ParamTable3		varchar(100) --Action
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT ur.UserRoleID FROM tbl_URM_UserRole ur
	WHERE  ur.UserId= @ParamTable1 AND ur.Type = @ParamTable2 AND ur.Name = @ParamTable3)
	BEGIN
		SELECT 1 [AccessType]
	END
	ELSE
	BEGIN
		SELECT 0 [AccessType]
	END	
END



GO
/****** Object:  StoredProcedure [dbo].[URM_Login]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_Login]
	@ParamTable1		varchar(100), --UserName
	@ParamTable2		varchar(100) --Password
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.UserId,u.RoleId
	FROM tbl_URM_User u 
	WHERE u.UserName = @ParamTable1 
	AND u.Password = @ParamTable2
	AND u.[Status] = 1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleDelete] 
		@ParamTable1	int --roleId
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_URM_Role t WHERE t.RoleId = @ParamTable1
			SELECT 'OK' [ReturnMessage]
		END



GO
/****** Object:  StoredProcedure [dbo].[URM_RoleInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[URM_RoleInsert] 
	@ParamTable1 URM_Role READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT RoleName,RoleDescription FROM tbl_URM_Role WHERE LOWER(RoleName) = (SELECT LOWER(p.RoleName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_URM_Role SELECT RoleName,RoleDescription,GETDATE(), GETDATE(), 1 FROM  @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END
	END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleSelectAll] 
	AS
	BEGIN 
		SELECT t.RoleId,t.RoleName,t.RoleDescription FROM tbl_URM_Role t WHERE  t.Status = 1
	END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SELECT BY ID
CREATE PROCEDURE [dbo].[URM_RoleSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.RoleName,t.RoleDescription FROM tbl_URM_Role t WHERE t.RoleId = @ParamTable1 AND t.Status = 1
	END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleUpdate] 
		@ParamTable1 URM_Role READONLY
	AS
	BEGIN
		UPDATE t SET t.RoleName = p.RoleName,t.RoleDescription = p.RoleDescription FROM tbl_URM_Role t INNER JOIN @ParamTable1 p ON t.RoleId = p.RoleId 
			SELECT 'OK' [ReturnMessage]
		END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserDelete]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[URM_UserDelete] 
		@ParamTable1	int 
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_URM_User where t.UserId = @ParamTable1
			SELECT 'OK' [ReturnMessage]
		END



GO
/****** Object:  StoredProcedure [dbo].[URM_UserInsert]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[URM_UserInsert] 
	@ParamTable1 URM_User READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT UserName,CNIC FROM tbl_URM_User WHERE LOWER(CNIC) = (SELECT LOWER(p.CNIC) FROM @ParamTable1 p) AND LOWER(UserName) = (SELECT LOWER(p.UserName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		INSERT INTO tbl_URM_User SELECT FirstName,LastName,Gender,CNIC,FullPic,UserName,Password,PassHint,
		RemMe,RoleId,GETDATE(), GETDATE(), 1 FROM  @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END
	END





GO
/****** Object:  StoredProcedure [dbo].[URM_UserRoleSelectbyId]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_UserRoleSelectbyId]
	@ParamTable1		int, --UserId
	@ParamTable2		int  --RoleId
AS
BEGIN
	SET NOCOUNT ON;

	Select ur.Name  FROM tbl_URM_UserRole ur 
	WHERE ur.UserId=@ParamTable1 AND ur.RoleId=@ParamTable2
	 
END

GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectAll]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_UserSelectAll] 
	AS
	BEGIN 
		SELECT t.UserId,t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName,t.Password,t.RoleId,r.RoleName
		FROM tbl_URM_User t 
		INNER JOIN tbl_URM_Role r On r.RoleId=t.RoleId
		WHERE  t.Status = 1
	END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectById]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_UserSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName,t.Password,t.RoleId 
		FROM tbl_URM_User t 
		WHERE t.UserId = @ParamTable1 AND t.Status = 1
	END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserUpdate]    Script Date: 1/10/2020 8:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[URM_UserUpdate] 
		@ParamTable1 URM_User READONLY
	AS
	BEGIN
		UPDATE t SET 
		t.FirstName=p.FirstName,
		t.LastName=p.LastName,
		t.Gender=p.Gender,
		t.CNIC=p.CNIC,
		t.FullPic=p.FullPic,
		t.UserName=p.UserName,
		t.RoleId = P.RoleId
		 FROM tbl_URM_User t INNER JOIN @ParamTable1 p ON t.UserId = p.UserId 
			SELECT 'OK' [ReturnMessage]
		END





GO
USE [master]
GO
ALTER DATABASE [URMDB] SET  READ_WRITE 
GO
