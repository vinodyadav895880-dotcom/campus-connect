# Campus Connect – College Placement & Internship Management System

Campus Connect is a web-based College Placement and Internship Management System developed to simplify and manage placement and internship activities within a college.

The system provides separate role-based modules for Students, Recruiters, and Administrators. Students can manage their profiles, explore job opportunities, apply for jobs, and track applications and interviews. Recruiters can post job opportunities, view applications, shortlist/reject/select candidates, and schedule interviews. Administrators can monitor and manage the overall system through a centralized dashboard and reports.

## Features

### Student Module
- Student registration and login
- Secure authentication
- Student profile management
- View available placement and internship opportunities
- Apply for jobs
- Prevent duplicate applications
- Track application status
- View scheduled interviews
- View interview results
- Logout and session management

### Recruiter Module
- Recruiter login
- Recruiter dashboard
- Company profile management
- Post placement and internship opportunities
- View posted jobs
- View student applications
- View student details
- Shortlist candidates
- Reject candidates
- Select candidates
- Schedule interviews
- Update interview results

### Admin Module
- Admin login
- Centralized dashboard
- View total students
- View total recruiters
- View total companies
- View total jobs
- View total applications
- Manage students
- Manage recruiters
- Manage companies
- Manage jobs
- Manage applications
- Placement and internship reports
- Application status statistics
- Job type statistics

## Technology Stack

| Technology | Purpose |
|------------|---------|
| Java 21 | Backend programming |
| JSP | Dynamic web pages |
| Servlets | Request handling and controller logic |
| JDBC | Database connectivity |
| MySQL | Database management |
| Bootstrap 5 | Responsive user interface |
| HTML/CSS | Frontend structure and styling |
| JavaScript | Client-side functionality |
| Apache Tomcat 9 | Web application server |
| Maven | Project and dependency management |
| Eclipse IDE | Development environment |
| Git & GitHub | Version control and repository management |

## Architecture

The project follows the MVC (Model-View-Controller) architecture.

### Model
The Model layer contains Java classes and DAO classes responsible for application data and database operations.

Examples:
- Student
- Application
- Interview
- StudentDAO
- ApplicationDAO
- InterviewDAO
- AdminDAO

### View
The View layer is implemented using JSP pages.

Examples:
- Login page
- Student dashboard
- Recruiter dashboard
- Admin dashboard
- Jobs page
- Applications page
- Interviews page
- Reports page

### Controller
The Controller layer contains Java Servlets responsible for handling HTTP requests, validating user actions, managing sessions, and communicating between the View and Model layers.

## Database

The application uses MySQL as its relational database.

### Main Tables

- users
- students
- companies
- jobs
- applications
- interviews
- notifications

### Main Relationships

- A user can have a Student, Recruiter, or Admin role.
- A student can apply for multiple jobs.
- A company can post multiple jobs.
- A job can receive multiple applications.
- An application can have an interview.
- Users can receive notifications.

## Security

The application includes several security-related features:

- Role-based access control
- HTTP session management
- Password hashing using BCrypt
- Server-side input validation
- PreparedStatement for database queries
- Environment variables for database credentials
- Logout with session invalidation
- Restricted access to Student, Recruiter, and Admin modules

Database credentials are not stored directly in the source code. Environment variables are used for local database configuration.

## Project Structure

```text
campus-connect/
│
├── pom.xml
├── README.md
│
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── campusconnect/
        │           ├── controller/
        │           ├── dao/
        │           ├── model/
        │           └── util/
        │
        └── webapp/
            ├── admin/
            ├── recruiter/
            ├── student/
            ├── css/
            ├── js/
            └── login.jsp

            Campus Connect
│
├── Authentication
│
├── Student
│   ├── Profile
│   ├── Jobs
│   ├── Applications
│   └── Interviews
│
├── Recruiter
│   ├── Company
│   ├── Jobs
│   ├── Applications
│   └── Interviews
│
└── Admin
    ├── Dashboard
    ├── Students
    ├── Recruiters
    ├── Companies
    ├── Jobs
    ├── Applications
    └── Reports

    Login
  ↓
Student Dashboard
  ↓
View Jobs
  ↓
Apply for Job
  ↓
Application Submitted
  ↓
Recruiter Reviews Application
  ↓
Shortlisted / Rejected / Selected
  ↓
Interview Scheduled
  ↓
Interview Result

Login
  ↓
Recruiter Dashboard
  ↓
Post Job
  ↓
Receive Applications
  ↓
Review Student Details
  ↓
Shortlist / Reject / Select
  ↓
Schedule Interview
  ↓
Update Interview Result

Admin Login
  ↓
Admin Dashboard
  ↓
Monitor System Statistics
  ↓
Manage Students
  ↓
Manage Recruiters
  ↓
Manage Companies
  ↓
Manage Jobs
  ↓
Manage Applications
  ↓
View Reports