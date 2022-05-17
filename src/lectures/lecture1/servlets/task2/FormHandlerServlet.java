package lectures.lecture1.servlets.task2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/lec1task2")
public class FormHandlerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().printf(
                "Hello, %s %s %s",
                (Integer.parseInt(request.getParameter("age")) >= 18 ? "Dear " : "Dude "),
                (request.getParameter("gender").equals("male") ? "Mister " : "Miss "),
                request.getParameter("fullName")
        );
    }
}
