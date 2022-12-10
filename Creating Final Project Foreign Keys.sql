
USE fictionalSurgeryCenter;
GO
ALTER TABLE ProcedureInfo WITH CHECK
ADD CONSTRAINT FK_ProcedureID FOREIGN KEY(ProcedureID) REFERENCES ProcedureDetails(ProcedureID)
ON UPDATE CASCADE
GO
ALTER TABLE ProcedureInfo WITH CHECK
ADD CONSTRAINT FK_PatientID FOREIGN KEY(PatientID) REFERENCES PatientInformation(PatientID)
ON UPDATE CASCADE
GO
ALTER TABLE ProcedureInfo WITH CHECK
ADD CONSTRAINT FK_SurgeonID FOREIGN KEY(SurgeonID) REFERENCES Surgeon(SurgeonID)
ON UPDATE CASCADE
GO
ALTER TABLE PatientInformation WITH CHECK
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)
ON UPDATE CASCADE
GO
ALTER TABLE Billing WITH CHECK
ADD CONSTRAINT FK_InsuranceProviderID FOREIGN KEY(InsuranceProviderID) REFERENCES Insurance(InsuranceProviderID)
ON UPDATE CASCADE
GO
ALTER TABLE Insurance
ADD CONSTRAINT FK_InsuranceZipcode FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)
ON UPDATE CASCADE
GO