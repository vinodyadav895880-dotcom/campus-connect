package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.model.Job;
import com.campusconnect.util.DBConnection;

public class JobDAO {

    public List<Job> getAllJobs() {

        List<Job> jobs = new ArrayList<>();

        String sql = """
                SELECT
                    j.job_id,
                    j.company_id,
                    c.company_name,
                    j.job_title,
                    j.job_type,
                    j.description,
                    j.eligibility,
                    j.salary,
                    j.location,
                    j.application_deadline
                FROM jobs j
                JOIN companies c
                    ON j.company_id = c.company_id
                ORDER BY j.created_at DESC
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Job job = new Job();

                job.setJobId(resultSet.getInt("job_id"));
                job.setCompanyId(resultSet.getInt("company_id"));
                job.setCompanyName(resultSet.getString("company_name"));
                job.setJobTitle(resultSet.getString("job_title"));
                job.setJobType(resultSet.getString("job_type"));
                job.setDescription(resultSet.getString("description"));
                job.setEligibility(resultSet.getString("eligibility"));
                job.setSalary(resultSet.getString("salary"));
                job.setLocation(resultSet.getString("location"));
                job.setApplicationDeadline(
                        resultSet.getString("application_deadline")
                );

                jobs.add(job);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return jobs;
    }
}