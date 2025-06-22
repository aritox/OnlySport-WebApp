package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.Message;

@WebServlet("/chat")
public class ChatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int convId = Integer.parseInt(req.getParameter("convId"));
            List<Message> messages = Message.getMessagesByConversation(convId);

            req.setAttribute("messages", messages);
            req.setAttribute("convId",   convId);
            req.getRequestDispatcher("/chat.jsp").forward(req, res);

        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Erreur lors du chargement du chat", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int convId       = Integer.parseInt(req.getParameter("convId"));
        String text      = req.getParameter("messageText");

        HttpSession session = req.getSession(false);
        Integer senderId = (session != null)
                           ? (Integer) session.getAttribute("user_id")
                           : null;

        if (senderId == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            Message.sendMessage(convId, senderId, text, "Adhérent");
            res.sendRedirect(req.getContextPath() + "/chat?convId=" + convId);

        } catch (SQLException e) {
            throw new ServletException("Erreur d'envoi du message", e);
        }
    }
}
