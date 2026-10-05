package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.InterviewDAO;
import com.campusconnect.dao.InterviewDAO.InterviewRecord;

@WebServlet("/recruiter/interviews")
public class RecruiterInterviewsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO = new InterviewDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
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

        // Check recruiter role
        String role =
                (String) session.getAttribute("userRole");

        if (!"RECRUITER".equals(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        try {

            // Get logged-in recruiter user ID
            Integer recruiterUserId =
                    (Integer) session.getAttribute(
                            "userId"
                    );

            // Get all interviews belonging
            // to this recruiter's company
            List<InterviewRecord> interviews =
                    interviewDAO.getInterviewsByRecruiterId(
                            recruiterUserId
                    );

            // Send data to JSP
            request.setAttribute(
                    "interviews",
                    interviews
            );

            // Open recruiter interviews page
            request.getRequestDispatcher(
                    "/recruiter/interviews.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load interviews."
            );

            request.getRequestDispatcher(
                    "/recruiter/interviews.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}