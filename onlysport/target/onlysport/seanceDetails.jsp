<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation - OnlySports</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root{--primary-blue:#004E89;--accent-blue:#0077b6;--highlight-yellow:#FFD400;--pure-white:#fff}
        body{font-family:'Poppins',sans-serif;background:#f8f9fa}
        .hero-section{background:linear-gradient(45deg,var(--primary-blue)30%,var(--accent-blue)100%);
                      padding:6rem 0 4rem;clip-path:polygon(0 0,100% 0,100% 90%,0 100%);
                      color:var(--pure-white);margin-bottom:3rem}
        .session-card{background:var(--pure-white);border-radius:15px;border:none;
                      box-shadow:0 10px 30px rgba(0,0,0,.08);transition:transform .3s ease;
                      position:relative;overflow:hidden}
        .session-card:hover{transform:translateY(-5px)}
        .session-card::after{content:'';position:absolute;bottom:0;left:0;width:100%;height:4px;
                             background:var(--highlight-yellow);transform:scaleX(0);
                             transition:transform .3s ease}
        .session-card:hover::after{transform:scaleX(1)}
        .filter-section{background:var(--pure-white);border-radius:15px;
                        box-shadow:0 5px 20px rgba(0,0,0,.05);padding:2rem;margin:-80px auto 3rem;
                        max-width:800px}
        .form-control{border:2px solid var(--primary-blue);border-radius:10px;padding:.75rem 1.25rem}
        .btn-primary-custom{background:var(--primary-blue);color:#fff;padding:.75rem 2rem;
                            border-radius:10px;border:none;transition:.3s}
        .btn-primary-custom:hover{background:var(--accent-blue);transform:translateY(-2px)}
    </style>
</head>

<body>
<jsp:include page="components/navbar.jsp"/>

<!-- ✅ Toast succès -->
<c:if test="${param.added eq '1'}">
  <div class="alert alert-success text-center my-3">
    ✅ La séance a été créée avec succès !
  </div>
</c:if>

<!-- Hero -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-3">Trouvez votre séance</h1>
        <p class="lead">Réservez dès maintenant avec nos coachs certifiés</p>
    </div>
</section>

<!-- Filtre -->
<div class="container">
    <div class="filter-section">
        <form action="${pageContext.request.contextPath}/seances" method="GET">
            <div class="mb-3">
                <label class="form-label fw-bold text-primary-blue">Filtrer par Type de Séance</label>
                <select class="form-control" name="type">
                    <option value="">-- Tous --</option>
                    <option value="football" ${param.type == 'football' ? 'selected' : ''}>Football</option>
                    <option value="basketball" ${param.type == 'basketball' ? 'selected' : ''}>Basketball</option>
                    <option value="tennis" ${param.type == 'tennis' ? 'selected' : ''}>Tennis</option>
                    <option value="natation" ${param.type == 'natation' ? 'selected' : ''}>Natation</option>
                    <option value="boxe" ${param.type == 'boxe' ? 'selected' : ''}>Boxe</option>
                    <option value="yoga" ${param.type == 'yoga' ? 'selected' : ''}>Yoga</option>
                    <option value="musculation" ${param.type == 'musculation' ? 'selected' : ''}>Musculation</option>
                    <option value="escalade" ${param.type == 'escalade' ? 'selected' : ''}>Escalade</option>
                </select>
            </div>
            <div class="text-center">
                <button class="btn btn-primary-custom">
                    <i class="bi bi-funnel-fill me-2"></i>Filtrer
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Cartes séances -->
<div class="container my-5">
    <h2 class="text-center mb-5 fw-bold text-primary-blue">Séances Disponibles</h2>
    <div class="row g-4">
        <c:forEach var="seance" items="${seances}">
            <div class="col-md-6 col-lg-4">
                <div class="session-card h-100">
                    <div class="card-body p-4">
                        <span class="session-type">${seance.type}</span>

                        <h5 class="card-title fw-bold mb-3">${seance.nomCoach}</h5>

                        <div class="d-flex align-items-center mb-2">
                            <i class="bi bi-clock-fill text-primary-blue me-2"></i>
                            <span>${seance.duree} minutes</span>
                        </div>

                        <div class="d-flex align-items-center mb-2">
                            <i class="bi bi-geo-alt-fill text-primary-blue me-2"></i>
                            <span>${seance.endroit}</span>
                        </div>

                        <div class="d-flex align-items-center mb-2">
                            <i class="bi bi-speedometer2 text-primary-blue me-2"></i>
                            <span>Niveau ${seance.niveau}</span>
                        </div>

                        <div class="d-flex align-items-center mb-4">
                            <i class="bi bi-cash-coin text-primary-blue me-2"></i>
                            <span class="fw-bold">${seance.tarif} €</span>
                        </div>

                        <!-- Détails -->
                        <a class="btn btn-primary-custom w-100 mb-2"
                           href="${pageContext.request.contextPath}/seances?id=${seance.id}">
                           <i class="bi bi-info-circle-fill me-2"></i>Détails
                        </a>

                        <!-- Réserver -->
                        <form method="post" action="${pageContext.request.contextPath}/reserverSeance">
                            <input type="hidden" name="coachId" value="${seance.coachId}"/>
                            <input type="hidden" name="seanceId" value="${seance.id}"/>
                            <button class="btn btn-primary-custom w-100">
                                <i class="bi bi-calendar-check me-2"></i>Réserver
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
