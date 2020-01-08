--SELCT ALL
Create PROCEDURE [dbo].[URM_UserSelectAll] 
	AS
	BEGIN 
		SELECT t.UserId,t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName
		FROM tbl_URM_User t WHERE  t.Status = 1
	END
	GO

--SAVE
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

--SELECT BY ID
CREATE PROCEDURE [dbo].[URM_UserSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.FirstName,t.LastName,t.Gender,t.CNIC,t.FullPic,t.UserName,t.Password FROM tbl_URM_User t 
		WHERE t.UserId = @ParamTable1 AND t.Status = 1
	END
	GO

--Update
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
		UPDATE t SET t.FirstName=p.FirstName,
		t.LastName=p.LastName,
		t.Gender=p.Gender,
		t.CNIC=p.CNIC,
		t.FullPic=p.FullPic,
		t.UserName=p.UserName,
		t.RemMe=p.RemMe

		 FROM tbl_URM_User t INNER JOIN @ParamTable1 p ON t.UserId = p.UserId 
			SELECT 'OK' [ReturnMessage]
		END
	END
	GO


--DELETE
CREATE PROCEDURE [dbo].[URM_UserDelete] 
		@ParamTable1	int 
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_URM_User t WHERE t.UserId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END