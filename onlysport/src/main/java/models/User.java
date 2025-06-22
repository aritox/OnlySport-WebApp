package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import org.mindrot.jbcrypt.BCrypt; // For password hashing

import database.DatabaseManagement;

public class User {
    private int id;
    private String email;
    private String password;
    private String nom;
    private String prenom;
    private String role;
    private LocalDate dateInscription;

    public User(String email, String password, String nom, String prenom) {
        this.email = email;
        this.password = password;
        this.nom = nom;
        this.prenom = prenom;
    }

    public User(int id, String email, String password, String nom, String prenom) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.nom = nom;
        this.prenom = prenom;
    }

    public User() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDate getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(LocalDate dateInscription) {
        this.dateInscription = dateInscription;
    }
 // Method to register a new user
    public boolean registerUser() {
        String insertUserSQL = "INSERT INTO utilisateur (nom, prenom, email, mot_de_passe, role, date_inscription) VALUES (?, ?, ?, ?, ?, ?)";
     // Assuming you're inserting the `utilisateur_id` and optionally filling other fields.
        String insertCoachSQL = "INSERT INTO coach (utilisateur_id, specialite, tarif_horaire, certification) VALUES (?, NULL, NULL, NULL)";

        String insertAdherentSQL = "INSERT INTO adherent (utilisateur_id, objectif, niveau, date_naissance) VALUES (?, NULL, NULL, NULL)";
        
        try (Connection connection = DatabaseManagement.getConnection();
             PreparedStatement ps = connection.prepareStatement(insertUserSQL, Statement.RETURN_GENERATED_KEYS)) {
             
            // Set values for user insertion
            ps.setString(1, this.nom);
            ps.setString(2, this.prenom);
            ps.setString(3, this.email);
            ps.setString(4, this.password);
            ps.setString(5, this.role);
            ps.setDate(6, java.sql.Date.valueOf(this.dateInscription));

            // Execute user insertion
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int userId = generatedKeys.getInt(1);  // Get the generated user ID

                        // Insert into Coach table if role is "coach"
                        if ("coach".equalsIgnoreCase(this.role)) {
                            try (PreparedStatement coachStmt = connection.prepareStatement(insertCoachSQL)) {
                                coachStmt.setInt(1, userId); // Set the user ID
                                coachStmt.executeUpdate();
                            }
                        }
                        // Insert into Adherent table if role is "adherent"
                        else if ("adherent".equalsIgnoreCase(this.role)) {
                            try (PreparedStatement adherentStmt = connection.prepareStatement(insertAdherentSQL)) {
                                adherentStmt.setInt(1, userId); // Set the user ID
                                adherentStmt.executeUpdate();
                            }
                        }

                        return true; // Registration successful
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false; // Registration failed
    }
    
    // Method to find user by email
    public static User findByEmail(String email) {
        User user = null;
        String query = "SELECT id, email, mot_de_passe, nom, prenom, role, date_inscription FROM utilisateur WHERE email = ?";

        try (Connection connection = DatabaseManagement.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("mot_de_passe"));
                user.setNom(resultSet.getString("nom"));
                user.setPrenom(resultSet.getString("prenom"));
                user.setRole(resultSet.getString("role"));
                user.setDateInscription(resultSet.getDate("date_inscription").toLocalDate());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Method to update the password of the user
    public boolean updatePassword(String email, String newPassword) {
        String query = "UPDATE utilisateur SET mot_de_passe = ? WHERE email = ?";

        try (Connection connection = DatabaseManagement.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            

            // Set the new password and email in the prepared statement
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, email);

            // Execute the update query
            int rowsAffected = preparedStatement.executeUpdate();

            // If the email exists, the update should affect exactly 1 row
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to check if the provided password matches the stored hash
    public boolean checkPassword(String providedPassword) {
        return BCrypt.checkpw(providedPassword, this.password);
    }
}
