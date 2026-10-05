package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.InterviewDAO;

@WebServlet("/recruiter/update-interview-result")
public class UpdateInterviewResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO =
            new InterviewDAO();

    @Override
    protected void doPost(
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

            String interviewIdParameter =
                    request.getParameter(
                            "interviewId"
                    );

            String result =
                    request.getParameter(
                            "result"
                    );

            // Validate interview ID
            if (interviewIdParameter == null
                    || interviewIdParameter.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/interviews?error=Invalid interview ID"
                );

                return;
            }

            // Validate result
            if (result == null
                    || result.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/interviews?error=Interview result is required"
                );

                return;
            }

            // Only allow valid database values
            if (!"PENDING".equals(result)
                    && !"PASSED".equals(result)
                    && !"FAILED".equals(result)) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/interviews?error=Invalid interview result"
                );

                return;
            }

            int interviewId =
                    Integer.parseInt(
                            interviewIdParameter
                    );

            Integer recruiterUserId =
                    (Integer) session.getAttribute(
                            "userId"
                    );

            boolean success =
                    interviewDAO.updateInterviewResult(
                            interviewId,
                            recruiterUserId,
                            result
                    );

            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/interviews?message=Interview result updated successfully"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/interviews?error=Unable to update interview result"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/interviews?error=Invalid interview ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/interviews?error=Something went wrong"
            );
        }
    }
}