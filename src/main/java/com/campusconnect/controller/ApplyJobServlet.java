package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.ApplicationDAO;

@WebServlet("/student/apply")
public class ApplyJobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        try {

            // Get logged-in student ID
            int studentId =
                    (Integer) session.getAttribute("userId");

            // Get job ID from URL
            String jobIdParameter =
                    request.getParameter("jobId");

            if (jobIdParameter == null ||
                jobIdParameter.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath() + "/student/jobs"
                );

                return;
            }

            int jobId =
                    Integer.parseInt(jobIdParameter);


            // Check duplicate application

            if (applicationDAO.hasApplied(studentId, jobId)) {

                request.getSession().setAttribute(
                        "applicationMessage",
                        "You have already applied for this job."
                );

                response.sendRedirect(
                        request.getContextPath() + "/student/jobs"
                );

                return;
            }


            // Save application

            boolean success =
                    applicationDAO.applyForJob(
                            studentId,
                            jobId
                    );


            if (success) {

                request.getSession().setAttribute(
                        "applicationMessage",
                        "Application submitted successfully!"
                );

            } else {

                request.getSession().setAttribute(
                        "applicationMessage",
                        "Unable to submit application. Please try again."
                );
            }


            // Redirect back to jobs page

            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );

        } catch (NumberFormatException e) {

            request.getSession().setAttribute(
                    "applicationMessage",
                    "Invalid job ID."
            );

            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "applicationMessage",
                    "Something went wrong while applying."
            );

            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );
        }
    }
}