package big_project.entities;

public class Field {
    private Long id;
    private String name;
    private Integer totalOrdersNumber;


    public Field() {
    }

    public Field(Long id, String name, Integer totalOrdersNumber) {
        this.id = id;
        this.name = name;
        this.totalOrdersNumber = totalOrdersNumber;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTotalOrdersNumber() {
        return totalOrdersNumber;
    }

    public void setTotalOrdersNumber(Integer totalOrdersNumber) {
        this.totalOrdersNumber = totalOrdersNumber;
    }
}
