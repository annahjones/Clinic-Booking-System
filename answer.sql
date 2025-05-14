-- -------------------------------------------
-- STEP 1: Create the database
CREATE DATABASE ClinicBookingsystem;
USE ClinicBookingSystem;

-- -------------------------------------------
-- STEP 2: Create Department table
-- -------------------------------------------
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT 
);

-- -------------------------------------------
-- STEP 3: Create Doctor table
-- -------------------------------------------
CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),   
    specialization VARCHAR(100),  
    department_id INT, 
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- -------------------------------------------
-- STEP 4: Create Patient table
-- -------------------------------------------
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    gender ENUM('Male', 'Female', 'Other') NOT NULL, 
    phone VARCHAR(15), 
    email VARCHAR(100) UNIQUE 
);

-- -------------------------------------------
-- STEP 5: Create Appointment table (linked to Department)
-- -------------------------------------------
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY, 
    appointment_date DATETIME NOT NULL, 
    patient_id INT NOT NULL, 
    doctor_id INT NOT NULL, 
    department_id INT NOT NULL, 
    status ENUM('Scheduled', 'Completed', 'Cancelled')
        DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- -------------------------------------------
-- STEP 6: Create Medical_Record table
-- -------------------------------------------
CREATE TABLE Medical_Record (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL, 
    visit_date DATE NOT NULL, 
    diagnosis TEXT NOT NULL, 
    prescription TEXT,  
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- -------------------------------------------
-- STEP 7: Insert sample Departments
-- -------------------------------------------
INSERT INTO Department (name, description) VALUES
('General Medicine', 'Handles general checkups and common illnesses'),
('Pediatrics', 'Health care for children'),
('Gynecology', 'Women’s reproductive health'),
('Cardiology', 'Heart-related treatments'),
('Dermatology', 'Skin conditions and treatments');

-- -------------------------------------------
-- STEP 8: Insert sample Doctors
-- -------------------------------------------
INSERT INTO Doctor (full_name, email, phone, specialization, department_id) VALUES
('Dr. James Mwangi', 'jmwangi@clinic.co.ke', '0712345678', 'General Practitioner', 1),
('Dr. Aisha Njeri', 'anjeri@clinic.co.ke', '0712345679', 'Pediatrician', 2),
('Dr. Grace Wambui', 'gwambui@clinic.co.ke', '0712345680', 'Gynecologist', 3),
('Dr. David Otieno', 'dotieno@clinic.co.ke', '0712345681', 'Cardiologist', 4),
('Dr. Brian Kiptoo', 'bkiptoo@clinic.co.ke', '0712345682', 'Dermatologist', 5);

-- -------------------------------------------
-- STEP 9: Insert sample Patients
-- -------------------------------------------
INSERT INTO Patient (full_name, date_of_birth, gender, phone, email) VALUES
('Samuel Kariuki', '1990-05-10', 'Male', '0722000011', 'skariuki@gmail.com'),
('Faith Chebet', '1995-08-22', 'Female', '0722000022', 'fchebet@gmail.com'),
('John Omondi', '1988-11-15', 'Male', '0722000033', 'jomondi@gmail.com'),
('Lucy Wanjiru', '2002-02-05', 'Female', '0722000044', 'lwanjiru@gmail.com'),
('Peter Ndegwa', '1975-12-30', 'Male', '0722000055', 'pndegwa@gmail.com');

-- -------------------------------------------
-- STEP 10: Insert sample Appointments (with department_id)
-- -------------------------------------------
INSERT INTO Appointment (appointment_date, patient_id, doctor_id, department_id, status) VALUES
('2025-05-14 10:00:00', 1, 1, 1, 'Scheduled'),
('2025-05-14 11:30:00', 2, 2, 2, 'Completed'),
('2025-05-15 09:00:00', 3, 4, 4, 'Cancelled'),
('2025-05-15 13:00:00', 4, 3, 3, 'Scheduled'),
('2025-05-16 15:30:00', 5, 5, 5, 'Scheduled');

-- -------------------------------------------
-- STEP 11: Insert sample Medical Records
-- -------------------------------------------
INSERT INTO Medical_Record (patient_id, doctor_id, visit_date, diagnosis, prescription) VALUES
(2, 2, '2025-05-14', 'Flu and fever', 'Paracetamol, rest, fluids'),
(3, 4, '2025-05-13', 'Mild chest pain', 'ECG test recommended, aspirin'),
(1, 1, '2025-05-12', 'Stomach upset', 'Flagyl for 5 days'),
(5, 5, '2025-05-10', 'Skin rash', 'Topical cream and antihistamine');
