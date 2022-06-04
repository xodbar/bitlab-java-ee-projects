package lectures.lecture7.task1;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SessionFormHandlerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("clear")
                    && (int) request.getSession().getAttribute("step") == 4) {
                request.getSession().removeAttribute("current_name");
                request.getSession().removeAttribute("current_surname");
                request.getSession().removeAttribute("current_age");
                request.getSession().removeAttribute("current_city");
                request.getSession().removeAttribute("current_address");
                request.getSession().removeAttribute("current_phone");
                request.getSession().removeAttribute("current_university");
                request.getSession().removeAttribute("current_faculty");
                request.getSession().removeAttribute("current_group");

                request.getSession().removeAttribute("step");
                response.sendRedirect("/lec7task1");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("ns") != null) {
            switch (request.getParameter("ns")) {
                case "2" -> {
                    request.getSession().setAttribute("current_name", request.getParameter("name"));
                    request.getSession().setAttribute("current_surname", request.getParameter("surname"));
                    request.getSession().setAttribute("current_age", request.getParameter("age"));

                    System.out.println(request.getSession().getAttribute("current_name") + " " +
                            request.getSession().getAttribute("current_surname") + " " +
                            request.getSession().getAttribute("current_age"));

                    request.getSession().setAttribute("step", 2);
                    request.getRequestDispatcher("./lectures/lecture7/task1/step2.jsp").forward(request, response);
                }
                case "3" -> {
                    request.getSession().setAttribute("current_city", request.getParameter("city"));
                    request.getSession().setAttribute("current_address", request.getParameter("address"));
                    request.getSession().setAttribute("current_phone", request.getParameter("phone"));

                    System.out.println(request.getSession().getAttribute("current_city") + " " +
                            request.getSession().getAttribute("current_address") + " " +
                            request.getSession().getAttribute("current_phone"));

                    request.getSession().setAttribute("step", 3);
                    request.getRequestDispatcher("./lectures/lecture7/task1/step3.jsp").forward(request, response);
                }
                case "4" -> {
                    request.getSession().setAttribute("current_university", request.getParameter("university"));
                    request.getSession().setAttribute("current_faculty", request.getParameter("faculty"));
                    request.getSession().setAttribute("current_group", request.getParameter("group"));

                    System.out.println(request.getSession().getAttribute("current_university") + " " +
                            request.getSession().getAttribute("current_faculty") + " " +
                            request.getSession().getAttribute("current_group"));

                    request.getSession().setAttribute("step", 4);
                    request.getRequestDispatcher("./lectures/lecture7/task1/result.jsp").forward(request, response);
                }
            }
        } else {
            request.getSession().setAttribute("step", 1);
            request.getRequestDispatcher("./lectures/lecture7/task1/index.jsp").forward(request, response);
        }
    }
}
