<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.model.Job" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Manage Jobs - Campus Connect</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            color: #333;
        }

        .navbar {
            background: #1f2937;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            width: 95%;
            max-width: 1400px;
            margin: 30px auto;
        }

        .header-section {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .header-section h1 {
            margin-bottom: 8px;
            color: #1f2937;
        }

        .header-section p {
            color: #666;
        }

        .table-container {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }

        th {
            background: #1f2937;
            color: white;
            padding: 14px 12px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 14px 12px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: top;
        }

        tr:hover {
            background: #f9fafb;
        }

        .job-type {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .placement {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .internship {
            background: #dcfce7;
            color: #15803d;
        }

        .description {
            max-width: 250px;
            line-height: 1.5;
        }

        .eligibility {
            max-width: 220px;
        }

        .empty-message {
            text-align: center;
            padding: 50px;
            color: #777;
            font-size: 18px;
        }

        .error-message {
            background: #fee2e2;
            color: #b91c1c;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #1d4ed8;
        }

        @media (max-width: 768px) {

            .navbar {
                flex-direction: column;
                gap: 12px;
                text-align: center;
            }

            .container {
                width: 98%;
            }

            .header-section {
                padding: 20px;
            }
        }

    </style>

</head>

<body>

<%
    String userRole =
            (String) session.getAttribute("userRole");

    if (!"ADMIN".equals(userRole)) {
        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );
        return;
    }

    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    String error =
            (String) request.getAttribute("error");
%>


<!-- NAVBAR -->

<div class="navbar">

    <h2>Campus Connect</h2>

    <div>

        <a href="<%= request.getContextPath() %>/admin/dashboard">
            Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<!-- MAIN CONTAINER -->

<div class="container">


    <!-- HEADER -->

    <div class="header-section">

        <h1>Manage Jobs</h1>

        <p>
            View all placement and internship opportunities
            available in the Campus Connect system.
        </p>

    </div>


    <!-- ERROR -->

    <% if (error != null) { %>

        <div class="error-message">
            <%= error %>
        </div>

    <% } %>


    <!-- JOB TABLE -->

    <div class="table-container">

        <% if (jobs == null || jobs.isEmpty()) { %>

            <div class="empty-message">

                No job records found.

            </div>

        <% } else { %>

            <table>

                <thead>

                    <tr>

                        <th>#</th>

                        <th>Job Title</th>

                        <th>Type</th>

                        <th>Company</th>

                        <th>Eligibility</th>

                        <th>Salary</th>

                        <th>Location</th>

                        <th>Deadline</th>

                        <th>Description</th>

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
                        </td>

                        <td>

                            <%
                                String type =
                                        job.getJobType();

                                if ("PLACEMENT".equals(type)) {
                            %>

                                <span class="job-type placement">
                                    Placement
                                </span>

                            <%
                                } else {
                            %>

                                <span class="job-type internship">
                                    Internship
                                </span>

                            <%
                                }
                            %>

                        </td>

                        <td>
                            <%= job.getCompanyName() %>
                        </td>

                        <td class="eligibility">
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

                        <td class="description">
                            <%= job.getDescription() %>
                        </td>

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        <% } %>

    </div>


    <!-- BACK BUTTON -->

    <a class="back-btn"
       href="<%= request.getContextPath() %>/admin/dashboard">

        ← Back to Admin Dashboard

    </a>


</div>

</body>

</html>