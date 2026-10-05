<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.dao.RecruiterDAO.RecruiterRecord" %>

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

    if (!"ADMIN".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );

        return;
    }

    List<RecruiterRecord> recruiters =
            (List<RecruiterRecord>) request.getAttribute("recruiters");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Manage Recruiters - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <style>

        body {
            background-color: #f5f7fb;
        }

        .navbar {
            background: #212529;
        }

        .page-header {
            background: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .table-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
        }

        .table th {
            white-space: nowrap;
        }

        .badge-company {
            background-color: #e7f1ff;
            color: #0d6efd;
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-dark">

    <div class="container">

        <a
            class="navbar-brand fw-bold"
            href="<%= request.getContextPath() %>/admin/dashboard">

            Campus Connect

        </a>

        <div class="d-flex align-items-center gap-3">

            <span class="text-white">
                Admin
            </span>

            <a
                href="<%= request.getContextPath() %>/admin/dashboard"
                class="btn btn-outline-light btn-sm">

                Dashboard

            </a>

            <a
                href="<%= request.getContextPath() %>/logout"
                class="btn btn-light btn-sm">

                Logout

            </a>

        </div>

    </div>

</nav>


<!-- MAIN -->

<div class="container mt-5">

    <!-- HEADER -->

    <div class="page-header shadow-sm">

        <h2 class="fw-bold mb-2">
            Manage Recruiters
        </h2>

        <p class="text-muted mb-0">
            View registered recruiters and their company information.
        </p>

    </div>


    <!-- ERROR -->

    <% if (error != null) { %>

        <div class="alert alert-danger">

            <%= error %>

        </div>

    <% } %>


    <!-- RECRUITER TABLE -->

    <div class="table-card shadow-sm">

        <div class="p-4 border-bottom">

            <h5 class="fw-bold mb-0">
                Registered Recruiters
            </h5>

        </div>


        <% if (recruiters == null || recruiters.isEmpty()) { %>

            <div class="p-5 text-center">

                <div style="font-size: 50px;">
                    🏢
                </div>

                <h5 class="mt-3">
                    No Recruiters Found
                </h5>

                <p class="text-muted">
                    There are currently no registered recruiters.
                </p>

            </div>

        <% } else { %>


            <div class="table-responsive">

                <table class="table table-hover align-middle mb-0">

                    <thead class="table-dark">

                        <tr>

                            <th>#</th>

                            <th>Recruiter Name</th>

                            <th>Email</th>

                            <th>Company</th>

                            <th>Industry</th>

                            <th>Website</th>

                            <th>Location</th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        int count = 1;

                        for (RecruiterRecord recruiter : recruiters) {
                    %>

                        <tr>

                            <td>
                                <%= count++ %>
                            </td>


                            <td>

                                <strong>
                                    <%= recruiter.getFullName() %>
                                </strong>

                            </td>


                            <td>

                                <%= recruiter.getEmail() %>

                            </td>


                            <td>

                                <% if (recruiter.getCompanyName() != null
                                        && !recruiter.getCompanyName().trim().isEmpty()) { %>

                                    <span class="badge badge-company">

                                        <%= recruiter.getCompanyName() %>

                                    </span>

                                <% } else { %>

                                    <span class="text-muted">
                                        Not Available
                                    </span>

                                <% } %>

                            </td>


                            <td>

                                <%= recruiter.getIndustry() != null
                                        ? recruiter.getIndustry()
                                        : "Not Available" %>

                            </td>


                            <td>

                                <% if (recruiter.getWebsite() != null
                                        && !recruiter.getWebsite().trim().isEmpty()) { %>

                                    <a
                                        href="<%= recruiter.getWebsite() %>"
                                        target="_blank"
                                        rel="noopener noreferrer">

                                        Visit Website

                                    </a>

                                <% } else { %>

                                    <span class="text-muted">
                                        Not Available
                                    </span>

                                <% } %>

                            </td>


                            <td>

                                <%= recruiter.getLocation() != null
                                        ? recruiter.getLocation()
                                        : "Not Available" %>

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

        <% } %>

    </div>


    <!-- BACK BUTTON -->

    <div class="mt-4 mb-5">

        <a
            href="<%= request.getContextPath() %>/admin/dashboard"
            class="btn btn-secondary">

            ← Back to Dashboard

        </a>

    </div>

</div>

</body>
</html>