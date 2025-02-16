--SELCT ALL
Create PROCEDURE [dbo].[CIM_CardSelectAll] 
	AS
	BEGIN 
		SELECT t.CardId,t.CardName,t.ShortName,t.CardTypeId,t.CardPaymentTypeId FROM tbl_CIM_Card t WHERE  t.Status = 1
	END
	GO

--SAVE
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

--SELECT BY ID
CREATE PROCEDURE [dbo].[CIM_CardSelectById] 
		@ParamTable1 int
	AS
	BEGIN 
		SELECT t.CardId,t.CardName,t.ShortName,t.CardTypeId,t.CardPaymentTypeId,t.PlasticTypeId 
		FROM tbl_CIM_Card t WHERE t.CardId = @ParamTable1 AND t.Status = 1
	END
	GO

--Update
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


--DELETE
CREATE PROCEDURE [dbo].[CIM_CardDelete] 
		@ParamTable1	int  
	AS
	BEGIN
		UPDATE t SET t.Status =0 FROM tbl_CIM_Card t WHERE t.CardId = @ParamTable1 
			SELECT 'OK' [ReturnMessage]
		END