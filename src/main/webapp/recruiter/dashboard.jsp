<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session == null
            || session.getAttribute("userId") == null) {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );

        return;
    }

    String userRole =
            (String) session.getAttribute("userRole");

    if (!"RECRUITER".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );

        return;
    }

    String userName =
            (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>Recruiter Dashboard - Campus Connect</title>

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
            class="navbar-brand fw-bold"
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

    <!-- Welcome Section -->

    <div class="mb-4">

        <h2 class="fw-bold">
            Welcome,
            <%= userName != null ? userName : "Recruiter" %> 👋
        </h2>

        <p class="text-muted">
            Manage jobs, applications and interviews from one place.
        </p>

    </div>


    <!-- ================= DASHBOARD CARDS ================= -->

    <div class="row g-4">


        <!-- POST / MANAGE JOBS -->

        <div class="col-md-4">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h4 class="card-title">
                        💼 Jobs
                    </h4>

                    <p class="card-text text-muted">
                        Create and manage placement and internship
                        opportunities for students.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/recruiter/jobs"
                        class="btn btn-primary"
                    >
                        Manage Jobs
                    </a>

                </div>

            </div>

        </div>


        <!-- APPLICATIONS -->

        <div class="col-md-4">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h4 class="card-title">
                        📄 Applications
                    </h4>

                    <p class="card-text text-muted">
                        View student applications and update their
                        application status.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/recruiter/applications"
                        class="btn btn-success"
                    >
                        Manage Applications
                    </a>

                </div>

            </div>

        </div>


        <!-- INTERVIEWS -->

        <div class="col-md-4">

            <div class="card shadow-sm h-100">

                <div class="card-body">

                    <h4 class="card-title">
                        🎯 Interviews
                    </h4>

                    <p class="card-text text-muted">
                        Schedule interviews and manage interview
                        results of shortlisted students.
                    </p>

                    <a
                        href="<%= request.getContextPath() %>/recruiter/interviews"
                        class="btn btn-warning"
                    >
                        Manage Interviews
                    </a>

                </div>

            </div>

        </div>


    </div>


    <!-- ================= QUICK ACTIONS ================= -->

    <div class="card shadow-sm mt-5">

        <div class="card-body">

            <h4 class="mb-4">
                Quick Actions
            </h4>

            <div class="d-flex flex-wrap gap-2">

                <a
                    href="<%= request.getContextPath() %>/recruiter/jobs"
                    class="btn btn-primary"
                >
                    ➕ Post Job
                </a>


                <a
                    href="<%= request.getContextPath() %>/recruiter/applications"
                    class="btn btn-success"
                >
                    📄 View Applications
                </a>


                <a
                    href="<%= request.getContextPath() %>/recruiter/interviews"
                    class="btn btn-warning"
                >
                    🎯 Manage Interviews
                </a>


                <a
                    href="<%= request.getContextPath() %>/logout"
                    class="btn btn-outline-danger"
                >
                    Logout
                </a>

            </div>

        </div>

    </div>


</div>


<!-- ================= BOOTSTRAP ================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
></script>

</body>

</html>