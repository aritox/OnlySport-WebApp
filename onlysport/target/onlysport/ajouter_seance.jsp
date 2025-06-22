<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Séance - OnlySports</title>

    <!-- Bootstrap & style local -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand,.btn-group .btn{font-weight:bold}
        .form-container{background-color:#f8f9fa;padding:2rem;border-radius:10px;
                        box-shadow:0 0 15px rgba(0,0,0,.1)}
        .btn-submit{background-color:#0077b6;color:#fff;font-weight:bold}
    </style>
</head>

<body class="bg-light">
<jsp:include page="components/navbar.jsp"/>

<div class="container my-5">
    <h2 class="text-center mb-4">Ajouter une Séance</h2>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/addSeance" method="POST">

            <!-- affichage nom/prénom coach (vient de la session) -->
            <div class="mb-3">
                <label class="form-label">Coach responsable</label>
                <input type="text" class="form-control"
                       value="${sessionScope.prenom}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Durée (en minutes)</label>
                <input type="number" class="form-control" name="duree" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Feedback</label>
                <textarea class="form-control" name="feedback" required></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Endroit</label>
                <input type="text" class="form-control" name="endroit" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Niveau</label>
                <input type="text" class="form-control" name="niveau" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Tarif (en dinars)</label>
                <input type="number" class="form-control" name="tarif" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Type de Séance</label>
                <select class="form-control" name="type" required>
                    <option value="football">Football</option>
                    <option value="basketball">Basketball</option>
                    <option value="tennis">Tennis</option>
                    <option value="natation">Natation</option>
                    <option value="boxe">Boxe</option>
                    <option value="yoga">Yoga</option>
                    <option value="musculation">Musculation</option>
                    <option value="escalade">Escalade</option>
                </select>
            </div>

            <button type="submit" class="btn btn-submit w-100">Ajouter la Séance</button>
        </form>
    </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
