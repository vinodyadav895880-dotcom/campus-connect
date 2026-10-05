<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.dao.InterviewDAO.InterviewRecord" %>

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

    List<InterviewRecord> interviews =
            (List<InterviewRecord>)
                    request.getAttribute("interviews");

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

    <title>My Interviews - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <a
            class="navbar-brand"
            href="<%= request.getContextPath() %>/student/dashboard.jsp"
        >
            Campus Connect
        </a>

        <div class="d-flex align-items-center gap-3">

            <span class="text-white">
                Student
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


<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>
                My Interviews
            </h2>

            <p class="text-muted mb-0">
                View your scheduled placement and internship interviews.
            </p>

        </div>

        <a
            href="<%= request.getContextPath() %>/student/dashboard.jsp"
            class="btn btn-secondary"
        >
            Dashboard
        </a>

    </div>


    <% if (error != null) { %>

        <div class="alert alert-danger">
            <%= error %>
        </div>

    <% } %>


    <% if (interviews == null || interviews.isEmpty()) { %>

        <div class="card shadow-sm">

            <div class="card-body text-center py-5">

                <h4>
                    No Interviews Scheduled
                </h4>

                <p class="text-muted">
                    You currently do not have any scheduled interviews.
                </p>

            </div>

        </div>

    <% } else { %>


        <div class="row g-4">

            <% for (InterviewRecord interview : interviews) { %>

                <div class="col-md-6">

                    <div class="card shadow-sm h-100">

                        <div class="card-header bg-dark text-white">

                            <h5 class="mb-0">
                                <%= interview.getJobTitle() %>
                            </h5>

                        </div>


                        <div class="card-body">

                            <h6 class="text-primary mb-3">
                                <%= interview.getCompanyName() %>
                            </h6>


                            <p>

                                <strong>
                                    Date:
                                </strong>

                                <%= interview.getInterviewDate() %>

                            </p>


                            <p>

                                <strong>
                                    Time:
                                </strong>

                                <%= interview.getInterviewTime() %>

                            </p>


                            <p>

                                <strong>
                                    Mode:
                                </strong>


                                <% if ("ONLINE".equals(
                                        interview.getInterviewMode())) { %>

                                    <span class="badge bg-primary">
                                        Online
                                    </span>

                                <% } else { %>

                                    <span class="badge bg-warning text-dark">
                                        Offline
                                    </span>

                                <% } %>

                            </p>


                            <% if (interview.getMeetingLink() != null
                                    && !interview.getMeetingLink()
                                            .trim()
                                            .isEmpty()) { %>

                                <p>

                                    <strong>
                                        Meeting Link:
                                    </strong>

                                    <br>

                                    <a
                                        href="<%= interview.getMeetingLink() %>"
                                        target="_blank"
                                        class="btn btn-sm btn-primary mt-2"
                                    >
                                        Join Interview
                                    </a>

                                </p>

                            <% } %>


                            <% if (interview.getVenue() != null
                                    && !interview.getVenue()
                                            .trim()
                                            .isEmpty()) { %>

                                <p>

                                    <strong>
                                        Venue:
                                    </strong>

                                    <%= interview.getVenue() %>

                                </p>

                            <% } %>


                            <p>

                                <strong>
                                    Result:
                                </strong>


                                <% if ("PASSED".equals(
                                        interview.getResult())) { %>

                                    <span class="badge bg-success">
                                        Passed
                                    </span>

                                <% } else if ("FAILED".equals(
                                        interview.getResult())) { %>

                                    <span class="badge bg-danger">
                                        Failed
                                    </span>

                                <% } else { %>

                                    <span class="badge bg-secondary">
                                        Pending
                                    </span>

                                <% } %>

                            </p>


                            <% if (interview.getRemarks() != null
                                    && !interview.getRemarks()
                                            .trim()
                                            .isEmpty()) { %>

                                <div class="alert alert-light border">

                                    <strong>
                                        Remarks:
                                    </strong>

                                    <br>

                                    <%= interview.getRemarks() %>

                                </div>

                            <% } %>

                        </div>

                    </div>

                </div>

            <% } %>

        </div>

    <% } %>

</div>

</body>

</html>