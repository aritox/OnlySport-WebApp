package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Supprimer la session utilisateur
        HttpSession session = request.getSession(false); // false = ne pas créer de nouvelle session
        if (session != null) {
            session.invalidate(); // détruit la session
        }

        // Redirection vers la page de login
        response.sendRedirect("login.jsp");
    }
}
