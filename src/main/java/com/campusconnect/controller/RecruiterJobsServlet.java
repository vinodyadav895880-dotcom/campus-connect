package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campusconnect.dao.RecruiterJobDAO;
import com.campusconnect.model.Job;

@WebServlet("/recruiter/jobs")
public class RecruiterJobsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RecruiterJobDAO recruiterJobDAO =
            new RecruiterJobDAO();


    /*
     * GET
     * Show recruiter jobs page
     */
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        /*
         * Check login
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
         * Check recruiter role
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
             * Find company belonging to recruiter
             */
            int companyId =
                    recruiterJobDAO
                            .getCompanyIdByUserId(userId);


            if (companyId == -1) {

                request.setAttribute(
                        "error",
                        "Company profile not found."
                );

                request.getRequestDispatcher(
                        "/recruiter/jobs.jsp"
                ).forward(request, response);

                return;
            }


            /*
             * Load jobs
             */
            List<Job> jobs =
                    recruiterJobDAO
                            .getJobsByCompanyId(companyId);


            request.setAttribute(
                    "jobs",
                    jobs
            );


            /*
             * Show JSP
             */
            request.getRequestDispatcher(
                    "/recruiter/jobs.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load jobs."
            );


            request.getRequestDispatcher(
                    "/recruiter/jobs.jsp"
            ).forward(request, response);
        }
    }


    /*
     * POST
     * Add new job
     */
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);


        /*
         * Check login
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
         * Check recruiter role
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
             * Get recruiter company
             */
            int companyId =
                    recruiterJobDAO
                            .getCompanyIdByUserId(userId);


            if (companyId == -1) {

                session.setAttribute(
                        "jobMessage",
                        "Company profile not found."
                );

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/jobs"
                );

                return;
            }


            /*
             * Read form values
             */
            String jobTitle =
                    request.getParameter("jobTitle");

            String jobType =
                    request.getParameter("jobType");

            String description =
                    request.getParameter("description");

            String eligibility =
                    request.getParameter("eligibility");

            String salary =
                    request.getParameter("salary");

            String location =
                    request.getParameter("location");

            String applicationDeadline =
                    request.getParameter(
                            "applicationDeadline"
                    );


            /*
             * Validate fields
             */
            if (jobTitle == null
                    || jobTitle.trim().isEmpty()
                    || jobType == null
                    || jobType.trim().isEmpty()
                    || description == null
                    || description.trim().isEmpty()
                    || eligibility == null
                    || eligibility.trim().isEmpty()
                    || salary == null
                    || salary.trim().isEmpty()
                    || location == null
                    || location.trim().isEmpty()
                    || applicationDeadline == null
                    || applicationDeadline.trim().isEmpty()) {

                session.setAttribute(
                        "jobMessage",
                        "Please fill all required fields."
                );

                response.sendRedirect(
                        request.getContextPath()
                                + "/recruiter/jobs"
                );

                return;
            }


            /*
             * Create Job object
             */
            Job job = new Job();

            job.setCompanyId(companyId);

            job.setJobTitle(
                    jobTitle.trim()
            );

            job.setJobType(
                    jobType.trim()
            );

            job.setDescription(
                    description.trim()
            );

            job.setEligibility(
                    eligibility.trim()
            );

            job.setSalary(
                    salary.trim()
            );

            job.setLocation(
                    location.trim()
            );

            job.setApplicationDeadline(
                    applicationDeadline.trim()
            );


            /*
             * Save job into database
             */
            boolean success =
                    recruiterJobDAO.addJob(job);


            if (success) {

                session.setAttribute(
                        "jobMessage",
                        "Job posted successfully!"
                );

            } else {

                session.setAttribute(
                        "jobMessage",
                        "Unable to post job. Please try again."
                );
            }


            /*
             * Redirect back to jobs page
             */
            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/jobs"
            );


        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "jobMessage",
                    "Something went wrong while posting the job."
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/recruiter/jobs"
            );
        }
    }
}