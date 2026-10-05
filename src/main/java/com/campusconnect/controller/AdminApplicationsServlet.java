package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.AdminApplicationDAO;
import com.campusconnect.dao.AdminApplicationDAO.ApplicationRecord;

@WebServlet("/admin/applications")
public class AdminApplicationsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminApplicationDAO applicationDAO =
            new AdminApplicationDAO();


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
         * LOAD APPLICATIONS
         * =========================================
         */

        try {

            List<ApplicationRecord> applications =
                    applicationDAO.getAllApplications();


            /*
             * Send application list to JSP
             */

            request.setAttribute(
                    "applications",
                    applications
            );


            /*
             * Open Admin Applications page
             */

            request.getRequestDispatcher(
                    "/admin/applications.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();


            /*
             * Error message
             */

            request.setAttribute(
                    "error",
                    "Unable to load application records."
            );


            /*
             * Still open JSP
             */

            request.getRequestDispatcher(
                    "/admin/applications.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}