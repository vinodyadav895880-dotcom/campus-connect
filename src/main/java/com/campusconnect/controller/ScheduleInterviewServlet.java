package com.campusconnect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.InterviewDAO;

@WebServlet("/recruiter/schedule-interview")
public class ScheduleInterviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO =
            new InterviewDAO();

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

        String role =
                (String) session.getAttribute("userRole");

        if (!"RECRUITER".equals(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        String applicationIdParameter =
                request.getParameter("applicationId");

        if (applicationIdParameter == null
                || applicationIdParameter.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/applications"
            );

            return;
        }

        try {

            int applicationId =
                    Integer.parseInt(
                            applicationIdParameter
                    );

            if (interviewDAO.interviewExists(
                    applicationId)) {

                request.setAttribute(
                        "error",
                        "An interview has already been scheduled for this application."
                );
            }

            request.setAttribute(
                    "applicationId",
                    applicationId
            );

            request.getRequestDispatcher(
                    "/recruiter/schedule-interview.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/applications"
            );
        }
    }

    @Override
    protected void doPost(
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

            int applicationId =
                    Integer.parseInt(
                            request.getParameter(
                                    "applicationId"
                            )
                    );

            String interviewDate =
                    request.getParameter(
                            "interviewDate"
                    );

            String interviewTime =
                    request.getParameter(
                            "interviewTime"
                    );

            String interviewMode =
                    request.getParameter(
                            "interviewMode"
                    );

            String meetingLink =
                    request.getParameter(
                            "meetingLink"
                    );

            String venue =
                    request.getParameter(
                            "venue"
                    );

            String remarks =
                    request.getParameter(
                            "remarks"
                    );

            if (interviewDate == null
                    || interviewDate.trim().isEmpty()
                    || interviewTime == null
                    || interviewTime.trim().isEmpty()
                    || interviewMode == null
                    || interviewMode.trim().isEmpty()) {

                request.setAttribute(
                        "error",
                        "Date, time and interview mode are required."
                );

                request.setAttribute(
                        "applicationId",
                        applicationId
                );

                request.getRequestDispatcher(
                        "/recruiter/schedule-interview.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }

            if (interviewDAO.interviewExists(
                    applicationId)) {

                request.setAttribute(
                        "error",
                        "An interview has already been scheduled for this application."
                );

                request.setAttribute(
                        "applicationId",
                        applicationId
                );

                request.getRequestDispatcher(
                        "/recruiter/schedule-interview.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }

            boolean success =
                    interviewDAO.scheduleInterview(
                            applicationId,
                            interviewDate,
                            interviewTime,
                            interviewMode,
                            meetingLink,
                            venue,
                            remarks
                    );

            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/applications?message=Interview scheduled successfully"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Unable to schedule interview."
                );

                request.setAttribute(
                        "applicationId",
                        applicationId
                );

                request.getRequestDispatcher(
                        "/recruiter/schedule-interview.jsp"
                ).forward(
                        request,
                        response
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Something went wrong while scheduling the interview."
            );

            request.getRequestDispatcher(
                    "/recruiter/schedule-interview.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}