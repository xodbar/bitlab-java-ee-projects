package sprint.sprint2.servlets;

import sprint.sprint2.db.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NewsFilterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("filter") != null) {
            switch (request.getParameter("filter")) {
                case "lang" -> {
                    request.removeAttribute("filter_error");

                    if (request.getParameter("lang") != null) {
                        request.setAttribute("news", DBManager.getNewsByLanguage(request.getParameter("lang")));

                        Cookie cookie = new Cookie("filter_lang", request.getParameter("lang"));
                        cookie.setMaxAge(24*30*12);
                        response.addCookie(cookie);

                        request.setAttribute("filter_lang", DBManager.getLanguageByCode("lang".toUpperCase()).getCode());
                    }
                    else request.setAttribute("filter_error", "Incorrect news language.");

                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }

                case "pub" -> {
                    request.removeAttribute("filter_error");

                    if (request.getParameter("pub") != null) {
                        request.setAttribute("news",
                                DBManager.getNewsByPublication(request.getParameter("pub")));
                        request.setAttribute("filter_pub",
                                DBManager.getPublicationByName(request.getParameter("pub")));
                    } else request.setAttribute("filter_error", "Incorrect publication name.");

                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }

                case "none" -> {
                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.removeAttribute("filter_lang");
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }

                default -> {
                    request.setAttribute("filter_error", "Incorrect filter parameter");
                    request.removeAttribute("filter_lang");
                    IndexQueryHandlerServlet.setDefaultAttributes(request);
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
                }
            }
        } else {
            request.setAttribute("languages", DBManager.getAllLanguages());
            request.setAttribute("publications", DBManager.getAllPublications());
            IndexQueryHandlerServlet.setDefaultAttributes(request);

            for (Cookie cookie : request.getCookies())
                if (cookie.getName().equals("current_user"))
                    request.getSession().setAttribute("current_user",
                            DBManager.getUserById(Long.parseLong(cookie.getValue())));

            boolean hasLangFilCookie = false;
            Cookie langFilCookie = new Cookie("temp", "kek");

            for (Cookie cookie : request.getCookies())
                if (cookie.getName().equals("filter_lang")) {
                    hasLangFilCookie = true;
                    langFilCookie = cookie;
                }

            if (hasLangFilCookie) {
                request.removeAttribute("filter_error");
                System.out.println("CHECK: " + langFilCookie.getName() + " " + langFilCookie.getValue());

                request.setAttribute("news", DBManager.getNewsByLanguage(langFilCookie.getValue()));
                request.setAttribute("filter_lang", langFilCookie.getValue());
            } else request.setAttribute("news", DBManager.getAllNews());

            request.getRequestDispatcher("./SPRINT/SPRINT_2/index.jsp").forward(request, response);
        }
    }
}
