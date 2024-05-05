package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import gym.Client;
public class ClientDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/clients";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    // Insert client into the database
public static boolean addClient(Client client) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("mechi lforname");
        String sql = "insert into clients (name, address, phone, email,password, membership_type,registrationdate) VALUES (?, ?, ?, ?,?, ?,?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, client.getName());
            statement.setString(2, client.getAddress());
            statement.setString(3, client.getPhone());
            statement.setString(4, client.getEmail());
            statement.setString(5, client.getPassword());
            statement.setString(6, client.getMembership_type());
            statement.setDate(7, new java.sql.Date(System.currentTimeMillis()));
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Client added successfully.");
                return true;
            } else {
                System.out.println("Failed to add client.");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error while adding client: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    } catch (ClassNotFoundException e) {
        System.out.println("MySQL JDBC Driver not found.");
        e.printStackTrace();
        return false;
    }
}
    // Remove client from the database by name
    public static boolean removeClient(String name) {
        String sql = "DELETE FROM clients WHERE name=?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, name);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Search for a client by name
    public static Client searchClient(String name) {
        String sql = "SELECT * FROM clients WHERE name=?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, name);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Client client = new Client();
                    client.setName(resultSet.getString("name"));
                    client.setAddress(resultSet.getString("address"));
                    client.setPhone(resultSet.getString("phone"));
                    client.setEmail(resultSet.getString("email"));
                    client.setPassword(resultSet.getString("password"));
                    client.setMembership_type(resultSet.getString("membership_type"));
                    client.setRegistrationdate(resultSet.getDate("registrationdate"));
                    return client;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

 // Retrieve all clients from the database
    public static List<Client> getAllClients() {
        List<Client> clients = new ArrayList<>();
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        String sql = "SELECT * FROM clients";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Client client = new Client();
                client.setName(resultSet.getString("name"));
                client.setAddress(resultSet.getString("address"));
                client.setPhone(resultSet.getString("phone"));
                client.setEmail(resultSet.getString("email"));
                client.setPassword(resultSet.getString("password"));
                client.setMembership_type(resultSet.getString("membership_type"));
                client.setRegistrationdate(resultSet.getDate("registrationdate"));
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }

    public static Client getClientByEmailAndPassword(String email, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Client client = null;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        try {
            conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String sql = "SELECT * FROM clients WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Client found, create Client object
                client = new Client();
                client.setName(rs.getString("name"));
                client.setAddress(rs.getString("address"));
                client.setPhone(rs.getString("phone"));
                client.setEmail(rs.getString("email"));
                client.setMembership_type(rs.getString("membership_type"));
                client.setRegistrationdate(rs.getDate("registrationdate"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return client;
    }


}
