package lectures.lecture6.task2;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Objects;

public class FormDraftServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String[] attributeNames = {"draft_name", "draft_surname", "draft_age", "draft_country", "draft_gender",
                "draft_card"};

        switch (request.getParameter("command")) {
            case "set" -> {
                for (String attribute : attributeNames) {
                    if (request.getParameter(attribute) != null) {
                        Cookie newCookie = new Cookie(attribute, request.getParameter(attribute));
                        newCookie.setMaxAge(3600*24*30);
                        response.addCookie(newCookie);

                        request.removeAttribute(attribute);
                    }
                }

                response.sendRedirect("/lec6task2");
            }

            case "delete" -> {
                for (String attribute : attributeNames)
                    request.removeAttribute(attribute);

                for (Cookie cookie : request.getCookies()) {
                    for (String name : attributeNames) {
                        if (cookie.getName().equals(name)) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            break;
                        }
                    }
                }

                response.sendRedirect("/lec6task2");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            Objects.requireNonNull(getCookies(request)).forEach(request::setAttribute);
            request.removeAttribute("cookie_error");
            request.getRequestDispatcher("./lectures/lecture6/task2/index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("cookie_error", e.getMessage());
            request.getRequestDispatcher("./lectures/lecture6/task2/index.jsp").forward(request, response);
        }
    }

    private HashMap<String, String> getCookies(HttpServletRequest request) {
        try {
            HashMap<String, String> cookies = new HashMap<>();

            for (Cookie cookie : request.getCookies())
                cookies.put(cookie.getName(), cookie.getValue());

            return cookies;
        } catch (Exception e) {
            request.setAttribute("cookie_error", e.getMessage());
            return null;
        }
    }
}
