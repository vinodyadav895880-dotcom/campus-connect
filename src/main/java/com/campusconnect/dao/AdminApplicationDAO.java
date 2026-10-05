package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.util.DBConnection;

public class AdminApplicationDAO {

    public List<ApplicationRecord> getAllApplications() {

        List<ApplicationRecord> applications =
                new ArrayList<>();

        String sql = """
                SELECT
                    a.application_id,
                    a.student_id,
                    a.job_id,
                    a.status,
                    a.applied_at,

                    u.full_name AS student_name,
                    u.email AS student_email,

                    s.enrollment_no,
                    s.course,
                    s.branch,
                    s.cgpa,

                    j.job_title,
                    j.job_type,

                    c.company_name

                FROM applications a

                JOIN students s
                    ON a.student_id = s.student_id

                JOIN users u
                    ON s.user_id = u.user_id

                JOIN jobs j
                    ON a.job_id = j.job_id

                JOIN companies c
                    ON j.company_id = c.company_id

                ORDER BY a.applied_at DESC
                """;

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            while (resultSet.next()) {

                ApplicationRecord application =
                        new ApplicationRecord();

                application.setApplicationId(
                        resultSet.getInt("application_id")
                );

                application.setStudentId(
                        resultSet.getInt("student_id")
                );

                application.setJobId(
                        resultSet.getInt("job_id")
                );

                application.setStatus(
                        resultSet.getString("status")
                );

                application.setAppliedAt(
                        resultSet.getTimestamp("applied_at")
                );

                application.setStudentName(
                        resultSet.getString("student_name")
                );

                application.setStudentEmail(
                        resultSet.getString("student_email")
                );

                application.setEnrollmentNo(
                        resultSet.getString("enrollment_no")
                );

                application.setCourse(
                        resultSet.getString("course")
                );

                application.setBranch(
                        resultSet.getString("branch")
                );

                application.setCgpa(
                        resultSet.getDouble("cgpa")
                );

                application.setJobTitle(
                        resultSet.getString("job_title")
                );

                application.setJobType(
                        resultSet.getString("job_type")
                );

                application.setCompanyName(
                        resultSet.getString("company_name")
                );

                applications.add(application);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return applications;
    }


    /*
     * =========================================
     * APPLICATION RECORD
     * =========================================
     */

    public static class ApplicationRecord {

        private int applicationId;
        private int studentId;
        private int jobId;

        private String status;
        private java.sql.Timestamp appliedAt;

        private String studentName;
        private String studentEmail;
        private String enrollmentNo;

        private String course;
        private String branch;
        private double cgpa;

        private String jobTitle;
        private String jobType;

        private String companyName;


        public int getApplicationId() {
            return applicationId;
        }

        public void setApplicationId(int applicationId) {
            this.applicationId = applicationId;
        }


        public int getStudentId() {
            return studentId;
        }

        public void setStudentId(int studentId) {
            this.studentId = studentId;
        }


        public int getJobId() {
            return jobId;
        }

        public void setJobId(int jobId) {
            this.jobId = jobId;
        }


        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }


        public java.sql.Timestamp getAppliedAt() {
            return appliedAt;
        }

        public void setAppliedAt(
                java.sql.Timestamp appliedAt) {

            this.appliedAt = appliedAt;
        }


        public String getStudentName() {
            return studentName;
        }

        public void setStudentName(
                String studentName) {

            this.studentName = studentName;
        }


        public String getStudentEmail() {
            return studentEmail;
        }

        public void setStudentEmail(
                String studentEmail) {

            this.studentEmail = studentEmail;
        }


        public String getEnrollmentNo() {
            return enrollmentNo;
        }

        public void setEnrollmentNo(
                String enrollmentNo) {

            this.enrollmentNo = enrollmentNo;
        }


        public String getCourse() {
            return course;
        }

        public void setCourse(
                String course) {

            this.course = course;
        }


        public String getBranch() {
            return branch;
        }

        public void setBranch(
                String branch) {

            this.branch = branch;
        }


        public double getCgpa() {
            return cgpa;
        }

        public void setCgpa(
                double cgpa) {

            this.cgpa = cgpa;
        }


        public String getJobTitle() {
            return jobTitle;
        }

        public void setJobTitle(
                String jobTitle) {

            this.jobTitle = jobTitle;
        }


        public String getJobType() {
            return jobType;
        }

        public void setJobType(
                String jobType) {

            this.jobType = jobType;
        }


        public String getCompanyName() {
            return companyName;
        }

        public void setCompanyName(
                String companyName) {

            this.companyName = companyName;
        }
    }
}