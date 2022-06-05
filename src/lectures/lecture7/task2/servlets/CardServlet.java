package lectures.lecture7.task2.servlets;

import lectures.lecture7.task2.db.StaticDBManager;
import lectures.lecture7.task2.entities.Card;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CardServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("command") != null) {
            switch (request.getParameter("command")) {
                case "add" -> {
                    if (request.getParameter("id") != null) {
                        if (request.getSession().getAttribute("card") == null)
                            request.getSession().setAttribute("card", new Card());

                        ((Card) request.getSession().getAttribute("card")).
                                addCardItem(StaticDBManager.getItemById(
                                        Long.parseLong(request.getParameter("id"))
                                ));

                        System.out.println("success " + request.getParameter("id"));
                    }

                    response.sendRedirect("/lec7task2");
                }

                case "del" -> {
                    if (request.getSession().getAttribute("card") != null) {
                        if (request.getParameter("id") != null) {
                            ((Card) request.getSession().getAttribute("card")).
                                    removeCardItem(Long.parseLong(request.getParameter("id")));
                            response.sendRedirect("/lec7task2?card=show");
                        }
                    }
                    else response.sendRedirect("/lec7task2");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setAttribute("items", StaticDBManager.getAllItems());

        if (request.getParameter("card") != null) {
            if (request.getParameter("card").equals("show"))
                if (request.getSession().getAttribute("card") != null) {
                    System.out.println("OK " + ((Card) request.getSession().getAttribute("card")).getCard().size());
                    request.getRequestDispatcher("./lectures/lecture7/task2/card.jsp").forward(request, response);
                }
        } else {
            if (request.getSession().getAttribute("card") == null)
                request.getSession().setAttribute("card", new Card());

            request.getRequestDispatcher("./lectures/lecture7/task2/index.jsp").forward(request, response);
        }
    }
}
