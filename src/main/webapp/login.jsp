<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Login - Campus Connect</title>

    <!-- Bootstrap 5 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container
                d-flex
                justify-content-center
                align-items-center
                min-vh-100">

        <div class="card shadow p-4"
             style="max-width: 420px; width: 100%;">

            <h2 class="text-center mb-2">
                Campus Connect
            </h2>

            <p class="text-center text-muted mb-4">
                College Placement & Internship Management System
            </p>


            <!-- Error Message -->

            <% if (request.getAttribute("error") != null) { %>

                <div class="alert alert-danger">

                    <%= request.getAttribute("error") %>

                </div>

            <% } %>


            <!-- Login Form -->

            <form
                action="${pageContext.request.contextPath}/login"
                method="post">


                <!-- Email -->

                <div class="mb-3">

                    <label for="email"
                           class="form-label">

                        Email

                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        placeholder="Enter your email"
                        required>

                </div>


                <!-- Password -->

                <div class="mb-3">

                    <label for="password"
                           class="form-label">

                        Password

                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Enter your password"
                        required>

                </div>


                <!-- Login Button -->

                <button
                    type="submit"
                    class="btn btn-primary w-100">

                    Login

                </button>

            </form>

        </div>

    </div>

</body>

</html>