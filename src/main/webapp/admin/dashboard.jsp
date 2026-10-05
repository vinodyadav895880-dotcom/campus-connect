<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /*
     * =========================================
     * ADMIN SESSION CHECK
     * =========================================
     */

    if (session == null
            || session.getAttribute("userId") == null) {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );

        return;
    }

    String userRole =
            (String) session.getAttribute("userRole");

    if (!"ADMIN".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );

        return;
    }


    /*
     * =========================================
     * DASHBOARD COUNTS
     * =========================================
     */

    Integer totalStudents =
            (Integer) request.getAttribute("totalStudents");

    Integer totalRecruiters =
            (Integer) request.getAttribute("totalRecruiters");

    Integer totalCompanies =
            (Integer) request.getAttribute("totalCompanies");

    Integer totalJobs =
            (Integer) request.getAttribute("totalJobs");

    Integer totalApplications =
            (Integer) request.getAttribute("totalApplications");


    /*
     * =========================================
     * NULL SAFETY
     * =========================================
     */

    if (totalStudents == null) {
        totalStudents = 0;
    }

    if (totalRecruiters == null) {
        totalRecruiters = 0;
    }

    if (totalCompanies == null) {
        totalCompanies = 0;
    }

    if (totalJobs == null) {
        totalJobs = 0;
    }

    if (totalApplications == null) {
        totalApplications = 0;
    }
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>
        Admin Dashboard - Campus Connect
    </title>


    <!-- Bootstrap 5 -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >


    <style>

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
        }


        /* =========================================
           NAVBAR
           ========================================= */

        .navbar {
            background: #212529;
        }


        /* =========================================
           STAT CARDS
           ========================================= */

        .stat-card {
            border: none;
            border-radius: 12px;
            transition: 0.2s;
        }


        .stat-card:hover {
            transform: translateY(-4px);
        }


        .stat-number {
            font-size: 32px;
            font-weight: 700;
        }


        .stat-icon {
            font-size: 34px;
        }


        /* =========================================
           MODULE CARDS
           ========================================= */

        .module-card {
            border: none;
            border-radius: 12px;
            transition: 0.2s;
        }


        .module-card:hover {
            transform: translateY(-4px);
        }


        .module-icon {
            font-size: 32px;
        }


        /* =========================================
           SECTION TITLE
           ========================================= */

        .section-title {
            font-weight: 700;
        }


        /* =========================================
           OVERVIEW
           ========================================= */

        .overview-card {
            border: none;
            border-radius: 12px;
        }


        .info-box {
            border-radius: 10px;
            background: #f8f9fa;
            padding: 18px;
        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar navbar-dark">

    <div class="container">

        <span class="navbar-brand fw-bold">
            Campus Connect
        </span>


        <div class="d-flex align-items-center gap-3">

            <span class="text-white">
                Admin Dashboard
            </span>


            <a
                href="<%= request.getContextPath() %>/logout"
                class="btn btn-light btn-sm"
            >
                Logout
            </a>

        </div>

    </div>

</nav>


<!-- =====================================================
     MAIN CONTAINER
     ===================================================== -->

<div class="container mt-5 mb-5">


    <!-- =================================================
         PAGE HEADER
         ================================================= -->

    <div class="mb-4">

        <h2 class="fw-bold">
            Admin Dashboard
        </h2>

        <p class="text-muted">
            Monitor Campus Connect placement and
            internship activities.
        </p>

    </div>


    <!-- =================================================
         STATISTICS
         ================================================= -->

    <div class="row g-4">


        <!-- STUDENTS -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm stat-card h-100">

                <div class="card-body">

                    <div
                        class="d-flex justify-content-between
                               align-items-center"
                    >

                        <div>

                            <p class="text-muted mb-1">
                                Total Students
                            </p>

                            <div class="stat-number">
                                <%= totalStudents %>
                            </div>

                        </div>


                        <div class="stat-icon">
                            👨‍🎓
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- RECRUITERS -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm stat-card h-100">

                <div class="card-body">

                    <div
                        class="d-flex justify-content-between
                               align-items-center"
                    >

                        <div>

                            <p class="text-muted mb-1">
                                Total Recruiters
                            </p>

                            <div class="stat-number">
                                <%= totalRecruiters %>
                            </div>

                        </div>


                        <div class="stat-icon">
                            🏢
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- COMPANIES -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm stat-card h-100">

                <div class="card-body">

                    <div
                        class="d-flex justify-content-between
                               align-items-center"
                    >

                        <div>

                            <p class="text-muted mb-1">
                                Total Companies
                            </p>

                            <div class="stat-number">
                                <%= totalCompanies %>
                            </div>

                        </div>


                        <div class="stat-icon">
                            🏭
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- JOBS -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm stat-card h-100">

                <div class="card-body">

                    <div
                        class="d-flex justify-content-between
                               align-items-center"
                    >

                        <div>

                            <p class="text-muted mb-1">
                                Total Jobs
                            </p>

                            <div class="stat-number">
                                <%= totalJobs %>
                            </div>

                        </div>


                        <div class="stat-icon">
                            💼
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =================================================
         APPLICATION + SYSTEM OVERVIEW
         ================================================= -->

    <div class="row g-4 mt-2">


        <!-- APPLICATIONS -->

        <div class="col-md-6">

            <div class="card shadow-sm overview-card h-100">

                <div class="card-body p-4">

                    <h5 class="fw-bold">
                        Applications Overview
                    </h5>

                    <p class="text-muted">
                        Total applications received through
                        Campus Connect.
                    </p>


                    <div class="display-5 fw-bold">
                        <%= totalApplications %>
                    </div>


                    <span class="text-muted">
                        Total Applications
                    </span>

                </div>

            </div>

        </div>


        <!-- SYSTEM OVERVIEW -->

        <div class="col-md-6">

            <div class="card shadow-sm overview-card h-100">

                <div class="card-body p-4">

                    <h5 class="fw-bold">
                        System Overview
                    </h5>

                    <p class="text-muted">
                        Campus Connect currently manages
                        students, recruiters, companies,
                        jobs and applications.
                    </p>


                    <div class="info-box">

                        <strong>
                            System Status
                        </strong>


                        <div class="mt-2">

                            <span class="badge bg-success">
                                Active
                            </span>

                            <span class="text-muted ms-2">
                                Campus Connect is running normally.
                            </span>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =================================================
         MANAGEMENT
         ================================================= -->

    <div class="mt-5">

        <h4 class="section-title mb-3">
            Management
        </h4>


        <div class="row g-4">


            <!-- ==========================================
                 MANAGE STUDENTS
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            👨‍🎓
                        </div>

                        <h5>
                            Manage Students
                        </h5>

                        <p class="text-muted">
                            View registered students and
                            their academic details.
                        </p>


                        <a
                            href="<%= request.getContextPath() %>/admin/students"
                            class="btn btn-primary"
                        >
                            Manage Students
                        </a>

                    </div>

                </div>

            </div>


            <!-- ==========================================
                 MANAGE RECRUITERS
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            🏢
                        </div>

                        <h5>
                            Manage Recruiters
                        </h5>

                        <p class="text-muted">
                            View registered recruiters and
                            company information.
                        </p>


                        <a
                            href="<%= request.getContextPath() %>/admin/recruiters"
                            class="btn btn-primary"
                        >
                            Manage Recruiters
                        </a>

                    </div>

                </div>

            </div>


            <!-- ==========================================
                 MANAGE COMPANIES
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            🏭
                        </div>

                        <h5>
                            Manage Companies
                        </h5>

                        <p class="text-muted">
                            View companies registered for
                            placement and internship drives.
                        </p>


                        <a
                            href="<%= request.getContextPath() %>/admin/companies"
                            class="btn btn-primary"
                        >
                            Manage Companies
                        </a>

                    </div>

                </div>

            </div>


            <!-- ==========================================
                 MANAGE JOBS
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            💼
                        </div>

                        <h5>
                            Manage Jobs
                        </h5>

                        <p class="text-muted">
                            Monitor placement and internship
                            job postings.
                        </p>


                        <a
                            href="<%= request.getContextPath() %>/admin/jobs"
                            class="btn btn-primary"
                        >
                            Manage Jobs
                        </a>

                    </div>

                </div>

            </div>


            <!-- ==========================================
                 MANAGE APPLICATIONS
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            📄
                        </div>

                        <h5>
                            Manage Applications
                        </h5>

                        <p class="text-muted">
                            Monitor student applications
                            and application status.
                        </p>


                        <a
                            href="<%= request.getContextPath() %>/admin/applications"
                            class="btn btn-primary"
                        >
                            Manage Applications
                        </a>

                    </div>

                </div>

            </div>


            <!-- ==========================================
                 REPORTS
                 ========================================== -->

            <div class="col-md-6 col-lg-3">

                <div class="card shadow-sm module-card h-100">

                    <div class="card-body">

                        <div class="module-icon mb-2">
                            📊
                        </div>

                        <h5>
                            Reports
                        </h5>

                        <p class="text-muted">
                            View placement and internship
                            reports and statistics.
                        </p>


                        <!-- WORKING REPORTS BUTTON -->

                        <a
                            href="<%= request.getContextPath() %>/admin/reports"
                            class="btn btn-primary"
                        >
                            View Reports
                        </a>

                    </div>

                </div>

            </div>


        </div>

    </div>


    <!-- =================================================
         MODULE OVERVIEW
         ================================================= -->

    <div class="mt-5">

        <h4 class="section-title mb-3">
            Campus Connect Modules
        </h4>


        <div class="card shadow-sm overview-card">

            <div class="card-body p-4">

                <div class="row g-4">


                    <!-- STUDENT MODULE -->

                    <div class="col-md-4">

                        <h6 class="fw-bold">
                            👨‍🎓 Student Module
                        </h6>

                        <p class="text-muted mb-0">
                            Student profile, available jobs,
                            applications and interviews.
                        </p>

                    </div>


                    <!-- RECRUITER MODULE -->

                    <div class="col-md-4">

                        <h6 class="fw-bold">
                            🏢 Recruiter Module
                        </h6>

                        <p class="text-muted mb-0">
                            Job posting, applications,
                            shortlisting and interviews.
                        </p>

                    </div>


                    <!-- ADMIN MODULE -->

                    <div class="col-md-4">

                        <h6 class="fw-bold">
                            🛡️ Admin Module
                        </h6>

                        <p class="text-muted mb-0">
                            System monitoring and management
                            of users and placement activities.
                        </p>

                    </div>


                </div>

            </div>

        </div>

    </div>


</div>


</body>

</html>