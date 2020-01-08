USE [URMDB]
GO
/****** Object:  UserDefinedTableType [dbo].[URM_Role]    Script Date: 1/8/2020 7:48:53 PM ******/
CREATE TYPE [dbo].[URM_Role] AS TABLE(
	[RoleId] [int] NULL,
	[RoleName] [varchar](100) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_User]    Script Date: 1/8/2020 7:48:53 PM ******/
CREATE TYPE [dbo].[URM_User] AS TABLE(
	[UserId] [int] NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CNIC] [varchar](20) NULL,
	[FullPic] [varchar](500) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[PassHint] [varchar](50) NULL,
	[RemMe] [bit] NULL,
	[Status] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[URM_UserRole]    Script Date: 1/8/2020 7:48:53 PM ******/
CREATE TYPE [dbo].[URM_UserRole] AS TABLE(
	[UserRoleID] [int] NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL
)
GO
/****** Object:  Table [dbo].[tbl_URM_Role]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  Table [dbo].[tbl_URM_User]    Script Date: 1/8/2020 7:48:53 PM ******/
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
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_URM_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_URM_UserRole]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[System_ClassGenerator]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CReate PROCEDURE [dbo].[System_ClassGenerator]
	@Name	nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
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
/****** Object:  StoredProcedure [dbo].[System_CreateGetAllProcedure]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[System_CreateGetAllProcedure]
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

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)  - 7)
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END
	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t WHERE t.TenantId = @ParamTable2 AND t.AppId = @ParamTable3 AND t.Status = 1'

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName+ 'SelectAll' +'] ' + CHAR(13)  + '
		@ParamTable1	int,' + CHAR(13)  + '
		@ParamTable2	int, '+CHAR(13)+'
		@ParamTable3	nvarchar(100)'+CHAR(13)+'
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'

	EXEC  (@FQuery)

END



GO
/****** Object:  StoredProcedure [dbo].[System_CreateSaveProcedureWithValidation]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateSaveProcedureWithValidation]
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

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)  - 3)
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

	SELECT @Insert_Query = @Insert_Query + 'GETDATE(), GETDATE(), 1 FROM  @ParamTable1'
	SELECT @Validation_Query = SUBSTRING(@Validation_Query, 0, LEN(@Validation_Query) - 3)


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
/****** Object:  StoredProcedure [dbo].[System_CreateSelectByIdProcedure]    Script Date: 1/8/2020 7:48:53 PM ******/
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

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)  - 7)
	BEGIN 
		SELECT @Select_Query = @Select_Query + 't.' + COLUMN_NAME + ','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END
	SELECT @Select_Query = SUBSTRING(@Select_Query, 0, LEN(@Select_Query))
	SELECT @Select_Query = @Select_Query + ' FROM ' +@TableName+ ' t WHERE t.'+ 
	(SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +
	' = @ParamTable4 AND t.Status = 1'

	DECLARE @FQuery varchar(1000);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'SelectById] ' + CHAR(13)  + '
		@ParamTable1	int,' + CHAR(13)  + '
		@ParamTable2	int, '+CHAR(13)+'
		@ParamTable3	nvarchar(100),'+CHAR(13)+'
		@ParamTable4	int
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		'+ @Select_Query +'
	END'
	--SELECT @FQuery
	EXEC  (@FQuery)
END
GO
/****** Object:  StoredProcedure [dbo].[System_CreateUpdateProcedureWithValidation]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[System_CreateUpdateProcedureWithValidation]
	@TableName nvarchar(100),
	@TVPName	nvarchar(100)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Adding Necessary 5 Columns to the Provided Table
	
	DECLARE @Update_Query nvarchar(MAX) ;
	DECLARE @Validation_Query nvarchar(MAX) ;
	SELECT @Update_Query = 'UPDATE t SET ';
	SET @Validation_Query = 'SELECT * FROM ' +@TableName+ ' WHERE ';
	DECLARE @Counter int;
	SELECT @Counter = 2;

	WHILE @Counter <= ((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName)  - 7)
	BEGIN 
		SELECT @Update_Query = @Update_Query + 't.'+COLUMN_NAME + ' = p.'+ COLUMN_NAME +','   
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		
		--For Validation of Data
		SELECT @Validation_Query = @Validation_Query + 'LOWER('+ COLUMN_NAME +') = (SELECT LOWER(p.'+ COLUMN_NAME +') FROM @ParamTable1 p) AND ' 
		FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_NAME = @TableName) cols WHERE cols.Sr = @Counter;
		SELECT @Counter = @Counter + 1; 
	END

	SELECT @Update_Query = SUBSTRING(@Update_Query, 0, LEN(@Update_Query))
	SELECT @Update_Query = @Update_Query + ' FROM '+ @TableName +' t INNER JOIN @ParamTable1 p ON t.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +' = p.'+ (SELECT COLUMN_NAME FROM  (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) [Sr],COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName ) abc WHERE abc.Sr = 1) +''
	SELECT @Validation_Query = SUBSTRING(@Validation_Query, 0, LEN(@Validation_Query) - 3)


	DECLARE @FQuery varchar(MAX);
	SET @FQuery = 'CREATE PROCEDURE ['+ @TVPName + 'Update] ' + CHAR(13)  + '
		@ParamTable1	'+ @TVPName +' READONLY' + CHAR(13)  + '
	AS' + CHAR(13)  + '
	BEGIN ' + CHAR(13)  + '
		IF EXISTS ( '+ @Validation_Query +' )
		BEGIN
			SELECT ''Record Already Exists'' [ReturnMessage]
		END
		ELSE
		BEGIN
		'+  @Update_Query +' ' + CHAR(13)  + '
			SELECT ''OK'' [ReturnMessage]
		END
	END'
	EXEC  (@FQuery)

END



GO
/****** Object:  StoredProcedure [dbo].[URM_IsAuthenticated]    Script Date: 1/8/2020 7:48:53 PM ******/
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

	IF EXISTS (SELECT * FROM tbl_URM_UserRole ur
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
/****** Object:  StoredProcedure [dbo].[URM_Login]    Script Date: 1/8/2020 7:48:53 PM ******/
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

	SELECT u.UserName, u.Password
	FROM tbl_URM_User u 
	WHERE u.UserName = @ParamTable1 
	AND u.Password = @ParamTable2
	AND u.[Status] = 1
END

GO
/****** Object:  StoredProcedure [dbo].[URM_RoleDelete]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_RoleInsert]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectAll]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_RoleSelectById]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_RoleUpdate]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URM_RoleUpdate] 
		@ParamTable1 URM_Role READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT RoleName,RoleDescription  FROM tbl_URM_Role WHERE LOWER(RoleName) = (SELECT LOWER(p.RoleName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET t.RoleName = p.RoleName,t.RoleDescription = p.RoleDescription FROM tbl_URM_Role t INNER JOIN @ParamTable1 p ON t.RoleId = p.RoleId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[URM_UserDelete]    Script Date: 1/8/2020 7:48:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[URM_UserInsert]    Script Date: 1/8/2020 7:48:53 PM ******/
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
		RemMe,GETDATE(), GETDATE(), 1 FROM  @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectAll]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_UserSelectAll] 
	AS
	BEGIN 
		SELECT t.UserId,t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName,t.Password
		FROM tbl_URM_User t WHERE  t.Status = 1
	END

GO
/****** Object:  StoredProcedure [dbo].[URM_UserSelectById]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[URM_UserSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName,t.Password FROM tbl_URM_User t 
		WHERE t.UserId = @ParamTable1 AND t.Status = 1
	END

GO
/****** Object:  StoredProcedure [dbo].[URM_UserUpdate]    Script Date: 1/8/2020 7:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[URM_UserUpdate] 
		@ParamTable1 URM_User READONLY
	AS
	BEGIN 
		IF EXISTS ( SELECT UserName,CNIC FROM tbl_URM_User WHERE LOWER(CNIC) = (SELECT LOWER(p.CNIC) FROM @ParamTable1 p) AND LOWER(UserName) = (SELECT LOWER(p.UserName) FROM @ParamTable1 p))
		BEGIN
			SELECT 'Record Already Exists' [ReturnMessage]
		END
		ELSE
		BEGIN
		UPDATE t SET 
		t.FirstName=p.FirstName,
		t.LastName=p.LastName,
		t.Gender=p.Gender,
		t.CNIC=p.CNIC,
		t.FullPic=p.FullPic,
		t.UserName=p.UserName
		 FROM tbl_URM_User t INNER JOIN @ParamTable1 p ON t.UserId = p.UserId 
			SELECT 'OK' [ReturnMessage]
		END
	END


GO
