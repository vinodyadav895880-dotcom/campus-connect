package com.campusconnect.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.ApplicationDAO;
import com.campusconnect.util.DBConnection;

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

            // Get logged-in user's user_id
            int userId = (Integer) session.getAttribute("userId");

            // Convert user_id -> actual student_id
            int studentId = getStudentIdByUserId(userId);

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

                session.setAttribute(
                        "applicationMessage",
                        "You have already applied for this job."
                );

                response.sendRedirect(
                        request.getContextPath() + "/student/jobs"
                );

                return;
            }

            // Save application using actual student_id
            boolean success =
                    applicationDAO.applyForJob(
                            studentId,
                            jobId
                    );

            if (success) {

                session.setAttribute(
                        "applicationMessage",
                        "Application submitted successfully!"
                );

            } else {

                session.setAttribute(
                        "applicationMessage",
                        "Unable to submit application. Please try again."
                );
            }

            // Redirect back to jobs page
            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );

        } catch (NumberFormatException e) {

            session.setAttribute(
                    "applicationMessage",
                    "Invalid job ID."
            );

            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "applicationMessage",
                    "Something went wrong while applying."
            );

            response.sendRedirect(
                    request.getContextPath() + "/student/jobs"
            );
        }
    }

    /**
     * Find actual student_id using logged-in user's user_id.
     */
    private int getStudentIdByUserId(int userId) throws SQLException {

        String sql =
                "SELECT student_id FROM students WHERE user_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    return resultSet.getInt("student_id");
                }

                throw new SQLException(
                        "Student profile not found for user_id: " + userId
                );
            }
        }
    }
}