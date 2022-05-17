package lectures.lecture1.servlets.task3;

import lectures.lecture1.servlets.task3.db.DBManager;
import lectures.lecture1.servlets.task3.db.Footballer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/lec1task3list")
public class ListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        ArrayList<Footballer> footballers = DBManager.getFootballers();
        PrintWriter out = response.getWriter();

        out.print("""
                <html>
                <head>
                    <title>Task 1.2 | Java EE</title>
                    <link rel="stylesheet" href="../../../css/general.css">
                    <script src="https://kit.fontawesome.com/145e892520.js" crossorigin="anonymous"></script>
                                
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                                
                    <style>
                        form {
                            width: 30%;
                            margin: auto;
                        }
                    </style>
                </head>
                <body>
                <header>
                    <div class="header">
                        <div class="logo">
                            <h1>Java EE Projects</h1>
                        </div>
                        <nav>
                            <ul class="nav_links">
                                <li><a href="#">Navigation <i class="fa-solid fa-map-location-dot"></i></a></li>
                                <li><a href="#">GitHub <i class="fa-brands fa-github"></i></a></li>
                                <li><a href="#">Next Task <i class="fa-solid fa-forward-step"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
                <main>
                    <div class="wrapper">
                        <table class="table">
                          <thead class="thead-dark">
                            <tr>
                              <th scope="col">ID</th>
                              <th scope="col">Name</th>
                              <th scope="col">Surname</th>
                              <th scope="col">Salary</th>
                              <th scope="col">Club</th>
                              <th scope="col">Transfer Price</th>
                            </tr>
                          </thead>
                          <tbody>
                """);
        for (Footballer footballer : footballers)
            out.printf("""
                    <tr>
                        <td scope="row">%d</td>
                        <td scope="row">%s</td>
                        <td scope="row">%s</td>
                        <td scope="row">%d</td>
                        <td scope="row">%s</td>
                        <td scope="row">%d</td>
                    </tr>
                    """, footballer.getId(), footballer.getName(), footballer.getSurname(),
                    footballer.getSalary(), footballer.getClub(), footballer.getTransferPrice());
        out.print("""
                </tbody></table></div></main></body></html>""");
    }
}
