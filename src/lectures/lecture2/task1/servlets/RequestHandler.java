package lectures.lecture2.task1.servlets;

import lectures.lecture2.task1.db.DBManager;
import lectures.lecture2.task1.entities.NewsArticle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class RequestHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (!request.getParameter("newArticle_title").isEmpty()
                && !request.getParameter("newArticle_details").isEmpty()
                && !request.getParameter("newArticle_author").isEmpty()) {
            DBManager.addArticle(new NewsArticle(
                    request.getParameter("newArticle_title"),
                    request.getParameter("newArticle_details"),
                    request.getParameter("newArticle_author"),
                    request.getParameter("newArticle_category")
            ));

            response.sendRedirect("/lec2task1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        ArrayList<NewsArticle> articles = new ArrayList<>();

        if (request.getParameter("category") != null) {
            if (!request.getParameter("category").isEmpty()) {
                String filter = request.getParameter("category");

                for (NewsArticle article : DBManager.getArticles())
                    if (article.getCategory().equalsIgnoreCase(filter))
                        articles.add(article);
            } else articles = DBManager.getArticles();
        } else articles = DBManager.getArticles();

        request.setAttribute("articlesList", articles);
        request.getRequestDispatcher("/lectures/lecture2/task1/index.jsp").forward(request, response);
    }
}
