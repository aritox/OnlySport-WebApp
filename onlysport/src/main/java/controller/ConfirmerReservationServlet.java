package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.Reservation;
import models.Seance;
import models.Conversation;

@WebServlet("/confirmerReservation")
public class ConfirmerReservationServlet extends HttpServlet {

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

        if (userId == null || !"adherent".equalsIgnoreCase(role)) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            int seanceId = Integer.parseInt(req.getParameter("seanceId"));

            // 1. créer la réservation
            Reservation.create(seanceId, userId);

            // 2. s'assurer qu'une conversation existe
            Seance seance = Seance.findById(seanceId);
            int coachId   = seance.getCoachId();
            int convId    = Conversation.ensureConversation(coachId, userId);

            // 3. rediriger vers le chat (=> ChatServlet)
            res.sendRedirect(req.getContextPath() + "/chat?convId=" + convId);

        } catch (NumberFormatException | SQLException e) {
            res.sendRedirect("seances?err=confirmer");
        }
    }
}
