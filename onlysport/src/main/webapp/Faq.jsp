<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ – OnlySports</title>

    <!-- Bootstrap 5 & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        :root {
            --primary-blue: #004E89;
            --highlight-yellow: #FFD400;
            --pure-white: #ffffff;
        }
        html, body { height: 100%; }
        body {
            display: flex; flex-direction: column; min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
        }
        main { flex: 1; }

        /* Navbar override */
        .navbar {
            background: var(--pure-white) !important;
            box-shadow: 0 2px 15px rgba(0,0,0,.1);
            padding: 1rem 0;
        }
        .nav-link {
            color: var(--primary-blue) !important;
            font-weight: 500;
            margin: 0 1.5rem;
            position: relative;
        }
        .nav-link:hover::after {
            content: ''; position: absolute; bottom: -5px; left: 0;
            width: 100%; height: 2px; background: var(--highlight-yellow);
        }

        /* FAQ headings */
        .faq-category { 
            margin: 4rem 0 2rem; 
            color: var(--primary-blue);
            font-weight: 700;
            font-size: 1.8rem;
            padding-left: 1rem;
            border-left: 4px solid var(--highlight-yellow);
        }

        /* Accordion styling */
        .accordion-button {
            background: rgba(0, 78, 137, 0.05);
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .accordion-button:not(.collapsed) {
            background: var(--primary-blue);
            color: white;
        }

        .accordion-button:focus {
            box-shadow: none;
        }

        .accordion-body {
            background: rgba(0, 78, 137, 0.03);
            line-height: 1.7;
        }

        .accordion-item {
            border: none;
            margin-bottom: 0.5rem;
        }

        /* Hero section */
        .faq-hero {
            background: linear-gradient(45deg, var(--primary-blue) 30%, #0077b6 100%);
            padding: 5rem 0 3rem;
            color: white;
            margin-bottom: 3rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
        }

        @media (max-width: 768px) {
            .faq-hero {
                padding: 3rem 0 2rem;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .faq-category {
                font-size: 1.5rem;
                margin: 3rem 0 1.5rem;
            }
        }
    </style>
</head>

<body>
    <!-- Barre de navigation -->
    <jsp:include page="components/navbar.jsp" />

    <div class="faq-hero">
        <div class="container text-center">
            <h1 class="display-5 fw-bold mb-3">FAQ OnlySports</h1>
            <p class="lead">Trouvez rapidement les réponses à vos questions</p>
        </div>
    </div>

    <main class="container py-4">
        <!-- Le contenu des accordéons reste identique -->
         <!-- ===== Account & Registration ===== -->
        <h3 class="faq-category">Account &amp; Registration</h3>
        <div class="accordion" id="accAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="acc-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#acc-collapse-1" aria-expanded="false" aria-controls="acc-collapse-1">
                        How do I reset my password?
                    </button>
                </h2>
                <div id="acc-collapse-1" class="accordion-collapse collapse" data-bs-parent="#accAccordion"
                     aria-labelledby="acc-heading-1">
                    <div class="accordion-body">
                        Use the “Forgot Password” link on the login page. We’ll email a reset link.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="acc-heading-2">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#acc-collapse-2" aria-expanded="false" aria-controls="acc-collapse-2">
                        Can I delete my account permanently?
                    </button>
                </h2>
                <div id="acc-collapse-2" class="accordion-collapse collapse" data-bs-parent="#accAccordion"
                     aria-labelledby="acc-heading-2">
                    <div class="accordion-body">
                        Yes. Go to Account › Settings › Delete Account. Data is fully removed within 72 h.
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Booking & Sessions ===== -->
        <h3 class="faq-category">Booking &amp; Sessions</h3>
        <div class="accordion" id="bookAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="book-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#book-collapse-1" aria-expanded="false" aria-controls="book-collapse-1">
                        What should I bring to my first session?
                    </button>
                </h2>
                <div id="book-collapse-1" class="accordion-collapse collapse" data-bs-parent="#bookAccordion"
                     aria-labelledby="book-heading-1">
                    <div class="accordion-body">
                        Bring workout clothes, water, and any equipment requested by your coach.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="book-heading-2">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#book-collapse-2" aria-expanded="false" aria-controls="book-collapse-2">
                        How do I track my session attendance?
                    </button>
                </h2>
                <div id="book-collapse-2" class="accordion-collapse collapse" data-bs-parent="#bookAccordion"
                     aria-labelledby="book-heading-2">
                    <div class="accordion-body">
                        Attendance is automatically tracked. Check “My Sessions” for your history.
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Payments & Pricing ===== -->
        <h3 class="faq-category">Payments &amp; Pricing</h3>
        <div class="accordion" id="payAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="pay-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#pay-collapse-1" aria-expanded="false" aria-controls="pay-collapse-1">
                        What payment methods do you accept?
                    </button>
                </h2>
                <div id="pay-collapse-1" class="accordion-collapse collapse" data-bs-parent="#payAccordion"
                     aria-labelledby="pay-heading-1">
                    <div class="accordion-body">
                        We accept major credit cards, PayPal and select crypto options.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="pay-heading-2">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#pay-collapse-2" aria-expanded="false" aria-controls="pay-collapse-2">
                        What’s your refund policy?
                    </button>
                </h2>
                <div id="pay-collapse-2" class="accordion-collapse collapse" data-bs-parent="#payAccordion"
                     aria-labelledby="pay-heading-2">
                    <div class="accordion-body">
                        Full refund within 24 h of booking, partial refund up to 1 h before start.
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Technical Support ===== -->
        <h3 class="faq-category">Technical Support</h3>
        <div class="accordion" id="techAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="tech-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#tech-collapse-1" aria-expanded="false" aria-controls="tech-collapse-1">
                        The app won’t load my schedule – what should I do?
                    </button>
                </h2>
                <div id="tech-collapse-1" class="accordion-collapse collapse" data-bs-parent="#techAccordion"
                     aria-labelledby="tech-heading-1">
                    <div class="accordion-body">
                        Refresh the page or clear cache. If it persists, contact support with your user ID.
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Safety & Privacy ===== -->
        <h3 class="faq-category">Safety &amp; Privacy</h3>
        <div class="accordion" id="safeAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="safe-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#safe-collapse-1" aria-expanded="false" aria-controls="safe-collapse-1">
                        How is my payment information protected?
                    </button>
                </h2>
                <div id="safe-collapse-1" class="accordion-collapse collapse" data-bs-parent="#safeAccordion"
                     aria-labelledby="safe-heading-1">
                    <div class="accordion-body">
                        We use SSL and PCI‑compliant processors. We never store full card details.
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Training Programs ===== -->
        <h3 class="faq-category">Training Programs</h3>
        <div class="accordion" id="trainAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="train-heading-1">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                            data-bs-target="#train-collapse-1" aria-expanded="false" aria-controls="train-collapse-1">
                        Can I customize my training program?
                    </button>
                </h2>
                <div id="train-collapse-1" class="accordion-collapse collapse" data-bs-parent="#trainAccordion"
                     aria-labelledby="train-heading-1">
                    <div class="accordion-body">
                        Absolutely! Coordinate with your coach to adapt exercises, intensity and frequency.
                    </div>
                </div>
            </div>
        </div>
        <!-- Section contact additionnelle -->
        <div class="text-center my-5 py-4">
            <h3 class="mb-4" style="color: var(--primary-blue);">Vous ne trouvez pas votre réponse ?</h3>
            <a href="help.jsp" class="btn btn-lg text-white" 
               style="background: var(--primary-blue); padding: 0.8rem 2rem; border-radius: 30px;">
               <i class="bi bi-headset me-2"></i>Contactez le support
            </a>
        </div>
    </main>

    <!-- Pied de page -->
    <jsp:include page="components/footer.jsp" />

    <!-- JS Bootstrap (bundle = Popper + BS) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>