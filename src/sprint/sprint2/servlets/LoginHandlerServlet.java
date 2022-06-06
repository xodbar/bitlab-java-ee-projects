package sprint.sprint2.servlets;

import sprint.sprint2.db.DBManager;
import sprint.sprint2.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginHandlerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("log") != null) {
            switch (request.getParameter("log")) {
                case "in" -> {
                    boolean success = false;

                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    request.removeAttribute("login_error");

                    System.out.println("WOOOW");

                    for (User user : DBManager.getAllUsers()) {
                        if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                            success = true;
                            request.getSession().setAttribute("current_user", DBManager.getUserByUsername(username));
                            response.addCookie(new Cookie("current_user", String.valueOf(user.getUserId())));

                            break;
                        }
                    }

                    if (!success)
                        request.setAttribute("login_error", "Incorrect username or password.");

                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }

                case "up" -> {
                    request.removeAttribute("login_error");

                    String username = request.getParameter("username"),
                            password = request.getParameter("password"),
                            repeatPassword = request.getParameter("repeat_password");

                    if (validateNewUser(username, password, repeatPassword)) {
                        DBManager.addUser(new User(null, username, password));
                        request.getSession().setAttribute("current_user", DBManager.getUserByUsername(username));

                        if (request.getParameter("remember").equals("remember"))
                            response.addCookie(new Cookie("current_user",
                                    String.valueOf(DBManager.getUserByUsername(username).getUserId())));
                    } else request.setAttribute("login_error", "Incorrect sign up data: username already exists " +
                            "or passwords aren't same.");

                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }

                case "out" -> {
                    request.removeAttribute("login_error");

                    if (request.getSession().getAttribute("current_user") != null)
                        request.getSession().removeAttribute("current_user");

                    Cookie temp = new Cookie("current_user", "");
                    temp.setMaxAge(0);
                    response.addCookie(temp);

                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }
            }
        }
    }

    public static boolean validateNewUser(String username, String password, String repeat) {
        boolean result = false;

        if (!username.isEmpty() && !password.isEmpty() && !repeat.isEmpty()) {
            if (password.equals(repeat)) {
                for (User user : DBManager.getAllUsers()) {
                    if (user.getUsername().equals(username)) {
                        result = false;
                        break;
                    } else result = true;
                }
            }
        }

        return result;
    }
}
