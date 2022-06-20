package lectures.lecture1.additional.servlets.task3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/lec1task3add1")
public class FormGeneratorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("""
                <fieldset>
                <form action="/lec1task3add2" method="post">
                <label>NAME:</label>
                <input type="text" name="name">
                <br>
                <label>SURNAME:</label>
                <input type="text" name="surname">
                <br>
                <button type="submit">Send</button>
                </form>
                </fieldset>
                """);
    }
}
