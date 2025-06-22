package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;  // Import the User model directly

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data and session attributes
        String code = request.getParameter("code");
        String newPassword = request.getParameter("newPassword");

        String expectedCode = (String) request.getSession().getAttribute("resetCode");
        String email = (String) request.getSession().getAttribute("emailToReset");

        // Check if the entered reset code matches the expected code
        if (expectedCode != null && expectedCode.equals(code)) {
            // Call the updatePassword method from the User class
			User user = new User();
			boolean success = user.updatePassword(email, newPassword);

			if (success) {
			    // Remove session attributes after successful password reset
			    request.getSession().removeAttribute("resetCode");
			    request.getSession().removeAttribute("emailToReset");

			    response.sendRedirect("login.jsp?reset=success");
			} else {
			    response.sendRedirect("reset_password.jsp?error=update");
			}
        } else {
            response.sendRedirect("reset_password.jsp?error=code");
        }
    }
}
