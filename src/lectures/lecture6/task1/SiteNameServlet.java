package lectures.lecture6.task1;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class SiteNameServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        switch (request.getParameter("command")) {
            case "set" -> {
                try {
                    request.removeAttribute("cookie_error");
                    request.removeAttribute("site_name");

                    Cookie newName = new Cookie("site_name",
                            URLEncoder.encode(request.getParameter("new_site_name"), StandardCharsets.UTF_8));
                    response.addCookie(newName);

                    response.sendRedirect("/lec6task1");
                } catch (Exception e) {
                    request.setAttribute("cookie_error", e.getMessage());
                    response.sendRedirect("/lec6task1");
                }
            }

            case "delete" -> {
                try {
                    request.removeAttribute("cookie_error");
                    request.removeAttribute("site_name");

                    for (Cookie cookie : request.getCookies()) {
                        if (cookie.getName().equals("site_name")) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            break;
                        }
                    }

                    response.sendRedirect("/lec6task1");
                } catch (Exception e) {
                    request.setAttribute("cookie_error", e.getMessage());
                    response.sendRedirect("/lec6task1");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("site_name")) {
                    request.setAttribute("site_name",
                            URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8));
                    break;
                }
            }

            request.getRequestDispatcher("./lectures/lecture6/task1/index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("cookie_error", e.getMessage());
            request.getRequestDispatcher("./lectures/lecture6/task1/index.jsp").forward(request, response);
        }
    }


    /*private HashMap<String, String> getCookies(HttpServletRequest request) {
        try {
            HashMap<String, String> cookies = new HashMap<>();

            for (Cookie cookie : request.getCookies())
                cookies.put(cookie.getName(), cookie.getValue());

            return cookies;
        } catch (NullPointerException e) {
            request.setAttribute("cookie_error", e.getMessage());
            return null;
        }
    }*/
}
