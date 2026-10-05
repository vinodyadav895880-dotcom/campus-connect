package com.campusconnect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campusconnect.dao.JobDAO;
import com.campusconnect.model.Job;

@WebServlet("/student/jobs")
public class JobListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Job> jobs = jobDAO.getAllJobs();

        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher(
                "/student/jobs.jsp"
        ).forward(request, response);
    }
}