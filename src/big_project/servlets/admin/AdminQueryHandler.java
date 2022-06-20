package big_project.servlets.admin;

import big_project.db.DBManager;
import big_project.entities.Comment;
import big_project.entities.Field;
import big_project.entities.Post;
import big_project.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import static big_project.servlets.main.LoginHandler.accountIsAvailable;
import static big_project.servlets.main.PostHandler.setDefaultAttributes;

public class AdminQueryHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getParameter("entity") != null) {
            if (request.getParameter("command") != null) {
                switch (request.getParameter("entity")) {
                    case "user" -> {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                if (request.getParameter("usernameA") != null
                                        && request.getParameter("passwordA") != null
                                        && request.getParameter("phoneA") != null) {
                                    if (accountIsAvailable(request.getParameter("usernameA"),
                                            request.getParameter("phoneA"))) {
                                        DBManager.addUser(new User(
                                                null, request.getParameter("usernameA"),
                                                request.getParameter("passwordA"),
                                                request.getParameter("phoneA"),
                                                false,
                                                (request.getParameter("avatarA") != null ?
                                                        request.getParameter("avatarA")
                                                        : "https://cdn-icons-png.flaticon.com/512/149/149071.png")
                                        ));
                                    }
                                }
                            }
                            case "update" -> {
                                if (request.getParameter("newUsername") != null
                                        && request.getParameter("newPassword") != null
                                        && request.getParameter("newPhoneNumber") != null
                                        && request.getParameter("newAvatar") != null) {
                                    System.out.println(request.getParameter("isBlocked"));
                                    DBManager.updateUser(new User(
                                            Long.parseLong(request.getParameter("id")),
                                            request.getParameter("newUsername"),
                                            request.getParameter("newPassword"),
                                            request.getParameter("newPhoneNumber"),
                                            Boolean.valueOf(request.getParameter("isBlocked")),
                                            request.getParameter("newAvatar")
                                    ));
                                }
                            }
                            case "delete" -> {
                                if (request.getParameter("id") != null)
                                    DBManager.deleteUser(Long.parseLong(request.getParameter("id")));
                            }
                            case "block" -> {
                                if (request.getParameter("id") != null) {
                                    User temp = DBManager.getUserById(Long.parseLong(request.getParameter("id")));

                                    DBManager.updateUser(new User(
                                            temp.getId(),
                                            temp.getUsername(),
                                            temp.getPassword(),
                                            temp.getPhoneNumber(),
                                            true,
                                            temp.getAvatarUrl()
                                    ));
                                }
                            }
                            case "unblock" -> {
                                if (request.getParameter("id") != null) {
                                    User temp = DBManager.getUserById(Long.parseLong(request.getParameter("id")));

                                    DBManager.updateUser(new User(
                                            temp.getId(),
                                            temp.getUsername(),
                                            temp.getPassword(),
                                            temp.getPhoneNumber(),
                                            false,
                                            temp.getAvatarUrl()
                                    ));
                                }
                            }
                        }
                    }

                    case "post" -> {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                if (request.getParameter("titleA") != null
                                        && request.getParameter("asUser") != null
                                        && request.getParameter("contentA") != null
                                        && request.getParameter("paymentA") != null
                                        && request.getParameter("deadlineA") != null
                                        && request.getParameter("fieldA") != null) {
                                    DBManager.addPost(new Post(
                                            null,
                                            DBManager.getUserById(Long.parseLong(request.getParameter("asUser"))),
                                            new Timestamp((new Date()).getTime()),
                                            Double.parseDouble(request.getParameter("paymentA")),
                                            Timestamp.valueOf((request.getParameter("deadlineA") + ":00").replace("T", " ")),
                                            request.getParameter("titleA"),
                                            request.getParameter("contentA"),
                                            request.getParameter("fieldA")
                                    ));
                                }
                            }
                            case "update" -> {
                                if (request.getParameter("id") != null
                                        && request.getParameter("newTitleA") != null
                                        && request.getParameter("newPostUserA") != null
                                        && request.getParameter("newContentA") != null
                                        && request.getParameter("newPaymentA") != null
                                        && request.getParameter("newDeadlineA") != null
                                        && request.getParameter("newFieldA") != null) {
                                    DBManager.updatePost(new Post(
                                            Long.parseLong(request.getParameter("id")),
                                            DBManager.getUserById(Long.parseLong(request.getParameter("newPostUserA"))),
                                            new Timestamp((new Date()).getTime()),
                                            Double.parseDouble(request.getParameter("newPaymentA")),
                                            Timestamp.valueOf((request.getParameter("newDeadlineA") + ":00").replace("T", " ")),
                                            request.getParameter("newTitleA"),
                                            request.getParameter("newContentA"),
                                            request.getParameter("newFieldA")
                                    ));
                                }
                            }
                            case "delete" -> {
                                if (request.getParameter("id") != null)
                                    DBManager.deletePost(Long.parseLong(request.getParameter("id")));
                            }
                        }
                    }

                    case "field" -> {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                if (request.getParameter("nameA") != null)
                                    DBManager.addField(new Field(
                                            null,
                                            request.getParameter("nameA"),
                                            0
                                    ));
                            }
                            case "update" -> {
                                if (request.getParameter("newNameA") != null
                                        && request.getParameter("id") != null) {
                                    Field temp = DBManager.getFieldById(Long.parseLong(request.getParameter("id")));

                                    DBManager.updateField(new Field(
                                            temp.getId(),
                                            request.getParameter("newNameA"),
                                            temp.getTotalOrdersNumber()
                                    ));
                                }
                            }
                            case "delete" -> {
                                if (request.getParameter("id") != null)
                                    DBManager.deleteField(Long.parseLong(request.getParameter("id")));
                            }
                        }
                    }

                    case "comment" -> {
                        switch (request.getParameter("command")) {
                            case "create" -> {
                                if (request.getParameter("contentA") != null
                                        && request.getParameter("asUser") != null) {
                                    DBManager.addComment(new Comment(
                                            null,
                                            Long.parseLong(request.getParameter("postIdA")),
                                            DBManager.getUserById(Long.parseLong(request.getParameter("asUser"))),
                                            null,
                                            request.getParameter("contentA"),
                                            false
                                    ));
                                }
                            }
                            case "update" -> {
                                if (request.getParameter("newContentA") != null
                                        && request.getParameter("id") != null) {
                                    Comment temp = DBManager.getCommentById(Long.parseLong(request.getParameter("id")));
                                    DBManager.updateComment(new Comment(
                                            temp.getId(),
                                            temp.getPostId(),
                                            temp.getUser(),
                                            temp.getPublicationTime(),
                                            request.getParameter("newContentA"),
                                            false
                                    ));
                                }
                            }
                            case "delete" -> {
                                if (request.getParameter("id") != null)
                                    DBManager.deleteComment(Long.parseLong(request.getParameter("id")));
                            }
                            case "block" -> {
                                if (request.getParameter("id") != null) {
                                    Comment temp =
                                            DBManager.getCommentById(Long.parseLong(request.getParameter("id")));

                                    System.out.println(request.getParameter("id"));
                                    System.out.printf(
                                            "%d, %d, %d, %s, %s",
                                            temp.getId(), temp.getPostId(), temp.getUser().getId(),
                                            temp.getPublicationTime(),
                                            temp.getContent()
                                    );

                                    DBManager.updateComment(new Comment(
                                            temp.getId(),
                                            temp.getPostId(),
                                            temp.getUser(),
                                            temp.getPublicationTime(),
                                            temp.getContent(),
                                            true
                                    ));
                                }
                            }
                            case "unblock" -> {
                                if (request.getParameter("id") != null) {
                                    Comment temp = DBManager.getCommentById(Long.parseLong(request.getParameter("id")));
                                    DBManager.updateComment(new Comment(
                                            temp.getId(),
                                            temp.getPostId(),
                                            temp.getUser(),
                                            temp.getPublicationTime(),
                                            temp.getContent(),
                                            false
                                    ));
                                }
                            }
                        }
                    }
                }
            }
        }

        response.sendRedirect("/freelancex/admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (request.getSession().getAttribute("currentUser") != null) {
            if (((User) request.getSession().getAttribute("currentUser")).getId().equals(1L)) {
                if (request.getParameter("entity") != null) {
                    switch (request.getParameter("entity")) {
                        case "user" -> {
                            if (request.getParameter("id") != null)
                                request.setAttribute("user", DBManager.getUserById(
                                        Long.parseLong(request.getParameter("id"))
                                ));
                        }
                        case "post" -> {
                            if (request.getParameter("id") != null)
                                request.setAttribute("post", DBManager.getPostById(
                                        Long.parseLong(request.getParameter("id"))
                                ));
                        }
                        case "field" -> {
                            if (request.getParameter("id") != null)
                                request.setAttribute("field", DBManager.getFieldById(
                                        Long.parseLong(request.getParameter("id"))
                                ));
                        }
                        case "comments" -> {
                            if (request.getParameter("id") != null)
                                request.setAttribute("comment", DBManager.getCommentById(
                                        Long.parseLong(request.getParameter("id"))
                                ));
                        }
                    }

                    setDefaultAttributes(request);
                    request.getRequestDispatcher("/big_project/admin/details.jsp").forward(request, response);
                } else {
                    request.setAttribute("users", DBManager.getAllUsers());
                    request.setAttribute("posts", DBManager.getAllPosts());
                    request.setAttribute("fields", DBManager.getAllFields());
                    request.setAttribute("comments", DBManager.getAllComments());

                    request.getRequestDispatcher("/big_project/admin/list.jsp").forward(request, response);
                }
            }
        }
    }
}
