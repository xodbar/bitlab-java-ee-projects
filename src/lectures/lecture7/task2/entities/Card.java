package lectures.lecture7.task2.entities;

import java.util.ArrayList;

public class Card {
    private final ArrayList<CardItem> card;

    public Card() {
        card = new ArrayList<>();
    }

    public Card(ArrayList<CardItem> card) {
        this.card = card;
    }

    public ArrayList<CardItem> getCard() {
        return card;
    }

    public void addCardItem(Item item) {
        System.out.println("adding new item: " + item.getItemId());
        if (card != null) {
            if (card.size() > 0) {
                boolean alreadyExists = false;

                for (CardItem it : card) {
                    if (it.getItemId().equals(item.getItemId())) {
                        it.increaseQuantity();
                        System.out.println("item quantity was increased");
                        alreadyExists = true;
                        break;
                    }
                }

                if (!alreadyExists) {
                    card.add(new CardItem(item.getItemId(), item.getItemName(), item.getItemDescription(), item.getPrice(),
                            1));
                    System.out.println("new item was added");
                }
            } else {
                card.add(new CardItem(item.getItemId(), item.getItemName(), item.getItemDescription(), item.getPrice(),
                        1));
            }
        }
    }

    public void removeCardItem(Long id) {
        for (int i = 0; i < card.size(); i++) {
            if (card.get(i).getItemId().equals(id)) {
                card.remove(i);
                break;
            }
        }
    }
}
