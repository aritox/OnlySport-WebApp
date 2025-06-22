package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import utils.MailSender;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        try {
            User user = User.findByEmail(email);

            if (user != null) {
                String resetCode = String.valueOf((int) (Math.random() * 1000000));
                request.getSession().setAttribute("resetCode", resetCode);
                request.getSession().setAttribute("emailToReset", email);

                // Envoie de l'email
                MailSender.send(email, "Code de réinitialisation", "Votre code : " + resetCode);

                response.sendRedirect("reset_password.jsp");
            } else {
                response.sendRedirect("forgot_password.jsp?error=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgot_password.jsp?error=true");
        }
    }
}
