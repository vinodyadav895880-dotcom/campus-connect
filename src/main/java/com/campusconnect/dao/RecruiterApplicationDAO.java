package com.campusconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusconnect.model.Application;
import com.campusconnect.util.DBConnection;

public class RecruiterApplicationDAO {


    /*
     * =========================================================
     * GET ALL APPLICATIONS FOR A RECRUITER'S COMPANY
     * =========================================================
     */

    public List<Application> getApplicationsByCompanyId(int companyId) {

        List<Application> applications = new ArrayList<>();


        String sql = """
                SELECT
                    a.application_id,
                    a.student_id,
                    a.job_id,

                    u.full_name,
                    u.email,

                    s.enrollment_no,
                    s.course,
                    s.branch,
                    s.cgpa,

                    j.job_title,

                    c.company_name,

                    a.status,
                    a.applied_at

                FROM applications a

                JOIN students s
                    ON a.student_id = s.student_id

                JOIN users u
                    ON s.user_id = u.user_id

                JOIN jobs j
                    ON a.job_id = j.job_id

                JOIN companies c
                    ON j.company_id = c.company_id

                WHERE j.company_id = ?

                ORDER BY a.applied_at DESC
                """;


        try (
            Connection connection =
                DBConnection.getConnection();

            PreparedStatement statement =
                connection.prepareStatement(sql)
        ) {


            statement.setInt(1, companyId);


            try (
                ResultSet resultSet =
                    statement.executeQuery()
            ) {


                while (resultSet.next()) {


                    Application app =
                        new Application();


                    /*
                     * Application information
                     */

                    app.setApplicationId(
                        resultSet.getInt("application_id")
                    );

                    app.setStudentId(
                        resultSet.getInt("student_id")
                    );

                    app.setJobId(
                        resultSet.getInt("job_id")
                    );


                    /*
                     * Student information
                     */

                    app.setStudentName(
                        resultSet.getString("full_name")
                    );

                    app.setStudentEmail(
                        resultSet.getString("email")
                    );

                    app.setEnrollmentNo(
                        resultSet.getString("enrollment_no")
                    );

                    app.setCourse(
                        resultSet.getString("course")
                    );

                    app.setBranch(
                        resultSet.getString("branch")
                    );

                    app.setCgpa(
                        resultSet.getString("cgpa")
                    );


                    /*
                     * Job information
                     */

                    app.setJobTitle(
                        resultSet.getString("job_title")
                    );


                    /*
                     * Company information
                     */

                    app.setCompanyName(
                        resultSet.getString("company_name")
                    );


                    /*
                     * Application status
                     */

                    app.setStatus(
                        resultSet.getString("status")
                    );


                    /*
                     * Application date
                     */

                    app.setAppliedAt(
                        resultSet.getString("applied_at")
                    );


                    applications.add(app);
                }
            }


        } catch (Exception e) {

            e.printStackTrace();
        }


        return applications;
    }



    /*
     * =========================================================
     * UPDATE APPLICATION STATUS
     * =========================================================
     */

    public boolean updateApplicationStatus(
            int applicationId,
            String status) {


        String sql = """
                UPDATE applications
                SET status = ?
                WHERE application_id = ?
                """;


        try (
            Connection connection =
                DBConnection.getConnection();

            PreparedStatement statement =
                connection.prepareStatement(sql)
        ) {


            statement.setString(1, status);

            statement.setInt(2, applicationId);


            return statement.executeUpdate() > 0;


        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}