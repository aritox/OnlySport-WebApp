package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseManagement {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/onlysport?user=postgres&password=yass123";
            return DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver non trouvé", e);
        }
    }
}