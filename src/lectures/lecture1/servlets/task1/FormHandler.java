package lectures.lecture1.servlets.task1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/lec1task1")
public class FormHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String name = request.getParameter("user_name"), surname = request.getParameter("user_surname"),
                food = request.getParameter("user_preferredFood");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.printf("<h1>%s %s has ordered %s</h1>", name, surname, food);
    }
}
