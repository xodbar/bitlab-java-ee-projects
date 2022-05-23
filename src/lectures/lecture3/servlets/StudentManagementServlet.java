package lectures.lecture3.servlets;

import lectures.lecture3.db.DBManager;
import lectures.lecture3.entities.Student;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentManagementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            switch (request.getParameter("c")) {
                case "1" -> {
                    DBManager.addStudent(new Student(
                            null,
                            request.getParameter("student_name"),
                            request.getParameter("student_surname"),
                            request.getParameter("student_birth_date"),
                            request.getParameter("student_city")
                    ));

                    response.sendRedirect("/lec3task1");
                }
                case "2" -> {
                    DBManager.overwriteStudent(new Student(
                            Long.parseLong(request.getParameter("id")),
                            request.getParameter("studentName"),
                            request.getParameter("studentSurname"),
                            request.getParameter("studentDate"),
                            request.getParameter("studentCity")
                    ));

                    response.sendRedirect("/lec3task1");
                }
                case "3" -> {
                    DBManager.deleteStudent(Long.parseLong(request.getParameter("id")));
                    response.sendRedirect("/lec3task1");
                }
                default -> response.sendRedirect("/404");
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE CALLING doPost: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            if (request.getParameter("command") != null) {
                if (request.getParameter("command").equals("details")) {
                    request.setAttribute("student",
                            DBManager.getStudentById(Long.parseLong(request.getParameter("id"))));
                    request.getRequestDispatcher("/lectures/lecture4/task1/student_details.jsp")
                            .forward(request, response);
                } else {
                    response.sendRedirect("./other/service/404.html");
                }
            } else {
                request.setAttribute("students", DBManager.getAllStudents());
                request.getRequestDispatcher("/lectures/lecture3/task1/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE CALLING doGet: " + e.getMessage());
        }
    }
}
