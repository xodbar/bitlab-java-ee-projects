package lectures.lecture4.servlets;

import lectures.lecture4.db.DBManager;
import lectures.lecture4.entities.City;
import lectures.lecture4.entities.Student;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentManagementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            switch (request.getParameter("entity")) {
                case "student" :
                    switch (request.getParameter("command")) {
                        case "add" -> {
                            DBManager.addStudent(new Student(
                                    null,
                                    request.getParameter("student_name"),
                                    request.getParameter("student_surname"),
                                    request.getParameter("student_birth_date"),
                                    Long.parseLong(request.getParameter("student_city_id")),
                                    DBManager.getCityById(Long.parseLong(request.
                                            getParameter("student_city_id"))).getCityName()
                            ));

                            response.sendRedirect("/lec4task1");
                        }
                        case "update" -> {
                            DBManager.overwriteStudent(new Student(
                                    Long.parseLong(request.getParameter("id")),
                                    request.getParameter("studentName"),
                                    request.getParameter("studentSurname"),
                                    request.getParameter("studentDate"),
                                    Long.parseLong(request.getParameter("studentCityId")),
                                    DBManager.getCityById(Long.parseLong(request.
                                            getParameter("studentCityId"))).getCityName()
                            ));

                            response.sendRedirect("/lec4task1");
                        }
                        case "delete" -> {
                            DBManager.deleteStudent(Long.parseLong(request.getParameter("id")));
                            response.sendRedirect("/lec4task1");
                        }
                        default -> response.sendRedirect("/404");
                    }
                case "city":
                    switch (request.getParameter("command")) {
                        case "add" -> {
                            DBManager.addCity(new City(
                                    null,
                                    request.getParameter("city_name"),
                                    request.getParameter("city_code")
                            ));

                            response.sendRedirect("/lec4task1");
                        }
                        case "update" -> {
                            DBManager.updateCity(new City(
                                    Long.parseLong(request.getParameter("city_id")),
                                    request.getParameter("city_name"),
                                    request.getParameter("city_code")
                            ));

                            response.sendRedirect("/lec4task1");
                        }
                        case "delete" -> {
                            DBManager.deleteCity(Long.parseLong(request.getParameter("id")));
                            response.sendRedirect("/lec4task1");
                        }
                        default -> response.sendRedirect("/404");
                    }
                default: response.sendRedirect("/404");
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE CALLING doPost: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            if (request.getParameter("command") != null) {
                if (request.getParameter("entity").equals("student")) {
                    if (request.getParameter("command").equals("details")) {
                        request.setAttribute("student",
                                DBManager.getStudentById(Long.parseLong(request.getParameter("id"))));
                        request.setAttribute("cities", DBManager.getCities());
                        request.getRequestDispatcher("/lectures/lecture4/task1/student_details.jsp")
                                .forward(request, response);
                    } else if (request.getParameter("command").equals("add")) {
                        request.setAttribute("cities", DBManager.getCities());
                        request.getRequestDispatcher("/lectures/lecture4/task1/add_student.jsp").forward(request, response);
                    } else response.sendRedirect("/404");
                } else if (request.getParameter("entity").equals("city")) {
                    if (request.getParameter("command").equals("details")) {
                        request.setAttribute("cities", DBManager.getCities());
                        request.setAttribute("city",
                                DBManager.getCityById(Long.parseLong(request.getParameter("id"))));
                        request.getRequestDispatcher("/lectures/lecture4/task1/city_details.jsp")
                                .forward(request, response);
                    } else if (request.getParameter("command").equals("list")) {
                        request.setAttribute("cities", DBManager.getCities());
                        request.getRequestDispatcher("/lectures/lecture4/task1/cities.jsp").forward(request, response);
                    } else if (request.getParameter("command").equals("add")) {
                        request.setAttribute("cities", DBManager.getCities());
                        request.getRequestDispatcher("/lectures/lecture4/task1/add_city.jsp").forward(request, response);
                    } else response.sendRedirect("/404");
                } else {
                    response.sendRedirect("./other/service/404.html");
                }
            } else {
                request.setAttribute("students", DBManager.getAllStudents());
                request.setAttribute("cities", DBManager.getCities());
                request.getRequestDispatcher("/lectures/lecture4/task1/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE CALLING doGet: " + e.getMessage());
        }
    }
}
