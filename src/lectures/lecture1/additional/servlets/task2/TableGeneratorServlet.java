package lectures.lecture1.additional.servlets.task2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class TableGeneratorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        ArrayList<Employee> employees = new ArrayList<>();
        employees.add(new Employee(
                "Iliyas", "Zhuanyshev", "IT", 550000
        ));
        employees.add(new Employee(
                "Zhandos", "Yessengaziev", "IT", 500000
        ));
        employees.add(new Employee(
                "Other", "User", "PM", 350000
        ));
        employees.add(new Employee(
                "Test", "Test", "BA", 150000
        ));

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println(
                """
                        <table>
                        <thead>
                        <tr>
                        <th>NAME</th>
                        <th>SURNAME</th>
                        <th>DEPARTMENT</th>
                        <th>SALARY</th>
                        </tr>
                        </thead>
                        <tbody>
                        """
        );

        for (Employee employee : employees)
            out.printf(
                    """
                            <tr>
                            <td>%s</td>
                            <td>%s</td>
                            <td>%s</td>
                            <td>%d</td>
                            </tr>
                            """,
                    employee.getName(), employee.getSurname(), employee.getDepartment(), employee.getSalary()
            );
    }
}
