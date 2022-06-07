package sprint.sprint2.servlets;

import sprint.sprint2.db.DBManager;
import sprint.sprint2.entities.Language;
import sprint.sprint2.entities.News;
import sprint.sprint2.entities.Publication;
import sprint.sprint2.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class AdminQueryHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("entity") != null) {
            switch (request.getParameter("entity")) {
                case "user" -> {
                    if (request.getParameter("command") != null) {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                DBManager.addUser(new User(
                                        null,
                                        request.getParameter("username"),
                                        request.getParameter("password")
                                ));

                                response.sendRedirect("/sprint2_admin");
                            }
                            case "edit" -> {
                                DBManager.updateUser(new User(
                                        Long.parseLong(request.getParameter("id")),
                                        request.getParameter("username"),
                                        request.getParameter("password")
                                ));

                                response.sendRedirect("/sprint2_admin");
                            }
                            case "delete" -> {
                                DBManager.deleteUser(Long.parseLong(request.getParameter("id")));
                                response.sendRedirect("/sprint2_admin");
                            }
                        }
                    }
                }

                case "language" -> {
                    if (request.getParameter("command") != null) {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                DBManager.addLanguage(new Language(
                                        null,
                                        new String(request.getParameter("lName")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        new String(request.getParameter("lCode")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8)
                                ));

                                response.sendRedirect("/sprint2_admin?entity=languages");
                            }
                            case "edit" -> {
                                DBManager.updateLanguage(new Language(
                                        Long.parseLong(request.getParameter("id")),
                                        request.getParameter("lName"),
                                        request.getParameter("lCode")
                                ));

                                response.sendRedirect("/sprint2_admin?entity=languages");
                            }
                            case "delete" -> {
                                DBManager.deleteLanguage(Long.parseLong(request.getParameter("id")));
                                response.sendRedirect("/sprint2_admin?entity=languages");
                            }
                        }
                    }
                }

                case "publication" -> {
                    if (request.getParameter("command") != null) {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                DBManager.addPublication(new Publication(
                                        null,
                                        request.getParameter("pName"),
                                        request.getParameter("pDesc"),
                                        Double.parseDouble(request.getParameter("pRating"))
                                ));

                                response.sendRedirect("/sprint2_admin?entity=publications");
                            }
                            case "edit" -> {
                                DBManager.updatePublication(new Publication(
                                        Long.parseLong(request.getParameter("id")),
                                        request.getParameter("pName"),
                                        request.getParameter("pDesc"),
                                        Double.parseDouble(request.getParameter("pRating"))
                                ));

                                response.sendRedirect("/sprint2_admin?entity=publications");
                            }
                            case "delete" -> {
                                DBManager.deletePublication(Long.parseLong(request.getParameter("id")));
                                response.sendRedirect("/sprint2_admin?entity=publications");
                            }
                        }
                    }
                }

                case "news" -> {
                    if (request.getParameter("command") != null) {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                DBManager.addNews(new News(
                                        null,
                                        new String(request.getParameter("nTitle")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        new String(request.getParameter("nShort")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        new String(request.getParameter("nContent")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        null,
                                        new String(request.getParameter("nPicUrl")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        Long.parseLong(request.getParameter("nLang")),
                                        DBManager.getLanguageById(Long.parseLong(request.getParameter("nLang")))
                                                .getCode(),
                                        Long.parseLong(request.getParameter("nPub")),
                                        DBManager.getPublicationById(Long.parseLong(request.getParameter("nPub")))
                                                .getPublicationName()
                                ));

                                response.sendRedirect("/sprint2_admin?entity=newsA");
                            }
                            case "edit" -> {
                                DBManager.updateNews(new News(
                                        Long.parseLong(request.getParameter("id")),
                                        new String(request.getParameter("nTitle")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        new String(request.getParameter("nShort")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        new String(request.getParameter("nContent")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        null,
                                        new String(request.getParameter("nPicUrl")
                                                .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                        Long.parseLong(request.getParameter("nLang")),
                                        DBManager.getLanguageById(Long.parseLong(request.getParameter("nLang")))
                                                .getCode(),
                                        Long.parseLong(request.getParameter("nPub")),
                                        DBManager.getPublicationById(Long.parseLong(request.getParameter("nPub")))
                                                .getPublicationName()
                                ));

                                response.sendRedirect("/sprint2_admin?entity=newsA");
                            }
                            case "delete" -> {
                                DBManager.deletePublication(Long.parseLong(request.getParameter("id")));
                                response.sendRedirect("/sprint2_admin?entity=newsA");
                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("entity") != null && request.getParameter("command") == null) {
            switch (request.getParameter("entity")) {
                case "users" -> {
                    request.setAttribute("users", DBManager.getAllUsers());
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/admin_users.jsp")
                            .forward(request, response);
                }
                case "languages" -> {
                    request.setAttribute("languages", DBManager.getAllLanguages());
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/admin_languages.jsp")
                            .forward(request, response);
                }
                case "publications" -> {
                    request.setAttribute("publications", DBManager.getAllPublications());
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/admin_publications.jsp")
                            .forward(request, response);
                }
                case "newsA" -> {
                    request.setAttribute("newsA", DBManager.getAllNews());
                    request.setAttribute("languages", DBManager.getAllLanguages());
                    request.setAttribute("publications", DBManager.getAllPublications());
                    request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/admin_news.jsp")
                            .forward(request, response);
                }
            }
        } else if (request.getParameter("entity") != null && request.getParameter("command") != null) {
            if (request.getParameter("command").equals("details")) {
                switch (request.getParameter("entity")) {
                    case "user" -> {
                        request.setAttribute("entity", "user");
                        request.setAttribute("editObj", DBManager.getUserById(Long.parseLong(request.getParameter("id"))));
                        request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/current.jsp")
                                .forward(request, response);
                    }
                    case "language" -> {
                        request.setAttribute("entity", "language");
                        request.setAttribute("editObj", DBManager.getLanguageById(Long.parseLong(request.getParameter("id"))));
                        request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/current.jsp")
                                .forward(request, response);
                    }
                    case "publication" -> {
                        request.setAttribute("entity", "publication");
                        request.setAttribute("editObj", DBManager.getPublicationById(Long.parseLong(request.getParameter("id"))));
                        request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/current.jsp")
                                .forward(request, response);
                    }
                    case "news" -> {
                        request.setAttribute("entity", "news");
                        request.setAttribute("editObj", DBManager.getNewsById(Long.parseLong(request.getParameter("id"))));
                        request.setAttribute("languages", DBManager.getAllLanguages());
                        request.setAttribute("publications", DBManager.getAllPublications());
                        request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/current.jsp")
                                .forward(request, response);
                    }
                }
            }
        } else {
            request.setAttribute("users", DBManager.getAllUsers());
            request.getRequestDispatcher("./SPRINT/SPRINT_2/admin/admin_users.jsp").forward(request, response);
        }
    }
}
