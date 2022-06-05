package lectures.lecture7.task2.db;

import lectures.lecture7.task2.entities.Item;

import java.util.ArrayList;

public class StaticDBManager {
    private static final ArrayList<Item> items;

    static {
        items = new ArrayList<>();

        items.add(new Item(1L, "Nike Air 90", "Lorem ipsum dolor sit amet", 90.99));
        items.add(new Item(2L, "Adidas Air Max", "Lorem ipsum dolor sit amet", 110.99));
        items.add(new Item(3L, "Adidas Yeezy 700", "Lorem ipsum dolor sit amet", 80.99));
        items.add(new Item(4L, "Puma Shoes", "Lorem ipsum dolor sit amet", 200.99));
        items.add(new Item(5L, "Reebok X-600", "Lorem ipsum dolor sit amet", 180.99));
        items.add(new Item(6L, "Adidas X-780", "Lorem ipsum dolor sit amet", 70.99));
        items.add(new Item(7L, "Nike Air 180", "Lorem ipsum dolor sit amet", 190.99));
    }

    public static ArrayList<Item> getAllItems() {
        return ((items != null && items.size() > 0) ? items : null);
    }

    public static Item getItemById(Long id) {
        Item item = null;

        for (Item it : items) {
            if (it.getItemId().equals(id)) {
                item = it;
                break;
            }
        }

        return item;
    }
}
