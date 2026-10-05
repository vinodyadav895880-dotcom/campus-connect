package com.campusconnect.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHashGenerator {

    public static void main(String[] args) {

        String password = System.getenv("CAMPUS_HASH_PASSWORD");

        if (password == null || password.isBlank()) {
            System.out.println(
                    "Set CAMPUS_HASH_PASSWORD environment variable first."
            );
            return;
        }

        String hashedPassword = BCrypt.hashpw(
                password,
                BCrypt.gensalt(12)
        );

        System.out.println("BCrypt Hash:");
        System.out.println(hashedPassword);
    }
}