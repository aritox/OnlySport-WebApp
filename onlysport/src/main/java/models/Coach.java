package models;

import database.DatabaseManagement;
import java.sql.*;
import java.util.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/** Représente un coach + gère lui-même la persistance. */
public class Coach {

    /* ---------- champs simples ---------- */
	
    private int    idCoach;
    private String nom;
    private String prenom;
    private String specialite;
    private double tarifHoraire;
    private String certification;                 // ★ champ principal
    private String bio;

    /* ---------- collections ---------- */
    private final List<String>    certifications = new ArrayList<>(); // ★ list
    private final List<SkillEntry> skills         = new ArrayList<>();

    private static final ObjectMapper JSON = new ObjectMapper();

    /* ===== getters / setters essentiels ===== */
    public void setId(int id) {
        this.idCoach = id;
    }
    public int getId() {
        return this.idCoach;
    }

    public int getIdCoach()           { return idCoach; }
    public String getNom()            { return nom; }
    public void setNom(String nom)    { this.nom = nom; }
    public String getPrenom()         { return prenom; }
    public void setPrenom(String p)   { this.prenom = p; }
    public String getSpecialite()     { return specialite; }
    public void setSpecialite(String s){ this.specialite = s; }
    public double getTarifHoraire()   { return tarifHoraire; }
    public void setTarifHoraire(double t){ this.tarifHoraire = t; }
    public String getBio()            { return bio; }
    public void setBio(String b)      { this.bio = b; }

    /* — getter pour la JSP — ★ */
    public String getCertification()  { return certification; }
    public void setCertification(String c){ this.certification = c; }

    public List<String>    getCertifications() { return certifications; }
    public List<SkillEntry> getSkills()        { return skills; }

    /* ------------------------------------------------------------------ */
    /*  Recherche / création par utilisateur                              */
    /* ------------------------------------------------------------------ */
    public static Coach findByUserId(int userId)
            throws SQLException, Exception {
        String sql = "SELECT * FROM coach WHERE utilisateur_id = ?";
        try (Connection cn = DatabaseManagement.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {
             
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);   // mapRow(rs) peut lever Exception
                }
                return null;
            }
        }
    }

    public static Coach getOrCreateByUserId(int userId) throws Exception {
        Coach c = findByUserId(userId);
        if (c != null) return c;

        String insert = "INSERT INTO coach (specialite, tarif_horaire, certification, utilisateur_id) VALUES ('',0.0,'',?)";
        try (Connection cn = DatabaseManagement.getConnection();
             PreparedStatement ps = cn.prepareStatement(insert)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        }
        return findByUserId(userId);
    }

    /* ------------------------------------------------------------------ */
    /*  Sauvegarde                                                        */
    /* ------------------------------------------------------------------ */
    public void save() throws Exception {
        String sql = "UPDATE coach SET nom=? prenom=? specialite=? tarif_horaire=? certification=? bio=? certifications=? skills=? WHERE id=?";
        try (Connection cn = DatabaseManagement.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, specialite);
            ps.setDouble(4, tarifHoraire);
            ps.setString(5, certification);                       // ★
            ps.setString(6, bio);
            ps.setString(7, JSON.writeValueAsString(certifications));
            ps.setString(8, JSON.writeValueAsString(skills));
            ps.setInt   (9, idCoach);
            ps.executeUpdate();
        }
    }

    /* ------------------------------------------------------------------ */
    /*  Opérations métier                                                 */
    /* ------------------------------------------------------------------ */
    public void addCertification(String titre)    { certifications.add(titre); }
    public void removeCertification(String titre) { certifications.remove(titre); }

    public void addSkill(String nom, String niveau) {
        skills.add(new SkillEntry(nom, niveau));
    }
    public void removeSkill(String nom) {
        skills.removeIf(s -> s.nom.equals(nom));
    }

    /* ------------------------------------------------------------------ */
    /*  Mapping ResultSet → Objet                                         */
    /* ------------------------------------------------------------------ */
    private static Coach mapRow(ResultSet rs) throws Exception {
        Coach c = new Coach();
        c.idCoach      = rs.getInt("id");
        c.nom          = rs.getString("nom");
        c.prenom       = rs.getString("prenom");
        c.specialite   = rs.getString("specialite");
        c.tarifHoraire = rs.getDouble("tarif_horaire");
        c.certification= rs.getString("certification");           // ★
        c.bio          = rs.getString("bio");

        /* JSONB → listes */
        String certsJson = rs.getString("certifications");
        if (certsJson != null && !certsJson.isBlank())
            c.certifications.addAll(
                JSON.readValue(certsJson, new TypeReference<List<String>>(){}));

        String skillsJson = rs.getString("skills");
        if (skillsJson != null && !skillsJson.isBlank())
            c.skills.addAll(
                JSON.readValue(skillsJson, new TypeReference<List<SkillEntry>>(){}));

        return c;
    }

    /* ---------------- mini-record interne ---------------- */
    public static class SkillEntry {
        public String nom;
        public String niveau;
        public SkillEntry() {}
        public SkillEntry(String n, String nv) { nom = n; niveau = nv; }
    }

    /* Alias conservé si tes servlets appellent encore saveProfile() */
    public void saveProfile() throws Exception { this.save(); }
}
