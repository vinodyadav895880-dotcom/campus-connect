package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.model.Student;
import com.campusconnect.util.DBConnection;

public class StudentDAO {

    // ==========================================
    // Get student profile using logged-in user ID
    // ==========================================

    public Student getStudentByUserId(int userId) {

        Student student = null;

        String sql = """
                SELECT *
                FROM students
                WHERE user_id = ?
                """;

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                if (resultSet.next()) {

                    student = new Student();

                    student.setStudentId(
                            resultSet.getInt("student_id")
                    );

                    student.setUserId(
                            resultSet.getInt("user_id")
                    );

                    student.setEnrollmentNo(
                            resultSet.getString("enrollment_no")
                    );

                    student.setPhone(
                            resultSet.getString("phone")
                    );

                    student.setCourse(
                            resultSet.getString("course")
                    );

                    student.setBranch(
                            resultSet.getString("branch")
                    );

                    student.setSemester(
                            resultSet.getInt("semester")
                    );

                    student.setCgpa(
                            resultSet.getDouble("cgpa")
                    );

                    student.setGraduationYear(
                            resultSet.getInt("graduation_year")
                    );

                    student.setResumePath(
                            resultSet.getString("resume_path")
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return student;
    }


    // ==========================================
    // Save or update student profile
    // ==========================================

    public boolean saveStudent(Student student) {

        String sql = """
                INSERT INTO students
                (
                    user_id,
                    enrollment_no,
                    phone,
                    course,
                    branch,
                    semester,
                    cgpa,
                    graduation_year,
                    resume_path
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)

                ON DUPLICATE KEY UPDATE

                    enrollment_no = VALUES(enrollment_no),
                    phone = VALUES(phone),
                    course = VALUES(course),
                    branch = VALUES(branch),
                    semester = VALUES(semester),
                    cgpa = VALUES(cgpa),
                    graduation_year = VALUES(graduation_year),
                    resume_path = VALUES(resume_path)
                """;

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    student.getUserId()
            );

            statement.setString(
                    2,
                    student.getEnrollmentNo()
            );

            statement.setString(
                    3,
                    student.getPhone()
            );

            statement.setString(
                    4,
                    student.getCourse()
            );

            statement.setString(
                    5,
                    student.getBranch()
            );

            statement.setInt(
                    6,
                    student.getSemester()
            );

            statement.setDouble(
                    7,
                    student.getCgpa()
            );

            statement.setInt(
                    8,
                    student.getGraduationYear()
            );

            statement.setString(
                    9,
                    student.getResumePath()
            );

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // ADMIN:
    // Get all students with user details
    // ==========================================

    public List<Student> getAllStudents() {

        List<Student> students =
                new ArrayList<>();

        String sql = """
                SELECT
                    s.student_id,
                    s.user_id,
                    s.enrollment_no,
                    s.phone,
                    s.course,
                    s.branch,
                    s.semester,
                    s.cgpa,
                    s.graduation_year,
                    s.resume_path,

                    u.full_name,
                    u.email,
                    u.created_at

                FROM students s

                JOIN users u
                    ON s.user_id = u.user_id

                WHERE u.role = 'STUDENT'

                ORDER BY s.student_id DESC
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

                Student student =
                        new Student();

                student.setStudentId(
                        resultSet.getInt("student_id")
                );

                student.setUserId(
                        resultSet.getInt("user_id")
                );

                student.setEnrollmentNo(
                        resultSet.getString("enrollment_no")
                );

                student.setPhone(
                        resultSet.getString("phone")
                );

                student.setCourse(
                        resultSet.getString("course")
                );

                student.setBranch(
                        resultSet.getString("branch")
                );

                student.setSemester(
                        resultSet.getInt("semester")
                );

                student.setCgpa(
                        resultSet.getDouble("cgpa")
                );

                student.setGraduationYear(
                        resultSet.getInt("graduation_year")
                );

                student.setResumePath(
                        resultSet.getString("resume_path")
                );

                /*
                 * These three values come from users table.
                 * Student model must contain these fields.
                 */
                student.setFullName(
                        resultSet.getString("full_name")
                );

                student.setEmail(
                        resultSet.getString("email")
                );

                students.add(student);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return students;
    }
}