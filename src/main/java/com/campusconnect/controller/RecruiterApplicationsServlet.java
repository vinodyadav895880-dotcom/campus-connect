package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.RecruiterApplicationDAO;
import com.campusconnect.dao.RecruiterJobDAO;
import com.campusconnect.model.Application;

@WebServlet("/recruiter/applications")
public class RecruiterApplicationsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RecruiterApplicationDAO applicationDAO =
            new RecruiterApplicationDAO();

    private RecruiterJobDAO jobDAO =
            new RecruiterJobDAO();


    /*
     * GET
     * Display student applications
     */
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        /*
         * Login check
         */
        if (session == null
                || session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }


        /*
         * Recruiter role check
         */
        String userRole =
                (String) session.getAttribute("userRole");

        if (!"RECRUITER".equals(userRole)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }


        try {

            int userId =
                    (Integer) session.getAttribute("userId");


            /*
             * Find recruiter company
             */
            int companyId =
                    jobDAO.getCompanyIdByUserId(userId);


            if (companyId == -1) {

                request.setAttribute(
                        "error",
                        "Company profile not found."
                );

                request.getRequestDispatcher(
                        "/recruiter/applications.jsp"
                ).forward(request, response);

                return;
            }


            /*
             * Get applications
             */
            List<Application> applications =
                    applicationDAO
                            .getApplicationsByCompanyId(
                                    companyId
                            );


            request.setAttribute(
                    "applications",
                    applications
            );


            request.getRequestDispatcher(
                    "/recruiter/applications.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load student applications."
            );

            request.getRequestDispatcher(
                    "/recruiter/applications.jsp"
            ).forward(request, response);
        }
    }


    /*
     * POST
     * Update application status
     */
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);


        /*
         * Login check
         */
        if (session == null
                || session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }


        /*
         * Recruiter role check
         */
        String userRole =
                (String) session.getAttribute("userRole");

        if (!"RECRUITER".equals(userRole)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }


        try {

            String applicationIdParameter =
                    request.getParameter("applicationId");

            String status =
                    request.getParameter("status");


            if (applicationIdParameter == null
                    || applicationIdParameter.trim().isEmpty()
                    || status == null
                    || status.trim().isEmpty()) {

                session.setAttribute(
                        "applicationMessage",
                        "Invalid application data."
                );

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/applications"
                );

                return;
            }


            int applicationId =
                    Integer.parseInt(
                            applicationIdParameter
                    );


            boolean success =
                    applicationDAO
                            .updateApplicationStatus(
                                    applicationId,
                                    status
                            );


            if (success) {

                session.setAttribute(
                        "applicationMessage",
                        "Application status updated successfully."
                );

            } else {

                session.setAttribute(
                        "applicationMessage",
                        "Unable to update application status."
                );
            }


            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/applications"
            );


        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "applicationMessage",
                    "Something went wrong while updating status."
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/applications"
            );
        }
    }
}