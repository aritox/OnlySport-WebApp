package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DatabaseManagement;

public class Conversation {

    // Attributs correspondant à la table conversation(coach_id, adherent_id)
    private int id;
    private int coachId;
    private int adherentId;

    public Conversation() { }

    public Conversation(int id, int coachId, int adherentId) {
        this.id         = id;
        this.coachId    = coachId;
        this.adherentId = adherentId;
    }

    public int getId() {
        return id;
    }

    public int getCoachId() {
        return coachId;
    }

    public int getAdherentId() {
        return adherentId;
    }

    /**
     * Renvoie l'ID de la conversation existante entre ce coach et cet adhérent,
     * ou crée et renvoie une nouvelle conversation.
     */
    public static int ensureConversation(int coachId, int adherentId) throws SQLException {
        String sql = "SELECT id FROM conversation WHERE coach_id = ? AND adherent_id = ?";
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, coachId);
            ps.setInt(2, adherentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                } else {
                    return createNewConversation(coachId, adherentId);
                }
            }
        }
    }

    /**
     * Insère une nouvelle conversation et renvoie sa clé générée.
     */
    private static int createNewConversation(int coachId, int adherentId) throws SQLException {
        String insertSql = 
            "INSERT INTO conversation (coach_id, adherent_id) VALUES (?, ?)";
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, coachId);
            ps.setInt(2, adherentId);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                } else {
                    throw new SQLException("La création de la conversation a échoué, pas de clé retournée.");
                }
            }
        }
    }
}
