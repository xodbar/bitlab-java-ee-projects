package lectures.lecture2.task1.entities;

public class NewsArticle {
    private String title;
    private String details;
    private String author;
    private String category;


    public NewsArticle() {
    }

    public NewsArticle(String title, String details, String author, String category) {
        this.title = title;
        this.details = details;
        this.author = author;
        this.category = category;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
