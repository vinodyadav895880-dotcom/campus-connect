package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.campusconnect.util.DBConnection;

public class AdminDAO {

    public int getTotalStudents() {

        String sql = """
                SELECT COUNT(*)
                FROM users
                WHERE role = 'STUDENT'
                """;

        return getCount(sql);
    }

    public int getTotalRecruiters() {

        String sql = """
                SELECT COUNT(*)
                FROM users
                WHERE role = 'RECRUITER'
                """;

        return getCount(sql);
    }

    public int getTotalCompanies() {

        String sql = """
                SELECT COUNT(*)
                FROM companies
                """;

        return getCount(sql);
    }

    public int getTotalJobs() {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
                """;

        return getCount(sql);
    }

    public int getTotalApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                """;

        return getCount(sql);
    }

    private int getCount(String sql) {

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}