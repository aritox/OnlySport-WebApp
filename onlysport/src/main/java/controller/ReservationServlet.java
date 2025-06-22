package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.Coach;
import models.Seance;

@WebServlet("/reserverSeance")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Integer userId = (session != null)
                         ? (Integer) session.getAttribute("user_id")
                         : null;
        String role    = (session != null)
                         ? (String)  session.getAttribute("role")
                         : null;

        // accès réservé aux adhérents connectés
        if (userId == null || !"adherent".equalsIgnoreCase(role)) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            int seanceId = Integer.parseInt(req.getParameter("seanceId"));

            Seance seance = Seance.findById(seanceId);
            if (seance == null) {
                res.sendRedirect("seances?err=notFound");
                return;
            }

            Coach coach = Coach.findByUserId(seance.getCoachId());
            if (coach == null) {
                res.sendRedirect("seances?err=coachNotFound");
                return;
            }

            req.setAttribute("seance", seance);
            req.setAttribute("coach",  coach);
            req.getRequestDispatcher("/confirmation.jsp").forward(req, res);

        } catch (NumberFormatException e) {
            // ID mal formé
            res.sendRedirect("seances?err=badId");

        } catch (SQLException e) {
            // erreurs JDBC
            throw new ServletException("Erreur d'accès aux données", e);

        } catch (Exception e) {
            // toutes les autres (notamment la checked Exception de findByUserId)
            throw new ServletException("Erreur interne", e);
        }
    }
}
