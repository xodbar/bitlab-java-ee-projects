package sprint.sprint1.entities;

public class Country {
    private Long id;
    private String name;
    private String code;

    public Country() {
    }

    public Country(Long id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
    }

    public Long getCountryId() {
        return id;
    }

    public void setCountryId(Long id) {
        this.id = id;
    }

    public String getCountryName() {
        return name;
    }

    public void setCountryName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
