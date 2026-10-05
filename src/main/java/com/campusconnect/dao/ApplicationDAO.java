package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.model.Application;
import com.campusconnect.util.DBConnection;

public class ApplicationDAO {

    // Apply for a job
    public boolean applyForJob(int studentId, int jobId) {

        String sql = """
                INSERT INTO applications
                (student_id, job_id, status)
                VALUES (?, ?, 'APPLIED')
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, studentId);
            statement.setInt(2, jobId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // Check whether student has already applied
    public boolean hasApplied(int studentId, int jobId) {

        String sql = """
                SELECT application_id
                FROM applications
                WHERE student_id = ?
                AND job_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, studentId);
            statement.setInt(2, jobId);

            try (ResultSet resultSet = statement.executeQuery()) {

                return resultSet.next();
            }

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // Get all applications submitted by a student
    public List<Application> getApplicationsByStudentId(int studentId) {

        List<Application> applications = new ArrayList<>();

        String sql = """
                SELECT
                    a.application_id,
                    a.student_id,
                    a.job_id,
                    j.job_title,
                    c.company_name,
                    a.status,
                    a.applied_at
                FROM applications a
                JOIN jobs j
                    ON a.job_id = j.job_id
                JOIN companies c
                    ON j.company_id = c.company_id
                WHERE a.student_id = ?
                ORDER BY a.applied_at DESC
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, studentId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Application application = new Application();

                    application.setApplicationId(
                            resultSet.getInt("application_id")
                    );

                    application.setStudentId(
                            resultSet.getInt("student_id")
                    );

                    application.setJobId(
                            resultSet.getInt("job_id")
                    );

                    application.setJobTitle(
                            resultSet.getString("job_title")
                    );

                    application.setCompanyName(
                            resultSet.getString("company_name")
                    );

                    application.setStatus(
                            resultSet.getString("status")
                    );

                    application.setAppliedAt(
                            resultSet.getString("applied_at")
                    );

                    applications.add(application);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return applications;
    }
}