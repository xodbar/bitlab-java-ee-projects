package sprint.sprint1.servlets;

import sprint.sprint1.db.DBManager;
import sprint.sprint1.entities.Item;
import sprint.sprint1.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminQueryHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getSession() != null) {
            if (request.getSession().getAttribute("current_user") != null) {
                if (((User) request.getSession().getAttribute("current_user")).
                        getEmail().equals(DBManager.getUserById(1L).getEmail())) {
                    switch (request.getParameter("entity")) {
                        case "user" -> UserQueryHandler.userPostOperations(request, response);
                        case "item" -> {
                            switch (request.getParameter("command")) {
                                case "1" -> {
                                    DBManager.addItem(new Item(
                                            null,
                                            request.getParameter("new_item_name"),
                                            request.getParameter("new_item_description"),
                                            Double.parseDouble(request.getParameter("new_item_price")),
                                            Long.parseLong(request.getParameter("new_item_brand_id")),
                                            DBManager.getBrandById(
                                                            Long.parseLong(request.getParameter("new_item_brand_id"))).
                                                    getBrandName()
                                    ));

                                    if (((User) request.getSession().getAttribute("current_user")).getUserId().
                                            equals(DBManager.getUserById(1L).getUserId())) {
                                        try {
                                            request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/manage_items.jsp")
                                                    .forward(request, response);
                                        } catch (ServletException e) {
                                            e.printStackTrace();
                                            response.sendRedirect("/404");
                                        }
                                    }
                                }
                                case "2" -> {

                                    if (((User) request.getSession().getAttribute("current_user")).getEmail().equals(
                                                    DBManager.getUserById(1L).getEmail()
                                    )) {
                                        DBManager.updateItem(new Item(
                                                Long.parseLong(request.getParameter("edit_item_id")),
                                                request.getParameter("edit_item_name"),
                                                request.getParameter("edit_item_description"),
                                                Double.parseDouble(request.getParameter("edit_item_price")),
                                                Long.parseLong(request.getParameter("edit_item_brand_id")),
                                                DBManager.getBrandById(
                                                                Long.parseLong
                                                                        (request.getParameter("edit_item_brand_id"))).
                                                        getBrandName()
                                        ));

                                        if (request.getSession() != null) {
                                            if (request.getSession().getAttribute("current_user") != null) {
                                                if (((User) request.getSession().getAttribute("current_user")).getUserId().equals(1L)) {
                                                    response.sendRedirect("/sprint1_admin?entity=items");
                                                } else {
                                                    response.sendRedirect("/404");
                                                }
                                            } else {
                                                request.getSession().setAttribute("current_user",
                                                        DBManager.getUserById(Long.parseLong(request.
                                                                getParameter("current_id"))));

                                                response.sendRedirect("/sprint1");
                                            }
                                        }
                                    }
                                }
                                case "3" -> {
                                    if (request.getParameter("current_id") != null) {
                                        if (request.getParameter("current_id").equals(request.
                                                getParameter("delete_item_id"))) {
                                            request.getSession().removeAttribute("current_user");
                                            DBManager.deleteItem(Long.parseLong(request.
                                                    getParameter("delete_item_id")));
                                            response.sendRedirect("/sprint1");
                                        } else {
                                            DBManager.deleteItem(Long.parseLong(request.
                                                    getParameter("delete_item_id")));
                                            response.sendRedirect("/sprint1_admin?entity=items");
                                        }
                                    } else response.sendRedirect("/404");
                                }
                                default -> response.sendRedirect("/404");
                            }
                        }
                        default -> response.sendRedirect("/404");
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getSession() != null) {
            if (request.getSession().getAttribute("current_user") != null) {
                if (((User) request.getSession().getAttribute("current_user")).
                        getEmail().equals(DBManager.getUserById(1L).getEmail())) {
                    switch (request.getParameter("entity")) {
                        case "users" -> {
                            if (request.getParameter("command") != null) {
                                if (request.getParameter("command").equals("details")) {
                                    request.setAttribute("current_user_edit", DBManager.getUserById(
                                            Long.parseLong(request.getParameter("id"))
                                    ));
                                    request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/user_card.jsp").forward(
                                            request, response
                                    );
                                }
                            } else {
                                request.setAttribute("users", DBManager.getAllUsers());
                                request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/manage_users.jsp").
                                        forward(request, response);
                            }
                        }
                        case "items" -> {
                            if (request.getParameter("command") != null) {
                                if (request.getParameter("command").equals("details")) {
                                    request.setAttribute("current_item_edit", DBManager.getItemById(
                                            Long.parseLong(request.getParameter("id"))
                                    ));
                                    request.setAttribute("brands_list", DBManager.getAllBrands());
                                    request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/item_card.jsp").forward(
                                            request, response
                                    );
                                }
                            } else {
                                request.setAttribute("items", DBManager.getAllItems());
                                request.setAttribute("brands_list", DBManager.getAllBrands());
                                request.getRequestDispatcher("./SPRINT/SPRINT_1/admin/manage_items.jsp").
                                        forward(request, response);
                            }
                        }
                    }
                }
            }
        }
    }
}
