package big_project.entities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Comment {
    private Long id;
    private Long postId;
    private User user;
    private Timestamp publicationTime;
    private String content;
    private Boolean isBlocked;


    public Comment() {
    }

    public Comment(Long id, Long postId, User user, Timestamp publicationTime, String content, Boolean isBlocked) {
        this.id = id;
        this.postId = postId;
        this.user = user;
        this.publicationTime = publicationTime;
        this.content = content;
        this.isBlocked = isBlocked;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getBlocked() {
        return isBlocked;
    }

    public void setBlocked(Boolean blocked) {
        isBlocked = blocked;
    }

    public String getSimpleDate(Timestamp date) {
        return new SimpleDateFormat("dd.MM.yyyy HH:mm").format(date);
    }
}
