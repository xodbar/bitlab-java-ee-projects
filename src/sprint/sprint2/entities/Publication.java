package sprint.sprint2.entities;

public class Publication {
    private Long id;
    private String name;
    private String description;
    private Double rating;


    public Publication() {
    }

    public Publication(Long id, String name, String description, Double rating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.rating = (Math.round(rating * 100.0) / 100.0);
    }

    public Long getPublicationId() {
        return id;
    }

    public void setPublicationId(Long id) {
        this.id = id;
    }

    public String getPublicationName() {
        return name;
    }

    public void setPublicationName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = Math.round(rating * 100.0) / 100.0;
    }
}
