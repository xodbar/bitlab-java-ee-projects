package big_project.entities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Post {
    private Long id;
    private User user;
    private Timestamp publicationTime;
    private Double payment;
    private Timestamp deadline;
    private String title;
    private String content;
    private String field;


    public Post() {
    }

    public Post(Long id, User user, Timestamp publicationTime, Double payment, Timestamp deadline,
                String title, String content, String field) {
        this.id = id;
        this.user = user;
        this.publicationTime = publicationTime;
        this.payment = payment;
        this.deadline = deadline;
        this.title = title;
        this.content = content;
        this.field = field;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getPublicationTime() {
        return publicationTime;
    }

    public void setPublicationTime(Timestamp publicationTime) {
        this.publicationTime = publicationTime;
    }

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public String getSimpleDate(Timestamp date) {
        return new SimpleDateFormat("dd.MM.yyyy HH:mm").format(date);
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }
}
