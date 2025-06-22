<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nouveau mot de passe - OnlySports</title>
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
                <h3 class="card-title text-center mb-4">Définir nouveau mot de passe</h3>

                <% if (request.getParameter("error") != null) { 
                    String error = request.getParameter("error");
                    String message = "";
                    if ("invalid".equals(error)) {
                        message = "Code invalide ou expiré";
                    } else if ("mismatch".equals(error)) {
                        message = "Les mots de passe ne correspondent pas";
                    }
                %>
                    <div class="alert alert-danger"><%= message %></div>
                <% } %>

                <form action="reset-password" method="POST">
                    <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                    
                    <div class="mb-3">
                        <label class="form-label">Code de vérification</label>
                        <input type="text" name="code" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nouveau mot de passe</label>
                        <input type="password" name="newPassword" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Confirmer le mot de passe</label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Réinitialiser</button>
                </form>

                <div class="mt-3 text-center">
                    <a href="forgotpassword.jsp" class="text-decoration-none">Renvoyer le code</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>