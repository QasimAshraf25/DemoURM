--URM USER--
CREATE TABLE [dbo].[tbl_URM_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CNIC] [varchar](20) NULL,
	[FullPic] [varchar](500) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PassHint] [varchar](50) NULL,
	[RemMe] [bit] NULL,
	[Status] [int] NULL,
	CONSTRAINT [PK_tbl_URM_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)  
ON [PRIMARY]
GO

CREATE TYPE [dbo].[URM_User] AS TABLE (
	[UserId] [int] NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CNIC] [varchar](20) NULL,
	[FullPic] [varchar](500) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PassHint] [varchar](50) NULL,
	[RemMe] [bit] NULL,
	[Status] [int] NULL
)
GO

--URM ROLE--
CREATE TABLE [dbo].[tbl_URM_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[Status] [int] NULL
 CONSTRAINT [PK_tbl_URM_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TYPE [dbo].[URM_Role] AS TABLE (
	[RoleId] [int]  NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[Status] [int] NULL
	)


-- URM USER ROLE--
CREATE TABLE [dbo].[tbl_URM_UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_URM_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TYPE [dbo].[URM_UserRole] AS TABLE (
	[UserRoleID] [int] NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [int] NULL)