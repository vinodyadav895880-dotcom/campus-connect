package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.util.DBConnection;

public class CompanyDAO {

    public List<CompanyRecord> getAllCompanies() {

        List<CompanyRecord> companies = new ArrayList<>();

        String sql = """
                SELECT
                    c.company_id,
                    c.user_id,
                    c.company_name,
                    c.industry,
                    c.website,
                    c.location,
                    c.description,
                    u.full_name,
                    u.email
                FROM companies c
                LEFT JOIN users u
                    ON c.user_id = u.user_id
                ORDER BY c.company_id DESC
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            while (resultSet.next()) {

                CompanyRecord company =
                        new CompanyRecord();

                company.setCompanyId(
                        resultSet.getInt("company_id")
                );

                company.setUserId(
                        resultSet.getInt("user_id")
                );

                company.setCompanyName(
                        resultSet.getString("company_name")
                );

                company.setIndustry(
                        resultSet.getString("industry")
                );

                company.setWebsite(
                        resultSet.getString("website")
                );

                company.setLocation(
                        resultSet.getString("location")
                );

                company.setDescription(
                        resultSet.getString("description")
                );

                company.setContactName(
                        resultSet.getString("full_name")
                );

                company.setContactEmail(
                        resultSet.getString("email")
                );

                companies.add(company);
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return companies;
    }


    public static class CompanyRecord {

        private int companyId;
        private int userId;

        private String companyName;
        private String industry;
        private String website;
        private String location;
        private String description;

        private String contactName;
        private String contactEmail;


        public int getCompanyId() {
            return companyId;
        }

        public void setCompanyId(int companyId) {
            this.companyId = companyId;
        }


        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
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


        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }


        public String getContactName() {
            return contactName;
        }

        public void setContactName(String contactName) {
            this.contactName = contactName;
        }


        public String getContactEmail() {
            return contactEmail;
        }

        public void setContactEmail(String contactEmail) {
            this.contactEmail = contactEmail;
        }
    }
}