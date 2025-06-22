<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Seance, models.Coach" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation de Réservation</title>
</head>
<body>
    <h1>Confirmation de votre Réservation</h1>
    <h3>Détails de la Séance</h3>
    <p>Coach : ${coach.nom}</p>
    <p>Type de séance : ${seance.type}</p>
    <p>Durée : ${seance.duree} minutes</p>
    <p>Lieu : ${seance.endroit}</p>
    <p>Niveau : ${seance.niveau}</p>
    <p>Tarif : ${seance.tarif} €</p>

    <form action="${pageContext.request.contextPath}/confirmerReservation" method="POST">
        <input type="hidden" name="seanceId" value="${seance.id}" />
        <button type="submit">Confirmer la Réservation</button>
    </form>

    <form action="${pageContext.request.contextPath}/seances" method="GET">
        <button type="submit">Retour aux Séances</button>
    </form>
</body>
</html>
