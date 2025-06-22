package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("mot_de_passe");

        // Fetch the user from the database based on the email
        User user = User.findByEmail(email);

        // Compare the provided password with the stored password (plain text)
        if (user != null && user.getPassword().equals(password)) {
            // User found and password matches, create a session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("prenom", user.getPrenom());
            session.setAttribute("coach_id", user.getId());     // ← OBLIGATOIRE
            session.setAttribute("prenom",   user.getPrenom()); // pour l’affichage// Used for displaying in navbar

            // Redirect user based on their role
            if ("coach".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("coach-home.jsp");  // Redirect to coach's page
            } else if ("adherent".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("adherent-home.jsp");  // Redirect to adherent's page
            } else {
                response.getWriter().println("Role not recognized.");
            }
        } else {
            // Invalid credentials
            response.getWriter().println("Error: Incorrect credentials.");
        }
    }
}
