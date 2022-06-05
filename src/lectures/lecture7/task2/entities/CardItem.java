package lectures.lecture7.task2.entities;

public class CardItem extends Item {
    private Integer quantity;

    public CardItem() {
    }

    public CardItem(Long id, String name, String description, Double price, Integer quantity) {
        super(id, name, description, price);
        this.quantity = quantity;
    }

    public void increaseQuantity() {
        quantity++;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
