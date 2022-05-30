package sprint.sprint1.entities;

public class Item {
    private Long id;
    private String name;
    private String description;
    private Double price;
    private Long brandId;
    private String brandName;


    public Item() {
    }

    public Item(Long id, String name, String description, Double price, Long brandId, String brandName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = (double) Math.round(price * 100) / 100;
        this.brandId = brandId;
        this.brandName = brandName;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
