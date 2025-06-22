<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Coach – OnlySports</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Animations & Custom styles -->
    <style>
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}  
            to   {opacity: 1; transform: translateY(0);}  
        }
        .animate-fade-in{animation: fadeIn .6s ease-out;}

        .session-card{transition: all .3s ease; cursor: pointer;}
        .session-card:hover{transform: translateY(-5px); box-shadow:0 10px 20px rgba(0,0,0,.1);}

        .status-badge{position:absolute; top:10px; right:10px;}
    </style>
</head>
<body class="bg-light">

<!-- Barre de navigation commune -->
<jsp:include page="components/navbar.jsp"/>

<main class="container py-5">
    <!-- En‑tête & actions rapides -->
    <div class="animate-fade-in d-flex flex-wrap justify-content-between align-items-center mb-5 gap-2">
        <div>
            <!-- Affichage dynamique du prénom coach alimenté par la session -->
            <h1 class="display-5 fw-bold text-primary mb-1"><i class="bi bi-person-badge me-2"></i>Bienvenue&nbsp;Coach&nbsp;<%= session.getAttribute("prenom") %></h1>
            <p class="lead text-muted mb-0">Gérez vos séances et suivez vos participants</p>
        </div>
        <div class="d-flex gap-2">
            <!-- Nouveau : créer séance -->
            <a href="ajouter_seance.jsp" class="btn btn-primary btn-lg"><i class="bi bi-plus-circle me-2"></i>Créer une séance</a>
            <!-- Nouveau : modifier profil -->
            <a href="coach-dashboard.jsp" class="btn btn-outline-secondary btn-lg"><i class="bi bi-person-gear me-2"></i>Modifier mon profil</a>
        </div>
    </div>

    <!-- Statistiques rapides (valeurs statiques pour le front ; à brancher plus tard) -->
    <div class="row g-4 mb-5 animate-fade-in">
        <div class="col-md-4">
            <div class="card bg-primary text-white shadow h-100">
                <div class="card-body text-center py-4">
                    <h5 class="card-title mb-2"><i class="bi bi-calendar-check me-2"></i>Séances à venir</h5>
                    <p class="display-4 fw-bold mb-0">12</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-success text-white shadow h-100">
                <div class="card-body text-center py-4">
                    <h5 class="card-title mb-2"><i class="bi bi-people me-2"></i>Participants total</h5>
                    <p class="display-4 fw-bold mb-0">86</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-info text-white shadow h-100">
                <div class="card-body text-center py-4">
                    <h5 class="card-title mb-2"><i class="bi bi-star me-2"></i>Note moyenne</h5>
                    <p class="display-4 fw-bold mb-0">4.8/5</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Liste exemple de prochaines séances (placeholders front) -->
    <div class="card shadow-lg animate-fade-in">
        <div class="card-header bg-white border-bottom-0"><h3 class="h4 mb-0"><i class="bi bi-list-task text-primary me-2"></i>Vos prochaines séances</h3></div>
        <div class="card-body p-4">
            <div class="row g-4">
                <!-- Exemple 1 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card session-card h-100 shadow-sm position-relative">
                        <span class="badge bg-success status-badge">Active</span>
                        <div class="card-body">
                            <h5 class="card-title text-primary">Cardio Training</h5>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-calendar-date me-2 text-muted"></i><div><small class="text-muted">Date</small><p class="mb-0 fw-bold">12/05/2025</p></div></div>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-geo-alt me-2 text-muted"></i><div><small class="text-muted">Lieu</small><p class="mb-0 fw-bold">Salle A</p></div></div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center"><i class="bi bi-people me-2 text-muted"></i><span class="fw-bold">8&nbsp;participants</span></div>
                                <a href="#" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil-square"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Exemple 2 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card session-card h-100 shadow-sm position-relative">
                        <span class="badge bg-success status-badge">Active</span>
                        <div class="card-body">
                            <h5 class="card-title text-primary">Séance HIIT</h5>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-calendar-date me-2 text-muted"></i><div><small class="text-muted">Date</small><p class="mb-0 fw-bold">15/05/2025</p></div></div>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-geo-alt me-2 text-muted"></i><div><small class="text-muted">Lieu</small><p class="mb-0 fw-bold">Terrain extérieur</p></div></div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center"><i class="bi bi-people me-2 text-muted"></i><span class="fw-bold">12&nbsp;participants</span></div>
                                <a href="#" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil-square"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Exemple 3 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card session-card h-100 shadow-sm position-relative">
                        <span class="badge bg-warning status-badge">Brouillon</span>
                        <div class="card-body">
                            <h5 class="card-title text-primary">Prépa Marathon</h5>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-calendar-date me-2 text-muted"></i><div><small class="text-muted">Date</small><p class="mb-0 fw-bold">—</p></div></div>
                            <div class="d-flex align-items-center mb-3"><i class="bi bi-geo-alt me-2 text-muted"></i><div><small class="text-muted">Lieu</small><p class="mb-0 fw-bold">À définir</p></div></div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center"><i class="bi bi-people me-2 text-muted"></i><span class="fw-bold">0&nbsp;participant</span></div>
                                <a href="#" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil-square"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Aucune séance (masquer si au moins une carte) -->
            
            <div class="text-center py-5">
                <i class="bi bi-calendar-x display-1 text-muted"></i>
                <h4 class="mt-3">Aucune séance programmée</h4>
                <p class="text-muted">Commencez par créer votre première séance</p>
            </div>
            
        </div>
    </div>

</main>

<!-- Pied de page commun -->
<jsp:include page="components/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
