/*
Use fictionalSurgeryCenter;


Insert Into Zipcode Values('35013', 	'Algood',	'AL')
Insert Into Zipcode Values('82242',	'VanTassell',	'WY')
Insert Into Zipcode Values('90001',	'Las Angeles',	'CA')
Insert Into Zipcode Values('10001', 	'New York City', 	'NY')
Insert Into Zipcode Values('49686',	'Traverse City',	'MI')
Insert Into Zipcode Values('84130',	'Salt Lake City', 	'UT')
Insert Into Zipcode Values('49684',	'Traverse City',	'MI')

select*from Zipcode;



Insert Into ProcedureDetails Values('8675',	'Total Hip Replacement')
Insert Into ProcedureDetails Values('97207',	'Appendectomy')
Insert Into ProcedureDetails Values('9684', 	'Bunionectomy')
Insert Into ProcedureDetails Values('753',	'Hysterectomy')
Insert Into ProcedureDetails Values('6524',	'Tonsilectomy')

select*from ProcedureDetails;


Insert into Surgeon Values('1',	'Smith',	'Hiller',	'Orthopedics')
Insert into Surgeon Values('2',	'Jenner',	'Morris',	'General Surgery')
Insert into Surgeon Values('3',	'Wallace',	'Great Lakes',	'ENT')
Insert into Surgeon Values('4',	'Chin',	'Baker',	'Gynecology')
Insert into Surgeon Values('5', 'Hadib',	'Hiller',	'Podiatry')

select*from Surgeon;


Insert Into Insurance values('865',	'Kaiser Permanente', '4569872',	'6587 Sommer Ave',	'90001')
Insert Into Insurance values('723',	'Blue Cross',	'5634287',	'512 Worchester blvd',	'10001')
Insert Into Insurance values('7356',	'Priority Health',	'3886645',	'987 Columbia Ave',	'90001')
Insert Into Insurance values('9868',	'United Healthcare',	'4653976',	'PO Bx 3551',	'90001')
Insert Into Insurance values('79276', 'Allied Healthcare',	'5648975',	'400 Major blvd	', '10001')

select*from Insurance;

Insert Into Billing values('12001',	'865',	'687254622')
Insert Into Billing values('23001',	'723',	'998729871')
Insert Into Billing values('34001',	'7356',	'693560279')
Insert Into Billing values('45001',	'9868',	'594678964')
Insert Into Billing values('56001',	'79276',	'736574650')

select*from Billing;


Insert Into PatientInformation values('12001',	'Jeff', 	'Winger',	'M',	'802 State St',	'49686')
Insert Into PatientInformation values('23001',	'Ben',	'Chang',	'M',	'215 Homestead Ct',	'49686')
Insert Into PatientInformation values('34001',	'Brita',	'Sullivan',	'F',  '810 Maple St',	'49684')
Insert Into PatientInformation values('45001',	'Abed',	'Smith',	'M',	'612 Station St',	'49684')
Insert Into PatientInformation values('56001',	'Shirley',	'Lane',	'M',	'221 Baker st',	'49684')

Select*from PatientInformation;

insert into ProcedureInfo values('TH096207',	'9/1/2022',	'8675',	'12001',	'1',	'6')
insert into ProcedureInfo values('A072657',	'8/23/2022',	'97207',	'23001',	'2',	'4')
insert into ProcedureInfo values('B0763275',	'7/16/2022',	'9684',	'34001',	'5',	'7')
insert into ProcedureInfo values('H0985297',	'5/13/2022',	'753',	'45001',	'4',	'9')
insert into ProcedureInfo values('T072476',	'9/3/2022',	'6524',	'56001',	'3',	'1')

Select*from ProcedureInfo;
*/
