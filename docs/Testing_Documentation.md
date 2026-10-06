# Campus Connect
## Testing Documentation

**Project Title:** Campus Connect – College Placement & Internship Management System

**Project Type:** Website Application

**Technology:** Java JSP, Servlets, JDBC, MySQL, Bootstrap 5, Apache Tomcat 9

**Academic Year:** 2026–27

**Guide:** Er. Ram Babu Buri

---

# 1. Introduction

Testing is performed to verify that the Campus Connect application works correctly according to its functional requirements.

The testing process covers the major user roles:

- Student
- Recruiter
- Administrator

The major workflows tested include authentication, role-based access, profile management, job management, applications, interview management, dashboards and reports.

---

# 2. Testing Objectives

The objectives of testing are:

1. Verify that users can login successfully.
2. Verify role-based access control.
3. Verify student functionality.
4. Verify recruiter functionality.
5. Verify administrator functionality.
6. Verify database operations.
7. Verify application status management.
8. Verify interview scheduling and result management.
9. Verify validation and error handling.
10. Verify logout and session management.
11. Verify integration between frontend, servlets and MySQL.
12. Ensure the application behaves correctly after restart and redeployment.

---

# 3. Testing Environment

## Hardware

- MacBook / Laptop
- Minimum 4 GB RAM
- Internet connection

## Software

- Java 21
- Apache Tomcat 9
- MySQL
- Maven
- Eclipse IDE
- Web Browser
- Git and GitHub

---

# 4. Testing Methodology

The application was tested using functional and integration testing.

## Functional Testing

Each major feature was tested independently to verify its expected behavior.

## Integration Testing

Different modules were tested together to verify database and workflow integration.

Example:

```text
Student
   ↓
Views Job
   ↓
Applies
   ↓
Recruiter Views Application
   ↓
Recruiter Shortlists
   ↓
Interview Scheduled
   ↓
Interview Result Updated
   ↓
Student Views Result