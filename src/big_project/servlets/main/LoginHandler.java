package big_project.servlets.main;

import big_project.db.DBManager;
import big_project.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("command") != null) {
            switch (request.getParameter("command")) {
                case "up" -> {
                    if (request.getParameter("username") != null && request.getParameter("password") != null
                            && request.getParameter("phone") != null) {
                        if (accountIsAvailable(request.getParameter("username"), request.getParameter("phone"))) {
                            DBManager.addUser(new User(
                                    null, request.getParameter("username"), request.getParameter("password"),
                                    request.getParameter("phone"), false, (request.getParameter("avatar") != null ?
                                    request.getParameter("avatar") : "https://cdn-icons-png.flaticon.com/512/149/149071.png")
                            ));

                            request.getSession().setAttribute("currentUser",
                                    DBManager.getUserByUsername(request.getParameter("username")));
                        } else request.getSession().setAttribute("loginError", "This username or phone is already taken");

                        if (request.getSession().getAttribute("currentUser") != null) {
                            Cookie cookie = new Cookie("currentUser",
                                    ((User) request.getSession().getAttribute("currentUser")).getUsername());
                            cookie.setMaxAge(24*30);
                            response.addCookie(cookie);
                        }

                        response.sendRedirect("/freelancex");
                    } else {
                        request.getSession().setAttribute("loginError", "Incorrect input data");
                        response.sendRedirect("/freelancex");
                    }
                }

                case "out" -> {
                    if (request.getSession().getAttribute("currentUser") != null) {
                        request.getSession().removeAttribute("currentUser");

                        Cookie cookie = new Cookie("currentUser", "None");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);

                        response.sendRedirect("/freelancex");
                    } else {
                        request.getSession().setAttribute("loginError", "You haven't authorized to log out");
                        response.sendRedirect("/freelancex");
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getSession().getAttribute("loginError") != null)
            request.getSession().removeAttribute("loginError");

        if (request.getParameter("username") != null && request.getParameter("password") != null) {
            if (DBManager.getUserByUsername(request.getParameter("username")) != null) {
                if (DBManager.getUserByUsername(request.getParameter("username")).getPhoneNumber() != null) {
                    if (request.getParameter("password").equals(DBManager.
                            getUserByUsername(request.getParameter("username")).getPassword()))
                        request.getSession().setAttribute("currentUser", DBManager.
                                getUserByUsername(request.getParameter("username")));
                    else request.getSession().setAttribute("loginError", "Incorrect password");
                } else request.getSession().setAttribute("loginError", "Incorrect login");

                if (request.getSession().getAttribute("currentUser") != null) {
                    Cookie cookie = new Cookie("currentUser",
                            ((User) request.getSession().getAttribute("currentUser")).getUsername());
                    cookie.setMaxAge(3600*24*30);
                    response.addCookie(cookie);
                }
            } else request.getSession().setAttribute("loginError", "No such user");
        } else request.getSession().setAttribute("loginError", "Incorrect input data");

        response.sendRedirect("/freelancex");
    }

    public static boolean accountIsAvailable(String username, String phone) {
        for (User user : DBManager.getAllUsers())
            if (user.getUsername().equals(username) || user.getPhoneNumber().equals(phone))
                return false;

        return true;
    }
}
