package lectures.lecture1.additional.servlets.task4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/lec1task4add2")
public class FormHandlerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        double markNumEquivalent = Double.parseDouble(request.getParameter("points"));
        String markCharEquivalent = (markNumEquivalent >= 90 ? "A" :
                markNumEquivalent >= 75 ? "B" : markNumEquivalent >= 60 ? "C" : markNumEquivalent >= 50 ? "D" : "F");

        out.printf("<h1>%s got \"%s\" for exam!</h1>",
                request.getParameter("fullName"), markCharEquivalent);
    }
}
