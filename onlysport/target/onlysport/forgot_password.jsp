<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mot de passe oublié - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">OnlySports</a>
        </div>
    </nav>

    <div class="container mt-5" style="max-width: 400px;">
        <div class="card shadow">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">Réinitialisation du mot de passe</h3>

                <% if (request.getParameter("error") != null) { 
                    String error = request.getParameter("error");
                    String message = "";
                    if ("email".equals(error)) {
                        message = "Aucun compte associé à cet email";
                    } else if ("code".equals(error)) {
                        message = "Code déjà envoyé";
                    }
                %>
                    <div class="alert alert-danger"><%= message %></div>
                <% } %>

                <% if (request.getParameter("success") != null) { %>
                    <div class="alert alert-success">Un code de réinitialisation a été envoyé à votre email</div>
                <% } %>

                <form action="forgot-password" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Envoyer le code</button>
                </form>

                <div class="mt-3 text-center">
                    <a href="login.jsp" class="text-decoration-none">Retour à la connexion</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>