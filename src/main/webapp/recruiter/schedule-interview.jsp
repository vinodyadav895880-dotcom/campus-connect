<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

    Integer applicationId =
            (Integer) request.getAttribute(
                    "applicationId"
            );

    String error =
            (String) request.getAttribute(
                    "error"
            );
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>Schedule Interview - Campus Connect</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">

    <div class="container">

        <a
            class="navbar-brand"
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

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-lg-7">

            <div class="card shadow-sm">

                <div class="card-header bg-primary text-white">

                    <h4 class="mb-0">
                        Schedule Interview
                    </h4>

                </div>

                <div class="card-body">

                    <% if (error != null) { %>

                        <div class="alert alert-danger">
                            <%= error %>
                        </div>

                    <% } %>

                    <div class="alert alert-info">

                        <strong>Application ID:</strong>
                        <%= applicationId %>

                    </div>

                    <form
                        action="<%= request.getContextPath() %>/recruiter/schedule-interview"
                        method="post"
                        id="scheduleInterviewForm"
                    >

                        <input
                            type="hidden"
                            name="applicationId"
                            value="<%= applicationId %>"
                        >

                        <div class="mb-3">

                            <label
                                for="interviewDate"
                                class="form-label"
                            >
                                Interview Date
                            </label>

                            <input
                                type="date"
                                id="interviewDate"
                                name="interviewDate"
                                class="form-control"
                                required
                            >

                            <div class="form-text">
                                Select today or a future date.
                            </div>

                        </div>

                        <div class="mb-3">

                            <label
                                for="interviewTime"
                                class="form-label"
                            >
                                Interview Time
                            </label>

                            <input
                                type="time"
                                id="interviewTime"
                                name="interviewTime"
                                class="form-control"
                                required
                            >

                        </div>

                        <div class="mb-3">

                            <label
                                for="interviewMode"
                                class="form-label"
                            >
                                Interview Mode
                            </label>

                            <select
                                id="interviewMode"
                                name="interviewMode"
                                class="form-select"
                                required
                            >

                                <option value="">
                                    Select Interview Mode
                                </option>

                                <option value="ONLINE">
                                    Online
                                </option>

                                <option value="OFFLINE">
                                    Offline
                                </option>

                            </select>

                        </div>

                        <div class="mb-3">

                            <label
                                for="meetingLink"
                                class="form-label"
                            >
                                Meeting Link
                            </label>

                            <input
                                type="url"
                                id="meetingLink"
                                name="meetingLink"
                                class="form-control"
                                placeholder="https://meet.google.com/..."
                            >

                            <div class="form-text">
                                Required for online interviews.
                            </div>

                        </div>

                        <div class="mb-3">

                            <label
                                for="venue"
                                class="form-label"
                            >
                                Venue
                            </label>

                            <input
                                type="text"
                                id="venue"
                                name="venue"
                                class="form-control"
                                placeholder="Example: Seminar Hall"
                            >

                            <div class="form-text">
                                Required for offline interviews.
                            </div>

                        </div>

                        <div class="mb-3">

                            <label
                                for="remarks"
                                class="form-label"
                            >
                                Remarks
                            </label>

                            <textarea
                                id="remarks"
                                name="remarks"
                                class="form-control"
                                rows="4"
                                placeholder="Additional interview instructions..."
                            ></textarea>

                        </div>

                        <div
                            id="validationMessage"
                            class="alert alert-warning d-none"
                            role="alert"
                        >
                        </div>

                        <div class="d-flex gap-2">

                            <button
                                type="submit"
                                class="btn btn-primary"
                            >
                                Schedule Interview
                            </button>

                            <a
                                href="<%= request.getContextPath() %>/recruiter/applications"
                                class="btn btn-secondary"
                            >
                                Back to Applications
                            </a>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    const interviewDate =
        document.getElementById("interviewDate");

    const interviewMode =
        document.getElementById("interviewMode");

    const meetingLink =
        document.getElementById("meetingLink");

    const venue =
        document.getElementById("venue");

    const form =
        document.getElementById("scheduleInterviewForm");

    const validationMessage =
        document.getElementById("validationMessage");


    // Prevent selecting a past interview date
    const today =
        new Date().toISOString().split("T")[0];

    interviewDate.min = today;


    function updateInterviewFields() {

        const mode =
            interviewMode.value;


        if (mode === "ONLINE") {

            meetingLink.disabled = false;
            meetingLink.required = true;

            venue.disabled = true;
            venue.required = false;

            venue.value = "";

        } else if (mode === "OFFLINE") {

            venue.disabled = false;
            venue.required = true;

            meetingLink.disabled = true;
            meetingLink.required = false;

            meetingLink.value = "";

        } else {

            meetingLink.disabled = true;
            meetingLink.required = false;

            venue.disabled = true;
            venue.required = false;

        }
    }


    interviewMode.addEventListener(
        "change",
        updateInterviewFields
    );


    form.addEventListener(
        "submit",
        function (event) {

            validationMessage.classList.add("d-none");
            validationMessage.textContent = "";


            if (interviewDate.value < today) {

                event.preventDefault();

                validationMessage.textContent =
                    "Please select today or a future interview date.";

                validationMessage.classList.remove("d-none");

                return;
            }


            if (interviewMode.value === "ONLINE"
                    && meetingLink.value.trim() === "") {

                event.preventDefault();

                validationMessage.textContent =
                    "Meeting link is required for an online interview.";

                validationMessage.classList.remove("d-none");

                return;
            }


            if (interviewMode.value === "OFFLINE"
                    && venue.value.trim() === "") {

                event.preventDefault();

                validationMessage.textContent =
                    "Venue is required for an offline interview.";

                validationMessage.classList.remove("d-none");

                return;
            }

        }
    );


    updateInterviewFields();

</script>

</body>

</html>