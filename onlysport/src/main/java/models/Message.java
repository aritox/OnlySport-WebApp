package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseManagement;

public class Message {
    private int id;               // ID du message
    private String senderName;     // Nom de l'expéditeur (adhérent ou coach)
    private String text;           // Texte du message
    private Timestamp timestamp;   // Heure d'envoi du message
    private int conversationId;    // ID de la conversation à laquelle ce message appartient

    // Constructeur
    public Message(int id, String senderName, String text, Timestamp timestamp, int conversationId) {
        this.id = id;
        this.senderName = senderName;
        this.text = text;
        this.timestamp = timestamp;
        this.conversationId = conversationId;
    }

    // Getters et Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getConversationId() {
        return conversationId;
    }

    public void setConversationId(int conversationId) {
        this.conversationId = conversationId;
    }

    // Méthode pour insérer un nouveau message dans la base de données
    public static void insertMessage(int conversationId, int senderId, String text, String senderName) throws SQLException {
        String sql = "INSERT INTO message (conversation_id, sender_id, text, sender_name, timestamp) VALUES (?, ?, ?, ?, NOW())";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            ps.setInt(2, senderId);
            ps.setString(3, text);
            ps.setString(4, senderName);
            ps.executeUpdate();
        }
    }

    // Méthode pour récupérer les messages d'une conversation spécifique
    public static List<Message> getMessagesByConversation(int conversationId) throws SQLException {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM message WHERE conversation_id = ? ORDER BY timestamp ASC";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, conversationId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message(
                        rs.getInt("id"),
                        rs.getString("sender_name"),
                        rs.getString("text"),
                        rs.getTimestamp("timestamp"),
                        rs.getInt("conversation_id")
                    );
                    messages.add(message);
                }
            }
        }
        return messages;
    }

    // Méthode pour envoyer un message dans une conversation
    public static void sendMessage(int conversationId, int senderId, String messageText, String senderName) throws SQLException {
        String sql = "INSERT INTO message (conversation_id, sender_id, text, sender_name, timestamp) VALUES (?, ?, ?, ?, NOW())";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            ps.setInt(2, senderId);
            ps.setString(3, messageText);
            ps.setString(4, senderName); // Le nom de l'expéditeur, par exemple "Adhérent" ou "Coach"
            ps.executeUpdate();
        }
    }

    // Méthode pour récupérer un message par son ID
    public static Message getMessageById(int id) throws SQLException {
        String sql = "SELECT * FROM message WHERE id = ?";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Message(
                        rs.getInt("id"),
                        rs.getString("sender_name"),
                        rs.getString("text"),
                        rs.getTimestamp("timestamp"),
                        rs.getInt("conversation_id")
                    );
                }
            }
        }
        return null; // Si aucun message trouvé
    }

    // Méthode pour supprimer un message
    public static void deleteMessage(int messageId) throws SQLException {
        String sql = "DELETE FROM message WHERE id = ?";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, messageId);
            ps.executeUpdate();
        }
    }
    public static List<Message> getMessages(int conversationId) throws SQLException {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM message WHERE conversation_id = ? ORDER BY timestamp ASC";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, conversationId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message(
                        rs.getInt("id"),
                        rs.getString("sender_name"),
                        rs.getString("text"),
                        rs.getTimestamp("timestamp"),
                        rs.getInt("conversation_id")
                    );
                    messages.add(message);
                }
            }
        }
        return messages;
    }
}
