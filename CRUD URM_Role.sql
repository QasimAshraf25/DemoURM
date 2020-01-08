--SELCT ALL
Create PROCEDURE [dbo].[URM_RoleSelectAll] 
	AS
	BEGIN 
		SELECT t.RoleName,t.RoleDescription FROM tbl_URM_Role t WHERE  t.Status = 1
	END
	GO

--SAVE
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

--SELECT BY ID
CREATE PROCEDURE [dbo].[URM_RoleSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.RoleId,t.RoleName,t.RoleDescription FROM tbl_URM_Role t WHERE t.RoleId = @ParamTable1 AND t.Status = 1
	END
	GO

--Update
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


--DELETE
CREATE PROCEDURE [dbo].[URM_RoleDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_URM_Role t WHERE t.RoleId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END