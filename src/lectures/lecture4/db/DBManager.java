package lectures.lecture4.db;

import lectures.lecture4.entities.City;
import lectures.lecture4.entities.Student;

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
                            "student_birth_date, student_city_id) VALUES(?, ?, ?, ?)"
            );

            statement.setString(1, newStudent.getStudentName());
            statement.setString(2, newStudent.getSurname());
            statement.setString(3, newStudent.getBirthDate());
            statement.setLong(4, newStudent.getCityId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE ADDING A NEW STUDENT: " + e.getMessage());
        }
    }

    public static Student getStudentById(Long id) {
        Student student = new Student();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM students WHERE student_id=?"
            );

            statement.setLong(1, id);

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                student.setStudentId(result.getLong("student_id"));
                student.setStudentName(result.getString("student_name"));
                student.setSurname(result.getString("student_surname"));
                student.setBirthDate(result.getString("student_birth_date"));
                student.setCityId(result.getLong("student_city_id"));
                student.setCityName(getCityById(result.getLong("student_city_id")).getCityName());
            }
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE GETTING STUDENT BY ID: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE GETTING STUDENT BY ID: " + e.getMessage());
        }

        return student;
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
                        resultSet.getLong("student_city_id"),
                        getCityById(resultSet.getLong("student_city_id")).getCityName()
                ));
            }
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE GETTING ALL STUDENTS: " + e.getMessage());
        }

        return students;
    }

    public static void overwriteStudent(Student student) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE students " +
                            "SET student_name=?, student_surname=?, student_birth_date=?, student_city_id=? " +
                            "WHERE student_id=?"
            );

            statement.setString(1, student.getStudentName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthDate());
            statement.setLong(4, student.getCityId());
            statement.setLong(5, student.getStudentId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE UPDATING STUDENT: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE UPDATING STUDENT: " + e.getMessage());
        }
    }

    public static void deleteStudent(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM students WHERE student_id=?"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE DELETING THE STUDENT: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE DELETING THE STUDENT: " + e.getMessage());
        }
    }

    public static ArrayList<City> getCities() {
        ArrayList<City> cities = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM cities"
            );
            while (resultSet.next())
                cities.add(new City(
                        resultSet.getLong("city_id"),
                        resultSet.getString("city_name"),
                        resultSet.getString("city_code")
                ));
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE GETTING ALL CITIES: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE GETTING ALL CITIES: " + e.getMessage());
        }

        return cities;
    }

    public static City getCityById(Long id) {
        City city = new City();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM cities WHERE city_id=?"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                city = new City(
                        resultSet.getLong("city_id"),
                        resultSet.getString("city_name"),
                        resultSet.getString("city_code")
                );
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE GETTING THE CITY BY ID: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE GETTING THE CITY BY ID: " + e.getMessage());
        }

        return city;
    }

    public static void addCity(City city) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO cities(city_name, city_code) VALUES(?, ?)"
            );

            statement.setString(1, city.getCityName());
            statement.setString(2, city.getCode());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE ADDING A NEW CITY: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE ADDING A NEW CITY: " + e.getMessage());
        }
    }

    public static void updateCity(City city) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE cities SET city_name=?, city_code=? WHERE city_id=?"
            );

            statement.setString(1, city.getCityName());
            statement.setString(2, city.getCode());
            statement.setLong(3, city.getCityId());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE UPDATING THE CITY: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE UPDATING THE CITY: " + e.getMessage());
        }
    }

    public static void deleteCity(Long id) {
        try {
            PreparedStatement statement1 = connection.prepareStatement(
                    "DELETE FROM students WHERE student_city_id=?;"
            );

            statement1.setLong(1, id);
            statement1.executeUpdate();
            statement1.close();

            PreparedStatement statement2 = connection.prepareStatement(
                    "DELETE FROM cities WHERE city_id=?;"
            );

            statement2.setLong(1, id);
            statement2.executeUpdate();
            statement2.close();
        } catch (SQLException e) {
            System.out.println("SQL ERROR WHILE DELETING THE CITY: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("UNHANDLED ERROR WHILE DELETING THE CITY: " + e.getMessage());
        }
    }
}
