package big_project.servlets.main;

import big_project.db.DBManager;
import big_project.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static big_project.servlets.main.PostHandler.setDefaultAttributes;

public class ProfileChangesHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("newUsername") != null && request.getParameter("newPassword") != null
                && request.getParameter("newPhone") != null && request.getParameter("newAvatar") != null) {
            DBManager.updateUser(new User(
                    ((User) request.getSession().getAttribute("currentUser")).getId(),
                    request.getParameter("newUsername"),
                    request.getParameter("newPassword"),
                    request.getParameter("newPhone"),
                    false,
                    request.getParameter("newAvatar")
            ));

            request.getSession().setAttribute("currentUser", DBManager.
                    getUserByUsername(request.getParameter("newUsername")));

            Cookie cookie = new Cookie("currentUser",
                    ((User) request.getSession().getAttribute("currentUser")).getUsername());
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);

            response.sendRedirect("/freelancex");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("currentUser") != null) {
            setDefaultAttributes(request);
            System.out.println("HALO");
            request.getRequestDispatcher("/big_project/public/profile.jsp").forward(request, response);
        } else response.sendRedirect("/freelancex");
    }
}
