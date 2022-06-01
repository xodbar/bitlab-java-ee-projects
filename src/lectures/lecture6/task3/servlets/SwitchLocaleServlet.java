package lectures.lecture6.task3.servlets;

import lectures.lecture6.task3.locale.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SwitchLocaleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String[] parameters = {"dn", "da", "dc", "dg", "di"};

        switch (request.getParameter("c")) {
            case "sd" -> {
                for (String parameter : parameters) {
                    if (request.getParameter(parameter) != null) {
                        Cookie newParam = new Cookie(parameter, request.getParameter(parameter));
                        newParam.setMaxAge(3600*24*30);

                        System.out.println(request.getParameter(parameter));

                        response.addCookie(newParam);
                    }
                }

                response.sendRedirect("/lec6task3");
            }

            case "dd" -> {
                for (String parameter : parameters) {
                    for (Cookie cookie : request.getCookies()) {
                        if (cookie.getName().equals(parameter)) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }

                response.sendRedirect("/lec6task3");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String[] parameters = {"dn", "da", "dc", "dg", "di"};
        for (String parameter : parameters)
            for (Cookie cookie : request.getCookies()) {
                System.out.println(parameter + " | " + cookie.getName() + " " + cookie.getValue());
                if (cookie.getName().equals(parameter))
                    request.setAttribute(parameter, cookie.getValue());
            }

        if (request.getParameter("locale") != null) {
            request.setAttribute("locale",
                    (request.getParameter("locale").equals("ru") ? Locale.getLocale("ru") : Locale.getLocale("en")));

            request.getRequestDispatcher("./lectures/lecture6/task3/index.jsp").forward(request, response);
        } else {
            request.setAttribute("locale", Locale.getLocale(request.getLocale().getLanguage()));
            response.addCookie(new Cookie("locale", request.getLocale().getLanguage()));
            request.getRequestDispatcher("./lectures/lecture6/task3/index.jsp").forward(request, response);
        }
    }
}
