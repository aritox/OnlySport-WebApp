package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Coach;

@WebServlet("/coach/profile")
public class CoachProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userId = (Integer) req.getSession().getAttribute("userId");
        try {
            Coach c = Coach.getOrCreateByUserId(userId);

            c.setNom(req.getParameter("nom"));
            c.setPrenom(req.getParameter("prenom"));
            c.setSpecialite(req.getParameter("specialite"));
            c.setTarifHoraire(Double.parseDouble(req.getParameter("tarif")));
            c.setBio(req.getParameter("bio"));
            c.save();                                  // ← nouveau nom

            resp.sendRedirect(req.getContextPath() + "/coach/dashboard?ok");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}


