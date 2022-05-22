package lectures.lecture3.db;

import lectures.lecture3.entities.Student;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR WHILE CONNECTING POSTGRES (CLASS FOR NAME): " + e.getMessage());
        }

        try {
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/students_database",
                    "postgres", "xodbar"
            );
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE CONNECTING TO THE DATABASE: " + e.getMessage());
        }
    }

    public static void addStudent(Student newStudent) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO students(student_name, student_surname, " +
                            "student_birth_date, student_city) VALUES(?, ?, ?, ?)"
            );

            statement.setString(1, newStudent.getStudentName());
            statement.setString(2, newStudent.getSurname());
            statement.setString(3, newStudent.getBirthDate());
            statement.setString(4, newStudent.getCity());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE ADDING A NEW STUDENT: " + e.getMessage());
        }
    }

    public static ArrayList<Student> getAllStudents() {
        ArrayList<Student> students = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM students"
            );

            while (resultSet.next()) {
                students.add(new Student(
                        resultSet.getLong("student_id"),
                        resultSet.getString("student_name"),
                        resultSet.getString("student_surname"),
                        resultSet.getString("student_birth_date"),
                        resultSet.getString("student_city")
                ));
            }
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE GETTING ALL STUDENTS: " + e.getMessage());
        }

        return students;
    }
}
