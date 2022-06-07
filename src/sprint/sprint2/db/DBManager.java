package sprint.sprint2.db;

import sprint.sprint2.entities.Language;
import sprint.sprint2.entities.News;
import sprint.sprint2.entities.Publication;
import sprint.sprint2.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/news_portal?useUnicode=true&amp;characterEncoding=UTF-8",
                    "postgres", "xodbar");
        } catch (ClassNotFoundException e) {
            System.out.println("Error while initializing driver:");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("SQL Exception while connecting to the DB:");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled exception:");
            e.printStackTrace();
        }
    }

    public static void addLanguage(Language language) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO languages VALUEs(DEFAULT, ?, ?);"
            );

            statement.setString(1, language.getLanguageName());
            statement.setString(2, language.getCode());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception while adding a new language:");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled exception while adding a new language:");
            e.printStackTrace();
        }
    }

    public static Language getLanguageById(Long id) {
        Language result = new Language();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM languages WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                result = new Language(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                );
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception while getting language by ID:");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled exception while getting language by ID:");
            e.printStackTrace();
        }

        return result;
    }

    public static Language getLanguageByCode(String code) {
        Language result = new Language();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM languages WHERE code=?"
            );

            statement.setString(1, code);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                result = new Language(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                );
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception while getting language by code:");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled exception while getting language by code:");
            e.printStackTrace();
        }

        return result;
    }

    public static ArrayList<Language> getAllLanguages() {
        ArrayList<Language> languages = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM languages;"
            );
            while (resultSet.next())
                languages.add(new Language(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                ));
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception while getting all languages:");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled exception while getting all languages:");
            e.printStackTrace();
        }

        return languages;
    }

    public static void updateLanguage(Language language) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE languages SET name=?, code=? WHERE id=?;"
            );

            statement.setString(1, language.getLanguageName());
            statement.setString(2, language.getCode());
            statement.setLong(3, language.getLanguageId());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception while updating the language");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unhandled error while updating the language:");
            e.printStackTrace();
        }
    }

    public static void deleteLanguage(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM languages WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void addPublication(Publication publication) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO publications VALUES (DEFAULT, ?, ?, ?);"
            );

            statement.setString(1, publication.getPublicationName());
            statement.setString(2, publication.getDescription());
            statement.setDouble(3, publication.getRating());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Publication getPublicationById(Long id) {
        Publication result = new Publication();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM publications WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                result = new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static Publication getPublicationByName(String name) {
        Publication publication = new Publication();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM publications WHERE name=?;"
            );

            statement.setString(1, name);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                publication = new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return publication;
    }

    public static ArrayList<Publication> getAllPublications() {
        ArrayList<Publication> publications = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM publications;"
            );

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next())
                publications.add(new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                ));

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return publications;
    }

    public static void updatePublication(Publication publication) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE publications SET name=?, description=?, rating=? WHERE id=?;"
            );

            statement.setString(1, publication.getPublicationName());
            statement.setString(2, publication.getDescription());
            statement.setDouble(3, publication.getRating());
            statement.setLong(4, publication.getPublicationId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deletePublication(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM publications WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void addUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO news_portal.public.users VALUES (DEFAULT, ?, ?);"
            );

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static User getUserById(Long id) {
        User user = new User();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM news_portal.public.users WHERE id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                user = new User(
                        id,
                        resultSet.getString("username"),
                        resultSet.getString("password")
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
                    "SELECT * FROM news_portal.public.users WHERE username=?;"
            );

            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                user = new User(
                        resultSet.getLong("id"),
                        username,
                        resultSet.getString("password")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM news_portal.public.users;"
            );

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                users.add(new User(
                        resultSet.getLong("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public static void updateUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE news_portal.public.users SET username=?, password=? WHERE id=?;"
            );

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setLong(3, user.getUserId());

            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteUser(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM news_portal.public.users WHERE id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void addNews(News news) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO news VALUES (DEFAULT, ?, ?, ?, NOW(), ?, ?, ?);"
            );

            statement.setString(1, news.getNewsTitle());
            statement.setString(2, news.getShortContent());
            statement.setString(3, news.getContent());
            statement.setString(4, news.getPictureUrl());
            statement.setLong(5, news.getLanguageId());
            statement.setLong(6, news.getPublicationId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static News getNewsById(Long id) {
        News news = new News();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.title as newsTitle, n.short_content as newsShortContent, " +
                            "n.content as newsContent, n.post_date as newsPostDate, n.picture_url as newsPictureUrl," +
                            " n.language_id as newsLangId, l.code as langCode, n.publication_id as newsPublicId, " +
                            "p.name as publicName FROM news AS n" +
                            " INNER JOIN languages l on l.id = n.language_id" +
                            " INNER JOIN publications p on n.publication_id = p.id WHERE n.id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                news = new News(
                        id,
                        resultSet.getString("newsTitle"),
                        resultSet.getString("newsShortContent"),
                        resultSet.getString("newsContent"),
                        resultSet.getTimestamp("newsPostDate"),
                        resultSet.getString("newsPictureUrl"),
                        resultSet.getLong("newsLangId"),
                        resultSet.getString("langCode"),
                        resultSet.getLong("newsPublicId"),
                        resultSet.getString("publicName")
                );
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return news;
    }

    public static ArrayList<News> getAllNews() {
        ArrayList<News> news = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id as newsId, n.title as newsTitle, n.short_content as newsShortContent, " +
                            "n.content as newsContent, n.post_date as newsPostDate, n.picture_url as newsPictureUrl," +
                            " n.language_id as newsLangId, l.code as langCode, n.publication_id as newsPublicId, " +
                            "p.name as publicName FROM news AS n" +
                            " INNER JOIN languages l on l.id = n.language_id" +
                            " INNER JOIN publications p on n.publication_id = p.id"
            );

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                news.add(new News(
                        resultSet.getLong("newsId"),
                        resultSet.getString("newsTitle"),
                        resultSet.getString("newsShortContent"),
                        resultSet.getString("newsContent"),
                        resultSet.getTimestamp("newsPostDate"),
                        resultSet.getString("newsPictureUrl"),
                        resultSet.getLong("newsLangId"),
                        resultSet.getString("langCode"),
                        resultSet.getLong("newsPublicId"),
                        resultSet.getString("publicName")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return news;
    }

    public static ArrayList<News> getNewsByLanguage(String code) {
        ArrayList<News> news = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id as newsId, n.title as newsTitle, n.short_content as newsShortContent, " +
                            "n.content as newsContent, n.post_date as newsPostDate, n.picture_url as newsPictureUrl," +
                            " n.language_id as newsLangId, l.code as langCode, n.publication_id as newsPublicId, " +
                            "p.name as publicName FROM news AS n" +
                            " INNER JOIN languages l on l.id = n.language_id" +
                            " INNER JOIN publications p on n.publication_id = p.id WHERE l.code=?;"
            );

            statement.setString(1, code);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                news.add(new News(
                        resultSet.getLong("newsId"),
                        resultSet.getString("newsTitle"),
                        resultSet.getString("newsShortContent"),
                        resultSet.getString("newsContent"),
                        resultSet.getTimestamp("newsPostDate"),
                        resultSet.getString("newsPictureUrl"),
                        resultSet.getLong("newsLangId"),
                        code,
                        resultSet.getLong("newsPublicId"),
                        resultSet.getString("publicName")
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return news;
    }

    public static ArrayList<News> getNewsByPublication(String pub) {
        ArrayList<News> news = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id as newsId, n.title as newsTitle, n.short_content as newsShortContent, " +
                            "n.content as newsContent, n.post_date as newsPostDate, n.picture_url as newsPictureUrl," +
                            " n.language_id as newsLangId, l.code as langCode, n.publication_id as newsPublicId, " +
                            "p.name as publicName FROM news AS n" +
                            " INNER JOIN languages l on l.id = n.language_id" +
                            " INNER JOIN publications p on n.publication_id = p.id WHERE p.name=?;"
            );

            statement.setString(1, pub);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                news.add(new News(
                        resultSet.getLong("newsId"),
                        resultSet.getString("newsTitle"),
                        resultSet.getString("newsShortContent"),
                        resultSet.getString("newsContent"),
                        resultSet.getTimestamp("newsPostDate"),
                        resultSet.getString("newsPictureUrl"),
                        resultSet.getLong("newsLangId"),
                        resultSet.getString("langCode"),
                        resultSet.getLong("newsPublicId"),
                        pub
                ));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return news;
    }

    public static void updateNews(News news) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE news SET title=?, short_content=?, content=?, " +
                            "picture_url=?, language_id=?, publication_id=? WHERE id=?"
            );

            statement.setString(1, news.getNewsTitle());
            statement.setString(2, news.getShortContent());
            statement.setString(3, news.getContent());
            statement.setString(4, news.getPictureUrl());
            statement.setLong(5, news.getLanguageId());
            statement.setLong(6, news.getPublicationId());
            statement.setLong(7, news.getNewsId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
