package lectures.lecture4_5.entities;

public class City {
    private Long id;
    private String name;
    private String code;


    public City() {
    }

    public City(Long id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
    }


    public Long getCityId() {
        return id;
    }

    public void setCityId(Long id) {
        this.id = id;
    }

    public String getCityName() {
        return name;
    }

    public void setCityName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
