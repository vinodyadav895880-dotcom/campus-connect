<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.model.Application" %>

<%
    if (session == null
            || session.getAttribute("userId") == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );

        return;
    }

    String userRole =
            (String) session.getAttribute("userRole");

    if (!"RECRUITER".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );

        return;
    }

    List<Application> applications =
            (List<Application>) request.getAttribute(
                    "applications"
            );

    String message =
            request.getParameter("message");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>Applications - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

</head>

<body class="bg-light">

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-dark bg-dark">

    <div class="container">

        <a
            class="navbar-brand"
            href="<%= request.getContextPath() %>/recruiter/dashboard.jsp"
        >
            Campus Connect
        </a>

        <div class="d-flex align-items-center gap-3">

            <span class="text-white">
                Recruiter
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


<!-- ================= MAIN CONTENT ================= -->

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>
                Student Applications
            </h2>

            <p class="text-muted mb-0">
                Review applications submitted by students.
            </p>

        </div>

        <a
            href="<%= request.getContextPath() %>/recruiter/dashboard.jsp"
            class="btn btn-secondary"
        >
            Dashboard
        </a>

    </div>


    <!-- ================= SUCCESS MESSAGE ================= -->

    <% if (message != null && !message.trim().isEmpty()) { %>

        <div class="alert alert-success alert-dismissible fade show">

            <%= message %>

            <button
                type="button"
                class="btn-close"
                data-bs-dismiss="alert"
            ></button>

        </div>

    <% } %>


    <!-- ================= ERROR MESSAGE ================= -->

    <% if (error != null && !error.trim().isEmpty()) { %>

        <div class="alert alert-danger">

            <%= error %>

        </div>

    <% } %>


    <!-- ================= NO APPLICATIONS ================= -->

    <% if (applications == null || applications.isEmpty()) { %>

        <div class="card shadow-sm">

            <div class="card-body text-center py-5">

                <h4>
                    No Applications Found
                </h4>

                <p class="text-muted mb-0">
                    No students have applied for your jobs yet.
                </p>

            </div>

        </div>

    <% } else { %>


        <!-- ================= APPLICATION CARDS ================= -->

        <div class="row g-4">

            <% for (Application app : applications) { %>

                <div class="col-12">

                    <div class="card shadow-sm">

                        <!-- ================= CARD HEADER ================= -->

                        <div class="card-header bg-dark text-white">

                            <div class="d-flex justify-content-between align-items-center">

                                <div>

                                    <h5 class="mb-1">

                                        <%= app.getStudentName() %>

                                    </h5>

                                    <small>

                                        Application ID:
                                        <%= app.getApplicationId() %>

                                    </small>

                                </div>


                                <!-- STATUS -->

                                <div>

                                    <% if ("APPLIED".equals(
                                            app.getStatus())) { %>

                                        <span class="badge bg-primary">
                                            APPLIED
                                        </span>

                                    <% } else if ("SHORTLISTED".equals(
                                            app.getStatus())) { %>

                                        <span class="badge bg-success">
                                            SHORTLISTED
                                        </span>

                                    <% } else if ("REJECTED".equals(
                                            app.getStatus())) { %>

                                        <span class="badge bg-danger">
                                            REJECTED
                                        </span>

                                    <% } else if ("SELECTED".equals(
                                            app.getStatus())) { %>

                                        <span class="badge bg-warning text-dark">
                                            SELECTED
                                        </span>

                                    <% } else { %>

                                        <span class="badge bg-secondary">
                                            <%= app.getStatus() %>
                                        </span>

                                    <% } %>

                                </div>

                            </div>

                        </div>


                        <!-- ================= CARD BODY ================= -->

                        <div class="card-body">

                            <div class="row g-4">


                                <!-- ================= STUDENT DETAILS ================= -->

                                <div class="col-md-6">

                                    <h5 class="mb-3">
                                        Student Details
                                    </h5>

                                    <table class="table table-bordered">

                                        <tr>

                                            <th style="width: 40%;">
                                                Name
                                            </th>

                                            <td>
                                                <%= app.getStudentName() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Email
                                            </th>

                                            <td>
                                                <%= app.getStudentEmail() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Enrollment No.
                                            </th>

                                            <td>
                                                <%= app.getEnrollmentNo() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Course
                                            </th>

                                            <td>
                                                <%= app.getCourse() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Branch
                                            </th>

                                            <td>
                                                <%= app.getBranch() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                CGPA
                                            </th>

                                            <td>
                                                <%= app.getCgpa() %>
                                            </td>

                                        </tr>

                                    </table>

                                </div>


                                <!-- ================= JOB DETAILS ================= -->

                                <div class="col-md-6">

                                    <h5 class="mb-3">
                                        Job Details
                                    </h5>

                                    <table class="table table-bordered">

                                        <tr>

                                            <th style="width: 40%;">
                                                Job Title
                                            </th>

                                            <td>
                                                <%= app.getJobTitle() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Company
                                            </th>

                                            <td>
                                                <%= app.getCompanyName() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Application Status
                                            </th>

                                            <td>

                                                <% if ("APPLIED".equals(
                                                        app.getStatus())) { %>

                                                    <span class="badge bg-primary">
                                                        APPLIED
                                                    </span>

                                                <% } else if ("SHORTLISTED".equals(
                                                        app.getStatus())) { %>

                                                    <span class="badge bg-success">
                                                        SHORTLISTED
                                                    </span>

                                                <% } else if ("REJECTED".equals(
                                                        app.getStatus())) { %>

                                                    <span class="badge bg-danger">
                                                        REJECTED
                                                    </span>

                                                <% } else if ("SELECTED".equals(
                                                        app.getStatus())) { %>

                                                    <span class="badge bg-warning text-dark">
                                                        SELECTED
                                                    </span>

                                                <% } else { %>

                                                    <span class="badge bg-secondary">
                                                        <%= app.getStatus() %>
                                                    </span>

                                                <% } %>

                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Applied At
                                            </th>

                                            <td>
                                                <%= app.getAppliedAt() %>
                                            </td>

                                        </tr>

                                    </table>

                                </div>

                            </div>


                            <!-- ================= ACTIONS ================= -->

                            <hr>


                            <div class="d-flex flex-wrap gap-2 align-items-center">

                                <span class="fw-bold me-2">
                                    Application Action:
                                </span>


                                <!-- SHORTLIST -->

                                <% if (!"SHORTLISTED".equals(
                                        app.getStatus())
                                        && !"SELECTED".equals(
                                                app.getStatus())
                                        && !"REJECTED".equals(
                                                app.getStatus())) { %>

                                    <form
                                        action="<%= request.getContextPath() %>/recruiter/update-application"
                                        method="post"
                                        class="d-inline"
                                    >

                                        <input
                                            type="hidden"
                                            name="applicationId"
                                            value="<%= app.getApplicationId() %>"
                                        >

                                        <input
                                            type="hidden"
                                            name="status"
                                            value="SHORTLISTED"
                                        >

                                        <button
                                            type="submit"
                                            class="btn btn-success btn-sm"
                                        >
                                            Shortlist
                                        </button>

                                    </form>

                                <% } %>


                                <!-- REJECT -->

                                <% if (!"REJECTED".equals(
                                        app.getStatus())
                                        && !"SELECTED".equals(
                                                app.getStatus())) { %>

                                    <form
                                        action="<%= request.getContextPath() %>/recruiter/update-application"
                                        method="post"
                                        class="d-inline"
                                    >

                                        <input
                                            type="hidden"
                                            name="applicationId"
                                            value="<%= app.getApplicationId() %>"
                                        >

                                        <input
                                            type="hidden"
                                            name="status"
                                            value="REJECTED"
                                        >

                                        <button
                                            type="submit"
                                            class="btn btn-danger btn-sm"
                                        >
                                            Reject
                                        </button>

                                    </form>

                                <% } %>


                                <!-- SELECT -->

                                <% if ("SHORTLISTED".equals(
                                        app.getStatus())) { %>

                                    <form
                                        action="<%= request.getContextPath() %>/recruiter/update-application"
                                        method="post"
                                        class="d-inline"
                                    >

                                        <input
                                            type="hidden"
                                            name="applicationId"
                                            value="<%= app.getApplicationId() %>"
                                        >

                                        <input
                                            type="hidden"
                                            name="status"
                                            value="SELECTED"
                                        >

                                        <button
                                            type="submit"
                                            class="btn btn-warning btn-sm"
                                        >
                                            Select
                                        </button>

                                    </form>

                                <% } %>


                                <!-- ================= SCHEDULE INTERVIEW ================= -->

                                <% if ("SHORTLISTED".equals(
                                        app.getStatus())) { %>

                                    <a
                                        href="<%= request.getContextPath() %>/recruiter/schedule-interview?applicationId=<%= app.getApplicationId() %>"
                                        class="btn btn-primary btn-sm"
                                    >
                                        Schedule Interview
                                    </a>

                                <% } %>

                            </div>


                            <!-- ================= INTERVIEW INFO ================= -->

                            <% if ("SHORTLISTED".equals(
                                    app.getStatus())) { %>

                                <div class="alert alert-info mt-3 mb-0">

                                    <strong>
                                        Interview Management:
                                    </strong>

                                    Since this student is shortlisted,
                                    you can schedule an interview using
                                    the <strong>Schedule Interview</strong>
                                    button.

                                </div>

                            <% } %>


                        </div>

                    </div>

                </div>

            <% } %>

        </div>

    <% } %>

</div>


<!-- ================= BOOTSTRAP JS ================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
></script>

</body>

</html>