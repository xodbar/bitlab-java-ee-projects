package lectures.lecture7.task3.db;

import lectures.lecture7.task3.entity.User;

import java.util.ArrayList;

public class StaticDBManager {
    private static final ArrayList<User> users;

    static {
        users = new ArrayList<>();

        users.add(new User(1L, "admin", "Xodbar123$"));
        users.add(new User(2L, "username", "Test123$"));
        users.add(new User(3L, "test", "User123$"));
    }

    public static ArrayList<User> getAllUsers() {
        return users;
    }
}
