package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.UserDAO;
import com.campusconnect.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Form se email aur password lena
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validation
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            request.setAttribute(
                    "error",
                    "Email and password are required."
            );

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);

            return;
        }

        // Database se user verify karna
        User user = userDAO.login(email.trim(), password);

        // Login successful
        if (user != null) {

            // Session create karna
            HttpSession session = request.getSession();

            session.setAttribute("loggedInUser", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userRole", user.getRole());

            // User ke role ke according dashboard
            switch (user.getRole()) {

                case "STUDENT":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/student/dashboard.jsp"
                    );

                    break;

                case "RECRUITER":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/recruiter/dashboard.jsp"
                    );

                    break;

                case "ADMIN":
                    response.sendRedirect(
                        request.getContextPath() + "/admin/dashboard"
                    );
                    break;
                default:

                    response.sendRedirect(
                            request.getContextPath()
                            + "/index.jsp"
                    );
            }

        } else {

            // Login failed
            request.setAttribute(
                    "error",
                    "Invalid email or password."
            );

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );
    }
}