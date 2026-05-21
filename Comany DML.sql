USE Company

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Department';

ALTER TABLE Department DROP 
CONSTRAINT FK__DEPARTMEN__Manag__5FB337D6;

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'WorkingHours';

ALTER TABLE WorkingHours DROP 
CONSTRAINT FK__WorkingHour__SSN__6A30C649;

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Employee';

ALTER TABLE Employee DROP CONSTRAINT FK__Employee__Superv__5CD6CB2B;

ALTER TABLE Employee DROP CONSTRAINT FK_EMP_DEP;

DROP TABLE Employee;

CREATE TABLE Employee(
SSN int IDENTITY (1000,1) PRIMARY KEY,
F_Name varchar(10),
L_Name varchar(10),
gender varchar(8),
Date_of_Birth date,
Supervised_id int,
D_Num int, 
FOREIGN KEY (Supervised_id) REFERENCES Employee(SSN),
FOREIGN KEY (D_Num) REFERENCES DEPARTMENT(Dep_Num)
);

CREATE TABLE Dependent(
dependent_name varchar(15),
SSN int,
gender varchar(8) CHECK (GENDER IN ('Male', 'Female')),
date_of_birth date,
PRIMARY KEY (dependent_name, SSN),
FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK_DEP_EMP
FOREIGN KEY (Manager_id) REFERENCES Employee(SSN);

ALTER TABLE WorkingHours
ADD CONSTRAINT FK_WK_EMP
FOREIGN KEY (SSN) REFERENCES Employee(SSN);


INSERT INTO Employee(F_Name,L_Name,gender,Date_of_Birth,Supervised_id,D_Num)
VALUES ('Sara','Ahmed','Female','1998-03-22',NULL,NULL),
	('Omar','Salim','Male','1992-07-15',NULL,NULL),
	('Noor','Khalid','Female','2000-01-30',NULL,NULL),
	('Yusuf','Ibrahim','Male','1996-09-12',NULL,NULL),
	('Mona','Ali','Female','1999-11-05',NULL,NULL),
	('Hassan','Nabil','Male','1993-04-18',NULL,NULL),
	('Laila','Fahad','Female','1997-08-25',NULL,NULL);

INSERT INTO Employee(F_Name,L_Name,gender,Date_of_Birth,Supervised_id,D_Num)
VALUES ('Khalid','Zahran','Male','1994-02-14',NULL,NULL),
	('Aisha','Salim','Female','2001-06-09',NULL,NULL),
	('Ahmed','Ali','Male','1992-02-17',NULL,NULL);


SELECT * FROM Employee;

UPDATE Employee SET Supervised_id = 1000 WHERE SSN IN (1001,1002);
UPDATE Employee SET Supervised_id = 1001 WHERE SSN IN (1003,1005);
UPDATE Employee SET Supervised_id = 1002 WHERE SSN IN (1004,1006);
UPDATE Employee SET Supervised_id = 1003 WHERE SSN IN (1007);

UPDATE Employee SET Supervised_id = 1002 WHERE SSN IN (1013,1015);
UPDATE Employee SET Supervised_id = 1006 WHERE SSN IN (1014);

INSERT INTO DEPARTMENT (Dep_name,Manager_id,Hiring_date)
VALUES
('HR',1000,'2020-01-01'),
('IT',1001,'2019-05-10'),
('Finance',1002,'2018-03-15'),
('Sales',1004,'2021-07-20'),
('Admin',1005,'2022-09-01');

SELECT * FROM DEPARTMENT;

UPDATE Employee SET D_Num = 1 WHERE SSN IN (1000,1003);
UPDATE Employee SET D_Num = 2 WHERE SSN IN (1001,1006);
UPDATE Employee SET D_Num = 3 WHERE SSN IN (1002,1004);
UPDATE Employee SET D_Num = 4 WHERE SSN IN (1005,1007);

UPDATE Employee SET D_Num = 2 WHERE SSN IN (1015,1013);
UPDATE Employee SET D_Num = 4 WHERE SSN IN (1014);

INSERT INTO Department_Location (Department_Num, loc)
VALUES
(1,'Muscat'),
(2,'Seeb'),
(3,'Ruwi'),
(4,'Bowsher'),
(5,'Qurum');

SELECT * FROM Department_Location;

INSERT INTO Project (p_name,p_location,city,dept_num)
VALUES
('Website','Office','Muscat',2),
('Payroll','HQ','Seeb',3),
('AppDev','Lab','Ruwi',2),
('Audit','Office','Muscat',3),
('Marketing','Branch','Qurum',4),
('Support','CallCenter','Bowsher',1);

SELECT * FROM Project;

INSERT INTO Dependent (dependent_name,SSN,gender,date_of_birth)
VALUES
('Aisha',1000,'Female','2010-06-01'),
('Khalid',1014,'Male','2012-09-10'),
('Maryam',1001,'Female','2015-12-20'),
('YarA',1003,'Female','2018-03-14'),
('Omar',1004,'Male','2016-07-07'),
('Sara',1015,'Female','2014-05-10'),
('Ali',1005,'Male','2013-09-01'),
('Noor',1006,'Female','2017-11-22'),
('Hassan',1002,'Male','2011-08-30'),
('Laila Jr',1013,'Female','2019-02-14');

SELECT * FROM Dependent

INSERT INTO WorkingHours (SSN, project_number, working_hours)
VALUES 
(1000,100,8.5),
(1001,101,7.0),
(1002,102,9.0),
(1003,103,6.5),
(1004,104,8.0),
(1005,105,7.5),
(1006,100,5.0),
(1013,101,6.0),
(1014,102,8.0),
(1015,103,7.0);

SELECT * FROM WorkingHours;

ALTER TABLE Employee
ADD salary decimal(10,3);

SELECT * FROM Employee;

UPDATE Employee SET salary = 5000 WHERE SSN = 1000;
UPDATE Employee SET salary = 4500 WHERE SSN = 1001;
UPDATE Employee SET salary = 6000 WHERE SSN = 1002;
UPDATE Employee SET salary = 5200 WHERE SSN = 1003;
UPDATE Employee SET salary = 4800 WHERE SSN = 1004;
UPDATE Employee SET salary = 5000 WHERE SSN = 1005;
UPDATE Employee SET salary = 4500 WHERE SSN = 1006;
UPDATE Employee SET salary = 6000 WHERE SSN = 1013;
UPDATE Employee SET salary = 5200 WHERE SSN = 1014;
UPDATE Employee SET salary = 4800 WHERE SSN = 1015;

UPDATE Employee SET salary = salary * 1.10 WHERE D_Num = 2;

UPDATE DEPARTMENT SET Dep_name= 'IT Support' WHERE Dep_Num = 2;

SELECT * FROM DEPARTMENT;

UPDATE Project
SET p_name = 'HR System Upgrade'
WHERE p_number = 101;

SELECT * FROM Project;

UPDATE Employee
SET D_Num = 4
WHERE SSN = 1003;

SELECT * FROM Employee;

UPDATE Employee 
SET salary = 7500
WHERE SSN = 1002;

DELETE FROM Dependent WHERE SSN = 1013;
SELECT * FROM Dependent;

DELETE FROM WorkingHours WHERE SSN = 1013;
SELECT * FROM WorkingHours;

DELETE FROM Employee WHERE SSN = 1013; 


DELETE FROM Dependent WHERE SSN IN (SELECT SSN FROM Employee WHERE D_Num = 3);

DELETE FROM WorkingHours WHERE SSN IN (SELECT SSN FROM Employee WHERE D_NUM = 3);

UPDATE DEPARTMENT SET Manager_id = NULL 
WHERE Manager_id IN (SELECT SSN FROM EMPLOYEE WHERE D_Num =3);

SELECT * FROM DEPARTMENT;

UPDATE Employee SET Supervised_id = NULL 
WHERE Supervised_id IN (SELECT SSN FROM EMPLOYEE WHERE D_Num = 3);

DELETE FROM Employee WHERE D_Num = 3;
SELECT * FROM Employee;


DELETE FROM WorkingHours WHERE project_number = 101;
SELECT * FROM WorkingHours;

DELETE FROM Project WHERE p_number = 101;
SELECT * FROM Project;


UPDATE Employee SET D_Num = NULL WHERE D_NUM = 3;

UPDATE Project SET dept_num = NULL WHERE dept_num = 3;

DELETE FROM Department_Location WHERE Department_Num = 3;
SELECT * FROM Department_Location;

DELETE FROM DEPARTMENT WHERE Dep_Num = 3;
SELECT * FROM DEPARTMENT;


DELETE FROM Dependent WHERE SSN IN (SELECT SSN FROM Employee WHERE salary < 5000);
SELECT * FROM Dependent;

UPDATE DEPARTMENT SET Manager_id = NULL WHERE Manager_id IN (SELECT SSN FROM Employee WHERE salary < 5000);
SELECT * FROM DEPARTMENT;

DELETE FROM WorkingHours WHERE SSN IN (SELECT SSN FROM Employee WHERE salary < 5000);
SELECT * FROM WorkingHours;

UPDATE Employee SET Supervised_id = NULL  WHERE Supervised_id IN  (SELECT SSN FROM Employee WHERE salary < 5000);

DELETE FROM Employee WHERE salary < 5000;
SELECT * FROM Employee;


--DROP TABLE WorkingHours;

--DROP TABLE Dependent;

--DROP TABLE Project;

--DROP TABLE Department_Location;

--DROP TABLE Employee;

--DROP TABLE Department;	