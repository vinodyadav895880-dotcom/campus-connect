package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.InterviewDAO;
import com.campusconnect.dao.InterviewDAO.InterviewRecord;
import com.campusconnect.dao.StudentDAO;
import com.campusconnect.model.Student;

@WebServlet("/student/interviews")
public class StudentInterviewsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO = new InterviewDAO();
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null
                || session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        // Check student role
        String role =
                (String) session.getAttribute("userRole");

        if (!"STUDENT".equals(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        try {

            // Get logged-in user's ID
            Integer userId =
                    (Integer) session.getAttribute("userId");

            // Find student profile
            Student student =
                    studentDAO.getStudentByUserId(userId);

            if (student == null) {

                request.setAttribute(
                        "error",
                        "Student profile not found."
                );

                request.getRequestDispatcher(
                        "/student/interviews.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }

            // Get student's database ID
            int studentId =
                    student.getStudentId();

            // Get all interviews for this student
            List<InterviewRecord> interviews =
                    interviewDAO.getInterviewsByStudentId(
                            studentId
                    );

            // Send interviews to JSP
            request.setAttribute(
                    "interviews",
                    interviews
            );

            // Open interviews page
            request.getRequestDispatcher(
                    "/student/interviews.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load interviews."
            );

            request.getRequestDispatcher(
                    "/student/interviews.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}