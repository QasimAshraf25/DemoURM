USE [master]
GO
/****** Object:  Database [VCIMDB]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE DATABASE [VCIMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'URMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\URMDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'URMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\URMDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VCIMDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VCIMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VCIMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VCIMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VCIMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VCIMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VCIMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VCIMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VCIMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VCIMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VCIMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VCIMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VCIMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VCIMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VCIMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VCIMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VCIMDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VCIMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VCIMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VCIMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VCIMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VCIMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VCIMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VCIMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VCIMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [VCIMDB] SET  MULTI_USER 
GO
ALTER DATABASE [VCIMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VCIMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VCIMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VCIMDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VCIMDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VCIMDB', N'ON'
GO
USE [VCIMDB]
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_Card]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[CIM_CardPaymentType]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[CIM_CardPaymentType] AS TABLE(
	[CardPaymentTypeId] [int] NULL,
	[CardpaymentTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_CardType]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[CIM_CardType] AS TABLE(
	[CardTypeId] [int] NULL,
	[CardTypeName] [nvarchar](10) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_Memo]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[CIM_Memo] AS TABLE(
	[MemoId] [int] NULL,
	[MemoDate] [date] NULL,
	[Total] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_MemoDetail]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[CIM_MemoDetail] AS TABLE(
	[MemoDetailId] [int] NULL,
	[MemoId] [int] NOT NULL,
	[CardId] [int] NOT NULL,
	[Quantity] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CIM_PlasticType]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[CIM_PlasticType] AS TABLE(
	[PlasticTypeId] [int] NULL,
	[PlasticTypeName] [nvarchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MISC_CreditReport]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[MISC_CreditReport] AS TABLE(
	[SINO] [int] NULL,
	[CardNo] [nvarchar](50) NULL,
	[CardCustNo] [nvarchar](50) NULL,
	[ReferenceNo] [nvarchar](50) NULL,
	[CardName] [nvarchar](50) NULL,
	[EmbossNo] [nvarchar](50) NULL,
	[CardType] [nvarchar](50) NULL,
	[Ind] [nvarchar](50) NULL,
	[PSINO] [nvarchar](50) NULL,
	[DlyChan] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Stock]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[Stock] AS TABLE(
	[StockId] [int] NULL,
	[CardId] [int] NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StockRemain]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[StockRemain] AS TABLE(
	[CardId] [int] NOT NULL,
	[StockLeft] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_Menu]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[URM_Menu] AS TABLE(
	[MenuId] [int] NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuURL] [nvarchar](max) NOT NULL,
	[ParentId] [int] NULL,
	[Header] [bit] NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_Role]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[URM_Role] AS TABLE(
	[RoleId] [int] NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_RoleMenu]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[URM_RoleMenu] AS TABLE(
	[RoleMenuId] [int] NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_User]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[URM_User] AS TABLE(
	[UserId] [int] NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [bit] NULL,
	[CNIC] [varchar](20) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[PassHint] [varchar](50) NULL,
	[RoleId] [int] NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_UserRole]    Script Date: 1/17/2020 7:05:26 PM ******/
CREATE TYPE [dbo].[URM_UserRole] AS TABLE(
	[UserRoleID] [int] NULL,
	[RoleId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [int] NULL
)
GO
/****** Object:  Table [dbo].[tbl_CIM_Card]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_CIM_CardPaymentType]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_CIM_CardType]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_CIM_Memo]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_Memo](
	[MemoId] [int] IDENTITY(1,1) NOT NULL,
	[MemoDate] [date] NOT NULL,
	[Total] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CIM_Memo] PRIMARY KEY CLUSTERED 
(
	[MemoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CIM_MemoDetail]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CIM_MemoDetail](
	[MemoDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemoId] [int] NOT NULL,
	[CardId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CIM_MemoDetail] PRIMARY KEY CLUSTERED 
(
	[MemoDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CIM_PlasticType]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_MISC_CreditReport]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MISC_CreditReport](
	[CRId] [int] IDENTITY(1,1) NOT NULL,
	[SINO] [int] NULL,
	[CardNo] [nvarchar](50) NULL,
	[CardCustNo] [nvarchar](50) NULL,
	[ReferenceNo] [nvarchar](50) NULL,
	[CardName] [nvarchar](50) NULL,
	[EmbossNo] [nvarchar](50) NULL,
	[CardType] [nvarchar](50) NULL,
	[Ind] [nvarchar](50) NULL,
	[PSINO] [nvarchar](50) NULL,
	[DlyChan] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[UploadedOn] [date] NOT NULL,
 CONSTRAINT [PK_tbl_MISC_CreditReport] PRIMARY KEY CLUSTERED 
(
	[CRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Stock]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_StockRemain]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StockRemain](
	[CardId] [int] NOT NULL,
	[StockLeft] [int] NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_Menu]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuURL] [nvarchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Header] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_URM_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_Role]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  Table [dbo].[tbl_URM_RoleMenu]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_RoleMenu](
	[RoleMenuId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_URM_RoleMenu] PRIMARY KEY CLUSTERED 
(
	[RoleMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_User]    Script Date: 1/17/2020 7:05:26 PM ******/
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
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[PassHint] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[tbl_URM_UserRole]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_URM_UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
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

INSERT [dbo].[tbl_CIM_Card] ([CardId], [CardName], [ShortName], [CardTypeId], [CardPaymentTypeId], [PlasticTypeId], [Status], [CreatedOn], [ModifiedOn]) VALUES (1, N'Visa Gold', N'VD1 ', 1, 1, 1, 1, CAST(N'2020-01-16T16:13:43.163' AS DateTime), CAST(N'2020-01-16T16:13:43.163' AS DateTime))
INSERT [dbo].[tbl_CIM_Card] ([CardId], [CardName], [ShortName], [CardTypeId], [CardPaymentTypeId], [PlasticTypeId], [Status], [CreatedOn], [ModifiedOn]) VALUES (2, N'Visa Saadiq Gold', N'IG4', 1, 1, 1, 1, CAST(N'2020-01-16T18:27:54.693' AS DateTime), CAST(N'2020-01-16T18:27:54.693' AS DateTime))
INSERT [dbo].[tbl_CIM_Card] ([CardId], [CardName], [ShortName], [CardTypeId], [CardPaymentTypeId], [PlasticTypeId], [Status], [CreatedOn], [ModifiedOn]) VALUES (3, N'Visa Platinum', N'VP1', 1, 1, 1, 1, CAST(N'2020-01-16T18:28:52.283' AS DateTime), CAST(N'2020-01-16T18:28:52.283' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_CIM_Card] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardPaymentType] ON 

INSERT [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId], [CardpaymentTypeName], [Status]) VALUES (1, N'Credit', 1)
INSERT [dbo].[tbl_CIM_CardPaymentType] ([CardPaymentTypeId], [CardpaymentTypeName], [Status]) VALUES (2, N'Debit', 1)
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardPaymentType] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardType] ON 

INSERT [dbo].[tbl_CIM_CardType] ([CardTypeId], [CardTypeName], [Status]) VALUES (1, N'Visa', 1)
INSERT [dbo].[tbl_CIM_CardType] ([CardTypeId], [CardTypeName], [Status]) VALUES (2, N'Master', 1)
SET IDENTITY_INSERT [dbo].[tbl_CIM_CardType] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_Memo] ON 

INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (1, CAST(N'2020-01-16' AS Date), 14, NULL, 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (2, CAST(N'2020-01-16' AS Date), 14, NULL, 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (3, CAST(N'2020-01-16' AS Date), 14, NULL, 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (4, CAST(N'2020-01-16' AS Date), 14, N'Nothing', 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (5, CAST(N'2020-01-16' AS Date), 14, N'Nothing', 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (6, CAST(N'2020-01-16' AS Date), 14, NULL, 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (7, CAST(N'2020-01-16' AS Date), 44, N'Checkin', 1)
INSERT [dbo].[tbl_CIM_Memo] ([MemoId], [MemoDate], [Total], [Remarks], [Status]) VALUES (8, CAST(N'2020-01-17' AS Date), 120, N'Nothin', 1)
SET IDENTITY_INSERT [dbo].[tbl_CIM_Memo] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_MemoDetail] ON 

INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (1, 1, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (2, 2, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (3, 3, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (4, 4, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (5, 5, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (6, 6, 1, 14)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (7, 7, 1, 44)
INSERT [dbo].[tbl_CIM_MemoDetail] ([MemoDetailId], [MemoId], [CardId], [Quantity]) VALUES (8, 8, 1, 120)
SET IDENTITY_INSERT [dbo].[tbl_CIM_MemoDetail] OFF
SET IDENTITY_INSERT [dbo].[tbl_CIM_PlasticType] ON 

INSERT [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId], [PlasticTypeName], [Status]) VALUES (1, N'Chip', 1)
INSERT [dbo].[tbl_CIM_PlasticType] ([PlasticTypeId], [PlasticTypeName], [Status]) VALUES (2, N'Master Chip', 1)
SET IDENTITY_INSERT [dbo].[tbl_CIM_PlasticType] OFF
SET IDENTITY_INSERT [dbo].[tbl_MISC_CreditReport] ON 

INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (1, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (2, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (3, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (4, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (5, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (6, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (7, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (8, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (9, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (10, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (11, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (12, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (13, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (14, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (15, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (16, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (17, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (18, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (19, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (20, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (21, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (22, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (23, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (24, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (25, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (26, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (27, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (28, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (29, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (30, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (31, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (32, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (33, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (34, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (35, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (36, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (37, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (38, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (39, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (40, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (41, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (42, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (43, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (44, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (45, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (46, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (47, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (48, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (49, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (50, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (51, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (52, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (53, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (54, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (55, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (56, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (57, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (58, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (59, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (60, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (61, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (62, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (63, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (64, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (65, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (66, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (67, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (68, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (69, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (70, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (71, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (72, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (73, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (74, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (75, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (76, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (77, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (78, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (79, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (80, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (81, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (82, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (83, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (84, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (85, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (86, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (87, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (88, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (89, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (90, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (91, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (92, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (93, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (94, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (95, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (96, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (97, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (98, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (99, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
GO
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (100, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (101, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (102, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (103, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (104, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (105, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (106, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (107, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (108, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (109, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (110, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (111, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (112, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (113, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (114, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (115, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (116, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (117, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (118, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (119, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (120, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (121, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (122, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (123, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (124, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (125, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (126, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (127, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (128, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (129, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (130, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (131, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (132, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (133, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (134, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (135, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (136, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (137, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (138, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (139, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (140, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (141, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (142, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (143, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (144, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (145, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (146, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (147, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (148, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (149, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (150, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (151, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (152, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (153, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (154, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (155, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (156, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (157, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (158, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (159, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (160, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (161, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (162, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (163, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (164, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (165, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (166, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (167, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (168, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (169, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'VD1', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (170, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (171, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (172, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (173, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (174, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (175, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (176, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (177, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (178, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (179, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (180, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (181, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (182, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (183, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (184, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (185, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (186, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (187, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (188, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (189, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (190, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (191, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (192, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (193, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (194, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (195, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (196, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (197, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (198, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (199, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
GO
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (200, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (201, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (202, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (203, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (204, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (205, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (206, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (207, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (208, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (209, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (210, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (211, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (212, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (213, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (214, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (215, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (216, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (217, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (218, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (219, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (220, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (221, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (222, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (223, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (224, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (225, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (226, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (227, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (228, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (229, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (230, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (231, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (232, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (233, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (234, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (235, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (236, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (237, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (238, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (239, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (240, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (241, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (242, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (243, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (244, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (245, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (246, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (247, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (248, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (249, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (250, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (251, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (252, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (253, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (254, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (255, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (256, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (257, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (258, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (259, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (260, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (261, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (262, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (263, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (264, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (265, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (266, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (267, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (268, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (269, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (270, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (271, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (272, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (273, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (274, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (275, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (276, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (277, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (278, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (279, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (280, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (281, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (282, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (283, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (284, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (285, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (286, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (287, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (288, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (289, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (290, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (291, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (292, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (293, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (294, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (295, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (296, 1, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (297, 2, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (298, 3, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (299, 4, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
GO
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (300, 5, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (301, 6, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (302, 7, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (303, 8, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (304, 9, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (305, 10, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (306, 11, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (307, 12, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (308, 13, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
INSERT [dbo].[tbl_MISC_CreditReport] ([CRId], [SINO], [CardNo], [CardCustNo], [ReferenceNo], [CardName], [EmbossNo], [CardType], [Ind], [PSINO], [DlyChan], [Remarks], [UploadedOn]) VALUES (309, 14, N'4289 XXXX XXXX 3007', N'980XXXX6845', N'980XXXX6845', N'FARHAN JAMAL', N'200101001', N'IG4', N'P', N'', N'', N'', CAST(N'2020-01-16' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_MISC_CreditReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Stock] ON 

INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (2, 1, 100, CAST(N'2020-01-16T16:14:22.023' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (3, 1, 130, CAST(N'2020-01-16T16:54:03.737' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (4, 2, 1000, CAST(N'2020-01-16T18:35:38.310' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (5, 3, 32, CAST(N'2020-01-16T18:35:49.207' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (6, 3, 45, CAST(N'2020-01-16T18:44:52.683' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (7, 1, 12, CAST(N'2020-01-17T18:38:00.673' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (8, 3, 100, CAST(N'2020-01-17T18:38:18.927' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (9, 1, 12, CAST(N'2020-01-17T18:38:28.747' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (10, 2, 12, CAST(N'2020-01-17T18:40:02.540' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (11, 2, 141, CAST(N'2020-01-17T18:40:17.673' AS DateTime))
INSERT [dbo].[tbl_Stock] ([StockId], [CardId], [Quantity], [LastUpdate]) VALUES (12, 1, 3, CAST(N'2020-01-17T18:40:29.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Stock] OFF
INSERT [dbo].[tbl_StockRemain] ([CardId], [StockLeft], [Status]) VALUES (1, 51, 1)
INSERT [dbo].[tbl_StockRemain] ([CardId], [StockLeft], [Status]) VALUES (2, 1153, 0)
INSERT [dbo].[tbl_StockRemain] ([CardId], [StockLeft], [Status]) VALUES (3, 177, 0)
SET IDENTITY_INSERT [dbo].[tbl_URM_Menu] ON 

INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (1, N'NULL', N'#', 0, 0, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (2, N'User', N'#', 1, 1, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (3, N'Stock', N'#', 1, 1, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (4, N'Card', N'#', 1, 1, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (5, N'Memo', N'#', 1, 1, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (6, N'Create User', N'/User/Create', 2, 0, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (7, N'Create Stock', N'/Stock/Create', 3, 0, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (8, N'Create Memo', N'/Memo/Create', 5, 0, 1)
INSERT [dbo].[tbl_URM_Menu] ([MenuId], [MenuName], [MenuURL], [ParentId], [Header], [Status]) VALUES (9, N'Create Card', N'/Card/Create', 4, 0, 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_Menu] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_Role] ON 

INSERT [dbo].[tbl_URM_Role] ([RoleId], [RoleName], [RoleDescription], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, N'Admin', N'Administrator', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_Role] ([RoleId], [RoleName], [RoleDescription], [CreatedOn], [ModifiedOn], [Status]) VALUES (2, N'User', N'Normal User', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_Role] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_RoleMenu] ON 

INSERT [dbo].[tbl_URM_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [Status]) VALUES (1, 1, 2, 1)
INSERT [dbo].[tbl_URM_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [Status]) VALUES (2, 1, 3, 1)
INSERT [dbo].[tbl_URM_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [Status]) VALUES (3, 1, 4, 1)
INSERT [dbo].[tbl_URM_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [Status]) VALUES (4, 1, 5, 1)
INSERT [dbo].[tbl_URM_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [Status]) VALUES (5, 2, 3, 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_RoleMenu] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_User] ON 

INSERT [dbo].[tbl_URM_User] ([UserId], [FirstName], [LastName], [Gender], [CNIC], [UserName], [Password], [PassHint], [RoleId], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, N'Vif', N'Admin', 1, N'1', N'vif', N'vif', N'vif', 1, CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_User] ([UserId], [FirstName], [LastName], [Gender], [CNIC], [UserName], [Password], [PassHint], [RoleId], [CreatedOn], [ModifiedOn], [Status]) VALUES (3, N'Normal', N'User', 1, N'2', N'user', N'user', N'user', 2, CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_User] ([UserId], [FirstName], [LastName], [Gender], [CNIC], [UserName], [Password], [PassHint], [RoleId], [CreatedOn], [ModifiedOn], [Status]) VALUES (4, N'Temp', N'Admin', 1, N'123', N'Temp', N'TEMP', N'temp', 1, CAST(N'2020-01-16T15:56:29.993' AS DateTime), CAST(N'2020-01-16T15:56:29.993' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_User] OFF
SET IDENTITY_INSERT [dbo].[tbl_URM_UserRole] ON 

INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (1, 1, N'User', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (2, 1, N'Card', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (3, 1, N'Memo', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (4, 1, N'CardType', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (5, 1, N'CardPaymentType', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (6, 1, N'PlasticType', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (7, 1, N'Role', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (12, 1, N'Stock', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_URM_UserRole] ([UserRoleID], [RoleId], [Name], [CreatedOn], [ModifiedOn], [Status]) VALUES (13, 1, N'Account', CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_URM_UserRole] OFF
ALTER TABLE [dbo].[tbl_URM_Menu] ADD  CONSTRAINT [DF_tbl_URM_Menu_ParentId]  DEFAULT ((1)) FOR [ParentId]
GO
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
ALTER TABLE [dbo].[tbl_CIM_MemoDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_Card_tbl_CIM_MemoDetail] FOREIGN KEY([CardId])
REFERENCES [dbo].[tbl_CIM_Card] ([CardId])
GO
ALTER TABLE [dbo].[tbl_CIM_MemoDetail] CHECK CONSTRAINT [FK_tbl_CIM_Card_tbl_CIM_MemoDetail]
GO
ALTER TABLE [dbo].[tbl_CIM_MemoDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_Memo_tbl_CIM_MemoDetail] FOREIGN KEY([MemoId])
REFERENCES [dbo].[tbl_CIM_Memo] ([MemoId])
GO
ALTER TABLE [dbo].[tbl_CIM_MemoDetail] CHECK CONSTRAINT [FK_tbl_CIM_Memo_tbl_CIM_MemoDetail]
GO
ALTER TABLE [dbo].[tbl_Stock]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_Card_tbl_Stock] FOREIGN KEY([CardId])
REFERENCES [dbo].[tbl_CIM_Card] ([CardId])
GO
ALTER TABLE [dbo].[tbl_Stock] CHECK CONSTRAINT [FK_tbl_CIM_Card_tbl_Stock]
GO
ALTER TABLE [dbo].[tbl_StockRemain]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CIM_Card_tbl_StockRemain] FOREIGN KEY([CardId])
REFERENCES [dbo].[tbl_CIM_Card] ([CardId])
GO
ALTER TABLE [dbo].[tbl_StockRemain] CHECK CONSTRAINT [FK_tbl_CIM_Card_tbl_StockRemain]
GO
ALTER TABLE [dbo].[tbl_URM_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_URM_Role_tbl_URM_User] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_URM_Role] ([RoleId])
GO
ALTER TABLE [dbo].[tbl_URM_User] CHECK CONSTRAINT [FK_tbl_URM_Role_tbl_URM_User]
GO
ALTER TABLE [dbo].[tbl_URM_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_tbl_URM_UserRole_tbl_URM_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_URM_Role] ([RoleId])
GO
ALTER TABLE [dbo].[tbl_URM_UserRole] CHECK CONSTRAINT [FK_tbl_URM_UserRole_tbl_URM_Role]
GO
/****** Object:  StoredProcedure [dbo].[CIM_CardDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_CIM_Card t
	WHERE t.CardId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardInsert] @ParamTable1 CIM_Card READONLY
AS
BEGIN
	INSERT INTO tbl_CIM_Card
	SELECT CardName
		,ShortName
		,CardTypeId
		,CardPaymentTypeId
		,PlasticTypeId
		,1
		,GETDATE()
		,GETDATE()
	FROM @ParamTable1

	DECLARE @CId INT = SCOPE_IDENTITY()

	--Insert Into Stock Remaining
	INSERT INTO tbl_StockRemain
	VALUES (
		@CId
		,0
		,0
		)

	SELECT 'true' [ReturnMessage]
END



GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_CIM_CardPaymentType t
	WHERE t.CardPaymentTypeId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeInsert] @ParamTable1 CIM_CardPaymentType READONLY
AS
BEGIN
	INSERT INTO tbl_CIM_CardPaymentType
	SELECT p.CardPaymentTypeName
		,1
	FROM @ParamTable1 p

	SELECT 'true' [ReturnMessage]
END



GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeSelectAll]
AS
BEGIN
	SELECT t.CardPaymentTypeId
		,t.CardPaymentTypeName
	FROM tbl_CIM_CardPaymentType t
	WHERE t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.CardPaymentTypeId
		,t.CardPaymentTypeName
	FROM tbl_CIM_CardPaymentType t
	WHERE t.CardPaymentTypeId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardPaymentTypeUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardPaymentTypeUpdate] 
@ParamTable1 CIM_CardPaymentType READONLY
AS
BEGIN
	UPDATE t
	SET t.CardPaymentTypeName = p.CardPaymentTypeName
	FROM tbl_CIM_CardPaymentType t
	INNER JOIN @ParamTable1 p ON t.CardPaymentTypeId = p.CardPaymentTypeId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardSelectAll]
AS
BEGIN
	SELECT t.CardId
		,t.CardName
		,t.ShortName
		,t.CardTypeId
		,ct.CardTypeName
		,t.CardPaymentTypeId
		,cpt.CardPaymentTypeName
		,t.PlasticTypeId
		,pt.PlasticTypeName
	FROM tbl_CIM_Card t
	INNER JOIN tbl_CIM_CardType ct ON ct.CardTypeId = t.CardTypeId
	INNER JOIN tbl_CIM_CardPaymentType cpt ON cpt.CardPaymentTypeId = t.CardPaymentTypeId
	INNER JOIN tbl_CIM_PlasticType pt ON pt.PlasticTypeId = t.PlasticTypeId
	WHERE t.STATUS = 1
		AND ct.STATUS = 1
		AND cpt.STATUS = 1
		AND pt.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.CardId
		,t.CardName
		,t.ShortName
		,t.CardTypeId
		,t.CardPaymentTypeId
		,t.PlasticTypeId
	FROM tbl_CIM_Card t
	WHERE t.CardId = @ParamTable1
		AND t.STATUS = 1
END

GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardTypeDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_CIM_CardType t
	WHERE t.CardTypeId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardTypeInsert] @ParamTable1 CIM_CardType READONLY
AS
BEGIN
	INSERT INTO tbl_CIM_CardType
	SELECT p.CardTypeName
		,1
	FROM @ParamTable1 p

	SELECT 'true' [ReturnMessage]
END



GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardTypeSelectAll]
AS
BEGIN
	SELECT t.CardTypeId
		,t.CardTypeName
	FROM tbl_CIM_CardType t
	WHERE t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardTypeSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.CardTypeId
		,t.CardTypeName
	FROM tbl_CIM_CardType t
	WHERE t.CardTypeId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardTypeUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardTypeUpdate] 
@ParamTable1 CIM_CardType READONLY
AS
BEGIN
	UPDATE t
	SET t.CardTypeName = p.CardTypeName
	FROM tbl_CIM_CardType t
	INNER JOIN @ParamTable1 p ON t.CardTypeId = p.CardTypeId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_CardUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_CardUpdate] 
@ParamTable1 CIM_Card READONLY
AS
BEGIN
	UPDATE t
	SET t.CardName = p.CardName
		,t.ShortName = p.ShortName
		,t.CardTypeId = p.CardTypeId
		,t.CardPaymentTypeId = p.CardPaymentTypeId
		,t.PlasticTypeId = p.PlasticTypeId
	FROM tbl_CIM_Card t
	INNER JOIN @ParamTable1 p ON t.CardId = p.CardId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_MemoDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_MemoDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_CIM_Memo t
	WHERE t.MemoId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_MemoDetailSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_MemoDetailSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.MemoDetailId
		,t.MemoId
		,t.CardId
		,t.Quantity
	FROM tbl_CIM_MemoDetail t
	WHERE t.MemoId = @ParamTable1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_MemoInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_MemoInsert] @ParamTable1 CIM_Memo READONLY
	,@ParamTable2 CIM_MemoDetail READONLY
AS
BEGIN
	INSERT INTO tbl_CIM_Memo
	SELECT MemoDate
		,Total
		,Remarks
		,1
	FROM @ParamTable1

	DECLARE @MemoId INT = SCOPE_IDENTITY()

	INSERT INTO tbl_CIM_MemoDetail
	SELECT @MemoId
		,CardId
		,Quantity
	FROM @ParamTable2

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_MemoSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_MemoSelectAll]
AS
BEGIN
	SELECT t.MemoId
		,t.MemoDate
		,t.Total
		,t.Remarks
		,t.STATUS
	FROM tbl_CIM_Memo t
	WHERE t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_MemoSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_MemoSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.MemoId
		,t.MemoDate
		,t.Total
		,t.Remarks
		,t.STATUS
	FROM tbl_CIM_Memo t
	WHERE t.MemoId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_PlasticTypeDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_CIM_PlasticType t
	WHERE t.PlasticTypeId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_PlasticTypeInsert] @ParamTable1 CIM_PlasticType READONLY
AS
BEGIN
	INSERT INTO tbl_CIM_PlasticType
	SELECT p.PlasticTypeName
		,1
	FROM @ParamTable1 p

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_PlasticTypeSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.PlasticTypeId
		,t.PlasticTypeName
	FROM tbl_CIM_PlasticType t
	WHERE t.PlasticTypeId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[CIM_PlasticTypeUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CIM_PlasticTypeUpdate] @ParamTable1 CIM_PlasticType READONLY
AS
BEGIN
	UPDATE t
	SET t.PlasticTypeName = p.PlasticTypeName
	FROM tbl_CIM_PlasticType t
	INNER JOIN @ParamTable1 p ON t.PlasticTypeId = p.PlasticTypeId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[MISC_CreditReportInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MISC_CreditReportInsert]
@ParamTable1 MISC_CreditReport READONLY
AS
BEGIN
	INSERT INTO tbl_MISC_CreditReport
	SELECT SINO
		,CardNo
		,CardCustNo
		,ReferenceNo
		,CardName
		,EmbossNo
		,CardType
		,Ind
		,PSINO
		,DlyChan
		,Remarks
		,GETDATE()
	FROM @ParamTable1


	SELECT c.CardId
		,c.CardName
		,t.CardType
		,Count(t.CardType) [Quantity]
	FROM @ParamTable1 t
	INNER JOIN tbl_CIM_Card c ON c.ShortName = t.CardType
	GROUP BY t.CardType
		,c.CardId
		,c.CardName

END





GO
/****** Object:  StoredProcedure [dbo].[MISC_CreditReportSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MISC_CreditReportSelectById] @ParamTable1 DATE
AS
BEGIN
	SELECT c.CardId
		,c.CardName
		,cr.CardType
		,Count(cr.CardType) [Count]
	FROM tbl_MISC_CreditReport cr
	INNER JOIN tbl_CIM_Card c ON c.ShortName = cr.CardType
	WHERE cr.UploadedOn = @ParamTable1
	GROUP BY cr.CardType
		,c.CardId
		,c.CardName
END




GO
/****** Object:  StoredProcedure [dbo].[RemainingStock]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemainingStock]
AS
BEGIN
	SELECT t.CardId
		,c.CardName + ' - ' +c.ShortName [CardName]
		,t.StockLeft [Quantity]
		,CASE WHEN t.StockLeft > 50 THEN 'HIGH' ELSE 'LOW' END [Status]
	FROM tbl_StockRemain t
	INNER JOIN tbl_CIM_Card c ON c.CardId = t.CardId
END



GO
/****** Object:  StoredProcedure [dbo].[StockInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockInsert] 
@ParamTable1 Stock READONLY
AS
BEGIN
	INSERT INTO tbl_Stock
	SELECT CardId
		,Quantity
		,GETDATE()
	FROM @ParamTable1

	--DECLARE @Q INT
	--DECLARE @C INT

	--SELECT @Q = Quantity , @C=CardId
	--FROM @ParamTable1

	--UPDATE t
	--SET t.StockLeft = t.StockLeft - @Q
	--FROM tbl_StockRemain t
	--WHERE t.CardId = @C

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[StockSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSelectAll]
AS
BEGIN
	SELECT t.StockId
		,t.CardId
		,c.CardName
		,t.Quantity
		,t.LastUpdate
	FROM tbl_Stock t
	INNER JOIN tbl_CIM_Card c ON c.CardId = t.CardId
END




GO
/****** Object:  StoredProcedure [dbo].[StockSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.StockId
		,t.CardId
		,t.Quantity
		,t.LastUpdate
	FROM tbl_Stock t
	WHERE t.StockId = @ParamTable1
END




GO
/****** Object:  StoredProcedure [dbo].[StockUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockUpdate] @ParamTable1 Stock READONLY
AS
BEGIN
	UPDATE t
	SET t.CardId = p.CardId
		,t.Quantity = p.Quantity
		,t.LastUpdate = GETDATE()
	FROM tbl_Stock t
	INNER JOIN @ParamTable1 p ON t.StockId = p.StockId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[System_ClassGenerator]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_CreateDeleteProcedure]    Script Date: 1/17/2020 7:05:26 PM ******/
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
			SELECT ''true'' [ReturnMessage]
		END'
	
	EXEC  (@FQuery)

END





GO
/****** Object:  StoredProcedure [dbo].[System_CreateSaveProcedure]    Script Date: 1/17/2020 7:05:26 PM ******/
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
			SELECT ''true'' [ReturnMessage]
		END
	END'

	EXEC  (@FQuery)

END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateSaveProcedureNoStatus]    Script Date: 1/17/2020 7:05:26 PM ******/
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
			SELECT ''true'' [ReturnMessage]
		END
	END'
	Print(@FQUERY)
	EXEC  (@FQuery)

END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectAllProcedure]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[System_CreateSelectAllProcedure] @TableName NVARCHAR(100)
	,@TVPName NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Adding Necessary 5 Columns to the Provided Table
	DECLARE @Select_Query NVARCHAR(MAX);

	SELECT @Select_Query = 'SELECT ';

	DECLARE @Counter INT;

	SELECT @Counter = 1;

	WHILE @Counter <= (
			SELECT COUNT(*)
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			)
	BEGIN
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','
		FROM (
			SELECT ROW_NUMBER() OVER (
					ORDER BY (
							SELECT 100
							)
					) [Sr]
				,COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			) cols
		WHERE cols.Sr = @Counter;

		SELECT @Counter = @Counter + 1;
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))

	SELECT @Select_Query = @Select_Query + ' FROM ' + @TableName + ' t WHERE t.Status = 1'

	DECLARE @FQuery VARCHAR(1000);

	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'SelectAll' + '] ' + CHAR(13) + '
	AS' + CHAR(13) + '
	BEGIN ' + CHAR(13) + '
		' + @Select_Query + '
	END'

	EXEC (@FQuery)
END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectAllProcedureNoStatus]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[System_CreateSelectAllProcedureNoStatus] @TableName NVARCHAR(100)
	,@TVPName NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Adding Necessary 5 Columns to the Provided Table
	DECLARE @Select_Query NVARCHAR(MAX);

	SELECT @Select_Query = 'SELECT ';

	DECLARE @Counter INT;

	SELECT @Counter = 1;

	WHILE @Counter <= (
			SELECT COUNT(*)
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			)
	BEGIN
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','
		FROM (
			SELECT ROW_NUMBER() OVER (
					ORDER BY (
							SELECT 100
							)
					) [Sr]
				,COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			) cols
		WHERE cols.Sr = @Counter;

		SELECT @Counter = @Counter + 1;
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))

	SELECT @Select_Query = @Select_Query + ' FROM ' + @TableName + ' t '

	DECLARE @FQuery VARCHAR(1000);

	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'SelectAll' + '] ' + CHAR(13) + '
	AS' + CHAR(13) + '
	BEGIN ' + CHAR(13) + '
		' + @Select_Query + '
	END'

	EXEC (@FQuery)
END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectByIdProcedure]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[System_CreateSelectByIdProcedure] @TableName NVARCHAR(100)
	,@TVPName NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Adding Necessary 5 Columns to the Provided Table
	DECLARE @Select_Query NVARCHAR(MAX);

	SELECT @Select_Query = 'SELECT ';

	DECLARE @Counter INT;

	SELECT @Counter = 1;

	WHILE @Counter <= (
			(
				SELECT COUNT(*)
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @TableName
				)
			)
	BEGIN
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','
		FROM (
			SELECT ROW_NUMBER() OVER (
					ORDER BY (
							SELECT 100
							)
					) [Sr]
				,COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			) cols
		WHERE cols.Sr = @Counter;

		SELECT @Counter = @Counter + 1;
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))

	SELECT @Select_Query = @Select_Query + ' FROM ' + @TableName + ' t WHERE t.' + (
			SELECT COLUMN_NAME
			FROM (
				SELECT ROW_NUMBER() OVER (
						ORDER BY (
								SELECT 100
								)
						) [Sr]
					,COLUMN_NAME
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @TableName
				) abc
			WHERE abc.Sr = 1
			) + ' = @ParamTable1 AND t.Status = 1'

	DECLARE @FQuery VARCHAR(1000);

	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'SelectById] ' + CHAR(13) + '
		@ParamTable1	int ' + CHAR(13) + '
	AS' + CHAR(13) + '
	BEGIN ' + CHAR(13) + '
		' + @Select_Query + '
	END'

	--SELECT @FQuery
	EXEC (@FQuery)
END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateSelectByIdProcedureNoStatus]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[System_CreateSelectByIdProcedureNoStatus] @TableName NVARCHAR(100)
	,@TVPName NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Adding Necessary 5 Columns to the Provided Table
	DECLARE @Select_Query NVARCHAR(MAX);

	SELECT @Select_Query = 'SELECT ';

	DECLARE @Counter INT;

	SELECT @Counter = 1;

	WHILE @Counter <= (
			(
				SELECT COUNT(*)
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @TableName
				)
			)
	BEGIN
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','
		FROM (
			SELECT ROW_NUMBER() OVER (
					ORDER BY (
							SELECT 100
							)
					) [Sr]
				,COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			) cols
		WHERE cols.Sr = @Counter;

		SELECT @Counter = @Counter + 1;
	END

	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))

	SELECT @Select_Query = @Select_Query + ' FROM ' + @TableName + ' t WHERE t.' + (
			SELECT COLUMN_NAME
			FROM (
				SELECT ROW_NUMBER() OVER (
						ORDER BY (
								SELECT 100
								)
						) [Sr]
					,COLUMN_NAME
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @TableName
				) abc
			WHERE abc.Sr = 1
			) + ' = @ParamTable1'

	DECLARE @FQuery VARCHAR(1000);

	SET @FQuery = 'CREATE PROCEDURE [' + @TVPName + 'SelectById] ' + CHAR(13) + '
		@ParamTable1	int ' + CHAR(13) + '
	AS' + CHAR(13) + '
	BEGIN ' + CHAR(13) + '
		' + @Select_Query + '
	END'

	--SELECT @FQuery
	EXEC (@FQuery)
END




GO
/****** Object:  StoredProcedure [dbo].[System_CreateTableBasicImplmentation]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_CreateTableBasicImplmentationNoStatus]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_CreateTVPForTable]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_CreateTVPForTableNoStatus]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_CreateUpdateProcedure]    Script Date: 1/17/2020 7:05:26 PM ******/
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
			SELECT ''true'' [ReturnMessage]
		END'
	print(@FQuery)
	EXEC  (@FQuery)

END




GO
/****** Object:  StoredProcedure [dbo].[URM_IsAuthenticated]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_IsAuthenticated]  
	@ParamTable1		int,		--UserId
	@ParamTable2		varchar(100), --RoleId
	@ParamTable3		varchar(100) --Action
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT ur.UserRoleID FROM tbl_URM_UserRole ur
	INNER JOIN tbl_URM_User u On u.UserId=@ParamTable1 
	WHERE  ur.RoleId=@ParamTable2 AND ur.Name = @ParamTable3)
	BEGIN
		SELECT 1 [AccessType]
	END
	ELSE
	BEGIN
		SELECT 0 [AccessType]
	END	
END







GO
/****** Object:  StoredProcedure [dbo].[URM_Login]    Script Date: 1/17/2020 7:05:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_MenuDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_URM_Menu t
	WHERE t.MenuId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuInsert] @ParamTable1 URM_Menu READONLY
AS
BEGIN
	INSERT INTO tbl_URM_Menu
	SELECT MenuName
		,Case WHEN Header = 1 THEN '#' ELSE MenuURL END
		,Case WHEN Header = 1 THEN 1 ELSE ParentId END
		,Header
		,1
	FROM @ParamTable1

	SELECT 'true' [ReturnMessage]
END
GO
/****** Object:  StoredProcedure [dbo].[URM_MenuSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuSelectAll]
AS
BEGIN
	SELECT t.MenuId
		,t.MenuName
		,t.MenuURL
		,t.ParentId
		,t.Header
	FROM tbl_URM_Menu t
	WHERE t.STATUS = 1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuSelectAllForRoleMenu]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuSelectAllForRoleMenu] @ParamTable1 INT
AS
BEGIN
	SELECT t.MenuId
		,t.MenuName
		,t.MenuURL
		,t.ParentId
		,t.Header
	FROM tbl_URM_Menu t
	WHERE t.STATUS = 1
		AND t.ParentId = 1
		AND t.MenuId NOT IN (
			SELECT MenuId
			FROM tbl_URM_RoleMenu rm
			WHERE rm.RoleId = @ParamTable1
			)
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.MenuId
		,t.MenuName
		,t.MenuURL
		,t.ParentId
		,t.Header
	FROM tbl_URM_Menu t
	WHERE t.MenuId = @ParamTable1
		AND t.STATUS = 1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuSelectByParent]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuSelectByParent] @ParamTable1 INT
AS
BEGIN
	SELECT m.MenuId
		,m.MenuName
		,m.MenuURL
		,m.ParentId
	FROM tbl_URM_Menu m
	WHERE m.ParentId = @ParamTable1 
		AND m.STATUS = 1 AND NOT m.Header=1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuSelectHeader]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_MenuSelectHeader] @ParamTable1 INT
AS
BEGIN
	SELECT 
	m.MenuId
		,m.MenuName
		,m.MenuURL
		,m.ParentId
	FROM tbl_URM_Menu m 
	INNER JOIN tbl_URM_RoleMenu r On r.RoleId=@ParamTable1 AND r.MenuId=m.MenuId
	WHERE m.Status=1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_MenuUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[URM_MenuUpdate] @ParamTable1 URM_Menu READONLY
AS
BEGIN
	UPDATE t
	SET t.MenuName = p.MenuName
		,t.MenuURL = Case WHEN p.Header = 1 THEN '#' ELSE p.MenuURL END
		,t.ParentId = Case WHEN p.Header = 1 THEN 1 ELSE p.ParentId END
		,t.Header = p.Header
	FROM tbl_URM_Menu t
	INNER JOIN @ParamTable1 p ON t.MenuId = p.MenuId

	SELECT 'true' [ReturnMessage]
END



GO
/****** Object:  StoredProcedure [dbo].[URM_RoleDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleDelete] @ParamTable1 INT --roleId
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_URM_Role t
	WHERE t.RoleId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleInsert] @ParamTable1 URM_Role READONLY
AS
BEGIN
	INSERT INTO tbl_URM_Role
	SELECT RoleName
		,RoleDescription
		,GETDATE()
		,GETDATE()
		,1
	FROM @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleMenuDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleMenuDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_URM_RoleMenu t
	WHERE t.RoleMenuId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleMenuInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleMenuInsert] @ParamTable1 URM_RoleMenu READONLY
AS
BEGIN
	INSERT INTO tbl_URM_RoleMenu
	SELECT RoleId
		,MenuId
		,1
	FROM @ParamTable1

	SELECT 'true' [ReturnMessage]
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleMenuSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleMenuSelectAll]
AS
BEGIN
	SELECT t.RoleId
		,r.RoleName
		,t.MenuId
		,m.MenuName
		,m.MenuURL
	FROM tbl_URM_RoleMenu t
	INNER JOIN tbl_URM_Role r ON r.roleid = t.RoleId
	INNER JOIN tbl_URM_Menu m ON m.MenuId = t.MenuId
	WHERE t.STATUS = 1 AND m.Header=1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleMenuSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleMenuSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT m.MenuName
		,m.MenuURL
		,m.ParentId
	FROM tbl_URM_RoleMenu t
	INNER JOIN tbl_URM_Menu m ON m.MenuId = t.MenuId
	WHERE t.RoleId = @ParamTable1
		AND t.STATUS = 1 
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleMenuUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleMenuUpdate] @ParamTable1 URM_RoleMenu READONLY
AS
BEGIN
	UPDATE t
	SET t.RoleId = p.RoleId
		,t.MenuId = p.MenuId
	FROM tbl_URM_RoleMenu t
	INNER JOIN @ParamTable1 p ON t.RoleMenuId = p.RoleMenuId

	SELECT 'true' [ReturnMessage]
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleSelectAll]
AS
BEGIN
	SELECT t.RoleId
		,t.RoleName
		,t.RoleDescription
	FROM tbl_URM_Role t
	WHERE t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SELECT BY ID
CREATE PROCEDURE [dbo].[URM_RoleSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.RoleName
		,t.RoleDescription
	FROM tbl_URM_Role t
	WHERE t.RoleId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[URM_RoleUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleUpdate] @ParamTable1 URM_Role READONLY
AS
BEGIN
	UPDATE t
	SET t.RoleName = p.RoleName
		,t.RoleDescription = p.RoleDescription
	FROM tbl_URM_Role t
	INNER JOIN @ParamTable1 p ON t.RoleId = p.RoleId

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserDelete]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[URM_UserDelete] @ParamTable1 INT
AS
BEGIN
	UPDATE t
	SET t.STATUS = 0
	FROM tbl_URM_User
	WHERE t.UserId = @ParamTable1

	SELECT 'true' [ReturnMessage]
END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserInsert]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_UserInsert] @ParamTable1 URM_User READONLY
AS
BEGIN
	INSERT INTO tbl_URM_User
	SELECT FirstName
		,LastName
		,Gender
		,CNIC
		,UserName
		,Password
		,PassHint
		,RoleId
		,GETDATE()
		,GETDATE()
		,1
	FROM @ParamTable1

	SELECT 'true' [ReturnMessage]
END





GO
/****** Object:  StoredProcedure [dbo].[URM_UserRoleSelectbyId]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_UserRoleSelectbyId] @ParamTable1 INT
	,--UserId
	@ParamTable2 INT --RoleId
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ur.Name
	FROM tbl_URM_UserRole ur
	INNER JOIN tbl_URM_User u ON u.UserId = @ParamTable1
		AND ur.RoleId = @ParamTable2
END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectAll]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_UserSelectAll]
AS
BEGIN
	SELECT t.UserId
		,t.FirstName
		,t.LastName
		,t.Gender
		,t.CNIC
		,t.UserName
		,t.Password
		,t.RoleId
		,r.RoleName
	FROM tbl_URM_User t
	INNER JOIN tbl_URM_Role r ON r.RoleId = t.RoleId
	WHERE t.STATUS = 1 AND r.Status=1
END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectById]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_UserSelectById] @ParamTable1 INT
AS
BEGIN
	SELECT t.FirstName
		,t.LastName
		,t.Gender
		,t.CNIC
		,t.UserName
		,t.Password
		,t.RoleId
	FROM tbl_URM_User t
	WHERE t.UserId = @ParamTable1
		AND t.STATUS = 1
END




GO
/****** Object:  StoredProcedure [dbo].[URM_UserUpdate]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_UserUpdate] @ParamTable1 URM_User READONLY
AS
BEGIN
	UPDATE t
	SET t.FirstName = p.FirstName
		,t.LastName = p.LastName
		,t.Gender = p.Gender
		,t.CNIC = p.CNIC
		,t.UserName = p.UserName
		,t.RoleId = P.RoleId
	FROM tbl_URM_User t
	INNER JOIN @ParamTable1 p ON t.UserId = p.UserId

	SELECT 'true' [ReturnMessage]
END

GO
/****** Object:  Trigger [dbo].[trigger_StockRemainMemo]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trigger_StockRemainMemo] ON [dbo].[tbl_CIM_MemoDetail]
AFTER INSERT
AS
BEGIN
	DECLARE @CardId INT
	DECLARE @Quantity INT

	SELECT @CardId = CardId
		,@Quantity = Quantity
	FROM inserted

	UPDATE t
	SET t.StockLeft = StockLeft - @Quantity
		,t.STATUS = CASE 
			WHEN t.StockLeft > 50
				THEN 0
			ELSE 1
			END
	FROM tbl_StockRemain t
	WHERE t.CardId = @CardId;
END;



GO
ALTER TABLE [dbo].[tbl_CIM_MemoDetail] ENABLE TRIGGER [trigger_StockRemainMemo]
GO
/****** Object:  Trigger [dbo].[trigger_StockRemain]    Script Date: 1/17/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trigger_StockRemain] ON [dbo].[tbl_Stock]
AFTER INSERT
AS
BEGIN
	DECLARE @CardId INT
	DECLARE @Quantity INT

	SELECT @CardId = CardId
		,@Quantity = Quantity
	FROM inserted
	--0 Means Low
	UPDATE t
	SET t.StockLeft = StockLeft + @Quantity
		,t.STATUS = CASE 
			WHEN t.StockLeft > 50
				THEN 0
			ELSE 1
			END
	FROM tbl_StockRemain t
	WHERE t.CardId = @CardId;
END;


GO
ALTER TABLE [dbo].[tbl_Stock] ENABLE TRIGGER [trigger_StockRemain]
GO
USE [master]
GO
ALTER DATABASE [VCIMDB] SET  READ_WRITE 
GO
