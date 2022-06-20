package big_project.servlets.main;

import big_project.db.DBManager;
import big_project.entities.Post;
import big_project.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

public class PostHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        setDefaultAttributes(request);
        if (request.getSession().getAttribute("currentUser") != null) {
            if (request.getParameter("title") != null && request.getParameter("content") != null
                    && request.getParameter("payment") != null && request.getParameter("deadline") != null
                    && request.getParameter("field") != null) {
                DBManager.addPost(new Post(
                        null, ((User) request.getSession().getAttribute("currentUser")),
                        new Timestamp((new Date()).getTime()), Double.parseDouble(request.getParameter("payment")),
                        Timestamp.valueOf((request.getParameter("deadline") + ":00").replace("T"," ")),
                        request.getParameter("title"),
                        request.getParameter("content"), request.getParameter("field")
                ));
            } else request.setAttribute("postError", "Incorrect input data");
        } else request.setAttribute("postError", "Access error. You have to login first");

        response.sendRedirect("/freelancex");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        setDefaultAttributes(request);
        if (request.getSession().getAttribute("postError") != null)
            request.getSession().removeAttribute("postError");

        if (request.getParameter("command") != null) {
            if (request.getParameter("command").equals("show")) {
                if (request.getParameter("id")!=null) {
                    request.setAttribute("post",
                            DBManager.getPostById(Long.parseLong(request.getParameter("id"))));
                    request.setAttribute("comments",
                            DBManager.getAllCommentsForPost(Long.parseLong(request.getParameter("id"))));
                    request.getRequestDispatcher("/big_project/public/post.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("postError", "Incorrect command");
                    response.sendRedirect("/freelancex");
                }
            } else if (request.getParameter("command").equals("filter")) {
                if (DBManager.getPostsByField(request.getParameter("field")).size() > 0) {
                    request.setAttribute("posts", DBManager.getPostsByField(request.getParameter("field")));
                    request.getRequestDispatcher("/big_project/public/index.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("postError", "Incorrect field");
                    response.sendRedirect("/freelancex");
                }
            } else {
                request.getSession().setAttribute("postError", "Incorrect query");
                response.sendRedirect("/freelancex");
            }
        } else {
            if (request.getParameter("search") != null) {
                request.setAttribute("posts", DBManager.getPostByTitle(request.getParameter("search")));
            } else request.setAttribute("posts", DBManager.getAllPosts());

            boolean authorized = false;
            Cookie authCookie = null;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("currentUser")) {
                    authorized = true;
                    authCookie = cookie;
                    break;
                }
            }

            if (authorized)
                request.getSession().setAttribute("currentUser", DBManager.getUserByUsername(authCookie.getValue()));

            request.getRequestDispatcher("/big_project/public/index.jsp").forward(request, response);
        }
    }

    public static void setDefaultAttributes(HttpServletRequest request) {
        request.setAttribute("fields", DBManager.getAllFields());
    }
}
