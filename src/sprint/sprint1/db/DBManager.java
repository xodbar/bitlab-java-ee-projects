package sprint.sprint1.db;

import other.ANSI;
import sprint.sprint1.entities.Brand;
import sprint.sprint1.entities.Country;
import sprint.sprint1.entities.Item;
import sprint.sprint1.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                System.out.println("EXCEPTION WHILE CONNECTING POSTGRESQL DRIVER: " + e.getMessage());
            }

            try {
                connection = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/shop",
                        "postgres", "xodbar"
                );
            } catch (SQLException e) {
                System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                        "EXCEPTION WHILE CONNECTING TO THE DATABASE: " + e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE DEFINING STATIC DB MANAGER: " + e.getMessage());
        }
    }

    public static void addItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO items VALUES(DEFAULT, ?, ?, ?, ?)"
            );

            statement.setString(1, item.getItemName());
            statement.setString(2, item.getDescription());
            statement.setDouble(4, item.getPrice());
            statement.setLong(3, item.getBrandId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING A NEW ITEM: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE ADDING A NEW ITEM: " + e.getMessage());
        }
    }

    public static ArrayList<Item> getAllItems() {
        ArrayList<Item> items = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT it.item_id, it.item_name, " +
                    "it.item_description, it.item_price, b.brand_id, b.brand_name " +
                    "FROM items it INNER JOIN brands b ON b.brand_id = it.item_brand_id;");
            while (resultSet.next()) {
                items.add(new Item(
                        resultSet.getLong("item_id"),
                        resultSet.getString("item_name"),
                        resultSet.getString("item_description"),
                        resultSet.getDouble("item_price"),
                        resultSet.getLong("brand_id"),
                        resultSet.getString("brand_name")
                ));
            }
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING ALL ITEMS: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING ALL ITEMS: " + e.getMessage());
        }

        return items;
    }

    public static Item getItemById(Long id) {
        Item item = new Item();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT it.item_id, it.item_name, it.item_description, it.item_price, b.brand_id, b.brand_name " +
                    "FROM items it INNER JOIN brands b on b.brand_id = it.item_brand_id WHERE it.item_id = ?"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                item = new Item(
                        resultSet.getLong("item_id"),
                        resultSet.getString("item_name"),
                        resultSet.getString("item_description"),
                        resultSet.getDouble("item_price"),
                        resultSet.getLong("brand_id"),
                        resultSet.getString("brand_name")
                );
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING THE ITEM BY ID: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING THE ITEM BY ID: " + e.getMessage());
        }

        return item;
    }

    public static void updateItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE items SET item_name=?, item_description=?, item_price=?, item_brand_id=? WHERE item_id=?"
            );

            statement.setString(1, item.getItemName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.setLong(4, item.getBrandId());
            statement.setLong(5, item.getItemId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE UPDATING THE ITEM: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE UPDATING THE ITEM: " + e.getMessage());
        }
    }

    public static void deleteItem(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM items WHERE item_id=?"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL ERROR WHILE DELETING THE ITEM: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE DELETING THE ITEM: " + e.getMessage());
        }
    }


    public static void addUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO users VALUES(DEFAULT, ?, ?, ?)"
            );

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING A NEW USER: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE ADDING A NEW USER: " + e.getMessage());
        }
    }

    public static ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * FROM users");
            while (resultSet.next())
                users.add(new User(
                        resultSet.getLong("user_id"),
                        resultSet.getString("user_email"),
                        resultSet.getString("user_password"),
                        resultSet.getString("user_full_name")
                ));
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING ALL USERS: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING ALL USER: " + e.getMessage());
        }

        return users;
    }

    public static User getUserById(Long id) {
        User user = new User();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM users WHERE user_id=?"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                user = new User(
                        resultSet.getLong("user_id"),
                        resultSet.getString("user_email"),
                        resultSet.getString("user_password"),
                        resultSet.getString("user_full_name")
                );
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING THE USER BY ID: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING THE USER BY ID: " + e.getMessage());
        }

        return user;
    }

    public static User getUserByEmail(String email) {
        User user = new User();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM users WHERE user_email=?"
            );

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                user = new User(
                        resultSet.getLong("user_id"),
                        resultSet.getString("user_email"),
                        resultSet.getString("user_password"),
                        resultSet.getString("user_full_name")
                );
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING THE USER BY EMAIL: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING THE USER BY EMAIL: " + e.getMessage());
        }

        return user;
    }

    public static void updateUser(User user) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE users SET user_id=?, user_email=?, user_password=?, user_full_name=? WHERE user_id=?"
            );

            statement.setLong(1, user.getUserId());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getFullName());
            statement.setLong(5, user.getUserId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE UPDATING THE USER: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE UPDATING THE USER: " + e.getMessage());
        }
    }

    public static void deleteUser(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM users WHERE user_id=?"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE DELETING THE USER");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE DELETING THE USER: " + e.getMessage());
        }
    }


    public static void addBrand(Brand brand) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO brands VALUES (DEFAULT, ?, ?);"
            );

            statement.setString(1, brand.getBrandName());
            statement.setLong(2, brand.getCountryId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING NEW BRAND");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE ADDING NEW BRAND: " + e.getMessage());
        }
    }

    public static ArrayList<Brand> getAllBrands() {
        ArrayList<Brand> brands = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM brands;"
            );
            while (resultSet.next())
                brands.add(new Brand(
                        resultSet.getLong("brand_id"),
                        resultSet.getString("brand_name"),
                        resultSet.getLong("brand_country_id")
                ));

        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING ALL BRANDS");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING ALL BRANDS: " + e.getMessage());
        }

        return brands;
    }

    public static Brand getBrandById(Long id) {
        Brand brand = new Brand();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM brands WHERE brand_id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                brand = new Brand(
                        resultSet.getLong("brand_id"),
                        resultSet.getString("brand_name"),
                        resultSet.getLong("brand_country_id")
                );
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE GETTING BRAND BY ID");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING BRAND BY ID: " + e.getMessage());
        }

        return brand;
    }

    public static void updateBrand(Brand brand) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE brands SET brand_name=?, brand_country_id=? WHERE brand_id=?;"
            );

            statement.setString(1, brand.getBrandName());
            statement.setLong(2, brand.getCountryId());
            statement.setLong(3, brand.getBrandId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE UPDATING THE BRAND");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE UPDATING BRAND: " + e.getMessage());
        }
    }

    public static void deleteBrand(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM brands WHERE brand_id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE DELETING THE BRAND");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE DELETING BRAND: " + e.getMessage());
        }
    }


    public static void addCountry(Country country) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO countries VALUES(DEFAULT, ?, ?);"
            );

            statement.setString(1, country.getCountryName());
            statement.setString(2, country.getCode());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING A NEW COUNTRY");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE ADDING A NEW COUNTRY: " + e.getMessage());
        }
    }

    public static ArrayList<Country> getAllCountries() {
        ArrayList<Country> countries = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM countries;"
            );
            while (resultSet.next())
                countries.add(new Country(
                        resultSet.getLong("country_id"),
                        resultSet.getString("country_name"),
                        resultSet.getString("country_code")
                ));
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING GETTING ALL COUNTRIES");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING ALL COUNTRIES: " + e.getMessage());
        }

        return countries;
    }

    public static Country getCountryById(Long id) {
        Country country = new Country();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM countries WHERE country_id=?;"
            );

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                country = new Country(
                        resultSet.getLong("country_id"),
                        resultSet.getString("country_name"),
                        resultSet.getString("country_code")
                );
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE ADDING GETTING ALL COUNTRIES");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE GETTING ALL COUNTRIES: " + e.getMessage());
        }

        return country;
    }

    public static void updateCountry(Country country) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE countries SET country_name=?, country_code=? WHERE country_id=?;"
            );

            statement.setString(1, country.getCountryName());
            statement.setString(2, country.getCode());
            statement.setLong(3, country.getCountryId());

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE UPDATING COUNTRY");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE UPDATING COUNTRY: " + e.getMessage());
        }
    }

    public static void deleteCountry(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM countries WHERE country_id=?;"
            );

            statement.setLong(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_RED +
                    "SQL EXCEPTION WHILE DELETING THE COUNTRY");
        } catch (Exception e) {
            System.out.println(ANSI.ANSI_YELLOW_BACKGROUND + ANSI.ANSI_BLACK +
                    "UNHANDLED EXCEPTION WHILE DELETING THE COUNTRY: " + e.getMessage());
        }
    }
}
