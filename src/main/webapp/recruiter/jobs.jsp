<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.model.Job" %>

<%
    /*
     * Check login
     */
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );
        return;
    }

    /*
     * Check recruiter role
     */
    String userRole =
            (String) session.getAttribute("userRole");

    if (!"RECRUITER".equals(userRole)) {
        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );
        return;
    }

    /*
     * Get jobs from servlet
     */
    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    /*
     * Get messages
     */
    String error =
            (String) request.getAttribute("error");

    String jobMessage =
            (String) session.getAttribute("jobMessage");

    /*
     * Remove message after reading
     */
    if (jobMessage != null) {
        session.removeAttribute("jobMessage");
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1">

    <title>Manage Jobs - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <!-- Navbar -->

    <nav class="navbar navbar-dark bg-success">

        <div class="container">

            <a
                class="navbar-brand"
                href="<%= request.getContextPath() %>/recruiter/dashboard.jsp">

                Campus Connect

            </a>

            <div class="d-flex align-items-center gap-3">

                <span class="text-white">
                    Manage Jobs
                </span>

                <a
                    href="<%= request.getContextPath() %>/logout"
                    class="btn btn-light btn-sm">

                    Logout

                </a>

            </div>

        </div>

    </nav>


    <!-- Main Container -->

    <div class="container mt-5 mb-5">

        <!-- Header -->

        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>

                <h2>
                    Manage Jobs
                </h2>

                <p class="text-muted">
                    Create and manage placement and internship opportunities.
                </p>

            </div>

            <a
                href="<%= request.getContextPath() %>/recruiter/dashboard.jsp"
                class="btn btn-secondary">

                Back to Dashboard

            </a>

        </div>


        <!-- Success/Error Message -->

        <% if (jobMessage != null) { %>

            <div class="alert alert-success">
                <%= jobMessage %>
            </div>

        <% } %>


        <% if (error != null) { %>

            <div class="alert alert-danger">
                <%= error %>
            </div>

        <% } %>


        <!-- Add Job Card -->

        <div class="card shadow-sm mb-5">

            <div class="card-header bg-success text-white">

                <h5 class="mb-0">
                    Post New Job
                </h5>

            </div>


            <div class="card-body">

                <form
                    action="<%= request.getContextPath() %>/recruiter/jobs"
                    method="post">


                    <!-- Job Title -->

                    <div class="mb-3">

                        <label
                            for="jobTitle"
                            class="form-label">

                            Job Title

                        </label>

                        <input
                            type="text"
                            id="jobTitle"
                            name="jobTitle"
                            class="form-control"
                            placeholder="Example: Java Developer"
                            required>

                    </div>


                    <!-- Job Type -->

                    <div class="mb-3">

                        <label
                            for="jobType"
                            class="form-label">

                            Job Type

                        </label>

                        <select
                            id="jobType"
                            name="jobType"
                            class="form-select"
                            required>

                            <option value="">
                                Select Job Type
                            </option>

                            <option value="PLACEMENT">
                                Placement
                            </option>

                            <option value="INTERNSHIP">
                                Internship
                            </option>

                        </select>

                    </div>


                    <!-- Description -->

                    <div class="mb-3">

                        <label
                            for="description"
                            class="form-label">

                            Description

                        </label>

                        <textarea
                            id="description"
                            name="description"
                            class="form-control"
                            rows="4"
                            placeholder="Enter job description"
                            required></textarea>

                    </div>


                    <!-- Eligibility -->

                    <div class="mb-3">

                        <label
                            for="eligibility"
                            class="form-label">

                            Eligibility

                        </label>

                        <input
                            type="text"
                            id="eligibility"
                            name="eligibility"
                            class="form-control"
                            placeholder="Example: B.Tech IT/CSE, CGPA 6.5+"
                            required>

                    </div>


                    <!-- Salary -->

                    <div class="mb-3">

                        <label
                            for="salary"
                            class="form-label">

                            Salary / Stipend

                        </label>

                        <input
                            type="text"
                            id="salary"
                            name="salary"
                            class="form-control"
                            placeholder="Example: ₹5 LPA / ₹15,000 per month"
                            required>

                    </div>


                    <!-- Location -->

                    <div class="mb-3">

                        <label
                            for="location"
                            class="form-label">

                            Location

                        </label>

                        <input
                            type="text"
                            id="location"
                            name="location"
                            class="form-control"
                            placeholder="Example: Jaipur"
                            required>

                    </div>


                    <!-- Application Deadline -->

                    <div class="mb-3">

                        <label
                            for="applicationDeadline"
                            class="form-label">

                            Application Deadline

                        </label>

                        <input
                            type="date"
                            id="applicationDeadline"
                            name="applicationDeadline"
                            class="form-control"
                            required>

                    </div>


                    <!-- Submit -->

                    <button
                        type="submit"
                        class="btn btn-success">

                        Post Job

                    </button>

                </form>

            </div>

        </div>


        <!-- Existing Jobs -->

        <div class="card shadow-sm">

            <div class="card-header bg-primary text-white">

                <h5 class="mb-0">
                    My Posted Jobs
                </h5>

            </div>


            <div class="card-body">


                <% if (jobs == null || jobs.isEmpty()) { %>

                    <div class="text-center p-5">

                        <h5>
                            No Jobs Posted Yet
                        </h5>

                        <p class="text-muted">
                            Use the form above to post your first job.
                        </p>

                    </div>

                <% } else { %>


                    <div class="table-responsive">

                        <table
                            class="table table-hover align-middle">

                            <thead class="table-light">

                                <tr>

                                    <th>#</th>

                                    <th>Job Title</th>

                                    <th>Type</th>

                                    <th>Eligibility</th>

                                    <th>Salary</th>

                                    <th>Location</th>

                                    <th>Deadline</th>

                                </tr>

                            </thead>


                            <tbody>

                                <%
                                    int count = 1;

                                    for (Job job : jobs) {
                                %>

                                    <tr>

                                        <td>
                                            <%= count++ %>
                                        </td>

                                        <td>

                                            <strong>
                                                <%= job.getJobTitle() %>
                                            </strong>

                                            <br>

                                            <small class="text-muted">
                                                <%= job.getDescription() %>
                                            </small>

                                        </td>

                                        <td>

                                            <% if ("PLACEMENT".equals(job.getJobType())) { %>

                                                <span class="badge bg-primary">
                                                    PLACEMENT
                                                </span>

                                            <% } else { %>

                                                <span class="badge bg-info text-dark">
                                                    INTERNSHIP
                                                </span>

                                            <% } %>

                                        </td>

                                        <td>
                                            <%= job.getEligibility() %>
                                        </td>

                                        <td>
                                            <%= job.getSalary() %>
                                        </td>

                                        <td>
                                            <%= job.getLocation() %>
                                        </td>

                                        <td>
                                            <%= job.getApplicationDeadline() %>
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

        </div>

    </div>


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>