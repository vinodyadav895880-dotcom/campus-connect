CREATE DATABASE IF NOT EXISTS campus_connect;

USE campus_connect;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'RECRUITER', 'ADMIN') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    enrollment_no VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(15),
    course VARCHAR(100),
    branch VARCHAR(100),
    semester INT,
    cgpa DECIMAL(3,2),
    graduation_year INT,
    resume_path VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Companies table
CREATE TABLE IF NOT EXISTS companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    company_name VARCHAR(150) NOT NULL,
    industry VARCHAR(100),
    website VARCHAR(255),
    location VARCHAR(150),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Jobs table
CREATE TABLE IF NOT EXISTS jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    job_title VARCHAR(150) NOT NULL,
    job_type ENUM('PLACEMENT', 'INTERNSHIP') NOT NULL,
    description TEXT,
    eligibility VARCHAR(255),
    salary VARCHAR(100),
    location VARCHAR(150),
    application_deadline DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Applications table
CREATE TABLE IF NOT EXISTS applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    job_id INT NOT NULL,
    status ENUM('APPLIED', 'SHORTLISTED', 'REJECTED', 'SELECTED')
        DEFAULT 'APPLIED',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    UNIQUE (student_id, job_id)
);

-- Interviews table
CREATE TABLE IF NOT EXISTS interviews (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    interview_date DATE NOT NULL,
    interview_time TIME NOT NULL,
    interview_mode ENUM('ONLINE', 'OFFLINE') NOT NULL,
    meeting_link VARCHAR(255),
    venue VARCHAR(255),
    result ENUM('PENDING', 'PASSED', 'FAILED')
        DEFAULT 'PENDING',
    remarks VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

-- Notifications table
CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    message VARCHAR(500) NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);