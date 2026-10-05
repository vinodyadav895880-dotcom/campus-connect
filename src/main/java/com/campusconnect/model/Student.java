package com.campusconnect.model;

public class Student {

    private int studentId;
    private int userId;

    // User table details
    private String fullName;
    private String email;

    // Student table details
    private String enrollmentNo;
    private String phone;
    private String course;
    private String branch;
    private int semester;
    private double cgpa;
    private int graduationYear;
    private String resumePath;

    public Student() {
    }

    public Student(int studentId, int userId,
                   String fullName, String email,
                   String enrollmentNo, String phone,
                   String course, String branch,
                   int semester, double cgpa,
                   int graduationYear, String resumePath) {

        this.studentId = studentId;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.enrollmentNo = enrollmentNo;
        this.phone = phone;
        this.course = course;
        this.branch = branch;
        this.semester = semester;
        this.cgpa = cgpa;
        this.graduationYear = graduationYear;
        this.resumePath = resumePath;
    }

    // Student ID
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    // User ID
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Full Name
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    // Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Enrollment Number
    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public void setEnrollmentNo(String enrollmentNo) {
        this.enrollmentNo = enrollmentNo;
    }

    // Phone
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Course
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    // Branch
    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    // Semester
    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    // CGPA
    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }

    // Graduation Year
    public int getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(int graduationYear) {
        this.graduationYear = graduationYear;
    }

    // Resume Path
    public String getResumePath() {
        return resumePath;
    }

    public void setResumePath(String resumePath) {
        this.resumePath = resumePath;
    }
}