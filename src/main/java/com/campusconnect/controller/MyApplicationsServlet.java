package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.ApplicationDAO;
import com.campusconnect.model.Application;

@WebServlet("/student/applications")
public class MyApplicationsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check login session
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        try {

            // Get logged-in student's user ID
            int userId =
                    (Integer) session.getAttribute("userId");

            /*
             * applications table stores student_id,
             * while login session stores user_id.
             *
             * So first get student record using StudentDAO.
             */

            com.campusconnect.dao.StudentDAO studentDAO =
                    new com.campusconnect.dao.StudentDAO();

            com.campusconnect.model.Student student =
                    studentDAO.getStudentByUserId(userId);

            if (student == null) {

                request.setAttribute(
                        "error",
                        "Student profile not found. Please complete your profile first."
                );

                request.getRequestDispatcher(
                        "/student/applications.jsp"
                ).forward(request, response);

                return;
            }

            // Get actual student_id
            int studentId = student.getStudentId();

            // Fetch applications
            List<Application> applications =
                    applicationDAO.getApplicationsByStudentId(
                            studentId
                    );

            // Send applications to JSP
            request.setAttribute(
                    "applications",
                    applications
            );

            // Open applications page
            request.getRequestDispatcher(
                    "/student/applications.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load your applications."
            );

            request.getRequestDispatcher(
                    "/student/applications.jsp"
            ).forward(request, response);
        }
    }
}