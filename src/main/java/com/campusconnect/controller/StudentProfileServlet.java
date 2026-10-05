package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.StudentDAO;
import com.campusconnect.model.Student;

@WebServlet("/student/profile")
public class StudentProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check whether user is logged in
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        Student student = studentDAO.getStudentByUserId(userId);

        request.setAttribute("student", student);

        request.getRequestDispatcher(
                "/student/profile.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check whether user is logged in
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        try {

            String enrollmentNo =
                    request.getParameter("enrollmentNo");

            String phone =
                    request.getParameter("phone");

            String course =
                    request.getParameter("course");

            String branch =
                    request.getParameter("branch");

            int semester =
                    Integer.parseInt(
                            request.getParameter("semester")
                    );

            double cgpa =
                    Double.parseDouble(
                            request.getParameter("cgpa")
                    );

            int graduationYear =
                    Integer.parseInt(
                            request.getParameter("graduationYear")
                    );

            Student student = new Student();

            student.setUserId(userId);
            student.setEnrollmentNo(enrollmentNo);
            student.setPhone(phone);
            student.setCourse(course);
            student.setBranch(branch);
            student.setSemester(semester);
            student.setCgpa(cgpa);
            student.setGraduationYear(graduationYear);
            student.setResumePath(null);

            boolean success =
                    studentDAO.saveStudent(student);

            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/student/profile"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Unable to save profile."
                );

                request.setAttribute(
                        "student",
                        student
                );

                request.getRequestDispatcher(
                        "/student/profile.jsp"
                ).forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "error",
                    "Please enter valid numbers for semester, CGPA and graduation year."
            );

            request.getRequestDispatcher(
                    "/student/profile.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Something went wrong while saving profile."
            );

            request.getRequestDispatcher(
                    "/student/profile.jsp"
            ).forward(request, response);
        }
    }
}