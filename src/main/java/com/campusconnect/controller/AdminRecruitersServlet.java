package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.RecruiterDAO;
import com.campusconnect.dao.RecruiterDAO.RecruiterRecord;

@WebServlet("/admin/recruiters")
public class AdminRecruitersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RecruiterDAO recruiterDAO = new RecruiterDAO();

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

            List<RecruiterRecord> recruiters =
                    recruiterDAO.getAllRecruiters();

            request.setAttribute(
                    "recruiters",
                    recruiters
            );

            request.getRequestDispatcher(
                    "/admin/recruiters.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load recruiter records."
            );

            request.getRequestDispatcher(
                    "/admin/recruiters.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}