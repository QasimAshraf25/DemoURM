
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
	AND u.Status = 1
END
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


