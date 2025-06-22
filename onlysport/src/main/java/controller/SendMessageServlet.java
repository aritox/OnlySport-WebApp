package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Message;

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Récupérer le paramètre 'convId' et 'messageText' depuis la requête
        int convId = Integer.parseInt(req.getParameter("convId"));
        String messageText = req.getParameter("messageText");

        // Récupérer l'id de l'adhérent à partir de la session
        HttpSession session = req.getSession(false);
        Integer adherentId = (session != null) ? (Integer) session.getAttribute("adherent_id") : null;

        // Si l'adhérent n'est pas connecté, rediriger vers la page de login
        if (adherentId == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        // Validation du texte du message
        if (messageText == null || messageText.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Le message ne peut pas être vide.");
            req.getRequestDispatcher("chat.jsp?convId=" + convId).forward(req, res);
            return;
        }

        try {
            // Envoi du message dans la conversation
            Message.sendMessage(convId, adherentId, messageText, "Adhérent");

            // Rediriger vers la page du chat avec le message envoyé
            res.sendRedirect("chat.jsp?convId=" + convId);
        } catch (Exception e) {
            // En cas d'erreur, rediriger avec un message d'erreur
            req.setAttribute("errorMessage", "Erreur lors de l'envoi du message.");
            req.getRequestDispatcher("chat.jsp?convId=" + convId).forward(req, res);
        }
    }
}
