package lectures.lecture1.servlets.task3;

import lectures.lecture1.servlets.task3.db.DBManager;
import lectures.lecture1.servlets.task3.db.Footballer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/lec1task3")
public class FormHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String name = request.getParameter("newFootballerName"),
                surname = request.getParameter("newFootballerSurname"),
                club = request.getParameter("newFootballerClub");
        int salary = Integer.parseInt(request.getParameter("newFootballerSalary")),
                transferPrice = Integer.parseInt(request.getParameter("newFootballerTransferPrice"));

        DBManager.addFootballer(new Footballer(DBManager.getId(), name, surname, salary, club, transferPrice));
        response.sendRedirect("/lec1task3list");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }
}
