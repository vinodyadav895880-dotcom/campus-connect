<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.model.Student" %>

<%
    // Admin role check
    String userRole = (String) session.getAttribute("userRole");

    if (userRole == null || !"ADMIN".equals(userRole)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Student> students =
            (List<Student>) request.getAttribute("students");

    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Manage Students - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <style>

        body {
            background-color: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background: linear-gradient(135deg, #0d6efd, #084298);
        }

        .navbar-brand {
            font-weight: bold;
        }

        .page-header {
            background: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .page-header h2 {
            margin-bottom: 5px;
            font-weight: 700;
        }

        .table-container {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .table thead th {
            background-color: #0d6efd;
            color: white;
            white-space: nowrap;
        }

        .table td {
            vertical-align: middle;
            white-space: nowrap;
        }

        .student-count {
            font-size: 14px;
            color: #6c757d;
        }

        .empty-message {
            padding: 50px;
            text-align: center;
            color: #6c757d;
        }

        .cgpa-badge {
            background-color: #198754;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
        }

    </style>

</head>

<body>

    <!-- NAVBAR -->

    <nav class="navbar navbar-dark">

        <div class="container-fluid">

            <a class="navbar-brand"
               href="<%= request.getContextPath() %>/admin/dashboard">

                Campus Connect - Admin

            </a>

            <div>

                <a class="btn btn-light btn-sm me-2"
                   href="<%= request.getContextPath() %>/admin/dashboard">

                    Dashboard

                </a>

                <a class="btn btn-danger btn-sm"
                   href="<%= request.getContextPath() %>/logout">

                    Logout

                </a>

            </div>

        </div>

    </nav>


    <!-- MAIN CONTENT -->

    <div class="container-fluid mt-4">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <h2>
                Student Management
            </h2>

            <p class="mb-0 text-muted">
                View all registered students and their academic information.
            </p>

        </div>


        <!-- ERROR MESSAGE -->

        <% if (error != null) { %>

            <div class="alert alert-danger">
                <strong>Error:</strong>
                <%= error %>
            </div>

        <% } %>


        <!-- STUDENT TABLE -->

        <div class="table-container">

            <div class="d-flex justify-content-between
                        align-items-center mb-3">

                <h5 class="mb-0">
                    Registered Students
                </h5>

                <span class="student-count">

                    Total Students:

                    <strong>
                        <%= students != null ? students.size() : 0 %>
                    </strong>

                </span>

            </div>


            <% if (students != null && !students.isEmpty()) { %>

                <div class="table-responsive">

                    <table class="table table-bordered
                                  table-hover align-middle">

                        <thead>

                            <tr>

                                <th>#</th>

                                <th>Student Name</th>

                                <th>Email</th>

                                <th>Enrollment No.</th>

                                <th>Phone</th>

                                <th>Course</th>

                                <th>Branch</th>

                                <th>Semester</th>

                                <th>CGPA</th>

                                <th>Graduation Year</th>

                            </tr>

                        </thead>


                        <tbody>

                            <%
                                int count = 1;

                                for (Student student : students) {
                            %>

                                <tr>

                                    <td>
                                        <%= count++ %>
                                    </td>

                                    <td>
                                        <strong>
                                            <%= student.getFullName() != null
                                                ? student.getFullName()
                                                : "N/A" %>
                                        </strong>
                                    </td>

                                    <td>
                                        <%= student.getEmail() != null
                                            ? student.getEmail()
                                            : "N/A" %>
                                    </td>

                                    <td>
                                        <%= student.getEnrollmentNo() != null
                                            ? student.getEnrollmentNo()
                                            : "N/A" %>
                                    </td>

                                    <td>
                                        <%= student.getPhone() != null
                                            ? student.getPhone()
                                            : "N/A" %>
                                    </td>

                                    <td>
                                        <%= student.getCourse() != null
                                            ? student.getCourse()
                                            : "N/A" %>
                                    </td>

                                    <td>
                                        <%= student.getBranch() != null
                                            ? student.getBranch()
                                            : "N/A" %>
                                    </td>

                                    <td>
                                        <%= student.getSemester() %>
                                    </td>

                                    <td>

                                        <span class="cgpa-badge">

                                            <%= student.getCgpa() %>

                                        </span>

                                    </td>

                                    <td>
                                        <%= student.getGraduationYear() %>
                                    </td>

                                </tr>

                            <%
                                }
                            %>

                        </tbody>

                    </table>

                </div>

            <% } else { %>

                <div class="empty-message">

                    <h5>No Students Found</h5>

                    <p>
                        There are currently no registered student records.
                    </p>

                </div>

            <% } %>

        </div>

    </div>


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>