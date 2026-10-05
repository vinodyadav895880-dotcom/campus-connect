<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.model.Job" %>

<%
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");

    String applicationMessage =
            (String) session.getAttribute("applicationMessage");

    if (applicationMessage != null) {
        session.removeAttribute("applicationMessage");
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Jobs & Internships - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">


<!-- Navbar -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/student/dashboard.jsp">

            Campus Connect

        </a>

        <span class="text-white">

            Jobs & Internships

        </span>

    </div>

</nav>


<!-- Main Content -->

<div class="container mt-5 mb-5">


    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>Jobs & Internships</h2>

            <p class="text-muted">

                Explore available placement and internship opportunities.

            </p>

        </div>

        <a
            href="<%= request.getContextPath() %>/student/dashboard.jsp"
            class="btn btn-secondary">

            Back to Dashboard

        </a>

    </div>


    <!-- Application Message -->

    <% if (applicationMessage != null) { %>

        <div class="alert alert-info">

            <%= applicationMessage %>

        </div>

    <% } %>


    <% if (jobs == null || jobs.isEmpty()) { %>

        <div class="alert alert-info">

            No jobs or internships are currently available.

        </div>

    <% } else { %>


        <div class="row g-4">


            <% for (Job job : jobs) { %>


                <div class="col-md-6 col-lg-4">

                    <div class="card shadow-sm h-100">

                        <div class="card-body">


                            <!-- Job Title + Type -->

                            <div class="d-flex justify-content-between align-items-start">

                                <h5 class="card-title">

                                    <%= job.getJobTitle() %>

                                </h5>


                                <span class="badge
                                    <%= "PLACEMENT".equals(job.getJobType())
                                        ? "bg-primary"
                                        : "bg-success" %>">

                                    <%= job.getJobType() %>

                                </span>

                            </div>


                            <!-- Company -->

                            <h6 class="text-muted mt-2">

                                <%= job.getCompanyName() %>

                            </h6>


                            <!-- Description -->

                            <p class="card-text mt-3">

                                <%= job.getDescription() %>

                            </p>


                            <!-- Eligibility -->

                            <p class="mb-1">

                                <strong>Eligibility:</strong>

                                <%= job.getEligibility() %>

                            </p>


                            <!-- Salary -->

                            <p class="mb-1">

                                <strong>Salary:</strong>

                                <%= job.getSalary() %>

                            </p>


                            <!-- Location -->

                            <p class="mb-1">

                                <strong>Location:</strong>

                                <%= job.getLocation() %>

                            </p>


                            <!-- Deadline -->

                            <p class="mb-3">

                                <strong>Application Deadline:</strong>

                                <%= job.getApplicationDeadline() %>

                            </p>


                            <!-- Apply Button -->

                            <a
                                href="<%= request.getContextPath() %>/student/apply?jobId=<%= job.getJobId() %>"
                                class="btn btn-primary w-100">

                                Apply Now

                            </a>


                        </div>

                    </div>

                </div>


            <% } %>


        </div>


    <% } %>


</div>


</body>

</html>