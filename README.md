
Loading older messages…



























































Campus Connect — College Placement & Internship Management System
A Java-based web application that brings college placement and internship activities into one place. Students can explore opportunities and track applications, recruiters can manage jobs and candidates, and administrators can monitor placement activity through a central dashboard.

<p align="center"> <a href="https://campus-connect-production-8935.up.railway.app/campus-connect/login.jsp"><strong>🌐 Open Live Demo</strong></a> &nbsp; • &nbsp; <a href="https://github.com/vinodyadav895880-dotcom/campus-connect"><strong>💻 View Source Code</strong></a> </p> <p align="center"> <img alt="Java 21" src="https://img.shields.io/badge/Java-21-orange?logo=openjdk&logoColor=white"> <img alt="JSP and Servlets" src="https://img.shields.io/badge/Web-JSP%20%7C%20Servlets-blue"> <img alt="MySQL" src="https://img.shields.io/badge/Database-MySQL-4479A1?logo=mysql&logoColor=white"> <img alt="Apache Tomcat 9" src="https://img.shields.io/badge/Server-Tomcat%209-F8DC75?logo=apachetomcat&logoColor=black"> <img alt="Maven" src="https://img.shields.io/badge/Build-Maven-C71A36?logo=apachemaven&logoColor=white"> <img alt="Docker" src="https://img.shields.io/badge/Deployment-Docker-2496ED?logo=docker&logoColor=white"> <img alt="Railway" src="https://img.shields.io/badge/Hosting-Railway-6B46C1?logo=railway&logoColor=white"> </p>
Academic project | Academic year 2026–27
Project type: Java web application
Team leader: Vinod Yadav
Guide: Er. Ram Babu Buri

Table of Contents
Overview
Live Demo
Problem Statement
Features
Technology Stack
Architecture
Application Workflow
Database Design
Security and Configuration
Run Locally
Deployment
Project Structure
Project Milestones
Testing
Documentation
Team Contributions
Limitations and Future Enhancements
Overview
Campus Connect is a centralized placement and internship management system designed for college students, recruiters, and placement administrators. It organizes core placement activities in one application instead of relying on separate forms, messages, and spreadsheets.

The system has three role-based areas:

Student: maintain profile details, browse placement and internship opportunities, submit applications, track application status, and view scheduled interviews and results.
Recruiter: manage company and job details, review candidate applications, shortlist/reject/select candidates, and schedule interviews or update interview outcomes.
Administrator: monitor students, recruiters, companies, jobs, applications, and placement-related reports from a centralized dashboard.
Live Demo
Live application: https://campus-connect-production-8935.up.railway.app/campus-connect/login.jsp
Source repository: https://github.com/vinodyadav895880-dotcom/campus-connect
Hosting platform: Railway
Application runtime: Docker + Apache Tomcat 9
Database: MySQL hosted on Railway
The live deployment uses demonstration data for academic evaluation. Do not enter private, sensitive, or real student information into a public demo. Demo credentials are intentionally not published in this repository.

Problem Statement
Placement information and interview coordination can be scattered across spreadsheets, forms, emails, and separate communication channels. This makes it harder to track job opportunities, candidate application statuses, interview schedules, and overall placement activity.

Proposed solution: Campus Connect combines the main placement workflow in one role-based, database-backed web application so students, recruiters, and administrators can access the information relevant to their roles.

Features
Student Module
Student login and profile management
Browse placement and internship opportunities
Apply for a job and prevent duplicate applications
Track application statuses: APPLIED, SHORTLISTED, REJECTED, and SELECTED
View interview schedules and interview results
Logout and session management
Recruiter Module
Recruiter login and company profile management
Create and manage placement and internship job postings
Review applications and student information
Shortlist, reject, or select candidates
Schedule interviews with date, time, mode, meeting link, or venue
Update interview results
Administrator Module
Centralized dashboard and system statistics
Monitor students, recruiters, companies, jobs, and applications
Access placement and internship reports
View application-status and job-type summaries
Technology Stack
Layer / Purpose	Technology	How it is used
Backend and business logic	Java 21	Implements application rules and processing
View layer	JSP, HTML5, CSS3, JavaScript	Renders pages and browser-side interactions
Request handling	Java Servlets	Handles HTTP requests, validation, sessions, and navigation
Database access	JDBC	Connects Java code to MySQL and executes SQL statements
Relational database	MySQL	Stores users, profiles, companies, jobs, applications, and interviews
UI components	Bootstrap 5	Supports a consistent, responsive interface
Web runtime	Apache Tomcat 9	Runs the JSP/Servlet web application
Build and packaging	Apache Maven	Manages dependencies and builds the WAR package
Development IDE	Eclipse IDE	Used for Java web project development and local testing
Version control	Git and GitHub	Tracks code changes and supports collaboration
Container packaging	Docker	Packages the build and Tomcat runtime configuration
Cloud hosting	Railway	Hosts the web application and MySQL service
Architecture
The application follows the Model–View–Controller (MVC) pattern. JSP pages provide the View, Servlets act as Controllers, and Java model/DAO classes handle application data and database operations. MySQL provides persistent storage.

Supporting tools: Maven builds the deployable WAR file; Docker defines the build and runtime environment; Tomcat runs the application; Railway hosts the application and database services.

Application Workflow
Student workflow
Login → Browse Jobs → Apply → Track Status → View Interview → View Result

Recruiter workflow
Login → Manage Company/Jobs → Review Applications → Update Candidate Status → Schedule Interview → Update Interview Result

Administrator workflow
Login → Dashboard → Monitor Users and Jobs → Review Application Statistics → View Reports

Database Design
The schema is stored in `database/campus_connect_schema.sql`.

Table	Purpose
users	Authentication details and user role
students	Student profile and academic details
companies	Recruiter/company information
jobs	Placement and internship opportunities
applications	Student-to-job applications and application status
interviews	Interview schedules, mode, and results
notifications	User-specific notification records
Main relationships
A user may have a student or company/recruiter profile; administrator access is represented by the user role.
A company can post multiple jobs.
A student can submit applications to multiple jobs.
A job can receive applications from multiple students.
An application can have an associated interview.
Primary keys identify records, and foreign keys help maintain relationships between related tables.

Security and Configuration
The project includes the following security-related practices:

BCrypt password hashing and verification
Prepared statements for parameterized database queries
Server-side input validation
Session-based login state and logout/session invalidation
Role-aware access to student, recruiter, and administrator areas
Database connection configuration through environment variables instead of hard-coded credentials
Production note: Before use with real college or student data, perform a security review, verify access controls for every protected route, configure backups and monitoring, and use appropriate privacy and data-retention practices. This academic demo should not be treated as a fully audited production service.

Run Locally
Prerequisites
Install and configure:

JDK 21
MySQL
Apache Maven
Eclipse IDE for Enterprise Java and Web Developers (optional, for IDE-based development)
Apache Tomcat 9 (for a manual local deployment)
1. Clone the repository
git clone https://github.com/vinodyadav895880-dotcom/campus-connect.git
cd campus-connect
2. Create the database and tables
The schema file creates the campus_connect database and its tables. Run it using a MySQL account with permission to create the database:

mysql -u root -p < database/campus_connect_schema.sql
If your MySQL setup uses another administrative account, replace root with that account. The schema creates table definitions; it does not itself provide production credentials or guarantee that demo users/data are populated.

3. Configure database environment variables
Set these variables in the environment used to run Tomcat/application:

CAMPUS_DB_URL=jdbc:mysql://localhost:3306/campus_connect?serverTimezone=UTC
CAMPUS_DB_USER=your_mysql_username
CAMPUS_DB_PASSWORD=your_mysql_password
Replace the example username and password with your local MySQL credentials. Do not commit real credentials to GitHub. Create or seed application user records using the project’s supported registration/admin process before attempting to log in locally.

4. Build the application
mvn clean package
Maven should produce a WAR file in the target/ directory if the build completes successfully.

5. Run in Eclipse/Tomcat
Import the repository into Eclipse as an Existing Maven Project.
Ensure the project uses JDK 21 and Apache Tomcat 9.
Configure the database environment variables for the Tomcat launch configuration.
Run the project on the Tomcat server, or deploy the generated WAR to Tomcat.
Open the application context in your browser. For a WAR named campus-connect.war, the context path is typically /campus-connect.
For environment-specific setup and troubleshooting, see `docs/Project_Run_Guide.md`.

Deployment
The public application is deployed on Railway using a Dockerfile-based build.

Dockerfile defines the Maven build stage and Tomcat runtime stage.
docker-entrypoint.sh adjusts Tomcat’s HTTP connector to use the port provided by the hosting environment, then starts Tomcat.
.dockerignore excludes build output, Git metadata, logs, and local environment files from the Docker build context.
Railway environment variables provide the database URL, username, and password to the application service.
Environment variables required by the application
Variable	Purpose
CAMPUS_DB_URL	JDBC URL of the MySQL database
CAMPUS_DB_USER	Database username
CAMPUS_DB_PASSWORD	Database password
Keep all secrets in Railway’s private variable configuration. Never paste passwords, private keys, or complete secret values into this README or into source control.

Project Structure
campus-connect/
├── database/
│   └── campus_connect_schema.sql
├── docs/
│   ├── Campus_Connect_Final_Report.pdf
│   ├── Campus_Connect_SRS.md
│   ├── Project_Run_Guide.md
│   ├── Testing_Documentation.md
│   ├── Weekly_Progress_Tracking.md
│   ├── Use_Case_Diagram.png
│   ├── Class_Diagram.png
│   └── ER_Diagram.png
├── src/
│   └── main/
│       ├── java/com/campusconnect/
│       │   ├── controller/
│       │   ├── dao/
│       │   ├── model/
│       │   └── util/
│       └── webapp/
│           ├── admin/
│           ├── recruiter/
│           ├── student/
│           ├── css/
│           ├── js/
│           └── login.jsp
├── .dockerignore
├── Dockerfile
├── docker-entrypoint.sh
├── pom.xml
└── README.md
Project Milestones
The project was organized into these development stages:

Planning and requirements: define the placement-management problem, user roles, and requirements.
System design: prepare the MVC design, use-case/class/ER diagrams, and UI planning.
Database design: define tables, primary keys, foreign keys, and application relationships.
Implementation: develop authentication, student, recruiter, application, interview, and administrator functionality.
Integration and testing: connect modules with MySQL and verify the primary end-to-end placement workflow.
Version control and deployment: maintain source code on GitHub and deploy the Dockerized application to Railway.
Documentation and demonstration: prepare the report, run guide, test evidence, and live demo.
Actual daily work logs, signatures, review approvals, and milestone evidence should be maintained according to the college’s required format.

Testing
The following workflows have been manually exercised in the live demonstration:

Administrator login and dashboard access
Student login and dashboard access
Loading placement and internship listings
Submitting a student job application
Viewing the submitted application from the recruiter area
Shortlisting an application
Scheduling an interview from the recruiter area
Verifying the interview in the student area
This is manual functional verification, not a claim of automated test-suite coverage or a formal security audit.

Documentation
Final Project Report (PDF)
Software Requirements Specification
Project Run Guide
Testing Documentation
Weekly Progress Tracking
Use Case Diagram
Class Diagram
Entity Relationship Diagram
Database Schema
Team Contributions
Team member	Primary responsibility
Vinod Yadav — Team Leader	Authentication, integration, deployment coordination, and GitHub workflow
Ritika Yadav	Student module
Shalini Priya	Applications and interviews
Rakshit Sharma	Recruiter, company, and jobs modules
Akshara Prashar	Administrator module and reports
Team members should be credited according to the actual work completed and the contribution evidence maintained by the team.

Limitations and Future Enhancements
Potential areas for future work include:

Email and real-time notifications
Advanced job search and filtering
Resume document management
Automated eligibility checks
Online aptitude assessments
PDF/Excel report export and richer placement analytics
Expanded deployment monitoring, automated backups, and production hardening
Acknowledgements
Developed as an academic project for the 2026–27 session under the guidance of Er. Ram Babu Buri. Thanks to the Department, the guide, and all team members for their input and collaboration.

<p align="center"> <strong>Campus Connect</strong><br> Making college placement workflows more organized, accessible, and easier to track. </p>


⋮⋮⋮⋮⋮⋮⋮⋮
