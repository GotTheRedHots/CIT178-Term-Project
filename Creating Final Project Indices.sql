USE fictionalSurgeryCenter;
GO
CREATE INDEX idx_InsuranceZipcode ON Insurance(Zipcode);
GO
CREATE INDEX idx_PatientZipcode ON PatientInformation(Zipcode);
GO
CREATE INDEX idx_Billing ON Billing(InsuranceProviderID);
GO
CREATE INDEX idx_ProcInfoProcID ON ProcedureInfo(ProcedureID);
GO
CREATE INDEX idx_ProcInfoPatID ON ProcedureInfo(PatientID);
GO
CREATE INDEX idx_ProcInfoSurgID ON ProcedureInfo(SurgeonID);
GO
