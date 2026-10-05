package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.campusconnect.model.User;
import com.campusconnect.util.DBConnection;

public class UserDAO {

    public User login(String email, String password) {

        User user = null;

        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                String hashedPassword = resultSet.getString("password");

                if (BCrypt.checkpw(password, hashedPassword)) {

                    user = new User();

                    user.setUserId(resultSet.getInt("user_id"));
                    user.setFullName(resultSet.getString("full_name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(hashedPassword);
                    user.setRole(resultSet.getString("role"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}