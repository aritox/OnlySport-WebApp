package models;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseManagement;

public class Reservation {

    /* =======================================================================
       1)  Mode “legacy” : on ne stocke que coach_id + type
       ======================================================================= */
    public static void create(int coachId, String type) throws SQLException {
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(
                 "INSERT INTO reservation (coach_id, type) VALUES (?,?)")) {

            ps.setInt   (1, coachId);
            ps.setString(2, type);
            ps.executeUpdate();
        }
    }

    /* =======================================================================
       2)  Mode complet : séance + adhérent
       ======================================================================= */
    public static void create(int seanceId, int adherentId) throws SQLException {
        String sql = "INSERT INTO reservation(seance_id, adherent_id) VALUES (?, ?)";
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, seanceId);
            ps.setInt(2, adherentId);
            ps.executeUpdate(); // Insère la réservation
        }
    }

    /* =======================================================================
       3)  Lister les séances réservées pour un adhérent
       ======================================================================= */
    public static List<Integer> findSeancesByAdherent(int adherentId) throws SQLException {
        List<Integer> list = new ArrayList<>();
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(
                 "SELECT seance_id FROM reservation WHERE adherent_id = ?")) {

            ps.setInt(1, adherentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(rs.getInt(1));
            }
        }
        return list;
    }

    /* =======================================================================
       4)  Stat : nombre d’adhérents distincts pour un coach
       ======================================================================= */
    public static int countAdherentsForCoach(int coachId) throws SQLException {

        /* deux voies : si tu utilises l’ancien format, on compte coach_id ;
           sinon, on passe par seance → coach_id.  */
        final String sql =
            "SELECT COUNT(DISTINCT COALESCE(adherent_id, 0)) "
          + "FROM reservation r "
          + "LEFT JOIN seance s ON s.id = r.seance_id "
          + "WHERE (r.coach_id = ? OR s.coach_id = ?)";

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, coachId);
            ps.setInt(2, coachId);
            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }

    /* =======================================================================
       5)  Annuler une réservation (optionnel)
       ======================================================================= */
    public static void cancel(int seanceId, int adherentId) throws SQLException {

        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(
                 "DELETE FROM reservation WHERE seance_id=? AND adherent_id=?")) {
            ps.setInt(1, seanceId);
            ps.setInt(2, adherentId);
            ps.executeUpdate();
        }
        /* si tu veux remettre la séance dispo=true */
        try (Connection c = DatabaseManagement.getConnection();
             PreparedStatement ps = c.prepareStatement(
                 "UPDATE seance SET dispo=true WHERE id=?")) {
            ps.setInt(1, seanceId);
            ps.executeUpdate();
        }
    }

    /* =======================================================================
       6)  Mapping ResultSet → objet (facultatif, si tu veux un POJO)
       ======================================================================= */
    public int    id;
    public int    coachId;
    public String type;
    public int    seanceId;
    public Integer adherentId;
    public LocalDateTime dateResa;
    public String statut;

    private static Reservation map(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.id          = rs.getInt   ("id");
        r.coachId     = rs.getInt   ("coach_id");
        r.type        = rs.getString("type");
        r.seanceId    = rs.getInt   ("seance_id");
        int adh = rs.getInt("adherent_id");
        r.adherentId  = rs.wasNull() ? null : adh;
        Timestamp ts  = rs.getTimestamp("date_resa");
        r.dateResa    = (ts!=null) ? ts.toLocalDateTime() : null;
        r.statut      = rs.getString("statut");
        return r;
    }
}
