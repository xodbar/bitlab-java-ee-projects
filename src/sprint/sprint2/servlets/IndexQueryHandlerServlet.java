package sprint.sprint2.servlets;

import sprint.sprint2.db.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexQueryHandlerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("article") != null) {
            System.out.println("bingo");
            request.removeAttribute("article_error");
            request.setAttribute("article", DBManager.getNewsById(Long.parseLong(request.getParameter("article"))));
            setDefaultAttributes(request);
            request.getRequestDispatcher("./SPRINT/SPRINT_2/article.jsp").forward(request, response);
        } else {
            request.setAttribute("article_error", "Incorrect query");
            response.sendRedirect("/sprint2");
        }
    }

    protected static void setDefaultAttributes(HttpServletRequest request) {
        request.setAttribute("languages", DBManager.getAllLanguages());
        request.setAttribute("publications", DBManager.getAllPublications());

        if (request.getParameter("filter") == null || request.getParameter("filter").equals("none"))
            request.setAttribute("news", DBManager.getAllNews());
    }
}
