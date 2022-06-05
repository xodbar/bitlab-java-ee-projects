package lectures.lecture7.task2.entities;

public class Item {
    private Long id;
    private String name;
    private String description;
    private Double price;

    public Item() {
    }

    public Item(Long id, String name, String description, Double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = Math.round(price*100.0)/100.0;
    }

    public Long getItemId() {
        return id;
    }

    public void setItemId(Long id) {
        this.id = id;
    }

    public String getItemName() {
        return name;
    }

    public void setItemName(String name) {
        this.name = name;
    }

    public String getItemDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = Math.round(price*100.0)/100.0;
    }
}
