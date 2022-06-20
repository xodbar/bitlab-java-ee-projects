package lectures.lecture1.additional.servlets.task4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/lec1task4add1")
public class FormGeneratorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("""
                <fieldset>
                <form action="/lec1task4add2" method="post">
                <label>FULL NAME:</label>
                <input type="text" name="fullName">
                <br>
                <label>POINTS:</label>
                <input type="number" name="points" min=0 max=100>
                <br>
                <button type="submit">Send</button>
                </form>
                </fieldset>
                """);
    }
}
