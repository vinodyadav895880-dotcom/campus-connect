<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.campusconnect.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Student Profile - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/student/dashboard.jsp">

            Campus Connect

        </a>

        <span class="text-white">
            Student Profile
        </span>

    </div>

</nav>

<div class="container mt-5 mb-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="card shadow">

                <div class="card-body p-4">

                    <h2 class="mb-1">
                        Student Profile
                    </h2>

                    <p class="text-muted mb-4">
                        Manage your academic and personal information.
                    </p>

                    <% if (request.getAttribute("error") != null) { %>

                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>

                    <% } %>

                    <form
                        action="<%= request.getContextPath() %>/student/profile"
                        method="post">

                        <div class="mb-3">

                            <label class="form-label">
                                Enrollment Number
                            </label>

                            <input
                                type="text"
                                name="enrollmentNo"
                                class="form-control"
                                value="<%= student != null && student.getEnrollmentNo() != null
                                        ? student.getEnrollmentNo() : "" %>"
                                placeholder="Enter enrollment number"
                                required>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Phone Number
                            </label>

                            <input
                                type="tel"
                                name="phone"
                                class="form-control"
                                value="<%= student != null && student.getPhone() != null
                                        ? student.getPhone() : "" %>"
                                placeholder="Enter phone number"
                                required>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Course
                            </label>

                            <input
                                type="text"
                                name="course"
                                class="form-control"
                                value="<%= student != null && student.getCourse() != null
                                        ? student.getCourse() : "" %>"
                                placeholder="e.g. B.Tech">

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Branch
                            </label>

                            <input
                                type="text"
                                name="branch"
                                class="form-control"
                                value="<%= student != null && student.getBranch() != null
                                        ? student.getBranch() : "" %>"
                                placeholder="e.g. Information Technology">

                        </div>

                        <div class="row">

                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Semester
                                </label>

                                <input
                                    type="number"
                                    name="semester"
                                    class="form-control"
                                    value="<%= student != null
                                            ? student.getSemester() : "" %>"
                                    min="1"
                                    max="12"
                                    required>

                            </div>

                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    CGPA
                                </label>

                                <input
                                    type="number"
                                    name="cgpa"
                                    class="form-control"
                                    value="<%= student != null
                                            ? student.getCgpa() : "" %>"
                                    min="0"
                                    max="10"
                                    step="0.01"
                                    placeholder="e.g. 8.25"
                                    required>

                            </div>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">
                                Graduation Year
                            </label>

                            <input
                                type="number"
                                name="graduationYear"
                                class="form-control"
                                value="<%= student != null
                                        ? student.getGraduationYear() : "" %>"
                                placeholder="e.g. 2027"
                                required>

                        </div>

                        <div class="d-flex gap-2">

                            <button
                                type="submit"
                                class="btn btn-primary">

                                Save Profile

                            </button>

                            <a
                                href="<%= request.getContextPath() %>/student/dashboard.jsp"
                                class="btn btn-secondary">

                                Back to Dashboard

                            </a>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>