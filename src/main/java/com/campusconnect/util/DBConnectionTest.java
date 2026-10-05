package com.campusconnect.util;

import java.sql.Connection;

public class DBConnectionTest {

    public static void main(String[] args) {

        try (Connection connection = DBConnection.getConnection()) {

            if (connection != null) {
                System.out.println("=================================");
                System.out.println("MySQL Connection Successful!");
                System.out.println("Database: campus_connect");
                System.out.println("=================================");
            }

        } catch (Exception e) {
            System.out.println("MySQL Connection Failed!");
            e.printStackTrace();
        }
    }
}