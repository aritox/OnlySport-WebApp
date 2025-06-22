<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="coach" class="models.Coach" scope="request" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Espace Coach - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #004E89;
            --accent-blue: #0077b6;
            --highlight-yellow: #FFD400;
            --pure-white: #ffffff;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background: var(--pure-white) !important;
            box-shadow: 0 2px 15px rgba(0,0,0,.1);
        }
        .nav-link {
            color: var(--primary-blue) !important;
            font-weight: 500;
            position: relative;
        }
        .nav-link:hover::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--highlight-yellow);
        }
        .card {
            background: var(--pure-white);
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .section-title {
            color: var(--primary-blue);
            border-bottom: 3px solid var(--highlight-yellow);
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .btn-primary {
            background: var(--primary-blue);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: var(--accent-blue);
            transform: translateY(-2px);
        }

        .badge-skill {
            background: var(--highlight-yellow);
            color: var(--primary-blue);
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }

        .alert-success {
            background: rgba(0,78,137,0.1);
            border: 2px solid var(--primary-blue);
            color: var(--primary-blue);
        }

        main {
            flex: 1;
            padding-bottom: 4rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="components/navbar.jsp" />

    <main class="container my-5">
        <!-- Message succès -->
        <c:if test="${not empty param.ok}">
            <div class="alert alert-success mb-4">Mise à jour effectuée avec succès !</div>
        </c:if>

        <!-- Carte profil -->
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">
                    ${coach.prenom} ${coach.nom}
                    <small class="text-muted">(${coach.specialite})</small>
                </h3>
                <div class="d-flex gap-3 mb-3">
                    <span class="badge-skill">${coach.tarifHoraire}€/h</span>
                    <span class="badge-skill">${coach.certification}</span>
                </div>
                <p class="lead">${coach.bio}</p>
                <a href="${pageContext.request.contextPath}/coach/profile" 
                   class="btn btn-primary">
                   <i class="bi bi-pencil-square me-2"></i>Modifier le profil
                </a>
            </div>
        </div>

        <!-- Certifications -->
        <section class="card">
            <div class="card-body">
                <h4 class="section-title">Mes certifications</h4>
                
                <c:choose>
                    <c:when test="${coach.certification.isEmpty()}">
                        <p class="text-muted fst-italic">Aucune certification enregistrée</p>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-group mb-4">
                            <c:forEach var="cert" items="${coach.certification}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>${cert}</span>
                                    <form method="post" class="m-0">
                                        <input type="hidden" name="action" value="delCert">
                                        <input type="hidden" name="titre" value="${cert}">
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>

                <form method="post" class="row g-3">
                    <input type="hidden" name="action" value="addCert"/>
                    <div class="col-md-6">
                        <input name="titre" class="form-control" 
                               placeholder="Nouvelle certification" required>
                    </div>
                    <div class="col-auto">
                        <button class="btn btn-primary">
                            <i class="bi bi-plus-lg me-2"></i>Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </section>

        <!-- Compétences -->
        <section class="card">
            <div class="card-body">
                <h4 class="section-title">Mes compétences</h4>

                <c:choose>
                    <c:when test="${coach.skills.isEmpty()}">
                        <p class="text-muted fst-italic">Aucune compétence enregistrée</p>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-group mb-4">
                            <c:forEach var="sk" items="${coach.skills}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>
                                        <strong>${sk.nom}</strong>
                                        <span class="badge-skill ms-2">${sk.niveau}</span>
                                    </div>
                                    <form method="post" class="m-0">
                                        <input type="hidden" name="action" value="delSkill">
                                        <input type="hidden" name="nom" value="${sk.nom}">
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>

                <form method="post" class="row g-3 align-items-end">
                    <input type="hidden" name="action" value="addSkill"/>
                    <div class="col-md-4">
                        <input name="nom" class="form-control" 
                               placeholder="Compétence" required>
                    </div>
                    <div class="col-md-4">
                        <select name="niveau" class="form-select">
                            <option>Débutant</option>
                            <option>Intermédiaire</option>
                            <option>Expert</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button class="btn btn-primary">
                            <i class="bi bi-plus-lg me-2"></i>Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>