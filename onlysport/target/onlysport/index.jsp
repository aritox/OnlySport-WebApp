<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'accueil - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<% 
    if (session != null) { // Si la session existe, récupérer le rôle
        String role = (String) session.getAttribute("role"); // Récupérer le rôle de l'utilisateur depuis la session
        if ("adherent".equals(role)) {
            response.sendRedirect("adherent-home.jsp"); // Rediriger vers la page d'accueil de l'adhérent
        } else if ("coach".equals(role)) {
            response.sendRedirect("coach-home.jsp"); // Rediriger vers la page d'accueil du coach
        }
    }
%>

<!-- Contenu de la page d'accueil si non connecté -->
<div class="container my-5">
    <h2 class="text-center mb-4">Bienvenue sur OnlySports</h2>
    <p class="text-center">Veuillez vous connecter pour accéder à votre espace.</p>
    <a href="login.jsp" class="btn btn-primary w-100">Se connecter</a>
</div>

</body>
</html>
