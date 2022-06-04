package sprint.sprint2uc.entities;

import java.sql.Timestamp;

public class News {
    private Long id;
    private String title;
    private String shortContent;
    private String content;
    private Timestamp postDate;
    private String pictureUrl;
    private Long languageId;
    private String languageCode;
    private Long publicationId;
    private String publicationName;


    public News() {
    }

    public News(Long id, String title, String shortContent, String content, Timestamp postDate, String pictureUrl,
                Long languageId, String languageCode, Long publicationId, String publicationName) {
        this.id = id;
        this.title = title;
        this.shortContent = shortContent;
        this.content = content;
        this.postDate = postDate;
        this.pictureUrl = pictureUrl;
        this.languageId = languageId;
        this.languageCode = languageCode;
        this.publicationId = publicationId;
        this.publicationName = publicationName;
    }

    public Long getNewsId() {
        return id;
    }

    public void setNewsId(Long id) {
        this.id = id;
    }

    public String getNewsTitle() {
        return title;
    }

    public void setNewsTitle(String title) {
        this.title = title;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public Long getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Long languageId) {
        this.languageId = languageId;
    }

    public Long getPublicationId() {
        return publicationId;
    }

    public void setPublicationId(Long publicationId) {
        this.publicationId = publicationId;
    }
}
