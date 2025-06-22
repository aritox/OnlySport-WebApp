package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseManagement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Coach;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sport = request.getParameter("sport");
        List<Coach> coachs = new ArrayList<>();
        try (Connection conn = DatabaseManagement.getConnection()) {
            String sql = "SELECT * FROM coach WHERE specialite = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, sport);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Coach c = new Coach();
                c.setNom(rs.getString("nom"));
                c.setPrenom(rs.getString("prenom"));
                c.setSpecialite(rs.getString("specialite"));
                c.setTarifHoraire(rs.getDouble("tarif_horaire"));
                coachs.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("coachs", coachs);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
