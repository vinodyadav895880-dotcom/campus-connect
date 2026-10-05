package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.AdminDAO;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

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

            int totalStudents =
                    adminDAO.getTotalStudents();

            int totalRecruiters =
                    adminDAO.getTotalRecruiters();

            int totalCompanies =
                    adminDAO.getTotalCompanies();

            int totalJobs =
                    adminDAO.getTotalJobs();

            int totalApplications =
                    adminDAO.getTotalApplications();

            request.setAttribute(
                    "totalStudents",
                    totalStudents
            );

            request.setAttribute(
                    "totalRecruiters",
                    totalRecruiters
            );

            request.setAttribute(
                    "totalCompanies",
                    totalCompanies
            );

            request.setAttribute(
                    "totalJobs",
                    totalJobs
            );

            request.setAttribute(
                    "totalApplications",
                    totalApplications
            );

            request.getRequestDispatcher(
                    "/admin/dashboard.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load admin dashboard."
            );

            request.getRequestDispatcher(
                    "/admin/dashboard.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}