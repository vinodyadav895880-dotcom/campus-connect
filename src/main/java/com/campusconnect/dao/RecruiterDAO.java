package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.util.DBConnection;

public class RecruiterDAO {

    public List<RecruiterRecord> getAllRecruiters() {

        List<RecruiterRecord> recruiters = new ArrayList<>();

        String sql = """
                SELECT
                    u.user_id,
                    u.full_name,
                    u.email,
                    c.company_id,
                    c.company_name,
                    c.industry,
                    c.website,
                    c.location
                FROM users u
                LEFT JOIN companies c
                    ON u.user_id = c.user_id
                WHERE u.role = 'RECRUITER'
                ORDER BY u.user_id DESC
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            while (resultSet.next()) {

                RecruiterRecord recruiter =
                        new RecruiterRecord();

                recruiter.setUserId(
                        resultSet.getInt("user_id")
                );

                recruiter.setFullName(
                        resultSet.getString("full_name")
                );

                recruiter.setEmail(
                        resultSet.getString("email")
                );

                recruiter.setCompanyId(
                        resultSet.getInt("company_id")
                );

                recruiter.setCompanyName(
                        resultSet.getString("company_name")
                );

                recruiter.setIndustry(
                        resultSet.getString("industry")
                );

                recruiter.setWebsite(
                        resultSet.getString("website")
                );

                recruiter.setLocation(
                        resultSet.getString("location")
                );

                recruiters.add(recruiter);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return recruiters;
    }


    public static class RecruiterRecord {

        private int userId;
        private String fullName;
        private String email;

        private int companyId;
        private String companyName;
        private String industry;
        private String website;
        private String location;


        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }


        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }


        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }


        public int getCompanyId() {
            return companyId;
        }

        public void setCompanyId(int companyId) {
            this.companyId = companyId;
        }


        public String getCompanyName() {
            return companyName;
        }

        public void setCompanyName(String companyName) {
            this.companyName = companyName;
        }


        public String getIndustry() {
            return industry;
        }

        public void setIndustry(String industry) {
            this.industry = industry;
        }


        public String getWebsite() {
            return website;
        }

        public void setWebsite(String website) {
            this.website = website;
        }


        public String getLocation() {
            return location;
        }

        public void setLocation(String location) {
            this.location = location;
        }
    }
}