package controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the registration form parameters
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("mot_de_passe");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String role = request.getParameter("role");
        LocalDate dateInscription = LocalDate.now();

        // Create a new user object
        User user = new User(email, motDePasse, nom, prenom);
        user.setRole(role);
        user.setDateInscription(dateInscription);

        // Try registering the user
        if (user.registerUser()) {
            // Redirect to the login page after successful registration
            response.sendRedirect("login.jsp");
        } else {
            // If registration failed, show an error message
            response.getWriter().println("Error: User registration failed.");
        }
    }
}
