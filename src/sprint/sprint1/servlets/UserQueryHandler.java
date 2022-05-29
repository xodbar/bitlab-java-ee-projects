package sprint.sprint1.servlets;

import sprint.sprint1.db.DBManager;
import sprint.sprint1.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserQueryHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        userPostOperations(request, response);
    }

    static void userPostOperations(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
            switch (request.getParameter("command")) {
            case "1" -> {
                if (validateEmail(request.getParameter("new_user_email"))) {
                    DBManager.addUser(new User(
                            null,
                            request.getParameter("new_user_email"),
                            request.getParameter("new_user_password"),
                            request.getParameter("new_user_fullName")
                    ));

                    if (request.getSession().getAttribute("current_user") != null) {
                        if (((User) request.getSession().getAttribute("current_user")).getUserId().
                                equals(DBManager.getUserById(1L).getUserId())) {
                            try {
                                request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/manage_users.jsp")
                                        .forward(request, response);
                            } catch (ServletException e) {
                                e.printStackTrace();
                                response.sendRedirect("/404");
                            }
                        }
                    }
                } else {
                    response.getWriter().println("""
                        <script>
                            alert('User with this email is already exists, enter other email!');
                        </script>""");
                    response.sendRedirect("./sprint1");
                }
            }
            case "2" -> {
                if (validateEmail(request.getParameter("edit_user_email"),
                        DBManager.getUserById(Long.parseLong(request.getParameter("current_id"))).getEmail())) {
                    DBManager.updateUser(new User(
                            Long.parseLong(request.getParameter("edit_user_id")),
                            request.getParameter("edit_user_email"),
                            request.getParameter("edit_user_password"),
                            request.getParameter("edit_user_fullName")
                    ));

                    if (request.getSession() != null) {
                        if (request.getSession().getAttribute("current_user") != null) {
                            if (((User) request.getSession().getAttribute("current_user")).getUserId().equals(1L)) {
                                response.sendRedirect("/sprint1_admin?entity=users");
                            } else {
                                response.sendRedirect("/404");
                            }
                        } else {
                            request.getSession().setAttribute("current_user",
                                    DBManager.getUserById(Long.parseLong(request.getParameter("current_id"))));

                            response.sendRedirect("/sprint1");
                        }
                    } else {
                        request.getSession().setAttribute("current_user",
                                DBManager.getUserById(Long.parseLong(request.getParameter("current_id"))));

                        response.sendRedirect("/sprint1");
                    }
                } else {
                    response.getWriter().println("""
                        <script>
                            alert('User with this email is already exists, enter other email!');
                        </script>""");
                    response.sendRedirect("/sprint1");
                }
            }
            case "3" -> {
                if (request.getParameter("current_id") != null) {
                    if (request.getParameter("current_id").equals(request.getParameter("delete_user_id"))) {
                        request.getSession().removeAttribute("current_user");
                        DBManager.deleteUser(Long.parseLong(request.getParameter("delete_user_id")));
                        response.sendRedirect("/sprint1");
                    } else {
                        DBManager.deleteUser(Long.parseLong(request.getParameter("delete_user_id")));
                        response.sendRedirect("/sprint1_admin?entity=users");
                    }
                } else response.sendRedirect("/404");
            }
            default -> response.sendRedirect("/404");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("command") != null && !request.getParameter("command").isEmpty()) {
            if (request.getParameter("command").equals("1")) {
                request.setAttribute("user",
                        DBManager.getUserById(Long.parseLong(request.getParameter("user_id"))));
                request.getRequestDispatcher("./SPRINT/SPRINT_1/profile.jsp").forward(request, response);
            } else response.sendRedirect("/404");
        } else getItemsPage(request, response);
    }

    static void getItemsPage(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        request.setAttribute("items", DBManager.getAllItems());
        request.getRequestDispatcher("./SPRINT/SPRINT_1/index.jsp").forward(request, response);
    }

    static boolean validateEmail(String input) {
        boolean result = true;

        for (User user : DBManager.getAllUsers())
            if (user.getEmail().equals(input)) {
                result = false;
                break;
            }

        return result;
    }

    static boolean validateEmail(String input, String currentEmail) {
        boolean result = true;

        for (User user : DBManager.getAllUsers()) {
            if (!user.getEmail().equals(currentEmail)) {
                if (user.getEmail().equals(input)) {
                    result = false;
                    break;
                }
            }
        }

        return result;
    }
}
