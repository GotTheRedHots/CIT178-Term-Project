
Create Database fictionalSurgeryCenter;

go
Use fictionalSurgeryCenter;

CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)
);
GO

CREATE TABLE ProcedureDetails(
	ProcedureID varchar(10) NOT NULL,
	ProcedureName varchar(50) NOT NULL,
	PRIMARY KEY(ProcedureID)
);
GO

CREATE TABLE Surgeon(
	SurgeonID varchar(10) NOT NULL,
	ProviderName varchar(50) NOT NULL,
	PracticeGroupName varchar(30) NOT NULL,
	Specialty varchar(40) NOT NULL,
	PRIMARY KEY(SurgeonID)
);
GO

CREATE TABLE ProcedureInfo(
	ProcedureAdmitID varchar(10) NOT NULL,
	ProcedureDateTime datetime NOT NULL,
	ProcedureID varchar(10) NOT NULL,
	PatientID int NOT NULL,
	SurgeonID varchar(10) NOT NULL,
	ORNumber int NOT NULL,
	PRIMARY KEY(ProcedureAdmitID)
);
GO

CREATE TABLE PatientInformation(
	PatientID int NOT NULL,
	PatientFirstName varchar(20) NOT NULL,
	PatientLastName varchar(30) NOT NULL,
	SexAtbirth char NOT NULL,
	Address varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	PRIMARY KEY(PatientID)
);

GO

CREATE TABLE Billing(
	PatientID int NOT NULL,
	InsuranceProviderID varchar(30) NOT NULL,
	PlanNumber int NOT NULL,
	PRIMARY KEY(PatientID)
);
GO
CREATE TABLE Insurance(
	InsuranceProviderID varchar(30) NOT NULL,
	CompanyName varchar (30) NOT NULL,
	Phone int NOT NULL,
	Address varchar(30),
	Zipcode varchar(10)NOT NULL,
	PRIMARY KEY(InsuranceProviderID)
);
GO

