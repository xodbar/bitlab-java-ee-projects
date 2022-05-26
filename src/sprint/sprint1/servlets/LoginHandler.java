package sprint.sprint1.servlets;

import sprint.sprint1.db.DBManager;
import sprint.sprint1.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getSession(true);
        HttpSession session = request.getSession();

        if ("1".equals(request.getParameter("command"))) {
            if (UserQueryHandler.validateEmail(request.getParameter("new_user_email"))) {
                UserQueryHandler.userPostOperations(request, response);
                session.setAttribute("current_user", DBManager.getUserByEmail(
                        request.getParameter("new_user_email")
                ));
                response.sendRedirect("./SPRINT/SPRINT_1/profile.jsp");
            } else {
                session.setAttribute("loginError", "An account with this email is already exists!" +
                        " Try sign up again.");
                request.getRequestDispatcher("/sprint1").forward(request, response);
            }
        } else {
            response.sendRedirect("/404");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getSession(true);
        HttpSession session = request.getSession();

        if (request.getParameter("command") == null) {
            boolean successfullyLoggedIn = false;

            for (User user : DBManager.getAllUsers()) {
                if (request.getParameter("email").equals(user.getEmail()) &&
                        request.getParameter("password").equals(user.getPassword())) {
                    session.setAttribute("current_user", user);
                    successfullyLoggedIn = true;
                    break;
                }
            }

            if (successfullyLoggedIn) {
                if (session.getAttribute("loginError") != null)
                    session.removeAttribute("loginError");
                response.sendRedirect("/sprint1_profile?command=details");
            } else {
                session.setAttribute("loginError", "Incorrect login or password!" +
                        " Try sign in again.");
                request.getRequestDispatcher("/sprint1").forward(request, response);
            }
        } else {
            if ("details".equals(request.getParameter("command"))) {
                request.getRequestDispatcher("./SPRINT/SPRINT_1/profile.jsp").forward(request, response);
            } else if ("logout".equals(request.getParameter("command"))) {
                if (session.getAttribute("current_user") != null) {
                    session.removeAttribute("current_user");
                    response.sendRedirect("/sprint1");
                } else response.sendRedirect("/404");
            } else {
                response.sendRedirect("/404");
            }
        }
    }
}
