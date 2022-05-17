package lectures.lecture1.servlets.task3.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Footballer> footballers;
    private static Long id;

    static {
        footballers = new ArrayList<>();
        id = 1L;
    }

    public static void addFootballer(Footballer footballer) {
        footballers.add(footballer);
        id++;
    }

    public static ArrayList<Footballer> getFootballers() {
        return footballers;
    }

    public static Long getId() {
        return id;
    }
}
