<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inscription - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <!-- Même navbar que login.jsp -->

    <div class="container mt-5" style="max-width: 400px;">
        <div class="card shadow">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">Inscription</h3>

                <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger">
        <%
            String error = request.getParameter("error");
            String message;
            if ("1".equals(error)) {
                message = "Erreur lors de l'inscription";
            } else if ("2".equals(error)) {
                message = "Erreur technique";
            } else {
                message = "Erreur inconnue";
            }
            out.print(message);
        %>
    </div>
<% } %>

                <form action="register" method="POST">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Nom</label>
                            <input type="text" name="nom" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Prénom</label>
                            <input type="text" name="prenom" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mot de passe</label>
                        <input type="password" name="mot_de_passe" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Rôle</label>
                        <select name="role" class="form-select" required>
                            <option value="adherent">Adhérent</option>
                            <option value="coach">Coach</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>