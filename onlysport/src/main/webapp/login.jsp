<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/tailwindcss@3.0.0-alpha/dist/tailwind.min.css"></script>
    <style>
        /* Tailwind customizations for the page */
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light h-screen flex items-center justify-center">

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
        <img src="${pageContext.request.contextPath}/img/logo.jpeg" width="35">
            <span class="h4 text-primary">OnlySports</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="aboutus.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="Actualite.jsp">Actualite</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Need Help?</a></li>
            </ul>	
            <!-- Navbar Buttons -->
<div class="d-flex">
    <!-- Link to Login Page -->
    <a class="btn btn-outline-primary me-2" href="login.jsp">
        Login
    </a>
    <!-- Link to Sign Up Page -->
    <a class="btn btn-primary" href="register.jsp">
        Sign Up
    </a>
</div>
        </div>

    </div>

</nav>
    <!-- Main Content -->
    <div class="container mt-5 pt-5" style="max-width: 450px;">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
                <h3 class="card-title text-center mb-4 font-weight-bold">Connexion</h3>
                
                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger">Identifiants invalides</div>
                <% } %>

                <form action="login" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mot de passe</label>
                        <input type="password" name="mot_de_passe" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Se connecter</button>
                </form>

                <div class="mt-3 text-center">
                    <a href="register.jsp" class="text-decoration-none text-primary">Créer un compte</a> | 
                    <a href="forgot_password.jsp" class="text-decoration-none text-primary">Mot de passe oublié ?</a>
                </div>
            </div>
        </div>
    </div>
<!-- Footer -->
<jsp:include page="components/footer.jsp" />
    <!-- Bootstrap and Tailwind JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
