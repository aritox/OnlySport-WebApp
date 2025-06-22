<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recherche Coach - OnlySport</title>
</head>
<body>

    <h2>Rechercher un Coach par Sport</h2>

    <form action="search" method="get">
        <label for="sport">Choisissez un sport :</label>
        <select name="sport" id="sport">
            <option value="football">Football</option>
            <option value="tennis">Tennis</option>
            <option value="basket">Basket</option>
            <option value="volley">Volley</option>
            <option value="natation">Natation</option>
        </select>
        <input type="submit" value="Rechercher">
    </form>

    <hr>

    <%
        java.util.List<models.Coach> coachs = (java.util.List<models.Coach>) request.getAttribute("coachs");
        if (coachs != null && !coachs.isEmpty()) {
    %>
        <h3>Résultats :</h3>
        <ul>
        <% for (models.Coach c : coachs) { %>
            <li>
                <strong><%= c.getNom() %> <%= c.getPrenom() %></strong><br>
                Specialité : <%= c.getSpecialite() %><br>
                Tarif horaire : <%= c.getTarifHoraire() %> €<br>
                Certification : <%= c.getCertification() %>
            </li>
            <br>
        <% } %>
        </ul>
    <% } else if (coachs != null) { %>
        <p>Aucun coach trouvé pour ce sport.</p>
    <% } %>

</body>
</html>
