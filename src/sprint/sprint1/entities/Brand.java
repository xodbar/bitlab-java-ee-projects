package sprint.sprint1.entities;

public class Brand {
    private Long id;
    private String name;
    private Long countryId;

    public Brand() {
    }

    public Brand(Long id, String name, Long countryId) {
        this.id = id;
        this.name = name;
        this.countryId = countryId;
    }

    public Long getBrandId() {
        return id;
    }

    public void setBrandId(Long id) {
        this.id = id;
    }

    public String getBrandName() {
        return name;
    }

    public void setBrandName(String name) {
        this.name = name;
    }

    public Long getCountryId() {
        return countryId;
    }

    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }
}
