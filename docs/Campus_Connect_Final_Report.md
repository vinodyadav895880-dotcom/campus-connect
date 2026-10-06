# CAMPUS CONNECT

## College Placement & Internship Management System

### Final Project Report

---

## Project Information

**Project Title:** Campus Connect – College Placement & Internship Management System

**Project Type:** Website Application

**Technology Track:** Java Website Application

**Academic Year:** 2026–27

**Guide:** Er. Ram Babu Buri

**Team Leader:** Vinod Yadav

### Team Members

1. Vinod Yadav
2. Ritika Yadav
3. Shalini Priya
4. Rakshit Sharma
5. Akshara Prashar

---

# CERTIFICATE

This is to certify that the project titled:

**“Campus Connect – College Placement & Internship Management System”**

has been developed as an academic project by the following students during the academic year 2026–27 under the guidance of:

**Er. Ram Babu Buri**

The project has been developed using Java-based web technologies, MySQL and Apache Tomcat and is intended to provide a centralized platform for college placement and internship management.

The project has been submitted for academic evaluation as part of the prescribed project-based learning requirements.

### Team Members

- Vinod Yadav
- Ritika Yadav
- Shalini Priya
- Rakshit Sharma
- Akshara Prashar

**Guide Signature:** ____________________

**Date:** ____________________

**College Seal:** ____________________

---

# DECLARATION

We hereby declare that the project titled:

**“Campus Connect – College Placement & Internship Management System”**

has been developed by us as part of our academic project work.

The project work presented in this report is based on our development, implementation, testing and documentation activities.

The project uses Java JSP, Servlets, JDBC, MySQL, Bootstrap 5, Maven and Apache Tomcat.

We understand the importance of academic integrity and have made efforts to ensure that the submitted work is properly documented.

### Team Members

1. Vinod Yadav
2. Ritika Yadav
3. Shalini Priya
4. Rakshit Sharma
5. Akshara Prashar

**Team Leader Signature:** ____________________

**Date:** ____________________

---

# ACKNOWLEDGEMENT

We would like to express our sincere gratitude to our project guide **Er. Ram Babu Buri** for providing guidance and support during the development of the Campus Connect project.

We are thankful to our department and college for providing the academic environment and resources required for developing and testing the project.

We also acknowledge the contribution of all team members who participated in requirement analysis, design, implementation, testing and documentation.

Finally, we thank everyone who provided suggestions and support throughout the development process.

---

# ABSTRACT

Campus Connect is a web-based **College Placement & Internship Management System** developed to centralize and simplify placement and internship activities.

The system provides separate role-based functionality for **Students, Recruiters and Administrators**.

Students can login, manage their profiles, view available placement and internship opportunities, apply for jobs, track application status and view scheduled interviews and interview results.

Recruiters can manage company-related information, post job opportunities, view student applications, update application status, shortlist or reject candidates, select candidates and schedule interviews.

Administrators can monitor the overall system through a dashboard containing statistics related to students, recruiters, companies, jobs and applications. The administrator can also view system reports.

The application has been developed using **Java 21, JSP, Servlets, JDBC, MySQL, Bootstrap 5, Maven and Apache Tomcat 9** and follows an **MVC architecture**.

Security-related features include session management, role-based authorization, input validation, BCrypt password hashing and environment-based database credentials.

The project aims to provide a structured, centralized and database-driven solution for managing college placement and internship activities.

---

# TABLE OF CONTENTS

1. Introduction
2. Problem Statement
3. Objectives
4. Existing System
5. Proposed System
6. Scope of the Project
7. User Roles
8. Technology Stack
9. System Requirements
10. System Architecture
11. Functional Requirements
12. Non-Functional Requirements
13. System Modules
14. Database Design
15. UML Design
16. UI Design
17. Security Implementation
18. Application Workflow
19. Implementation
20. Testing
21. Results and Observations
22. GitHub and Version Control
23. Future Enhancements
24. Limitations
25. Conclusion
26. References

---

# 1. INTRODUCTION

## 1.1 Background

Placement and internship activities are important parts of the college education process.

Students need access to job opportunities, recruiters, application information and interview details. Recruiters need a structured way to publish opportunities and manage student applications. Administrators need an overall view of the placement process and related statistics.

Managing these activities through separate manual processes can make information difficult to organize and track.

Campus Connect is developed as a centralized web application to address these requirements.

---

## 1.2 Purpose of the Project

The purpose of Campus Connect is to provide a common platform where:

- Students can find and apply for opportunities.
- Recruiters can manage job opportunities and applications.
- Administrators can monitor the overall placement system.

The application provides a structured workflow from job publication through application management and interview handling.

---

# 2. PROBLEM STATEMENT

Traditional placement and internship management may involve multiple manual tasks such as:

- Maintaining student records.
- Sharing job opportunities.
- Collecting student applications.
- Tracking application status.
- Coordinating interviews.
- Maintaining placement statistics.

These activities may result in difficulty in maintaining centralized information and tracking the progress of individual applications.

The problem addressed by this project is the need for a centralized, database-driven and role-based system for managing college placement and internship activities.

---

# 3. OBJECTIVES

The major objectives of Campus Connect are:

1. To create a centralized placement and internship platform.
2. To provide secure user authentication.
3. To implement role-based access for students, recruiters and administrators.
4. To allow students to maintain their profiles.
5. To allow students to view available jobs and internships.
6. To allow students to apply for opportunities.
7. To provide application status tracking.
8. To allow recruiters to post job opportunities.
9. To allow recruiters to view and manage student applications.
10. To provide interview scheduling functionality.
11. To provide interview result management.
12. To provide administrative dashboards and reports.
13. To integrate the complete workflow with a MySQL database.
14. To maintain project documentation and source code using Git and GitHub.

---

# 4. EXISTING SYSTEM

In a conventional placement workflow, different activities may be handled using separate tools or manual processes.

Examples may include:

- Spreadsheets for student records.
- Email or messaging applications for job information.
- Separate forms for collecting applications.
- Manual records for interview schedules.
- Manually maintained placement statistics.

### Problems with Such an Approach

- Data may be scattered across multiple locations.
- Application tracking may become difficult.
- Recruiters may not have a single application interface.
- Interview information may be difficult to maintain.
- Report generation can require manual effort.
- Access control is difficult to maintain consistently.

---

# 5. PROPOSED SYSTEM

Campus Connect provides a centralized web-based solution.

The proposed system provides:

- Centralized user management.
- Role-based authentication.
- Student profile management.
- Job and internship listing.
- Online application management.
- Application status tracking.
- Recruiter job management.
- Interview scheduling.
- Interview result management.
- Administrative dashboard.
- Database-driven reporting.

The proposed approach integrates these functions into one application.

---

# 6. SCOPE OF THE PROJECT

The project covers the major placement and internship activities of a college.

## Student Scope

Students can:

- Login.
- Access the student dashboard.
- Manage/view their profile.
- View available jobs and internships.
- Apply for opportunities.
- View applications.
- Track application status.
- View interview information.
- View interview result.

## Recruiter Scope

Recruiters can:

- Login.
- Access recruiter dashboard.
- Manage job opportunities.
- View student applications.
- Shortlist applicants.
- Reject applicants.
- Select applicants.
- Schedule interviews.
- View interviews.
- Update interview results.

## Administrator Scope

Administrators can:

- Login.
- View system dashboard.
- Monitor students.
- Monitor recruiters.
- Monitor companies.
- Monitor jobs.
- Monitor applications.
- View reports and statistics.

---

# 7. USER ROLES

## 7.1 Student

The Student is the user who searches for and applies to available placement and internship opportunities.

## 7.2 Recruiter

The Recruiter represents a company and manages job opportunities, student applications and interviews.

## 7.3 Administrator

The Administrator monitors the overall application and placement system.

---

# 8. TECHNOLOGY STACK

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

## Development Environment

- Eclipse IDE for Enterprise Java and Web Developers

## Version Control

- Git
- GitHub

---

# 9. SYSTEM REQUIREMENTS

## 9.1 Hardware Requirements

Recommended:

- Modern laptop or desktop computer.
- Minimum 4 GB RAM.
- Sufficient storage for development tools.
- Internet connection for GitHub and project resources.

## 9.2 Software Requirements

- Java Development Kit 21.
- Eclipse IDE.
- Apache Tomcat 9.
- MySQL.
- Apache Maven.
- Git.
- Web browser.

---

# 10. SYSTEM ARCHITECTURE

Campus Connect follows the **Model–View–Controller (MVC)** architecture.

## 10.1 Model

The Model represents application data and database-related objects.

Examples:

- Student
- Application
- Interview
- Job
- Company
- Database Access Objects

## 10.2 View

The View layer contains JSP pages responsible for presenting information to users.

Examples:

- Login
- Student Dashboard
- Student Profile
- Student Jobs
- Student Applications
- Student Interviews
- Recruiter Dashboard
- Recruiter Jobs
- Recruiter Applications
- Recruiter Interviews
- Admin Dashboard
- Admin Reports

## 10.3 Controller

The Controller layer contains Java Servlets.

Servlets:

- Receive HTTP requests.
- Validate user input.
- Check sessions and roles.
- Call DAO methods.
- Forward or redirect requests to appropriate JSP pages.

## 10.4 Database Layer

The database layer is implemented using MySQL and accessed through JDBC.

---

# 11. FUNCTIONAL REQUIREMENTS

## 11.1 Authentication

The system shall authenticate users using email and password.

## 11.2 Role Identification

The application identifies the user's role as:

- STUDENT
- RECRUITER
- ADMIN

## 11.3 Student Profile

The system supports student profile information including:

- Name
- Email
- Enrollment number
- Phone
- Course
- Branch
- Semester
- CGPA
- Graduation year
- Resume information

## 11.4 Job Listing

Students can view available:

- Placement opportunities.
- Internship opportunities.

## 11.5 Applications

Students can submit applications for job opportunities.

Duplicate applications for the same student and job are prevented using application validation and database constraints.

## 11.6 Application Status

Application status includes:

- APPLIED
- SHORTLISTED
- REJECTED
- SELECTED

## 11.7 Interview Management

Recruiters can schedule interviews.

Interview information includes:

- Date
- Time
- Mode
- Meeting link
- Venue
- Result
- Remarks

## 11.8 Interview Results

Interview result includes:

- PENDING
- PASSED
- FAILED

## 11.9 Reports

Administrators can view:

- Total students.
- Total recruiters.
- Total companies.
- Total jobs.
- Total applications.
- Application status distribution.
- Job type distribution.

---

# 12. NON-FUNCTIONAL REQUIREMENTS

## 12.1 Security

The system provides:

- BCrypt password hashing.
- Session-based authentication.
- Role-based authorization.
- Prepared statements.
- Environment-based database configuration.

## 12.2 Performance

The application is designed for normal college-level usage with database-driven retrieval of required information.

## 12.3 Usability

The user interface is designed to be simple and understandable for all three user roles.

## 12.4 Maintainability

MVC architecture separates presentation, controller logic and database operations.

## 12.5 Reliability

The application validates important inputs and handles database/application errors.

## 12.6 Portability

The application can run in Java-supported environments with the required server and database configuration.

---

# 13. SYSTEM MODULES

# 13.1 Authentication Module

Responsibilities:

- User login.
- Session creation.
- Role identification.
- Protected access.
- Logout.

---

# 13.2 Student Module

Responsibilities:

- Student dashboard.
- Student profile.
- Available jobs.
- Job application.
- Application tracking.
- Interview viewing.

---

# 13.3 Recruiter Module

Responsibilities:

- Recruiter dashboard.
- Job management.
- Application management.
- Candidate status updates.
- Interview scheduling.
- Interview result updates.

---

# 13.4 Administrator Module

Responsibilities:

- Dashboard statistics.
- Student monitoring.
- Recruiter monitoring.
- Company monitoring.
- Job monitoring.
- Application monitoring.
- Reports.

---

# 13.5 Interview Module

Responsibilities:

- Interview scheduling.
- Interview listing.
- Interview result management.
- Interview status display.

---

# 13.6 Reporting Module

Responsibilities:

- Overall statistics.
- Application status distribution.
- Job type distribution.
- System summary.

---

# 14. DATABASE DESIGN

The application uses MySQL.

The database is:

```text
campus_connect