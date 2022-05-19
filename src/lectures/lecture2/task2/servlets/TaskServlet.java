package lectures.lecture2.task2.servlets;

import lectures.lecture2.task2.db.DBManager;
import lectures.lecture2.task2.entities.Task;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("command") != null) {
            System.out.println("KEK FROM NOTNULL");
            if (request.getParameter("command").equals("add")) {
                System.out.println("KEK FROM COMMAND=ADD");
                DBManager.addTask(new Task(
                        DBManager.getLastId(),
                        request.getParameter("newTask_name"),
                        request.getParameter("newTask_description"),
                        request.getParameter("newTask_deadline"),
                        (request.getParameter("newTask_status") != null)
                ));

                response.sendRedirect("/lec2task2");
            }
            else if (request.getParameter("command").equals("overwrite")){
                System.out.println("KEK FROM COMMAND=OVERWRITE");
                DBManager.overwriteTask(Long.parseLong(request.getParameter("currentTaskId")), new Task(
                        Long.parseLong(request.getParameter("currentTaskId")),
                        request.getParameter("task_name"),
                        request.getParameter("task_description"),
                        request.getParameter("task_deadline"),
                        (request.getParameter("task_status") != null)
                ));

                response.sendRedirect("/lec2task2");
            } else if (request.getParameter("command").equals("delete")) {
                System.out.println("KEK FROM COMMAND=DELETE");
                DBManager.deleteTask(Long.parseLong(request.getParameter("currentTaskId")));

                response.sendRedirect("/lec2task2");
            }
        } else response.sendRedirect("/lec2task2");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("command") == null) {
            request.setAttribute("tasksList", DBManager.getAllTasks());
            System.out.println("KEK FROM MAIN");
            request.getRequestDispatcher("/lectures/lecture2/task2/index.jsp").forward(request, response);
        } else if (request.getParameter("command").equals("showDetails")) {
            request.setAttribute("currentTask",
                    DBManager.getTaskById(Long.parseLong(request.getParameter("currentTaskId"))));
            request.getRequestDispatcher("/lectures/lecture2/task2/currentTask.jsp").forward(request, response);

            response.sendRedirect("/lectures/lecture2/task2/currentTask.jsp");
            System.out.println("KEK FROM DETAILS");
        }
    }
}
