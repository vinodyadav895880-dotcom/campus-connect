package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.campusconnect.util.DBConnection;

public class ReportDAO {

    /*
     * =========================================
     * TOTAL STUDENTS
     * =========================================
     */

    public int getTotalStudents() {

        String sql = """
                SELECT COUNT(*)
                FROM users
                WHERE role = 'STUDENT'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * TOTAL RECRUITERS
     * =========================================
     */

    public int getTotalRecruiters() {

        String sql = """
                SELECT COUNT(*)
                FROM users
                WHERE role = 'RECRUITER'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * TOTAL COMPANIES
     * =========================================
     */

    public int getTotalCompanies() {

        String sql = """
                SELECT COUNT(*)
                FROM companies
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * TOTAL JOBS
     * =========================================
     */

    public int getTotalJobs() {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * TOTAL APPLICATIONS
     * =========================================
     */

    public int getTotalApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * APPLIED APPLICATIONS
     * =========================================
     */

    public int getAppliedApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                WHERE status = 'APPLIED'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * SHORTLISTED APPLICATIONS
     * =========================================
     */

    public int getShortlistedApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                WHERE status = 'SHORTLISTED'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * SELECTED APPLICATIONS
     * =========================================
     */

    public int getSelectedApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                WHERE status = 'SELECTED'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * REJECTED APPLICATIONS
     * =========================================
     */

    public int getRejectedApplications() {

        String sql = """
                SELECT COUNT(*)
                FROM applications
                WHERE status = 'REJECTED'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * PLACEMENT JOBS
     * =========================================
     */

    public int getPlacementJobs() {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
                WHERE job_type = 'PLACEMENT'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * INTERNSHIP JOBS
     * =========================================
     */

    public int getInternshipJobs() {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
                WHERE job_type = 'INTERNSHIP'
                """;

        return getCount(sql);
    }


    /*
     * =========================================
     * COMMON COUNT METHOD
     * =========================================
     */

    private int getCount(String sql) {

        try (
            Connection connection =
                    DBConnection.getConnection();

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