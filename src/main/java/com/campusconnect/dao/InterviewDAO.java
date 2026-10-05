package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.util.DBConnection;

public class InterviewDAO {

    // =========================================================
    // SCHEDULE INTERVIEW
    // =========================================================

    public boolean scheduleInterview(
            int applicationId,
            String interviewDate,
            String interviewTime,
            String interviewMode,
            String meetingLink,
            String venue,
            String remarks) {

        String sql = """
                INSERT INTO interviews
                (
                    application_id,
                    interview_date,
                    interview_time,
                    interview_mode,
                    meeting_link,
                    venue,
                    remarks
                )
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, applicationId);
            statement.setString(2, interviewDate);
            statement.setString(3, interviewTime);
            statement.setString(4, interviewMode);
            statement.setString(5, meetingLink);
            statement.setString(6, venue);
            statement.setString(7, remarks);

            int rows = statement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // CHECK WHETHER INTERVIEW ALREADY EXISTS
    // =========================================================

    public boolean interviewExists(int applicationId) {

        String sql = """
                SELECT interview_id
                FROM interviews
                WHERE application_id = ?
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, applicationId);

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                return resultSet.next();
            }

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // GET INTERVIEWS FOR STUDENT
    // =========================================================

    public List<InterviewRecord> getInterviewsByStudentId(
            int studentId) {

        List<InterviewRecord> interviews =
                new ArrayList<>();

        String sql = """
                SELECT
                    i.interview_id,
                    i.application_id,
                    i.interview_date,
                    i.interview_time,
                    i.interview_mode,
                    i.meeting_link,
                    i.venue,
                    i.result,
                    i.remarks,
                    i.created_at,
                    j.job_title,
                    c.company_name
                FROM interviews i
                JOIN applications a
                    ON i.application_id = a.application_id
                JOIN jobs j
                    ON a.job_id = j.job_id
                JOIN companies c
                    ON j.company_id = c.company_id
                WHERE a.student_id = ?
                ORDER BY i.interview_date ASC,
                         i.interview_time ASC
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, studentId);

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                while (resultSet.next()) {

                    InterviewRecord interview =
                            new InterviewRecord();

                    interview.setInterviewId(
                            resultSet.getInt("interview_id")
                    );

                    interview.setApplicationId(
                            resultSet.getInt("application_id")
                    );

                    interview.setInterviewDate(
                            resultSet.getString("interview_date")
                    );

                    interview.setInterviewTime(
                            resultSet.getString("interview_time")
                    );

                    interview.setInterviewMode(
                            resultSet.getString("interview_mode")
                    );

                    interview.setMeetingLink(
                            resultSet.getString("meeting_link")
                    );

                    interview.setVenue(
                            resultSet.getString("venue")
                    );

                    interview.setResult(
                            resultSet.getString("result")
                    );

                    interview.setRemarks(
                            resultSet.getString("remarks")
                    );

                    interview.setCreatedAt(
                            resultSet.getString("created_at")
                    );

                    interview.setJobTitle(
                            resultSet.getString("job_title")
                    );

                    interview.setCompanyName(
                            resultSet.getString("company_name")
                    );

                    interviews.add(interview);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return interviews;
    }


    // =========================================================
    // GET ALL INTERVIEWS FOR RECRUITER
    // =========================================================

    public List<InterviewRecord> getInterviewsByRecruiterId(
            int recruiterUserId) {

        List<InterviewRecord> interviews =
                new ArrayList<>();

        String sql = """
                SELECT
                    i.interview_id,
                    i.application_id,
                    i.interview_date,
                    i.interview_time,
                    i.interview_mode,
                    i.meeting_link,
                    i.venue,
                    i.result,
                    i.remarks,
                    i.created_at,

                    j.job_title,

                    c.company_name,

                    u.full_name AS student_name,
                    u.email AS student_email,

                    s.enrollment_no,
                    s.course,
                    s.branch,
                    s.cgpa

                FROM interviews i

                JOIN applications a
                    ON i.application_id = a.application_id

                JOIN students s
                    ON a.student_id = s.student_id

                JOIN users u
                    ON s.user_id = u.user_id

                JOIN jobs j
                    ON a.job_id = j.job_id

                JOIN companies c
                    ON j.company_id = c.company_id

                WHERE c.user_id = ?

                ORDER BY
                    i.interview_date ASC,
                    i.interview_time ASC
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, recruiterUserId);

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                while (resultSet.next()) {

                    InterviewRecord interview =
                            new InterviewRecord();

                    interview.setInterviewId(
                            resultSet.getInt("interview_id")
                    );

                    interview.setApplicationId(
                            resultSet.getInt("application_id")
                    );

                    interview.setInterviewDate(
                            resultSet.getString("interview_date")
                    );

                    interview.setInterviewTime(
                            resultSet.getString("interview_time")
                    );

                    interview.setInterviewMode(
                            resultSet.getString("interview_mode")
                    );

                    interview.setMeetingLink(
                            resultSet.getString("meeting_link")
                    );

                    interview.setVenue(
                            resultSet.getString("venue")
                    );

                    interview.setResult(
                            resultSet.getString("result")
                    );

                    interview.setRemarks(
                            resultSet.getString("remarks")
                    );

                    interview.setCreatedAt(
                            resultSet.getString("created_at")
                    );

                    interview.setJobTitle(
                            resultSet.getString("job_title")
                    );

                    interview.setCompanyName(
                            resultSet.getString("company_name")
                    );

                    interview.setStudentName(
                            resultSet.getString("student_name")
                    );

                    interview.setStudentEmail(
                            resultSet.getString("student_email")
                    );

                    interview.setEnrollmentNo(
                            resultSet.getString("enrollment_no")
                    );

                    interview.setCourse(
                            resultSet.getString("course")
                    );

                    interview.setBranch(
                            resultSet.getString("branch")
                    );

                    interview.setCgpa(
                            resultSet.getString("cgpa")
                    );

                    interviews.add(interview);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return interviews;
    }


    // =========================================================
    // UPDATE INTERVIEW RESULT
    // =========================================================

    public boolean updateInterviewResult(
            int interviewId,
            int recruiterUserId,
            String result) {

        String sql = """
                UPDATE interviews i

                JOIN applications a
                    ON i.application_id = a.application_id

                JOIN jobs j
                    ON a.job_id = j.job_id

                JOIN companies c
                    ON j.company_id = c.company_id

                SET i.result = ?

                WHERE i.interview_id = ?
                AND c.user_id = ?
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, result);
            statement.setInt(2, interviewId);
            statement.setInt(3, recruiterUserId);

            int rows = statement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // INTERVIEW RECORD MODEL
    // =========================================================

    public static class InterviewRecord {

        private int interviewId;
        private int applicationId;

        private String interviewDate;
        private String interviewTime;
        private String interviewMode;

        private String meetingLink;
        private String venue;

        private String result;
        private String remarks;
        private String createdAt;

        private String jobTitle;
        private String companyName;

        private String studentName;
        private String studentEmail;

        private String enrollmentNo;
        private String course;
        private String branch;
        private String cgpa;


        // ==============================
        // INTERVIEW ID
        // ==============================

        public int getInterviewId() {
            return interviewId;
        }

        public void setInterviewId(int interviewId) {
            this.interviewId = interviewId;
        }


        // ==============================
        // APPLICATION ID
        // ==============================

        public int getApplicationId() {
            return applicationId;
        }

        public void setApplicationId(int applicationId) {
            this.applicationId = applicationId;
        }


        // ==============================
        // INTERVIEW DATE
        // ==============================

        public String getInterviewDate() {
            return interviewDate;
        }

        public void setInterviewDate(String interviewDate) {
            this.interviewDate = interviewDate;
        }


        // ==============================
        // INTERVIEW TIME
        // ==============================

        public String getInterviewTime() {
            return interviewTime;
        }

        public void setInterviewTime(String interviewTime) {
            this.interviewTime = interviewTime;
        }


        // ==============================
        // INTERVIEW MODE
        // ==============================

        public String getInterviewMode() {
            return interviewMode;
        }

        public void setInterviewMode(String interviewMode) {
            this.interviewMode = interviewMode;
        }


        // ==============================
        // MEETING LINK
        // ==============================

        public String getMeetingLink() {
            return meetingLink;
        }

        public void setMeetingLink(String meetingLink) {
            this.meetingLink = meetingLink;
        }


        // ==============================
        // VENUE
        // ==============================

        public String getVenue() {
            return venue;
        }

        public void setVenue(String venue) {
            this.venue = venue;
        }


        // ==============================
        // RESULT
        // ==============================

        public String getResult() {
            return result;
        }

        public void setResult(String result) {
            this.result = result;
        }


        // ==============================
        // REMARKS
        // ==============================

        public String getRemarks() {
            return remarks;
        }

        public void setRemarks(String remarks) {
            this.remarks = remarks;
        }


        // ==============================
        // CREATED AT
        // ==============================

        public String getCreatedAt() {
            return createdAt;
        }

        public void setCreatedAt(String createdAt) {
            this.createdAt = createdAt;
        }


        // ==============================
        // JOB TITLE
        // ==============================

        public String getJobTitle() {
            return jobTitle;
        }

        public void setJobTitle(String jobTitle) {
            this.jobTitle = jobTitle;
        }


        // ==============================
        // COMPANY NAME
        // ==============================

        public String getCompanyName() {
            return companyName;
        }

        public void setCompanyName(String companyName) {
            this.companyName = companyName;
        }


        // ==============================
        // STUDENT NAME
        // ==============================

        public String getStudentName() {
            return studentName;
        }

        public void setStudentName(String studentName) {
            this.studentName = studentName;
        }


        // ==============================
        // STUDENT EMAIL
        // ==============================

        public String getStudentEmail() {
            return studentEmail;
        }

        public void setStudentEmail(String studentEmail) {
            this.studentEmail = studentEmail;
        }


        // ==============================
        // ENROLLMENT NUMBER
        // ==============================

        public String getEnrollmentNo() {
            return enrollmentNo;
        }

        public void setEnrollmentNo(String enrollmentNo) {
            this.enrollmentNo = enrollmentNo;
        }


        // ==============================
        // COURSE
        // ==============================

        public String getCourse() {
            return course;
        }

        public void setCourse(String course) {
            this.course = course;
        }


        // ==============================
        // BRANCH
        // ==============================

        public String getBranch() {
            return branch;
        }

        public void setBranch(String branch) {
            this.branch = branch;
        }


        // ==============================
        // CGPA
        // ==============================

        public String getCgpa() {
            return cgpa;
        }

        public void setCgpa(String cgpa) {
            this.cgpa = cgpa;
        }
    }
}