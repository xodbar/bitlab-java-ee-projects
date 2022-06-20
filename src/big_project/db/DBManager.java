package big_project.db;

import big_project.entities.Comment;
import big_project.entities.Field;
import big_project.entities.Post;
import big_project.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/freelancex",
                    "postgres", "xodbar"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO freelancex.public.users VALUES (DEFAULT, ?, ?, ?, ?, ?);"
            );

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getPhoneNumber());
            statement.setBoolean(4, user.getBlocked());
            statement.setString(5, user.getAvatarUrl());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM freelancex.public.users ORDER BY id DESC;"
            );
            while (resultSet.next())
                users.add(new User(
                        resultSet.getLong("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("phone"),
                        resultSet.getBoolean("blocked"),
                        resultSet.getString("avatar_url")
                ));

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public static User getUserById(Long id) {
        User user = new User();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM freelancex.public.users WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                user = new User(
                        resultSet.getLong("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("phone"),
                        resultSet.getBoolean("blocked"),
                        resultSet.getString("avatar_url")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static User getUserByUsername(String username) {
        User user = new User();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM freelancex.public.users WHERE username=?;"
            );

            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                user = new User(
                        resultSet.getLong("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("phone"),
                        resultSet.getBoolean("blocked"),
                        resultSet.getString("avatar_url")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static void updateUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE freelancex.public.users SET username=?, password=?, phone=?, blocked=?, avatar_url=? " +
                            "WHERE id=?;"
            );

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getPhoneNumber());
            statement.setBoolean(4, user.getBlocked());
            statement.setString(5, user.getAvatarUrl());
            statement.setLong(6, user.getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteUser(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM freelancex.public.users WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addField(Field field) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO fields VALUES (DEFAULT, ?);"
            );

            statement.setString(1, field.getName());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Field> getAllFields() {
        ArrayList<Field> fields = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM fields;"
            );
            while (resultSet.next())
                fields.add(new Field(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        0
                ));
            resultSet.close();
            statement.close();

            for (Field field : fields) {
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "SELECT COUNT(id) AS count FROM posts WHERE field_id=?"
                );

                preparedStatement.setLong(1, field.getId());

                ResultSet resultSet1 = preparedStatement.executeQuery();
                while (resultSet1.next())
                    field.setTotalOrdersNumber(resultSet1.getInt("count"));
                preparedStatement.close();
                resultSet1.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return fields;
    }

    public static Field getFieldById(Long id) {
        Field field = new Field();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM fields WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                field = new Field(
                        id,
                        resultSet.getString("name"),
                        0
                );
            statement.close();

            statement = connection.prepareStatement(
                    "SELECT COUNT(id) FROM posts WHERE field_id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet1 = statement.executeQuery();
            if (resultSet1.next())
                field.setTotalOrdersNumber(resultSet1.getInt("count"));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return field;
    }

    public static Field getFieldByName(String name) {
        Field field = new Field();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM fields WHERE name=?;"
            );

            statement.setString(1, name);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                field = new Field(
                        resultSet.getLong("id"),
                        name,
                        0
                );
            statement.close();

            statement = connection.prepareStatement(
                    "SELECT COUNT(id) FROM posts WHERE field_id=?;"
            );

            statement.setLong(1, field.getId());

            ResultSet resultSet1 = statement.executeQuery();
            if (resultSet1.next())
                field.setTotalOrdersNumber(resultSet1.getInt("count"));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return field;
    }

    public static void updateField(Field field) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE fields SET name=? WHERE id=?;"
            );

            statement.setString(1, field.getName());
            statement.setLong(2, field.getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteField(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM fields WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addPost(Post post) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO posts VALUES (DEFAULT, ?, NOW(), ?, ?, ?, ?, ?);"
            );

            statement.setLong(1, post.getUser().getId());
            statement.setDouble(2, post.getPayment());
            statement.setTimestamp(3, post.getDeadline());
            statement.setString(4, post.getTitle());
            statement.setString(5, post.getContent());
            statement.setLong(6, getFieldByName(post.getField()).getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Post> getAllPosts() {
        ArrayList<Post> posts = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT p.id AS id, p.user_id AS user_id, p.publication_time AS publication_time," +
                            " p.payment AS payment, p.deadline AS deadline, p.title AS title, p.content AS content, " +
                            "f.name AS field_name FROM posts AS p INNER JOIN fields f on p.field_id = f.id " +
                            "ORDER BY p.publication_time DESC;"
            );
            while (resultSet.next())
                posts.add(new Post(
                        resultSet.getLong("id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getDouble("payment"),
                        resultSet.getTimestamp("deadline"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("field_name")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return posts;
    }

    public static ArrayList<Post> getPostsByField(String name) {
        ArrayList<Post> posts = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT p.id AS id, p.user_id AS user_id, p.publication_time AS publication_time," +
                            " p.payment AS payment, p.deadline AS deadline, p.title AS title, p.content AS content," +
                            " f.name AS field_name FROM posts AS p INNER JOIN fields f on p.field_id = f.id" +
                            " WHERE f.name=? ORDER BY p.publication_time DESC;;"
            );

            getPostByParameters(name, posts, statement);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return posts;
    }

    public static Post getPostById(Long id) {
        Post post = new Post();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT p.id AS id, p.user_id AS user_id, p.publication_time AS publication_time," +
                            " p.payment AS payment, p.deadline AS deadline, p.title AS title, p.content AS content," +
                            " f.name AS field_name FROM posts AS p INNER JOIN fields f on p.field_id = f.id" +
                            " WHERE p.id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                post = new Post(
                        resultSet.getLong("id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getDouble("payment"),
                        resultSet.getTimestamp("deadline"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("field_name")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

    public static ArrayList<Post> getPostByTitle(String title) {
        ArrayList<Post> post = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT p.id AS id, p.user_id AS user_id, p.publication_time AS publication_time," +
                            " p.payment AS payment, p.deadline AS deadline, p.title AS title, p.content AS content," +
                            " f.name AS field_name FROM posts AS p INNER JOIN fields f on p.field_id = f.id" +
                            " WHERE lower(p.title) LIKE lower(? || '%') ORDER BY p.publication_time DESC;"
            );

            statement.setString(1, title);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                post.add(new Post(
                        resultSet.getLong("id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getDouble("payment"),
                        resultSet.getTimestamp("deadline"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("field_name")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

    public static void updatePost(Post post) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE posts SET payment=?, deadline=?, title=?, content=?, field_id=? WHERE id=?;"
            );

            statement.setDouble(1, post.getPayment());
            statement.setTimestamp(2, post.getDeadline());
            statement.setString(3, post.getTitle());
            statement.setString(4, post.getContent());
            statement.setLong(5, getFieldByName(post.getField()).getId());
            statement.setLong(6, post.getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deletePost(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM posts WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void getPostByParameters(String query, ArrayList<Post> result, PreparedStatement statement)
            throws SQLException {
        statement.setString(1, query);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
            result.add(new Post(
                    resultSet.getLong("id"),
                    getUserById(resultSet.getLong("user_id")),
                    resultSet.getTimestamp("publication_time"),
                    resultSet.getDouble("payment"),
                    resultSet.getTimestamp("deadline"),
                    resultSet.getString("title"),
                    resultSet.getString("content"),
                    resultSet.getString("field_name")
            ));
        statement.close();
    }

    public static void addComment(Comment comment) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO comments VALUES (DEFAULT, ?, ?, now(), ?, FALSE)"
            );

            statement.setLong(1, comment.getPostId());
            statement.setLong(2, comment.getUser().getId());
            statement.setString(3, comment.getContent());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Comment> getAllComments() {
        ArrayList<Comment> comments = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM comments ORDER BY publication_time DESC;"
            );
            while (resultSet.next())
                comments.add(new Comment(
                        resultSet.getLong("id"),
                        resultSet.getLong("post_id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getString("content"),
                        resultSet.getBoolean("blocked")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public static ArrayList<Comment> getAllCommentsForPost(Long postId) {
        ArrayList<Comment> comments = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM comments WHERE post_id=? ORDER BY publication_time DESC;"
            );

            statement.setLong(1, postId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                comments.add(new Comment(
                        resultSet.getLong("id"),
                        resultSet.getLong("post_id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getString("content"),
                        resultSet.getBoolean("blocked")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public static Comment getCommentById(Long id) {
        Comment comment = new Comment();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM comments WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                comment = new Comment(
                        resultSet.getLong("id"),
                        resultSet.getLong("post_id"),
                        getUserById(resultSet.getLong("user_id")),
                        resultSet.getTimestamp("publication_time"),
                        resultSet.getString("content"),
                        resultSet.getBoolean("blocked")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comment;
    }

    public static void updateComment(Comment comment) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE comments SET post_id=?, user_id=?, content=?, blocked=? WHERE id=?;"
            );

            statement.setLong(1, comment.getPostId());
            statement.setLong(2, comment.getUser().getId());
            statement.setString(3, comment.getContent());
            statement.setBoolean(4, comment.getBlocked());
            statement.setLong(5, comment.getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteComment(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM comments WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
