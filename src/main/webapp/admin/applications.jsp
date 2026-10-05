<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.dao.AdminApplicationDAO.ApplicationRecord" %>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>
        Manage Applications - Campus Connect
    </title>


    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            color: #333;
        }


        /* =========================================
           NAVBAR
           ========================================= */

        .navbar {
            background: #1f2937;
            color: white;
            padding: 18px 30px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        .navbar h2 {
            margin: 0;
        }


        .navbar-links {
            display: flex;
            gap: 20px;
        }


        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }


        .navbar a:hover {
            text-decoration: underline;
        }


        /* =========================================
           MAIN CONTAINER
           ========================================= */

        .container {
            width: 95%;
            max-width: 1500px;
            margin: 30px auto;
        }


        /* =========================================
           HEADER
           ========================================= */

        .header-section {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;

            box-shadow:
                0 3px 10px rgba(0, 0, 0, 0.08);
        }


        .header-section h1 {
            margin-bottom: 8px;
            color: #1f2937;
        }


        .header-section p {
            color: #666;
        }


        /* =========================================
           TABLE CONTAINER
           ========================================= */

        .table-container {
            background: white;
            padding: 20px;
            border-radius: 12px;

            box-shadow:
                0 3px 10px rgba(0, 0, 0, 0.08);

            overflow-x: auto;
        }


        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1500px;
        }


        th {
            background: #1f2937;
            color: white;

            padding: 14px 12px;

            text-align: left;
            white-space: nowrap;
        }


        td {
            padding: 14px 12px;

            border-bottom:
                1px solid #e5e7eb;

            vertical-align: top;
        }


        tr:hover {
            background: #f9fafb;
        }


        /* =========================================
           STUDENT DETAILS
           ========================================= */

        .student-name {
            font-weight: bold;
            color: #1f2937;
        }


        .student-email {
            color: #666;
            font-size: 13px;
            margin-top: 4px;
        }


        .student-details {
            line-height: 1.6;
        }


        /* =========================================
           JOB DETAILS
           ========================================= */

        .job-title {
            font-weight: bold;
        }


        .company-name {
            color: #666;
            margin-top: 4px;
        }


        /* =========================================
           JOB TYPE
           ========================================= */

        .job-type {
            display: inline-block;

            padding: 6px 10px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: bold;
        }


        .placement {
            background: #dbeafe;
            color: #1d4ed8;
        }


        .internship {
            background: #dcfce7;
            color: #15803d;
        }


        /* =========================================
           STATUS
           ========================================= */

        .status {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: bold;
        }


        .applied {
            background: #e0e7ff;
            color: #4338ca;
        }


        .shortlisted {
            background: #fef3c7;
            color: #92400e;
        }


        .rejected {
            background: #fee2e2;
            color: #b91c1c;
        }


        .selected {
            background: #dcfce7;
            color: #15803d;
        }


        /* =========================================
           EMPTY MESSAGE
           ========================================= */

        .empty-message {
            text-align: center;

            padding: 50px;

            color: #777;

            font-size: 18px;
        }


        /* =========================================
           ERROR MESSAGE
           ========================================= */

        .error-message {
            background: #fee2e2;

            color: #b91c1c;

            padding: 15px;

            border-radius: 8px;

            margin-bottom: 20px;
        }


        /* =========================================
           BACK BUTTON
           ========================================= */

        .back-btn {
            display: inline-block;

            margin-top: 20px;

            padding: 10px 18px;

            background: #2563eb;

            color: white;

            text-decoration: none;

            border-radius: 6px;
        }


        .back-btn:hover {
            background: #1d4ed8;
        }


        /* =========================================
           RESPONSIVE
           ========================================= */

        @media (max-width: 768px) {

            .navbar {
                flex-direction: column;
                gap: 12px;
                text-align: center;
            }


            .container {
                width: 98%;
            }


            .header-section {
                padding: 20px;
            }

        }

    </style>

</head>


<body>


<%
    /*
     * =========================================
     * ADMIN SESSION CHECK
     * =========================================
     */

    String userRole =
            (String) session.getAttribute("userRole");


    if (!"ADMIN".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );

        return;
    }


    /*
     * =========================================
     * GET APPLICATION DATA
     * =========================================
     */

    List<ApplicationRecord> applications =
            (List<ApplicationRecord>)
                    request.getAttribute("applications");


    String error =
            (String) request.getAttribute("error");
%>


<!-- =========================================
     NAVBAR
     ========================================= -->

<div class="navbar">

    <h2>
        Campus Connect
    </h2>


    <div class="navbar-links">

        <a
            href="<%= request.getContextPath() %>/admin/dashboard"
        >
            Dashboard
        </a>


        <a
            href="<%= request.getContextPath() %>/logout"
        >
            Logout
        </a>

    </div>

</div>


<!-- =========================================
     MAIN CONTAINER
     ========================================= -->

<div class="container">


    <!-- =========================================
         HEADER
         ========================================= -->

    <div class="header-section">

        <h1>
            Manage Applications
        </h1>


        <p>
            View all student applications submitted
            for placement and internship opportunities.
        </p>

    </div>


    <!-- =========================================
         ERROR
         ========================================= -->

    <% if (error != null) { %>

        <div class="error-message">

            <%= error %>

        </div>

    <% } %>


    <!-- =========================================
         APPLICATION TABLE
         ========================================= -->

    <div class="table-container">


        <% if (applications == null
                || applications.isEmpty()) { %>


            <div class="empty-message">

                No application records found.

            </div>


        <% } else { %>


            <table>

                <thead>

                    <tr>

                        <th>
                            #
                        </th>

                        <th>
                            Student
                        </th>

                        <th>
                            Enrollment
                        </th>

                        <th>
                            Course / Branch
                        </th>

                        <th>
                            CGPA
                        </th>

                        <th>
                            Job
                        </th>

                        <th>
                            Type
                        </th>

                        <th>
                            Company
                        </th>

                        <th>
                            Status
                        </th>

                        <th>
                            Applied Date
                        </th>

                    </tr>

                </thead>


                <tbody>


                <%
                    int count = 1;

                    for (ApplicationRecord app
                            : applications) {
                %>


                    <tr>


                        <!-- NUMBER -->

                        <td>

                            <%= count++ %>

                        </td>


                        <!-- STUDENT -->

                        <td>

                            <div class="student-details">

                                <div class="student-name">

                                    <%= app.getStudentName() %>

                                </div>


                                <div class="student-email">

                                    <%= app.getStudentEmail() %>

                                </div>

                            </div>

                        </td>


                        <!-- ENROLLMENT -->

                        <td>

                            <%= app.getEnrollmentNo() %>

                        </td>


                        <!-- COURSE / BRANCH -->

                        <td>

                            <strong>
                                <%= app.getCourse() %>
                            </strong>

                            <br>

                            <span class="student-email">
                                <%= app.getBranch() %>
                            </span>

                        </td>


                        <!-- CGPA -->

                        <td>

                            <%= app.getCgpa() %>

                        </td>


                        <!-- JOB -->

                        <td>

                            <div class="job-title">

                                <%= app.getJobTitle() %>

                            </div>

                        </td>


                        <!-- JOB TYPE -->

                        <td>

                            <%
                                if ("PLACEMENT".equals(
                                        app.getJobType())) {
                            %>

                                <span
                                    class="job-type placement"
                                >
                                    Placement
                                </span>

                            <%
                                } else {
                            %>

                                <span
                                    class="job-type internship"
                                >
                                    Internship
                                </span>

                            <%
                                }
                            %>

                        </td>


                        <!-- COMPANY -->

                        <td>

                            <%= app.getCompanyName() %>

                        </td>


                        <!-- STATUS -->

                        <td>

                            <%
                                String status =
                                        app.getStatus();

                                String statusClass =
                                        "applied";


                                if ("SHORTLISTED".equals(
                                        status)) {

                                    statusClass =
                                            "shortlisted";

                                } else if ("REJECTED".equals(
                                        status)) {

                                    statusClass =
                                            "rejected";

                                } else if ("SELECTED".equals(
                                        status)) {

                                    statusClass =
                                            "selected";
                                }
                            %>


                            <span
                                class="status <%= statusClass %>"
                            >

                                <%= status %>

                            </span>

                        </td>


                        <!-- APPLIED DATE -->

                        <td>

                            <%= app.getAppliedAt() %>

                        </td>


                    </tr>


                <%
                    }
                %>


                </tbody>

            </table>


        <% } %>


    </div>


    <!-- =========================================
         BACK BUTTON
         ========================================= -->

    <a
        class="back-btn"
        href="<%= request.getContextPath() %>/admin/dashboard"
    >

        ← Back to Admin Dashboard

    </a>


</div>


</body>

</html>