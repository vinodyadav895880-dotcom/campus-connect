package com.campusconnect.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            System.getenv().getOrDefault(
                    "CAMPUS_DB_URL",
                    "jdbc:mysql://localhost:3306/campus_connect"
            );

    private static final String USER =
            System.getenv().getOrDefault(
                    "CAMPUS_DB_USER",
                    "campus_user"
            );

    private static final String PASSWORD =
            System.getenv().getOrDefault(
                    "CAMPUS_DB_PASSWORD",
                    ""
            );

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                    "MySQL JDBC Driver not found!",
                    e
            );
        }

        if (PASSWORD.isEmpty()) {
            throw new SQLException(
                    "Database password is not configured. " +
                    "Set CAMPUS_DB_PASSWORD environment variable."
            );
        }

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );
    }
}