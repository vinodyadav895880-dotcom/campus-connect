<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<%
    List<com.campusconnect.model.Application> applications =
            (List<com.campusconnect.model.Application>)
            request.getAttribute("applications");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>My Applications - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">


<!-- Navbar -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <a
            class="navbar-brand"
            href="<%= request.getContextPath() %>/student/dashboard.jsp">

            Campus Connect

        </a>

        <span class="text-white">

            My Applications

        </span>

    </div>

</nav>


<!-- Main Content -->

<div class="container mt-5 mb-5">


    <!-- Header -->

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>My Applications</h2>

            <p class="text-muted">

                Track the jobs and internships you have applied for.

            </p>

        </div>


        <a
            href="<%= request.getContextPath() %>/student/dashboard.jsp"
            class="btn btn-secondary">

            Back to Dashboard

        </a>

    </div>


    <!-- Error -->

    <% if (error != null) { %>

        <div class="alert alert-danger">

            <%= error %>

        </div>

    <% } %>


    <% if (applications == null || applications.isEmpty()) { %>


        <!-- No Applications -->

        <div class="card shadow-sm">

            <div class="card-body text-center p-5">

                <h4>

                    No Applications Yet

                </h4>

                <p class="text-muted">

                    You have not applied for any job or internship yet.

                </p>

                <a
                    href="<%= request.getContextPath() %>/student/jobs"
                    class="btn btn-primary">

                    Browse Jobs

                </a>

            </div>

        </div>


    <% } else { %>


        <!-- Applications Table -->

        <div class="card shadow-sm">

            <div class="card-body">

                <div class="table-responsive">

                    <table class="table table-hover align-middle">

                        <thead class="table-primary">

                            <tr>

                                <th>#</th>

                                <th>Job</th>

                                <th>Company</th>

                                <th>Status</th>

                                <th>Applied Date</th>

                            </tr>

                        </thead>


                        <tbody>

                        <%

                            int count = 1;

                            for (
                                com.campusconnect.model.Application appItem
                                : applications
                            ) {

                                String status =
                                        appItem.getStatus();

                                String badgeClass =
                                        "bg-secondary";


                                if ("APPLIED".equals(status)) {

                                    badgeClass =
                                            "bg-primary";

                                } else if ("SHORTLISTED".equals(status)) {

                                    badgeClass =
                                            "bg-warning text-dark";

                                } else if ("SELECTED".equals(status)) {

                                    badgeClass =
                                            "bg-success";

                                } else if ("REJECTED".equals(status)) {

                                    badgeClass =
                                            "bg-danger";
                                }

                        %>


                            <tr>

                                <td>

                                    <%= count++ %>

                                </td>


                                <td>

                                    <strong>

                                        <%= appItem.getJobTitle() %>

                                    </strong>

                                </td>


                                <td>

                                    <%= appItem.getCompanyName() %>

                                </td>


                                <td>

                                    <span
                                        class="badge <%= badgeClass %>">

                                        <%= status %>

                                    </span>

                                </td>


                                <td>

                                    <%= appItem.getAppliedAt() %>

                                </td>

                            </tr>


                        <%

                            }

                        %>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>


    <% } %>


</div>


</body>

</html>