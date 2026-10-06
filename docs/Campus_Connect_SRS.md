# Campus Connect
## Software Requirements Specification (SRS)

**Project Title:** Campus Connect – College Placement & Internship Management System

**Project Type:** Website Application

**Technology Track:** Java Website Application

**Academic Year:** 2026–27

**Guide:** Er. Ram Babu Buri

**Team Leader:** Vinod Yadav

---

# 1. Introduction

## 1.1 Purpose

Campus Connect is a web-based College Placement and Internship Management System developed to simplify and organize placement and internship activities within a college.

The system provides a common platform for students, recruiters and administrators. Students can maintain their profiles, view available placement and internship opportunities, apply for jobs and internships, and view their application and interview information.

Recruiters can manage job opportunities, view student applications, update application status and schedule interviews.

Administrators can monitor the overall system and view statistics related to students, recruiters, companies, jobs and applications.

The application is developed using Java JSP and Servlets with MySQL as the database and Apache Tomcat as the web server.

---

# 2. Project Scope

Campus Connect covers the major activities involved in college placement and internship management.

The system provides the following major functionality:

- User authentication and role-based access.
- Student profile management.
- Viewing available job and internship opportunities.
- Applying for available opportunities.
- Viewing application status.
- Recruiter job management.
- Recruiter application management.
- Shortlisting, rejecting and selecting candidates.
- Interview scheduling.
- Interview result management.
- Administrative dashboard.
- Placement and internship statistics.
- Database-driven reporting.
- Session management and access control.

The system is designed for use by students, recruiters and administrators.

---

# 3. Problem Statement

Traditional placement and internship activities may involve multiple manual processes such as maintaining student details, sharing job opportunities, collecting applications, tracking selection status and coordinating interviews.

Managing these activities manually can result in:

- Difficulty in maintaining student records.
- Difficulty in tracking applications.
- Delayed communication between students and recruiters.
- Lack of centralized job information.
- Difficulty in managing interview schedules.
- Difficulty in generating placement statistics.

Campus Connect addresses these problems by providing a centralized web-based platform for placement and internship management.

---

# 4. Objectives

The main objectives of Campus Connect are:

1. To provide a centralized placement and internship management platform.
2. To allow students to create and manage their profiles.
3. To provide students with available placement and internship opportunities.
4. To allow students to apply for suitable opportunities.
5. To allow recruiters to post and manage job opportunities.
6. To allow recruiters to manage student applications.
7. To provide application status tracking.
8. To provide interview scheduling functionality.
9. To allow recruiters to update interview results.
10. To provide administrators with system-level statistics and reports.
11. To improve the efficiency and organization of placement-related activities.
12. To implement secure authentication and role-based access.

---

# 5. User Roles

The system contains three primary user roles.

## 5.1 Student

A student can:

- Login to the system.
- View dashboard.
- Manage student profile.
- View available jobs and internships.
- Apply for available opportunities.
- View submitted applications.
- Track application status.
- View scheduled interviews.
- View interview results.
- Logout securely.

---

## 5.2 Recruiter

A recruiter can:

- Login to the system.
- Access recruiter dashboard.
- Manage company information.
- Post job opportunities.
- View posted jobs.
- View student applications.
- Shortlist applicants.
- Reject applicants.
- Select applicants.
- Schedule interviews for shortlisted candidates.
- View scheduled interviews.
- Update interview results.
- Logout securely.

---

## 5.3 Administrator

An administrator can:

- Login to the system.
- Access the administrative dashboard.
- View student statistics.
- View recruiter statistics.
- View company statistics.
- View job statistics.
- View application statistics.
- Manage and view students.
- Manage and view recruiters.
- Manage and view companies.
- Manage and view jobs.
- View applications.
- View placement and internship reports.
- Logout securely.

---

# 6. Functional Requirements

## FR-01: User Login

The system shall allow registered users to login using their email and password.

The system shall identify the user's role after successful authentication.

The user shall be redirected to the appropriate dashboard according to their role.

---

## FR-02: Role-Based Access

The system shall provide different access levels for:

- Student
- Recruiter
- Administrator

Users shall not be allowed to access modules that do not belong to their assigned role.

---

## FR-03: Session Management

The system shall maintain an authenticated user session after successful login.

The system shall verify the session before allowing access to protected pages.

The system shall invalidate the session when the user logs out.

---

## FR-04: Student Profile Management

The system shall allow students to view and manage their profile information.

Student profile information includes:

- Full name
- Email
- Enrollment number
- Phone number
- Course
- Branch
- Semester
- CGPA
- Graduation year
- Resume information

---

## FR-05: Job and Internship Listing

The system shall allow students to view available opportunities.

Each opportunity can contain:

- Job title
- Job type
- Company
- Description
- Eligibility
- Salary
- Location
- Application deadline

The job type may be:

- Placement
- Internship

---

## FR-06: Job Application

The system shall allow a student to apply for an available opportunity.

The system shall prevent duplicate applications for the same student and job opportunity.

After successful application, the application shall be stored in the database.

---

## FR-07: Application Tracking

The system shall allow students to view their submitted applications.

Application status may include:

- APPLIED
- SHORTLISTED
- REJECTED
- SELECTED

The student shall be able to monitor the current status of submitted applications.

---

## FR-08: Recruiter Job Management

The system shall allow recruiters to create and manage job opportunities.

Recruiters shall be able to provide job details such as:

- Job title
- Job type
- Description
- Eligibility
- Salary
- Location
- Application deadline

---

## FR-09: Recruiter Application Management

The system shall allow recruiters to view applications received for their job opportunities.

Recruiters shall be able to review student information associated with applications.

---

## FR-10: Application Status Management

Recruiters shall be able to update application status.

The supported application statuses are:

- APPLIED
- SHORTLISTED
- REJECTED
- SELECTED

---

## FR-11: Interview Scheduling

The system shall allow recruiters to schedule interviews for applicants.

Interview information includes:

- Interview date
- Interview time
- Interview mode
- Meeting link
- Venue

Interview mode may be:

- ONLINE
- OFFLINE

---

## FR-12: Interview Result Management

Recruiters shall be able to update interview results.

Supported interview results are:

- PENDING
- PASSED
- FAILED

Recruiters may also store interview remarks.

Students can view their interview information and result.

---

## FR-13: Administrative Dashboard

The system shall provide an administrative dashboard containing overall system statistics.

The dashboard includes:

- Total students
- Total recruiters
- Total companies
- Total jobs
- Total applications

---

## FR-14: Administrative Reports

The system shall generate database-based reports containing:

### Application Status Statistics

- Applied
- Shortlisted
- Selected
- Rejected

### Job Type Distribution

- Placement
- Internship

### System Summary

- Registered students
- Registered recruiters
- Registered companies
- Available job opportunities
- Submitted applications

---

## FR-15: Logout

The system shall provide a logout mechanism.

When the user logs out, the active session shall be invalidated and the user shall be redirected to the login page.

---

# 7. Non-Functional Requirements

## 7.1 Security

The system shall provide:

- Password hashing using BCrypt.
- Session-based authentication.
- Role-based authorization.
- Protected URLs.
- Input validation.
- Database access through JDBC.
- Environment-based database credentials.
- No hard-coded database password in source code.

---

## 7.2 Performance

The system should provide reasonable response time for normal college-level usage.

Database queries should retrieve only the required information.

Resources such as database connections, prepared statements and result sets should be properly closed.

---

## 7.3 Reliability

The system should handle invalid input and database errors gracefully.

The application should avoid application crashes due to incorrect user input.

---

## 7.4 Usability

The interface should be simple and understandable for students, recruiters and administrators.

Navigation should clearly provide access to the major features of each role.

---

## 7.5 Maintainability

The application follows the MVC architecture.

The project separates:

- Model
- View
- Controller
- DAO
- Utility components

This makes the application easier to maintain and extend.

---

## 7.6 Portability

The application can run in a Java-supported development environment using:

- Java 21
- Apache Tomcat 9
- MySQL
- Maven
- Eclipse

---

# 8. System Architecture

Campus Connect follows the Model–View–Controller (MVC) architecture.

## 8.1 Model

The Model layer represents application data and database operations.

Examples include:

- Student
- Application
- Interview
- DAO classes

The DAO layer communicates with MySQL using JDBC.

---

## 8.2 View

The View layer consists mainly of JSP pages.

Examples include:

- Login page
- Student dashboard
- Student profile
- Student jobs
- Student applications
- Student interviews
- Recruiter dashboard
- Recruiter jobs
- Recruiter applications
- Recruiter interviews
- Admin dashboard
- Admin reports

---

## 8.3 Controller

The Controller layer consists of Java Servlets.

Servlets receive requests from users, validate input, communicate with DAO classes and forward or redirect users to the required JSP pages.

---

# 9. Technology Stack

## Frontend

- HTML5
- CSS3
- JavaScript
- Bootstrap 5
- JSP

## Backend

- Java 21
- Java Servlets
- JDBC

## Database

- MySQL

## Server

- Apache Tomcat 9

## Build Tool

- Apache Maven

## IDE

- Eclipse IDE for Enterprise Java and Web Developers

## Version Control

- Git
- GitHub

---

# 10. Database Requirements

The system uses MySQL as the relational database.

The main tables are:

## 10.1 users

Stores authentication and basic user information.

Important fields:

- user_id
- full_name
- email
- password
- role
- created_at

---

## 10.2 students

Stores student-specific information.

Important fields:

- student_id
- user_id
- enrollment_no
- phone
- course
- branch
- semester
- cgpa
- graduation_year
- resume_path

---

## 10.3 companies

Stores recruiter/company information.

Important fields:

- company_id
- user_id
- company_name
- industry
- website
- location
- description

---

## 10.4 jobs

Stores placement and internship opportunities.

Important fields:

- job_id
- company_id
- job_title
- job_type
- description
- eligibility
- salary
- location
- application_deadline
- created_at

---

## 10.5 applications

Stores student applications for jobs.

Important fields:

- application_id
- student_id
- job_id
- status
- applied_at

A unique constraint prevents the same student from applying multiple times to the same job.

---

## 10.6 interviews

Stores interview scheduling and results.

Important fields:

- interview_id
- application_id
- interview_date
- interview_time
- interview_mode
- meeting_link
- venue
- result
- remarks
- created_at

---

## 10.7 notifications

Stores user-specific notification information.

Important fields:

- notification_id
- user_id
- message
- is_read
- created_at

---

# 11. Database Relationships

The major database relationships are:

- One user can have one student profile.
- One user can have one recruiter/company profile.
- One company can post multiple jobs.
- One student can submit multiple applications.
- One job can receive multiple applications.
- One application belongs to one student and one job.
- One application can have interview information.
- One user can have multiple notifications.

Foreign keys are used to maintain referential integrity between related tables.

---

# 12. System Workflow

## 12.1 Student Workflow

```text
Student Login
     ↓
Student Dashboard
     ↓
View Profile
     ↓
View Jobs / Internships
     ↓
Apply for Opportunity
     ↓
View My Applications
     ↓
Application Status Updated
     ↓
Interview Scheduled
     ↓
View Interview
     ↓
View Interview Result