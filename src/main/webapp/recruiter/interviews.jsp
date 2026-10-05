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

    if (!"RECRUITER".equals(userRole)) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );

        return;
    }

    List<InterviewRecord> interviews =
            (List<InterviewRecord>)
                    request.getAttribute(
                            "interviews"
                    );

    String message =
            request.getParameter("message");

    String error =
            request.getParameter("error");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>Manage Interviews - Campus Connect</title>

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


<!-- ================= MAIN ================= -->

<div class="container mt-5">


    <!-- HEADER -->

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>
                Manage Interviews
            </h2>

            <p class="text-muted mb-0">

                View scheduled interviews and update interview results.

            </p>

        </div>

        <div class="d-flex gap-2">

            <a
                href="<%= request.getContextPath() %>/recruiter/applications"
                class="btn btn-secondary"
            >
                Applications
            </a>

            <a
                href="<%= request.getContextPath() %>/recruiter/dashboard.jsp"
                class="btn btn-dark"
            >
                Dashboard
            </a>

        </div>

    </div>


    <!-- ================= SUCCESS MESSAGE ================= -->

    <% if (message != null
            && !message.trim().isEmpty()) { %>

        <div class="alert alert-success">

            <%= message %>

        </div>

    <% } %>


    <!-- ================= ERROR MESSAGE ================= -->

    <% if (error != null
            && !error.trim().isEmpty()) { %>

        <div class="alert alert-danger">

            <%= error %>

        </div>

    <% } %>


    <!-- ================= NO INTERVIEWS ================= -->

    <% if (interviews == null
            || interviews.isEmpty()) { %>

        <div class="card shadow-sm">

            <div class="card-body text-center py-5">

                <h4>
                    No Interviews Scheduled
                </h4>

                <p class="text-muted mb-0">

                    No interviews have been scheduled yet.

                </p>

            </div>

        </div>


    <% } else { %>


        <!-- ================= INTERVIEW LIST ================= -->

        <div class="row g-4">

            <% for (InterviewRecord interview : interviews) { %>

                <div class="col-12">

                    <div class="card shadow-sm">


                        <!-- ================= CARD HEADER ================= -->

                        <div class="card-header bg-primary text-white">

                            <div class="d-flex justify-content-between align-items-center">

                                <div>

                                    <h5 class="mb-1">

                                        <%= interview.getJobTitle() %>

                                    </h5>

                                    <small>

                                        <%= interview.getCompanyName() %>

                                    </small>

                                </div>


                                <!-- RESULT BADGE -->

                                <div>

                                    <% if ("PASSED".equals(
                                            interview.getResult())) { %>

                                        <span class="badge bg-success">

                                            PASSED

                                        </span>

                                    <% } else if ("FAILED".equals(
                                            interview.getResult())) { %>

                                        <span class="badge bg-danger">

                                            FAILED

                                        </span>

                                    <% } else { %>

                                        <span class="badge bg-light text-dark">

                                            PENDING

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

                                            <th>
                                                Name
                                            </th>

                                            <td>
                                                <%= interview.getStudentName() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Email
                                            </th>

                                            <td>
                                                <%= interview.getStudentEmail() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Enrollment No.
                                            </th>

                                            <td>
                                                <%= interview.getEnrollmentNo() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Course
                                            </th>

                                            <td>
                                                <%= interview.getCourse() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Branch
                                            </th>

                                            <td>
                                                <%= interview.getBranch() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                CGPA
                                            </th>

                                            <td>
                                                <%= interview.getCgpa() %>
                                            </td>

                                        </tr>

                                    </table>

                                </div>


                                <!-- ================= INTERVIEW DETAILS ================= -->

                                <div class="col-md-6">

                                    <h5 class="mb-3">
                                        Interview Details
                                    </h5>

                                    <table class="table table-bordered">

                                        <tr>

                                            <th>
                                                Date
                                            </th>

                                            <td>
                                                <%= interview.getInterviewDate() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Time
                                            </th>

                                            <td>
                                                <%= interview.getInterviewTime() %>
                                            </td>

                                        </tr>

                                        <tr>

                                            <th>
                                                Mode
                                            </th>

                                            <td>

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

                                            </td>

                                        </tr>


                                        <% if (interview.getMeetingLink() != null
                                                && !interview.getMeetingLink()
                                                        .trim()
                                                        .isEmpty()) { %>

                                            <tr>

                                                <th>
                                                    Meeting Link
                                                </th>

                                                <td>

                                                    <a
                                                        href="<%= interview.getMeetingLink() %>"
                                                        target="_blank"
                                                    >
                                                        Join Interview
                                                    </a>

                                                </td>

                                            </tr>

                                        <% } %>


                                        <% if (interview.getVenue() != null
                                                && !interview.getVenue()
                                                        .trim()
                                                        .isEmpty()) { %>

                                            <tr>

                                                <th>
                                                    Venue
                                                </th>

                                                <td>
                                                    <%= interview.getVenue() %>
                                                </td>

                                            </tr>

                                        <% } %>


                                        <tr>

                                            <th>
                                                Current Result
                                            </th>

                                            <td>

                                                <% if ("PASSED".equals(
                                                        interview.getResult())) { %>

                                                    <span class="badge bg-success">
                                                        PASSED
                                                    </span>

                                                <% } else if ("FAILED".equals(
                                                        interview.getResult())) { %>

                                                    <span class="badge bg-danger">
                                                        FAILED
                                                    </span>

                                                <% } else { %>

                                                    <span class="badge bg-secondary">
                                                        PENDING
                                                    </span>

                                                <% } %>

                                            </td>

                                        </tr>

                                    </table>

                                </div>

                            </div>


                            <!-- ================= REMARKS ================= -->

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


                            <hr>


                            <!-- ================= UPDATE RESULT ================= -->

                            <div>

                                <h5>
                                    Update Interview Result
                                </h5>

                                <form
                                    action="<%= request.getContextPath() %>/recruiter/update-interview-result"
                                    method="post"
                                    class="row g-2 align-items-end"
                                >

                                    <input
                                        type="hidden"
                                        name="interviewId"
                                        value="<%= interview.getInterviewId() %>"
                                    >


                                    <div class="col-md-5">

                                        <label
                                            class="form-label"
                                            for="result_<%= interview.getInterviewId() %>"
                                        >
                                            Interview Result
                                        </label>

                                        <select
                                            id="result_<%= interview.getInterviewId() %>"
                                            name="result"
                                            class="form-select"
                                            required
                                        >

                                            <option
                                                value="PENDING"
                                                <%= "PENDING".equals(
                                                        interview.getResult())
                                                        ? "selected"
                                                        : "" %>
                                            >
                                                Pending
                                            </option>

                                            <option
                                                value="PASSED"
                                                <%= "PASSED".equals(
                                                        interview.getResult())
                                                        ? "selected"
                                                        : "" %>
                                            >
                                                Passed
                                            </option>

                                            <option
                                                value="FAILED"
                                                <%= "FAILED".equals(
                                                        interview.getResult())
                                                        ? "selected"
                                                        : "" %>
                                            >
                                                Failed
                                            </option>

                                        </select>

                                    </div>


                                    <div class="col-md-3">

                                        <button
                                            type="submit"
                                            class="btn btn-primary w-100"
                                        >
                                            Update Result
                                        </button>

                                    </div>

                                </form>

                            </div>

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