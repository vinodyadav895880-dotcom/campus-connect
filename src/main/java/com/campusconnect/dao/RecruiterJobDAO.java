package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.model.Job;
import com.campusconnect.util.DBConnection;

public class RecruiterJobDAO {

    /*
     * Get company ID of logged-in recruiter
     */
    public int getCompanyIdByUserId(int userId) {

        String sql = """
                SELECT company_id
                FROM companies
                WHERE user_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return resultSet.getInt("company_id");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }


    /*
     * Get all jobs posted by recruiter/company
     */
    public List<Job> getJobsByCompanyId(int companyId) {

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
                WHERE j.company_id = ?
                ORDER BY j.created_at DESC
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, companyId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Job job = new Job();

                    job.setJobId(
                            resultSet.getInt("job_id")
                    );

                    job.setCompanyId(
                            resultSet.getInt("company_id")
                    );

                    job.setCompanyName(
                            resultSet.getString("company_name")
                    );

                    job.setJobTitle(
                            resultSet.getString("job_title")
                    );

                    job.setJobType(
                            resultSet.getString("job_type")
                    );

                    job.setDescription(
                            resultSet.getString("description")
                    );

                    job.setEligibility(
                            resultSet.getString("eligibility")
                    );

                    job.setSalary(
                            resultSet.getString("salary")
                    );

                    job.setLocation(
                            resultSet.getString("location")
                    );

                    job.setApplicationDeadline(
                            resultSet.getString("application_deadline")
                    );

                    /*
                     * created_at intentionally not set here
                     * because Job.java does not contain createdAt field.
                     */

                    jobs.add(job);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobs;
    }


    /*
     * Add a new job
     */
    public boolean addJob(Job job) {

        String sql = """
                INSERT INTO jobs
                (
                    company_id,
                    job_title,
                    job_type,
                    description,
                    eligibility,
                    salary,
                    location,
                    application_deadline
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(
                    1,
                    job.getCompanyId()
            );

            statement.setString(
                    2,
                    job.getJobTitle()
            );

            statement.setString(
                    3,
                    job.getJobType()
            );

            statement.setString(
                    4,
                    job.getDescription()
            );

            statement.setString(
                    5,
                    job.getEligibility()
            );

            statement.setString(
                    6,
                    job.getSalary()
            );

            statement.setString(
                    7,
                    job.getLocation()
            );

            statement.setString(
                    8,
                    job.getApplicationDeadline()
            );

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}