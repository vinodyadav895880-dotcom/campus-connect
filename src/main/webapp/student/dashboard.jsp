<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

    if (!"STUDENT".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );

        return;
    }

    com.campusconnect.model.User loggedInUser =
            (com.campusconnect.model.User)
                    session.getAttribute("loggedInUser");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>Student Dashboard - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

</head>

<body class="bg-light">

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <a
            class="navbar-brand fw-bold"
            href="<%= request.getContextPath() %>/student/dashboard.jsp"
        >
            Campus Connect
        </a>

        <div class="d-flex align-items-center gap-3">

            <span class="text-white">

                Welcome,

                <%
                    if (loggedInUser != null) {
                %>

                    <%= loggedInUser.getFullName() %>

                <%
                    } else {
                %>

                    Student

                <%
                    }
                %>

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

    <!-- PAGE HEADER -->

    <div class="mb-4">

        <h2>
            Student Dashboard
        </h2>

        <p class="text-muted">
            Manage your profile, jobs, applications and interviews.
        </p>

    </div>


    <!-- ================= DASHBOARD CARDS ================= -->

    <div class="row g-4">


        <!-- ================= PROFILE ================= -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h5 class="card-title">
                        My Profile
                    </h5>

                    <p class="card-text text-muted">
                        View and update your student profile and academic details.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/student/profile"
                        class="btn btn-primary"
                    >
                        View Profile
                    </a>

                </div>

            </div>

        </div>


        <!-- ================= JOBS ================= -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h5 class="card-title">
                        Available Jobs
                    </h5>

                    <p class="card-text text-muted">
                        Browse available placement and internship opportunities.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/student/jobs"
                        class="btn btn-success"
                    >
                        Browse Jobs
                    </a>

                </div>

            </div>

        </div>


        <!-- ================= APPLICATIONS ================= -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h5 class="card-title">
                        My Applications
                    </h5>

                    <p class="card-text text-muted">
                        Track the status of jobs you have applied for.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/student/applications"
                        class="btn btn-warning"
                    >
                        View Applications
                    </a>

                </div>

            </div>

        </div>


        <!-- ================= INTERVIEWS ================= -->

        <div class="col-md-6 col-lg-3">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h5 class="card-title">
                        My Interviews
                    </h5>

                    <p class="card-text text-muted">
                        View your scheduled placement and internship interviews.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/student/interviews"
                        class="btn btn-primary"
                    >
                        View Interviews
                    </a>

                </div>

            </div>

        </div>

    </div>


    <!-- ================= QUICK ACTIONS ================= -->

    <div class="card shadow-sm mt-5">

        <div class="card-header bg-dark text-white">

            <h5 class="mb-0">
                Quick Actions
            </h5>

        </div>

        <div class="card-body">

            <div class="d-flex flex-wrap gap-2">

                <a
                    href="<%= request.getContextPath() %>/student/profile"
                    class="btn btn-outline-primary"
                >
                    My Profile
                </a>

                <a
                    href="<%= request.getContextPath() %>/student/jobs"
                    class="btn btn-outline-success"
                >
                    Browse Jobs
                </a>

                <a
                    href="<%= request.getContextPath() %>/student/applications"
                    class="btn btn-outline-warning"
                >
                    My Applications
                </a>

                <a
                    href="<%= request.getContextPath() %>/student/interviews"
                    class="btn btn-outline-primary"
                >
                    My Interviews
                </a>

            </div>

        </div>

    </div>


    <!-- ================= SYSTEM INFORMATION ================= -->

    <div class="card shadow-sm mt-4">

        <div class="card-body">

            <h5>
                Campus Connect
            </h5>

            <p class="text-muted mb-0">

                Campus Connect helps students discover placement
                and internship opportunities, apply for jobs,
                track application status and manage scheduled interviews.

            </p>

        </div>

    </div>


    <!-- ================= PLACEMENT TIP ================= -->

    <div class="alert alert-info shadow-sm mt-4" role="alert">

        <h6 class="alert-heading">
            Placement Tip
        </h6>

        <p class="mb-0">
            Keep your profile and academic details updated
            before applying for placement opportunities.
        </p>

    </div>

</div>


<!-- ================= BOOTSTRAP JS ================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
></script>

</body>

</html>
