<%@ page contentType="text/html;charset=UTF-8" %>

<!-- Navbar globale -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container">

    <!-- Logo -->
    <a class="navbar-brand d-flex align-items-center gap-1" href="index.jsp">
    <img src="${pageContext.request.contextPath}/img/logo.jpeg" width="35">
      <span class="h4 mb-0 text-primary">OnlySports</span>
    </a>

    <!-- Burger mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <%-- ---------- Détection de connexion ---------- --%>
    <%
        String role        = (String) session.getAttribute("role");   // "coach" | "adherent" | null
        boolean loggedIn   = (role != null);
        String displayName = (String) session.getAttribute("prenom"); // ou "Profil" par défaut
        if (displayName == null) displayName = "Profil";
    %>

    <div class="collapse navbar-collapse" id="navbarNav">

      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="Actualite.jsp">Actualité</a></li>
        <li class="nav-item"><a class="nav-link" href="help.jsp">Need Help?</a></li>
      </ul>

      <% if (!loggedIn) { %>
        <!-- Non connecté -->
        <div class="d-flex">
          <a class="btn btn-outline-primary me-2" href="login.jsp">Login</a>
          <a class="btn btn-primary" href="register.jsp">Sign Up</a>
        </div>
      <% } else { %>
        <!-- Connecté -->
        <div class="dropdown">
          <button class="btn btn-outline-primary dropdown-toggle" type="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-person-circle me-1"></i><%= displayName %>
          </button>
          <ul class="dropdown-menu dropdown-menu-end">
            <% if ("coach".equalsIgnoreCase(role)) { %>
              <li><a class="dropdown-item" href="coach-dashboard.jsp"><i class="bi bi-speedometer2 me-2"></i>Dashboard coach</a></li>
            <% } else { %>
              <li><a class="dropdown-item" href="adherent-home.jsp"><i class="bi bi-layout-text-sidebar-reverse me-2"></i>Mon espace</a></li>
            <% } %>

            <li><a class="dropdown-item" href="coach-dashboard.jsp"><i class="bi bi-gear me-2"></i>Paramètres du profil</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="<%= request.getContextPath() %>/logout">
    <i class="bi bi-box-arrow-right me-2"></i>Se déconnecter
</a>

          </ul>
        </div>
      <% } %>

    </div>
  </div>
</nav>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
