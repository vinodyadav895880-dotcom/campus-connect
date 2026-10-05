package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.JobDAO;
import com.campusconnect.model.Job;

@WebServlet("/admin/jobs")
public class AdminJobsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether user is logged in
        HttpSession session =
                request.getSession(false);

        if (session == null
                || session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        // Check ADMIN role
        String userRole =
                (String) session.getAttribute("userRole");

        if (!"ADMIN".equals(userRole)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        try {

            // Get all jobs from database
            List<Job> jobs =
                    jobDAO.getAllJobs();

            // Send jobs to JSP
            request.setAttribute(
                    "jobs",
                    jobs
            );

            // Open admin jobs page
            request.getRequestDispatcher(
                    "/admin/jobs.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load job records."
            );

            request.getRequestDispatcher(
                    "/admin/jobs.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}