/* Final Project Procedures */

-- Retrieves and displays data
USE fictionalSurgeryCenter;
GO
CREATE PROC ORSchedules
AS
SELECT * FROM ProcedureInfo
ORDER BY ProcedureDateTime;
GO

EXEC ORSchedules;



-- Takes an input parameter

USE fictionalSurgeryCenter;
GO
CREATE PROC MDSurgeryList
	@SurgeonID int
AS
BEGIN
	SELECT * FROM ProcedureInfo
	WHERE SurgeonID = @SurgeonID;
END
GO
EXEC MDSurgeryList 2

--add patient Phone Number to patient Information
USE fictionalSurgeryCenter;
Alter table PatientInformation
ADD PatientPhone VARCHAR(20) NULL;

select * from PatientInformation;

-- Takes one input parameter and returns three output parameters
USE fictionalSurgeryCenter
GO
CREATE PROC spConfirmationCallContact
	@ProcedureDate datetime,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@PhoneNumber nvarchar(20) OUTPUT,
	@Procedure nvarchar(30) OUTPUT 
AS
SELECT @FirstName = PatientFirstName, @LastName = PatientLastName, @PhoneNumber = PatientInformation.PatientPhone, @Procedure = ProcedureDetails.ProcedureName
FROM ProcedureInfo
join PatientInformation on PatientInformation.PatientID = ProcedureInfo.PatientID
join ProcedureDetails on ProcedureDetails.ProcedureID = ProcedureInfo.ProcedureID
WHERE ProcedureDateTime = @ProcedureDate;
GO
-- Run the procedure
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @PhoneNumber nvarchar(20);
declare @Procedure nvarchar(30);
EXEC spConfirmationCallContact  '08-23-2022', @FirstName OUTPUT, @LastName OUTPUT, @PhoneNumber OUTPUT, @Procedure OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @PhoneNumber AS 'Phone Number', @Procedure AS 'Procedure';

-- Stored procedure that has a return value 
USE fictionalSurgeryCenter;
GO
CREATE PROC spPatientCount
AS
DECLARE @PatientCount int;
SELECT @PatientCount = COUNT(*)
FROM PatientInformation 
RETURN @PatientCount;
GO

DECLARE @PatientCount int;
EXEC @PatientCount = spPatientCount;
PRINT 'There are ' + CONVERT(varchar, @PatientCount) + ' Patients in your database';
GO


/* Final Project User Defined Functions */

-- creates the function
USE fictionalSurgeryCenter;
GO
CREATE FUNCTION fnGetName
    (@ProcedureID varchar(10) = '%')
    RETURNS varchar
BEGIN
    RETURN (SELECT ProcedureName FROM ProcedureDetails 
	WHERE ProcedureID Like @ProcedureID);
END; 

GO
SELECT ProcedureName FROM ProcedureDetails
WHERE ProcedureName = dbo.fnGetName('753%');

--select * from Surgeon;

USE fictionalSurgeryCenter;
GO
CREATE FUNCTION fnSurgeonsByPractice
	(@PracticeGroup nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Surgeon WHERE PracticeGroupName 
	LIKE @PracticeGroup);
GO

SELECT * FROM dbo.fnSurgeonsByPractice('%ENT%');

 /* Final Project Triggers */

 -- create archive table by copying customer table without any rows
 USE fictionalSurgeryCenter;
 GO
 SELECT * INTO PatientProcedures
 FROM ProcedureInfo
 WHERE 1=0;

 -- update CustomerTransaction table and add activity column for status
 ALTER TABLE PatientProcedures
 ADD Activity varchar(50);
 GO

 -- create insert trigger
 CREATE TRIGGER PatientProcedures_INSERT ON ProcedureInfo
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ProcedureAdmitID nvarchar(10)
	DECLARE @ProcedureDateTime datetime
	DECLARE @ProcedureID nvarchar(10)
	DECLARE @PatientID int
	DECLARE @SurgeonID nvarchar(10)
	DECLARE @ORNumber int

    SELECT @ProcedureAdmitID =INSERTED.ProcedureAdmitID, 
	@ProcedureDateTime = INSERTED.ProcedureDateTime, 
	@ProcedureID = INSERTED.ProcedureID,
	@PatientID = INSERTED.PatientID, 
	@SurgeonID = INSERTED.SurgeonID, 
	@ORNumber = INSERTED.ORNumber
	FROM INSERTED

    INSERT INTO PatientProcedures VALUES(@ProcedureAdmitID,
				@ProcedureDateTime, @ProcedureID, @PatientID,
				@SurgeonID, @ORNumber, 'Inserted' )
END
GO

Select * from ProcedureInfo;
-- add row into customer to test insert trigger
INSERT INTO ProcedureInfo VALUES('H586746','07-16-2022 00:02:00','97207', 12001,'2', 1);
GO
-- view data in customer archive
SELECT * FROM PatientProcedures;
GO
 -- create delete trigger
Create TRIGGER PatientProcedures_Delete ON ProcedureInfo
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ProcedureAdmitID nvarchar(10)
	DECLARE @ProcedureDateTime datetime
	DECLARE @ProcedureID nvarchar(10)
	DECLARE @PatientID int
	DECLARE @SurgeonID nvarchar(10)
	DECLARE @ORNumber int
    
    SELECT @ProcedureAdmitID =DELETED.ProcedureAdmitID, 
		@ProcedureDateTime = DELETED.ProcedureDateTime, 
		@ProcedureID = DELETED.ProcedureID,
		@PatientID = DELETED.PatientID, 
		@SurgeonID = DELETED.SurgeonID, 
		@ORNumber = DELETED.ORNumber
	FROM DELETED

    INSERT INTO PatientProcedures VALUES(@ProcedureAdmitID,
			@ProcedureDateTime, 
			@ProcedureID, @PatientID,
			@SurgeonID, @ORNumber, 'Deleted' )
END
GO
-- delete row from customer to test delete trigger
--Select * from ProcedureInfo;

DELETE FROM ProcedureInfo WHERE PatientID = 12001;
GO

-- view data in customer archive
SELECT * FROM PatientProcedures;

GO
 -- create update trigger
Create TRIGGER PatientProcedures_Update ON ProcedureInfo
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ProcedureAdmitID nvarchar(10)
	DECLARE @ProcedureDateTime datetime
	DECLARE @ProcedureID nvarchar(10)
	DECLARE @PatientID int
	DECLARE @SurgeonID nvarchar(10)
	DECLARE @ORNumber int

    
     SELECT @ProcedureAdmitID =INSERTED.ProcedureAdmitID, @ProcedureDateTime = INSERTED.ProcedureDateTime, @ProcedureID = INSERTED.ProcedureID,
	@PatientID = INSERTED.PatientID, @SurgeonID = INSERTED.SurgeonID, @ORNumber = INSERTED.ORNumber
	FROM INSERTED

    INSERT INTO PatientProcedures VALUES(@ProcedureAdmitID,@ProcedureDateTime, @ProcedureID, @PatientID, @SurgeonID, @ORNumber, 'Updated' )
END
GO


-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO ProcedureInfo VALUES('H586726','07-16-2022 00:02:00','97207', 12001,'2', 1);
GO

UPDATE ProcedureInfo
SET ORNumber = 3
WHERE PatientID = 56001;
GO
-- view data in customer archive
SELECT * FROM PatientProcedures;