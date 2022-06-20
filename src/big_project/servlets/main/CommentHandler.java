package big_project.servlets.main;

import big_project.db.DBManager;
import big_project.entities.Comment;
import big_project.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommentHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getSession().getAttribute("commentError") != null)
            request.getSession().removeAttribute("commentError");

        if (request.getSession().getAttribute("currentUser") != null) {
            if (request.getParameter("content") != null && request.getParameter("postId") != null) {
                if (request.getParameter("command") != null) {
                    if (request.getParameter("command").equals("add")) {
                        DBManager.addComment(new Comment(
                                null, Long.parseLong(request.getParameter("postId")),
                                ((User) request.getSession().getAttribute("currentUser")),
                                null, request.getParameter("content"), false
                        ));

                        response.sendRedirect("/freelancex?command=show&id=" + request.getParameter("postId"));
                    } else if (request.getParameter("command").equals("update")) {
                        DBManager.updateComment(new Comment(
                                null, Long.parseLong(request.getParameter("post_id")),
                                ((User) request.getSession().getAttribute("currentUser")),
                                null, request.getParameter("content"), false
                        ));

                        response.sendRedirect("/freelancex?command=show&id=" + request.getParameter("postId"));
                    } else if (request.getParameter("command").equals("delete")) {
                        DBManager.deleteComment(Long.parseLong(request.getParameter("commentId")));

                        response.sendRedirect("/freelancex?command=show&id=" + request.getParameter("postId"));
                    } else {
                        request.getSession().setAttribute("commentError", "Incorrect command");
                        response.sendRedirect("/freelancex");
                    }
                }
            } else {
                request.getSession().setAttribute("commentError", "Incorrect comment or post id");
                response.sendRedirect("/freelancex");
            }
        } else {
            request.getSession().setAttribute("commentError", "Access error. You have to login first");
            response.sendRedirect("/freelancex");
        }
    }
}
