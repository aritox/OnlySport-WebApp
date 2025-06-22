package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Seance;

@WebServlet("/seances")
public class SeanceDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Récupère le paramètre 'type' de la requête
        String type = req.getParameter("type");  
        List<Seance> seances = null;

        try {
            // Si un type est sélectionné, on filtre les séances par ce type
            if (type != null && !type.isEmpty()) {
                seances = Seance.find(type);  // Filtrage uniquement par type
                System.out.println("Séances filtrées par type : " + type);  // Affichage pour débogage
            } else {
                // Sinon, on récupère toutes les séances
                seances = Seance.find(null);  // Récupère toutes les séances
                System.out.println("Aucun type sélectionné, récupération de toutes les séances.");
            }

            // Passe les séances filtrées à la JSP
            req.setAttribute("seances", seances);  
            req.getRequestDispatcher("seanceDetails.jsp").forward(req, res);

        } catch (SQLException e) {
            throw new ServletException("Erreur lors de la récupération des séances", e);
        }
    }
}


