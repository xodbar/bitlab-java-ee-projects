package lectures.lecture7.task3.servlets;

import lectures.lecture7.task3.db.StaticDBManager;
import lectures.lecture7.task3.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginHandlerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("action") != null) {
            switch (request.getParameter("action")) {
                case "login" -> {
                    String username = request.getParameter("username"),
                            password = request.getParameter("password");

                    boolean loggedIn = false;
                    for (User user : StaticDBManager.getAllUsers()) {
                        if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                            loggedIn = true;
                            break;
                        }
                    }

                    if (loggedIn) {
                        request.getSession().setAttribute("current_user", new User(
                                StaticDBManager.getAllUsers().size()+1L, username, password
                        ));
                        request.removeAttribute("login_error");
                        request.getRequestDispatcher("./lectures/lecture7/task3/profile.jsp").
                                forward(request, response);
                    } else {
                        request.setAttribute("login_error", "Incorrect login or password.");
                        System.out.println("not found");
                        request.getRequestDispatcher("./lectures/lecture7/task3/index.jsp").
                                forward(request, response);
                    }
                }

                case "logout" -> {
                    if (request.getSession().getAttribute("current_user") != null) {
                        request.getSession().removeAttribute("current_user");
                        request.removeAttribute("login_error");
                        response.sendRedirect("/lec7task3");
                    } else {
                        request.setAttribute("login_error", "you haven't authorized yet.");
                        request.getRequestDispatcher("./lectures/lecture7/task3/index.jsp").
                                forward(request, response);
                    }
                }

                default -> {
                    request.setAttribute("login_error", "Unknown action, try again.");
                    request.getRequestDispatcher("./lectures/lecture7/task3/index.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("page") != null) {
            if (request.getParameter("page").equals("profile"))
                request.getRequestDispatcher("./lectures/lecture7/task3/profile.jsp").forward(request, response);
            else request.getRequestDispatcher("./lectures/lecture7/task3/index.jsp").forward(request, response);
        } else {
            System.out.println("KEK");
            request.getRequestDispatcher("./lectures/lecture7/task3/index.jsp").forward(request, response);
        }
    }
}
