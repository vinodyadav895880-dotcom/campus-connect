package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.StudentDAO;
import com.campusconnect.model.Student;

@WebServlet("/admin/students")
public class AdminStudentsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);

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

            // Get all students
            List<Student> students =
                    studentDAO.getAllStudents();

            // Send students to JSP
            request.setAttribute(
                    "students",
                    students
            );

            // Open students page
            request.getRequestDispatcher(
                    "/admin/students.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load student records."
            );

            request.getRequestDispatcher(
                    "/admin/students.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}