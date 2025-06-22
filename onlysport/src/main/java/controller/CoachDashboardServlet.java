package controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Coach;

@WebServlet("/coach/dashboard")
public class CoachDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userId = (Integer) req.getSession().getAttribute("userId");
        try {
            /* charge ou crée automatiquement la ligne coach */
            Coach coach = Coach.getOrCreateByUserId(userId);
            req.setAttribute("coach", coach);
            req.getRequestDispatcher("/WEB-INF/views/coach/dashboard.jsp")
               .forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
