/* #1


How many patients have we had year to date?

Use fictionalSurgeryCenter;
Select count(ProcedureAdmitID) as PatientsThisYear
from ProcedureInfo
where ProcedureDateTime > '2022-01-01';


What was a certain surgeons first case of the day?

Use fictionalSurgeryCenter;
select Min(ProcedureAdmitID) as FirstCaseOfTheDay
From ProcedureInfo
Where SurgeonID = 2 and ProcedureDateTime = '2022-08-23';



What was a certain surgeons last case of the day?

Use fictionalSurgeryCenter;
select Max(ProcedureAdmitID)
From ProcedureInfo
Where SurgeonID = 3 and ProcedureDateTime = '2022-09-03';


How many genetically Female patients have had procedures here this year?

Use fictionalSurgeryCenter;
Select count(ProcedureAdmitID)
from ProcedureInfo
join PatientInformation on PatientInformation.PatientID = ProcedureInfo.PatientID
where SexAtBirth = 'F';

*/


