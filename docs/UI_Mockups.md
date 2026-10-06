# Campus Connect
## UI Mock-ups and Screen Design

**Project Title:** Campus Connect – College Placement & Internship Management System

**Project Type:** Website Application

**Technology:** JSP, Servlets, Bootstrap 5, MySQL

**Academic Year:** 2026–27

**Guide:** Er. Ram Babu Buri

---

# 1. Introduction

The UI of Campus Connect is designed as a simple and responsive web interface for students, recruiters and administrators.

The interface is organized according to user roles so that each user can access the functions relevant to their responsibilities.

The major UI areas are:

- Authentication
- Student Portal
- Recruiter Portal
- Administrator Portal
- Application Management
- Interview Management
- Reports and Statistics

---

# 2. Design Objectives

The main objectives of the UI design are:

1. Provide simple navigation.
2. Provide role-based dashboards.
3. Make important information easy to understand.
4. Provide responsive layouts using Bootstrap.
5. Display application and interview status clearly.
6. Reduce unnecessary navigation steps.
7. Provide consistent buttons, cards, tables and forms.
8. Provide clear feedback after important operations.

---

# 3. Common UI Elements

The application uses common interface elements throughout the system.

## 3.1 Navigation Bar

The navigation area provides access to important pages according to the logged-in user's role.

Typical navigation options include:

- Dashboard
- Profile
- Jobs
- Applications
- Interviews
- Reports
- Logout

---

## 3.2 Buttons

Buttons are used for common actions such as:

- Login
- Apply
- Shortlist
- Reject
- Select
- Schedule Interview
- Update Result
- Logout

---

## 3.3 Status Badges

Application and interview results are represented using status labels.

### Application Status

- APPLIED
- SHORTLISTED
- REJECTED
- SELECTED

### Interview Result

- PENDING
- PASSED
- FAILED

These statuses make it easier for users to understand the current state of an application or interview.

---

# 4. Authentication Screen

## 4.1 Login Page

### Purpose

The login page provides authentication for all system users.

### Users

- Student
- Recruiter
- Administrator

### Main UI Components

- Email input field
- Password input field
- Login button

### Workflow

```text
Enter Email
     ↓
Enter Password
     ↓
Click Login
     ↓
Authenticate User
     ↓
Identify Role
     ↓
Open Appropriate Dashboard