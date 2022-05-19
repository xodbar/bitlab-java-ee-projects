package lectures.lecture2.task1.db;

import lectures.lecture2.task1.entities.NewsArticle;

import java.util.ArrayList;

public class DBManager {
    protected static ArrayList<NewsArticle> articles;
    private static Long id;

    static {
        articles = new ArrayList<>();

        articles.add(new NewsArticle(
                "The Topic of a news article #1",
                "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                "User Username",
                "Sport"
        ));
        articles.add(new NewsArticle(
                "The Topic of a news article #2",
                "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet " +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                "User Username",
                "Culture"
        ));
        articles.add(new NewsArticle(
                "The Topic of a news article #3",
                "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet " +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                "User Username",
                "Cinema"
        ));
        articles.add(new NewsArticle(
                "The Topic of a news article #4",
                "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet" +
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                "User Username",
                "Sport"
        ));

        id = 5L;
    }


    public static void addArticle(NewsArticle article) {
        articles.add(article);
        id++;
    }


    public static ArrayList<NewsArticle> getArticles() {
        return articles;
    }

    public static Long getId() {
        return id;
    }
}
