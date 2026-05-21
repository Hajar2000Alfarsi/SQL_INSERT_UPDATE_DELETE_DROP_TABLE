USE Hospital;

INSERT INTO Patient (f_name,l_name,email,p_address,date_of_birth,blood_group,gender)
VALUES
('Ali','Hassan','ali@gmail.com','Muscat','1995-05-10','A+','Male'),

('Sara','Ahmed','sara@gmail.com','Seeb','1998-03-22','B+','Female'),

('Omar','Salim','omar@gmail.com','Bawshar','1992-07-15','O+','Male'),

('Noor','Khalid','noor@gmail.com','Muttrah','2000-01-30','AB+','Female'),

('Yusuf','Ibrahim','yusuf@gmail.com','AlKhoud','1996-09-12','A-','Male'),

('Laila','Fahad','laila@gmail.com','Muscat','1997-08-25','B-','Female');

SELECT * FROM Patient;

INSERT INTO Department
(dep_name,dep_location,number_of_doctor,contact_number,dep_head)
VALUES
('Cardiology','Floor1',5,'1111111111',NULL),

('Neurology','Floor2',4,'2222222222',NULL),

('Pediatrics','Floor3',6,'3333333333',NULL),

('Dermatology','Floor4',3,'4444444444',NULL);

SELECT * FROM Department;

INSERT INTO Doctor
(name,specialization,email,license_no,qualification,years_of_experience,supervised_id,dep_id)
VALUES
('Ahmed','Cardiology','ahmed@h.com','LIC100','MBBS',10,NULL,10),

('Mona','Neurology','mona@h.com','LIC101','MD',8,NULL,11),

('Khalid','Pediatrics','khalid@h.com','LIC102','MBBS',12,NULL,12),

('Aisha','Dermatology','aisha@h.com','LIC103','MD',7,NULL,13);

SELECT * FROM Doctor;

INSERT INTO Appointment
(patient_id,doctor_id,bill_id,app_status,app_type,reason,app_time,app_date)

VALUES
(1,100,NULL,'Completed','Checkup','Chest Pain','09:00','2026-05-21'),

(2,101,NULL,'Pending','Consultation','Headache','10:30','2026-05-22'),

(3,102,NULL,'Completed','Follow-up','Fever','11:00','2026-05-23'),

(4,103,NULL,'Pending','Checkup','Skin Allergy','12:00','2026-05-24'),

(1,100,NULL,'Completed','Follow-up','Heart Review','14:00','2026-05-25'),

(2,101,NULL,'Completed','Consultation','Migraine','15:00','2026-05-26'),

(5,102,NULL,'Pending','Checkup','Cold','16:00','2026-05-27'),

(1,103,NULL,'Pending','Consultation','Rash','17:00','2026-05-28');

SELECT * FROM Appointment;

INSERT INTO Patient_phone (patient_id,phone_number)
VALUES
(1,'91234567'),

(2,'92345678'),

(3,'93456789'),

(4,'94567890'),

(5,'93454489'),

(6,'94587890');

SELECT * FROM Patient_phone;

INSERT INTO Doctor_phone (doctor_id,phone_number)
VALUES
(100,'90001111'),

(101,'90002222'),

(102,'90003333'),

(103,'90004444');

SELECT * FROM Doctor_phone;

UPDATE Department SET dep_head = 100 WHERE dep_id = 10;
UPDATE Department SET dep_head = 101 WHERE dep_id = 11;
UPDATE Department SET dep_head = 102 WHERE dep_id = 12;
UPDATE Department SET dep_head = 103 WHERE dep_id = 13;

SELECT * FROM Department;

INSERT INTO billing (patient_id,b_date,total_amount,payment_status,payment_method,due_date)
VALUES
(1,'2026-05-21',50.000,'Paid','Cash','2026-05-30'),

(2,'2026-05-22',70.000,'Pending','Card','2026-06-01'),

(3,'2026-05-23',30.000,'Paid','Cash','2026-05-31'),

(4,'2026-05-24',100.000,'Pending','Transfer','2026-06-05');

SELECT * FROM billing;


INSERT INTO H_Services (patient_id,department_id,s_name,s_type,s_description,unit_price)
VALUES
(1,10,'ECG','Test','Heart Test',25.000),

(2,11,'BrainScan','Scan','CT Scan',50.000),

(3,12,'Vaccin','Care','Child Care',20.000),

(4,13,'SkinCheck','Exam','Skin Exam',30.000);

SELECT * FROM H_Services;


INSERT INTO Appointment_Services(service_id,appointment_id,quantity)
VALUES
(13,100000,1),

(14,100001,1),

(15,100002,2),

(16,100003,1);

SELECT * FROM Appointment_Services;

INSERT INTO MedicalRecord(patient_id,doctor_id,appointment_id,visit_date,preciribed_medications,doctor_notes,follow_up_required,requirement_plan,diagnosis)
VALUES
(1,100,100000,'2026-05-21','Aspirin','Patient stable','Yes','Heart review','Mild chest pain'),

(2,101,100001,'2026-05-22','Paracetamol','Need MRI','Yes','Neurology visit','Migraine'),

(3,102,100002,'2026-05-23','Ibuprofen','Improved','No','Rest','Flu'),

(4,103,100003,'2026-05-24','Cream','Skin reaction','Yes','Derm visit','Allergy');

SELECT * FROM MedicalRecord;

SELECT * FROM Appointment;

SELECT * FROM billing;

UPDATE Appointment SET bill_id = 1000 WHERE app_id = 100000;

UPDATE Appointment SET bill_id = 1001 WHERE app_id = 100001;

UPDATE Appointment SET bill_id = 1002 WHERE app_id = 100002;

UPDATE Appointment SET bill_id = 1003 WHERE app_id = 100003;

UPDATE Appointment SET bill_id = 1002 WHERE app_id = 100004;

UPDATE Appointment SET bill_id = 1003 WHERE app_id = 100005;

UPDATE Appointment SET bill_id = 1001 WHERE app_id = 100006;

UPDATE Appointment SET bill_id = 1000 WHERE app_id = 100007;

SELECT * FROM Doctor;

UPDATE Doctor SET supervised_id = 100 WHERE d_id = 101;

UPDATE Doctor SET supervised_id = 100 WHERE d_id = 102;

UPDATE Doctor SET supervised_id = 100 WHERE d_id = 103;

UPDATE Patient SET date_of_birth = '1994-05-10' WHERE p_id = 1;

SELECT * FROM Patient;

UPDATE Doctor SET specialization = 'Cardiac Surgery' WHERE d_id = 100;

SELECT * FROM Doctor;

UPDATE Appointment SET app_date = '2026-06-10' WHERE app_id = 100000;

SELECT * FROM Appointment;

UPDATE Patient SET f_name = 'Nour' WHERE p_id = 4;

SELECT * FROM Patient;

UPDATE Appointment SET doctor_id = 101 WHERE app_id = 100002;

SELECT * FROM Appointment;

DELETE FROM Appointment_Services WHERE appointment_id IN 
(SELECT app_id FROM Appointment WHERE patient_id = 5);

SELECT * FROM Appointment_Services;

DELETE FROM MedicalRecord WHERE patient_id = 5;

SELECT * FROM MedicalRecord;

DELETE FROM Appointment WHERE patient_id = 5;

SELECT * FROM Appointment;

DELETE FROM billing WHERE patient_id = 5;

SELECT * FROM billing;

DELETE FROM H_Services WHERE patient_id = 5;

SELECT * FROM H_Services;

DELETE FROM Patient_phone WHERE patient_id = 5;

SELECT * FROM Patient_phone;

DELETE FROM Patient WHERE p_id = 5;

SELECT * FROM Patient;


DELETE FROM MedicalRecord WHERE doctor_id = 103;

SELECT * FROM MedicalRecord;

DELETE FROM Appointment_Services WHERE appointment_id IN 
(SELECT App_id FROM Appointment WHERE doctor_id = 103);

SELECT * FROM Appointment_Services WHERE appointment_id IN 
(SELECT App_id FROM Appointment WHERE doctor_id = 103);

DELETE FROM Appointment WHERE doctor_id = 103;

SELECT * FROM Appointment;

UPDATE Department SET dep_head = NULL WHERE dep_head = 103;

SELECT * FROM Department;

UPDATE Doctor SET supervised_id = NULL WHERE supervised_id = 103;

SELECT * FROM Doctor;

DELETE FROM Doctor_phone WHERE doctor_id = 103;

SELECT * FROM Doctor_phone;

DELETE FROM Doctor WHERE d_id = 103;

SELECT * FROM Doctor;

DELETE FROM Appointment_Services WHERE appointment_id = 100000;

SELECT * FROM Appointment_Services;

DELETE FROM MedicalRecord WHERE appointment_id = 100000;

SELECT * FROM MedicalRecord;

DELETE FROM Appointment WHERE app_id = 100000 AND app_status='Completed';

SELECT * FROM Appointment;

DELETE FROM Patient WHERE p_id IN 
(SELECT p_id FROM Patient WHERE email IS NULL OR f_name IS NULL OR gender IS NULL);

SELECT * FROM Patient WHERE p_id IN 
(SELECT p_id FROM Patient WHERE email IS NULL OR f_name IS NULL OR gender IS NULL);


DELETE FROM Appointment_Services WHERE appointment_id IN
(SELECT app_id FROM Appointment WHERE doctor_id = 101);

SELECT * FROM Appointment_Services WHERE appointment_id IN
(SELECT app_id FROM Appointment WHERE doctor_id = 101);

DELETE FROM MedicalRecord WHERE doctor_id = 101;
SELECT * FROM MedicalRecord;

DELETE FROM MedicalRecord WHERE appointment_id IN 
(SELECT app_id FROM Appointment WHERE doctor_id = 101);

DELETE FROM Appointment WHERE doctor_id = 101;
SELECT * FROM Appointment WHERE doctor_id = 101;


--DROP TABLE Appointment_Services;

--DROP TABLE MedicalRecord;

--DROP TABLE Doctor_phone;

--DROP TABLE Patient_phone;

--DROP TABLE H_Services;

--DROP TABLE Appointment;

--DROP TABLE billing;

--DROP TABLE Doctor;

--DROP TABLE Department;

--DROP TABLE Patient;