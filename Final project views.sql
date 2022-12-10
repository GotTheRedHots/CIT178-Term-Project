/*Final Project Views


Create View PatientMailingInformation
as
select PatientFirstName + PatientLastName AS [Patient Name], 
	Address, Zipcode.City, Zipcode.State, Zipcode.Zipcode	 
From PatientInformation
join Zipcode on Zipcode.Zipcode = PatientInformation.Zipcode
;

Select * from PatientMailingInformation;

Create View ProceduresByDay
as
select Surgeon.ProviderName,  
PatientInformation.PatientFirstName + PatientInformation.PatientLastName AS [Patient Name], 
ProcedureDetails.ProcedureName, ProcedureDateTime
From ProcedureInfo
join PatientInformation on ProcedureInfo.PatientID = PatientInformation.PatientID
join Surgeon on Surgeon.SurgeonID =ProcedureInfo.SurgeonID
join ProcedureDetails on ProcedureDetails.ProcedureID = ProcedureInfo.ProcedureID;

Select * from ProceduresByDay;

Create View OR_Use_by_Practice
as
select ORNumber, PracticeGroupName, Specialty, ProcedureDateTime
From ProcedureInfo
join Surgeon on Surgeon.SurgeonID = ProcedureInfo.SurgeonID;

Create View InsuranceCompanyPhoneNumbers
as
select CompanyName, Phone
From Insurance;

alter View InsuranceCompanyPhoneNumbers
as
select CompanyName, Phone, Zipcode
From Insurance;

create view ProceduresWeDoHere
as 
select * from ProcedureDetails;

USE fictionalSurgeryCenter;
GO
INSERT INTO ProceduresWeDoHere(ProcedureID,ProcedureName)
VALUES('8754000','Mastectomy');

*/