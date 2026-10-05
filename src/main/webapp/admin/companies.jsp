<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.dao.CompanyDAO.CompanyRecord" %>

<%
    /*
     * =========================================
     * ADMIN SESSION CHECK
     * =========================================
     */

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


    /*
     * =========================================
     * GET COMPANY LIST
     * =========================================
     */

    List<CompanyRecord> companies =
            (List<CompanyRecord>) request.getAttribute("companies");


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

    <title>
        Manage Companies - Campus Connect
    </title>


    <!-- Bootstrap 5 -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >


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


        .company-badge {

            background-color: #e7f1ff;

            color: #0d6efd;

        }


        .industry-badge {

            background-color: #e8f5e9;

            color: #198754;

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar navbar-dark">

    <div class="container">


        <!-- BRAND -->

        <a
            class="navbar-brand fw-bold"
            href="<%= request.getContextPath() %>/admin/dashboard"
        >

            Campus Connect

        </a>


        <!-- RIGHT SIDE -->

        <div class="d-flex align-items-center gap-3">

            <span class="text-white">

                Admin

            </span>


            <a
                href="<%= request.getContextPath() %>/admin/dashboard"
                class="btn btn-outline-light btn-sm"
            >

                Dashboard

            </a>


            <a
                href="<%= request.getContextPath() %>/logout"
                class="btn btn-light btn-sm"
            >

                Logout

            </a>

        </div>

    </div>

</nav>



<!-- =====================================================
     MAIN CONTAINER
     ===================================================== -->

<div class="container mt-5 mb-5">


    <!-- =================================================
         PAGE HEADER
         ================================================= -->

    <div class="page-header shadow-sm">

        <h2 class="fw-bold mb-2">

            Manage Companies

        </h2>


        <p class="text-muted mb-0">

            View companies registered for placement and
            internship activities.

        </p>

    </div>



    <!-- =================================================
         ERROR MESSAGE
         ================================================= -->

    <% if (error != null) { %>

        <div class="alert alert-danger">

            <%= error %>

        </div>

    <% } %>



    <!-- =================================================
         COMPANY TABLE
         ================================================= -->

    <div class="table-card shadow-sm">


        <!-- TABLE HEADER -->

        <div class="p-4 border-bottom">

            <h5 class="fw-bold mb-0">

                Registered Companies

            </h5>

        </div>



        <!-- =================================================
             EMPTY STATE
             ================================================= -->

        <% if (companies == null || companies.isEmpty()) { %>


            <div class="p-5 text-center">

                <div style="font-size: 50px;">

                    🏭

                </div>


                <h5 class="mt-3">

                    No Companies Found

                </h5>


                <p class="text-muted">

                    There are currently no registered companies.

                </p>

            </div>


        <% } else { %>



            <!-- =================================================
                 RESPONSIVE TABLE
                 ================================================= -->

            <div class="table-responsive">

                <table
                    class="table table-hover align-middle mb-0"
                >


                    <!-- TABLE HEAD -->

                    <thead class="table-dark">

                        <tr>

                            <th>
                                #
                            </th>

                            <th>
                                Company
                            </th>

                            <th>
                                Industry
                            </th>

                            <th>
                                Location
                            </th>

                            <th>
                                Recruiter
                            </th>

                            <th>
                                Email
                            </th>

                            <th>
                                Website
                            </th>

                        </tr>

                    </thead>



                    <!-- TABLE BODY -->

                    <tbody>


                    <%
                        int count = 1;

                        for (CompanyRecord company : companies) {
                    %>


                        <tr>


                            <!-- NUMBER -->

                            <td>

                                <%= count++ %>

                            </td>



                            <!-- COMPANY -->

                            <td>

                                <strong>

                                    <%= company.getCompanyName() %>

                                </strong>

                            </td>



                            <!-- INDUSTRY -->

                            <td>


                                <% if (company.getIndustry() != null
                                        && !company.getIndustry().trim().isEmpty()) { %>


                                    <span
                                        class="badge industry-badge"
                                    >

                                        <%= company.getIndustry() %>

                                    </span>


                                <% } else { %>


                                    <span class="text-muted">

                                        Not Available

                                    </span>


                                <% } %>


                            </td>



                            <!-- LOCATION -->

                            <td>

                                <% if (company.getLocation() != null
                                        && !company.getLocation().trim().isEmpty()) { %>


                                    <%= company.getLocation() %>


                                <% } else { %>


                                    <span class="text-muted">

                                        Not Available

                                    </span>


                                <% } %>

                            </td>



                            <!-- RECRUITER -->

                            <td>

                                <% if (company.getContactName() != null
                                        && !company.getContactName().trim().isEmpty()) { %>


                                    <%= company.getContactName() %>


                                <% } else { %>


                                    <span class="text-muted">

                                        Not Available

                                    </span>


                                <% } %>

                            </td>



                            <!-- EMAIL -->

                            <td>

                                <% if (company.getContactEmail() != null
                                        && !company.getContactEmail().trim().isEmpty()) { %>


                                    <%= company.getContactEmail() %>


                                <% } else { %>


                                    <span class="text-muted">

                                        Not Available

                                    </span>


                                <% } %>

                            </td>



                            <!-- WEBSITE -->

                            <td>


                                <% if (company.getWebsite() != null
                                        && !company.getWebsite().trim().isEmpty()) { %>


                                    <a
                                        href="<%= company.getWebsite() %>"
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        class="btn btn-sm btn-outline-primary"
                                    >

                                        Visit Website

                                    </a>


                                <% } else { %>


                                    <span class="text-muted">

                                        Not Available

                                    </span>


                                <% } %>


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



    <!-- =================================================
         BACK BUTTON
         ================================================= -->

    <div class="mt-4">

        <a
            href="<%= request.getContextPath() %>/admin/dashboard"
            class="btn btn-secondary"
        >

            ← Back to Dashboard

        </a>

    </div>


</div>


</body>

</html>