<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
     * GET REPORT DATA
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

    Integer appliedApplications =
            (Integer) request.getAttribute("appliedApplications");

    Integer shortlistedApplications =
            (Integer) request.getAttribute("shortlistedApplications");

    Integer selectedApplications =
            (Integer) request.getAttribute("selectedApplications");

    Integer rejectedApplications =
            (Integer) request.getAttribute("rejectedApplications");

    Integer placementJobs =
            (Integer) request.getAttribute("placementJobs");

    Integer internshipJobs =
            (Integer) request.getAttribute("internshipJobs");


    /*
     * =========================================
     * NULL SAFETY
     * =========================================
     */

    if (totalStudents == null) totalStudents = 0;
    if (totalRecruiters == null) totalRecruiters = 0;
    if (totalCompanies == null) totalCompanies = 0;
    if (totalJobs == null) totalJobs = 0;
    if (totalApplications == null) totalApplications = 0;

    if (appliedApplications == null) appliedApplications = 0;
    if (shortlistedApplications == null) shortlistedApplications = 0;
    if (selectedApplications == null) selectedApplications = 0;
    if (rejectedApplications == null) rejectedApplications = 0;

    if (placementJobs == null) placementJobs = 0;
    if (internshipJobs == null) internshipJobs = 0;

    String error =
            (String) request.getAttribute("error");
%>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>
        Reports - Campus Connect
    </title>


    <style>

        * {
            box-sizing: border-box;
        }


        body {
            margin: 0;

            font-family:
                Arial,
                Helvetica,
                sans-serif;

            background: #f4f6f9;

            color: #333;
        }


        /* =========================================
           NAVBAR
           ========================================= */

        .navbar {
            background: #1f2937;

            color: white;

            padding: 18px 35px;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }


        .navbar-title {
            font-size: 24px;

            font-weight: bold;
        }


        .navbar-links {
            display: flex;

            gap: 25px;

            align-items: center;
        }


        .navbar-links a {
            color: white;

            text-decoration: none;

            font-weight: bold;
        }


        .navbar-links a:hover {
            text-decoration: underline;
        }


        .logout-btn {
            background: white;

            color: #1f2937 !important;

            padding: 8px 15px;

            border-radius: 6px;
        }


        /* =========================================
           MAIN CONTAINER
           ========================================= */

        .container {
            width: 94%;

            max-width: 1400px;

            margin: 35px auto 60px;
        }


        /* =========================================
           HEADER
           ========================================= */

        .page-header {
            background: white;

            padding: 30px;

            border-radius: 14px;

            box-shadow:
                0 3px 12px rgba(0, 0, 0, 0.08);

            margin-bottom: 30px;
        }


        .page-header h1 {
            margin: 0 0 8px;

            font-size: 32px;

            color: #1f2937;
        }


        .page-header p {
            margin: 0;

            color: #6b7280;

            font-size: 16px;
        }


        /* =========================================
           SECTION
           ========================================= */

        .section-title {
            margin: 30px 0 15px;

            font-size: 23px;

            color: #1f2937;
        }


        /* =========================================
           STAT GRID
           ========================================= */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(5, 1fr);

            gap: 18px;
        }


        .stat-card {
            background: white;

            padding: 22px;

            border-radius: 12px;

            box-shadow:
                0 3px 10px rgba(0, 0, 0, 0.07);

            transition: 0.2s;
        }


        .stat-card:hover {
            transform: translateY(-4px);
        }


        .stat-label {
            color: #6b7280;

            font-size: 14px;

            margin-bottom: 10px;
        }


        .stat-value {
            font-size: 32px;

            font-weight: bold;

            color: #1f2937;
        }


        /* =========================================
           REPORT GRID
           ========================================= */

        .report-grid {
            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 25px;
        }


        .report-card {
            background: white;

            padding: 25px;

            border-radius: 14px;

            box-shadow:
                0 3px 10px rgba(0, 0, 0, 0.07);
        }


        .report-card h3 {
            margin-top: 0;

            color: #1f2937;

            margin-bottom: 20px;
        }


        /* =========================================
           REPORT ROW
           ========================================= */

        .report-row {
            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 14px 0;

            border-bottom:
                1px solid #e5e7eb;
        }


        .report-row:last-child {
            border-bottom: none;
        }


        .report-name {
            font-weight: 600;
        }


        .report-number {
            font-weight: bold;

            font-size: 20px;
        }


        /* =========================================
           BADGES
           ========================================= */

        .badge {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: bold;
        }


        .badge-applied {
            background: #e0e7ff;

            color: #4338ca;
        }


        .badge-shortlisted {
            background: #fef3c7;

            color: #92400e;
        }


        .badge-selected {
            background: #dcfce7;

            color: #15803d;
        }


        .badge-rejected {
            background: #fee2e2;

            color: #b91c1c;
        }


        .badge-placement {
            background: #dbeafe;

            color: #1d4ed8;
        }


        .badge-internship {
            background: #dcfce7;

            color: #15803d;
        }


        /* =========================================
           SUCCESS BOX
           ========================================= */

        .success-box {
            margin-top: 25px;

            background: #ecfdf5;

            border: 1px solid #a7f3d0;

            color: #065f46;

            padding: 18px;

            border-radius: 10px;
        }


        /* =========================================
           ERROR
           ========================================= */

        .error-box {
            background: #fee2e2;

            color: #991b1b;

            padding: 15px;

            border-radius: 8px;

            margin-bottom: 20px;
        }


        /* =========================================
           BACK BUTTON
           ========================================= */

        .back-button {
            display: inline-block;

            margin-top: 30px;

            background: #2563eb;

            color: white;

            text-decoration: none;

            padding: 11px 18px;

            border-radius: 6px;

            font-weight: 600;
        }


        .back-button:hover {
            background: #1d4ed8;
        }


        /* =========================================
           RESPONSIVE
           ========================================= */

        @media (max-width: 1100px) {

            .stats-grid {
                grid-template-columns:
                    repeat(3, 1fr);
            }
        }


        @media (max-width: 750px) {

            .stats-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .report-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                flex-direction: column;

                gap: 15px;
            }
        }


        @media (max-width: 500px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .container {
                width: 96%;
            }

            .page-header {
                padding: 22px;
            }
        }

    </style>

</head>


<body>


<!-- =========================================
     NAVBAR
     ========================================= -->

<div class="navbar">

    <div class="navbar-title">
        Campus Connect
    </div>


    <div class="navbar-links">

        <a
            href="<%= request.getContextPath() %>/admin/dashboard"
        >
            Dashboard
        </a>


        <a
            href="<%= request.getContextPath() %>/logout"
            class="logout-btn"
        >
            Logout
        </a>

    </div>

</div>


<!-- =========================================
     MAIN
     ========================================= -->

<div class="container">


    <!-- =========================================
         HEADER
         ========================================= -->

    <div class="page-header">

        <h1>
            Reports & Statistics
        </h1>

        <p>
            View placement, internship and
            application statistics of Campus Connect.
        </p>

    </div>


    <!-- =========================================
         ERROR
         ========================================= -->

    <% if (error != null) { %>

        <div class="error-box">

            <%= error %>

        </div>

    <% } %>


    <!-- =========================================
         OVERALL STATISTICS
         ========================================= -->

    <h2 class="section-title">
        Overall Statistics
    </h2>


    <div class="stats-grid">


        <!-- STUDENTS -->

        <div class="stat-card">

            <div class="stat-label">
                Total Students
            </div>

            <div class="stat-value">
                <%= totalStudents %>
            </div>

        </div>


        <!-- RECRUITERS -->

        <div class="stat-card">

            <div class="stat-label">
                Total Recruiters
            </div>

            <div class="stat-value">
                <%= totalRecruiters %>
            </div>

        </div>


        <!-- COMPANIES -->

        <div class="stat-card">

            <div class="stat-label">
                Total Companies
            </div>

            <div class="stat-value">
                <%= totalCompanies %>
            </div>

        </div>


        <!-- JOBS -->

        <div class="stat-card">

            <div class="stat-label">
                Total Jobs
            </div>

            <div class="stat-value">
                <%= totalJobs %>
            </div>

        </div>


        <!-- APPLICATIONS -->

        <div class="stat-card">

            <div class="stat-label">
                Total Applications
            </div>

            <div class="stat-value">
                <%= totalApplications %>
            </div>

        </div>


    </div>


    <!-- =========================================
         DETAILED REPORTS
         ========================================= -->

    <h2 class="section-title">
        Detailed Reports
    </h2>


    <div class="report-grid">


        <!-- =====================================
             APPLICATION STATUS
             ===================================== -->

        <div class="report-card">

            <h3>
                Application Status
            </h3>


            <div class="report-row">

                <div>

                    <span class="badge badge-applied">
                        APPLIED
                    </span>

                </div>


                <div class="report-number">
                    <%= appliedApplications %>
                </div>

            </div>


            <div class="report-row">

                <div>

                    <span class="badge badge-shortlisted">
                        SHORTLISTED
                    </span>

                </div>


                <div class="report-number">
                    <%= shortlistedApplications %>
                </div>

            </div>


            <div class="report-row">

                <div>

                    <span class="badge badge-selected">
                        SELECTED
                    </span>

                </div>


                <div class="report-number">
                    <%= selectedApplications %>
                </div>

            </div>


            <div class="report-row">

                <div>

                    <span class="badge badge-rejected">
                        REJECTED
                    </span>

                </div>


                <div class="report-number">
                    <%= rejectedApplications %>
                </div>

            </div>

        </div>


        <!-- =====================================
             JOB TYPE
             ===================================== -->

        <div class="report-card">

            <h3>
                Job Type Distribution
            </h3>


            <div class="report-row">

                <div>

                    <span class="badge badge-placement">
                        PLACEMENT
                    </span>

                </div>


                <div class="report-number">
                    <%= placementJobs %>
                </div>

            </div>


            <div class="report-row">

                <div>

                    <span class="badge badge-internship">
                        INTERNSHIP
                    </span>

                </div>


                <div class="report-number">
                    <%= internshipJobs %>
                </div>

            </div>

        </div>


    </div>


    <!-- =========================================
         SYSTEM SUMMARY
         ========================================= -->

    <h2 class="section-title">
        System Summary
    </h2>


    <div class="report-card">

        <div class="report-row">

            <div class="report-name">
                Students registered
            </div>

            <div class="report-number">
                <%= totalStudents %>
            </div>

        </div>


        <div class="report-row">

            <div class="report-name">
                Recruiters registered
            </div>

            <div class="report-number">
                <%= totalRecruiters %>
            </div>

        </div>


        <div class="report-row">

            <div class="report-name">
                Companies registered
            </div>

            <div class="report-number">
                <%= totalCompanies %>
            </div>

        </div>


        <div class="report-row">

            <div class="report-name">
                Job opportunities
            </div>

            <div class="report-number">
                <%= totalJobs %>
            </div>

        </div>


        <div class="report-row">

            <div class="report-name">
                Applications submitted
            </div>

            <div class="report-number">
                <%= totalApplications %>
            </div>

        </div>

    </div>


    <!-- =========================================
         REPORT STATUS
         ========================================= -->

    <div class="success-box">

        <strong>
            Report Generated Successfully
        </strong>

        <br>

        Campus Connect report data has been
        generated directly from the MySQL database.

    </div>


    <!-- =========================================
         BACK BUTTON
         ========================================= -->

    <a
        href="<%= request.getContextPath() %>/admin/dashboard"
        class="back-button"
    >
        ← Back to Admin Dashboard
    </a>


</div>


</body>

</html>