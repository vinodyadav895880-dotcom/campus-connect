package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.CompanyDAO;
import com.campusconnect.dao.CompanyDAO.CompanyRecord;

@WebServlet("/admin/companies")
public class AdminCompaniesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CompanyDAO companyDAO = new CompanyDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        /*
         * =========================================
         * SESSION CHECK
         * =========================================
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
         * =========================================
         * ROLE CHECK
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
         * LOAD COMPANIES
         * =========================================
         */

        try {

            List<CompanyRecord> companies =
                    companyDAO.getAllCompanies();


            /*
             * Send company list to JSP
             */

            request.setAttribute(
                    "companies",
                    companies
            );


            /*
             * Open companies JSP
             */

            request.getRequestDispatcher(
                    "/admin/companies.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();


            /*
             * Send error message to JSP
             */

            request.setAttribute(
                    "error",
                    "Unable to load company records."
            );


            request.getRequestDispatcher(
                    "/admin/companies.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}