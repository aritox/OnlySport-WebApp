<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Adhérent - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animated-section {
            animation: fadeIn 0.8s ease-out;
        }
        .sport-card:hover {
            transform: translateY(-5px);
            transition: transform 0.3s ease;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
    </style>
</head>
<body class="gradient-bg">
    <!-- Navbar -->
    <jsp:include page="components/navbar.jsp" />

    <main class="container py-5">
        <section class="animated-section mb-5">
            <div class="text-center mb-4">
                <h1 class="display-4 fw-bold text-primary">Bienvenue Adhérent</h1>
                <p class="lead">Réservez votre séance avec un coach certifié</p>
            </div>

            <!-- Formulaire de réservation -->
            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-body p-4">
                    <form action="reservation.jsp" method="GET">
                        <div class="row g-3 align-items-center">
                            <div class="col-md-8">
                                <label for="sport" class="form-label h5">Choisissez votre sport</label>
                                <select name="sport" id="sport" class="form-select form-select-lg">
                                    <option value="football">⚽ Football</option>
                                    <option value="basketball">🏀 Basketball</option>
                                    <option value="tennis">🎾 Tennis</option>
                                    <option value="natation">🏊 Natation</option>
                                    <option value="boxe">🥊 Boxe</option>
                                    <option value="yoga">🧘 Yoga</option>
                                    <option value="musculation">🏋️ Musculation</option>
                                    <option value="escalade">🧗 Escalade</option>
                                </select>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary btn-lg w-100">
                                    Réserver maintenant
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Section Chatbot -->
        <section class="animated-section mb-5">
            <div class="card shadow border-0 rounded-3">
                <div class="card-body p-4 text-center">
                    <h2 class="h3 mb-3">Assistant virtuel</h2>
                    <p class="text-muted mb-4">Besoin d'aide ? Notre chatbot est à votre disposition</p>
                    <a href="chatbot.jsp" class="btn btn-success btn-lg px-5">
                        � Démarrer le Chatbot
                    </a>
                </div>
            </div>
        </section>

        <!-- Section Sports populaires -->
<section class="animated-section">
    <h2 class="h3 mb-4 text-center">Découvrez nos sports</h2>
    <div class="row g-4">
        <!-- Football -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=football" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm hover-shadow-lg transition-all">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">⚽</div>
                        <h3 class="h5 text-dark">Football</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Basketball -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=basketball" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🏀</div>
                        <h3 class="h5 text-dark">Basketball</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Tennis -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=tennis" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🎾</div>
                        <h3 class="h5 text-dark">Tennis</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Natation -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=natation" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🏊</div>
                        <h3 class="h5 text-dark">Natation</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Boxe -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=boxe" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🥊</div>
                        <h3 class="h5 text-dark">Boxe</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Yoga -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=yoga" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🧘</div>
                        <h3 class="h5 text-dark">Yoga</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Musculation -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=musculation" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🏋️</div>
                        <h3 class="h5 text-dark">Musculation</h3>
                    </div>
                </div>
            </a>
        </div>

        <!-- Escalade -->
        <div class="col-md-3 col-6">
            <a href="reservation.jsp?sport=escalade" class="text-decoration-none">
                <div class="card sport-card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">🧗</div>
                        <h3 class="h5 text-dark">Escalade</h3>
                    </div>
                </div>
            </a>
        </div>
    </div>
</section>
    </main>

    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>