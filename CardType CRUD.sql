--SELCT ALL
Create PROCEDURE [dbo].[CIM_CardTypeSelectAll] 
	AS
	BEGIN 
		SELECT t.CardTypeId,t.CardTypeName FROM tbl_CIM_CardType t WHERE  t.Status = 1
	END
	GO

--SAVE
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

--SELECT BY ID
CREATE PROCEDURE [dbo].[CIM_CardTypeSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.CardTypeId,t.CardTypeName FROM tbl_CIM_CardType t WHERE t.CardTypeId = @ParamTable1 AND t.Status = 1
	END
	GO

--Update
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


--DELETE
CREATE PROCEDURE [dbo].[CIM_CardTypeDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_CardType t WHERE t.CardTypeId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END