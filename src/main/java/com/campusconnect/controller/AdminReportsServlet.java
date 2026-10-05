package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.ReportDAO;

@WebServlet("/admin/reports")
public class AdminReportsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ReportDAO reportDAO =
            new ReportDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        /*
         * =========================================
         * SESSION CHECK
         * =========================================
         */

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


        /*
         * =========================================
         * ADMIN ROLE CHECK
         * =========================================
         */

        String userRole =
                (String) session.getAttribute("userRole");


        if (!"ADMIN".equals(userRole)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }


        /*
         * =========================================
         * LOAD REPORT DATA
         * =========================================
         */

        try {

            /*
             * Overall Statistics
             */

            int totalStudents =
                    reportDAO.getTotalStudents();

            int totalRecruiters =
                    reportDAO.getTotalRecruiters();

            int totalCompanies =
                    reportDAO.getTotalCompanies();

            int totalJobs =
                    reportDAO.getTotalJobs();

            int totalApplications =
                    reportDAO.getTotalApplications();


            /*
             * Application Status
             */

            int appliedApplications =
                    reportDAO.getAppliedApplications();

            int shortlistedApplications =
                    reportDAO.getShortlistedApplications();

            int selectedApplications =
                    reportDAO.getSelectedApplications();

            int rejectedApplications =
                    reportDAO.getRejectedApplications();


            /*
             * Job Type
             */

            int placementJobs =
                    reportDAO.getPlacementJobs();

            int internshipJobs =
                    reportDAO.getInternshipJobs();


            /*
             * =====================================
             * SEND DATA TO JSP
             * =====================================
             */

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


            request.setAttribute(
                    "appliedApplications",
                    appliedApplications
            );

            request.setAttribute(
                    "shortlistedApplications",
                    shortlistedApplications
            );

            request.setAttribute(
                    "selectedApplications",
                    selectedApplications
            );

            request.setAttribute(
                    "rejectedApplications",
                    rejectedApplications
            );


            request.setAttribute(
                    "placementJobs",
                    placementJobs
            );

            request.setAttribute(
                    "internshipJobs",
                    internshipJobs
            );


            /*
             * =====================================
             * OPEN REPORT PAGE
             * =====================================
             */

            request.getRequestDispatcher(
                    "/admin/reports.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();


            /*
             * =====================================
             * ERROR HANDLING
             * =====================================
             */

            request.setAttribute(
                    "error",
                    "Unable to generate reports."
            );


            request.getRequestDispatcher(
                    "/admin/reports.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}