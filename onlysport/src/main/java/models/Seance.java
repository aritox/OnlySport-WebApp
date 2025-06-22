package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseManagement;

public class Seance {

	/* ====== champs ====== */
	private int id;
	private int duree;
	private String feedback;
	private String endroit;
	private String niveau;
	private float tarif;
	private String type;
	private int coachId;
	private String nomCoach;

	/* ===== getters ===== */
	public int getId() {
		return id;
	}

	public int getDuree() {
		return duree;
	}

	public String getFeedback() {
		return feedback;
	}

	public String getEndroit() {
		return endroit;
	}

	public String getNiveau() {
		return niveau;
	}

	public float getTarif() {
		return tarif;
	}

	public String getType() {
		return type;
	}

	public int getCoachId() {
		return coachId;
	}

	public String getNomCoach() {
		return nomCoach;
	}

	/* ===== setters ===== */
	public void setId(int id) {
		this.id = id;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public void setEndroit(String endroit) {
		this.endroit = endroit;
	}

	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}

	public void setTarif(float tarif) {
		this.tarif = tarif;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCoachId(int coachId) {
		this.coachId = coachId;
	}

	public void setNomCoach(String nomCoach) {
		this.nomCoach = nomCoach;
	}

	/* ===== persistance ===== */

	/** Insère la séance et récupère l’id généré. */
	public void save() throws SQLException {

		final String sql = "INSERT INTO seance "
				+ "(duree, feedback, endroit, niveau, tarif, coach_id, nom_coach, type) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?) " + "RETURNING id";

		try (Connection c = DatabaseManagement.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {

			ps.setInt(1, duree);
			ps.setString(2, feedback);
			ps.setString(3, endroit);
			ps.setString(4, niveau);
			ps.setFloat(5, tarif);
			ps.setInt(6, coachId);
			ps.setString(7, nomCoach);
			ps.setString(8, type);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					this.id = rs.getInt(1);
					System.out.println("DEBUG save() – séance insérée id=" + id);
				} else {
					throw new SQLException("INSERT n’a rien retourné – vérifie les colonnes");
				}
			}

			/* ⚠️ au cas où autoCommit=false dans DatabaseManagement */
			if (!c.getAutoCommit()) {
				c.commit();
				System.out.println("DEBUG save() – commit OK");
			}

		} catch (SQLException ex) {
			/* Log complet pour voir l’erreur réelle */
			ex.printStackTrace();
			throw ex; // propage à la servlet, qui renverra 500 avec le détail
		}
	}

	/** Retourne la séance ou null. */
	public static Seance findById(int id) throws SQLException {
		try (Connection c = DatabaseManagement.getConnection();
				PreparedStatement ps = c.prepareStatement("SELECT * FROM seance WHERE id = ?")) {

			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? map(rs) : null;
			}
		}
	}
	public static List<Seance> find(String type) throws SQLException {
	    StringBuilder sql = new StringBuilder("SELECT * FROM seance WHERE 1=1 ");
	    List<Object> params = new ArrayList<>();

	    // Filtrage uniquement par type
	    if (type != null && !type.isBlank()) {
	        sql.append("AND type = ? ");
	        params.add(type);
	    }

	    try (Connection c = DatabaseManagement.getConnection();
	         PreparedStatement ps = c.prepareStatement(sql.toString())) {

	        // Affectation des paramètres dynamiques à la requête SQL
	        for (int i = 0; i < params.size(); i++) {
	            ps.setObject(i + 1, params.get(i));
	        }

	        List<Seance> out = new ArrayList<>();
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                out.add(map(rs));
	            }
	        }
	        return out;
	    }
	}

	/* ===== mapping ResultSet → objet ===== */
	private static Seance map(ResultSet rs) throws SQLException {
		Seance s = new Seance();
		s.id = rs.getInt("id");
		s.duree = rs.getInt("duree");
		s.feedback = rs.getString("feedback");
		s.endroit = rs.getString("endroit");
		s.niveau = rs.getString("niveau");
		s.tarif = rs.getFloat("tarif");
		s.coachId = rs.getInt("coach_id");
		s.nomCoach = rs.getString("nom_coach");
		s.type = rs.getString("type");
		return s;
	}

	public static int countByCoach(int coachId) throws SQLException {
		try (Connection c = DatabaseManagement.getConnection();
				PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM seance WHERE coach_id=?")) {
			ps.setInt(1, coachId);
			try (ResultSet rs = ps.executeQuery()) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	public static List<Seance> findDisponiblesByCoach(int coachId) throws SQLException {
	    List<Seance> seances = new ArrayList<>();
	    String sql = "SELECT * FROM seance WHERE coach_id = ? AND dispo = true";

	    try (Connection c = DatabaseManagement.getConnection();
	         PreparedStatement ps = c.prepareStatement(sql)) {
	        ps.setInt(1, coachId);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Seance seance = new Seance();
	                seance.setId(rs.getInt("id"));
	                seance.setDuree(rs.getInt("duree"));
	                seance.setFeedback(rs.getString("feedback"));
	                seance.setEndroit(rs.getString("endroit"));
	                seance.setNiveau(rs.getString("niveau"));
	                seance.setTarif(rs.getFloat("tarif"));
	                seance.setCoachId(rs.getInt("coach_id"));
	                seance.setNomCoach(rs.getString("nom_coach"));
	                seance.setType(rs.getString("type"));
	                seances.add(seance);
	            }
	        }
	    }
	    return seances;
	}

}
