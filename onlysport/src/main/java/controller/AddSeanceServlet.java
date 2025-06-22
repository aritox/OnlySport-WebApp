package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Seance;

@WebServlet("/addSeance")
public class AddSeanceServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		req.getRequestDispatcher("ajouter_seance.jsp").forward(req, res);
	}
	

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);

        /* ----------- sécurité : coach connecté ? -------- */
        if (session == null || session.getAttribute("coach_id") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        int coachId   = (Integer) session.getAttribute("coach_id");
        String prenom = (String)  session.getAttribute("prenom");

        /* ----------- construire la séance ---------------- */
        Seance s = new Seance();
        s.setDuree(   Integer.parseInt(req.getParameter("duree")));
        s.setFeedback(req.getParameter("feedback"));
        s.setEndroit( req.getParameter("endroit"));
        s.setNiveau(  req.getParameter("niveau"));
        s.setTarif(   Float.parseFloat(req.getParameter("tarif")));
        s.setType(    req.getParameter("type"));
        s.setCoachId( coachId);
        s.setNomCoach(prenom);

        /* ----------- insertion + redirection ------------- */
        try {
            s.save();
            // flag pour afficher le toast dans reservation.jsp
            res.sendRedirect(req.getContextPath() + "/addSeance?added=1");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
