<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-blue: #004E89;
            --accent-blue: #0077b6;
            --pure-white: #ffffff;
            --highlight-yellow: #FFD400;
            --dark-bg: #2d2d2d;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: var(--pure-white) !important;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }

        .nav-link {
            color: var(--primary-blue) !important;
            font-weight: 500;
            margin: 0 1.5rem;
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

        /* Hero Section */
        .hero-section {
            background: linear-gradient(45deg, var(--primary-blue) 30%, var(--accent-blue) 100%);
            padding: 6rem 0 4rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
            margin-bottom: 4rem;
        }

        .section-title {
            font-size: 2.8rem;
            color: var(--pure-white);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        /* Help Card Styles */
        .card-help {
            border: none;
            border-radius: 15px;
            background: var(--pure-white);
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
            text-align: center;
            padding: 1.5rem;
        }

        .card-help:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.12);
        }

        .card-help .card-title {
            color: var(--primary-blue);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .card-help .card-text {
            color: #666;
            margin-bottom: 1.5rem;
        }

        .btn-contact {
            background: var(--highlight-yellow);
            color: var(--primary-blue);
            padding: 0.8rem 2rem;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-contact:hover {
            background: var(--primary-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
        }

        /* Footer */
        .footer {
            background-color: var(--primary-blue);
            color: var(--pure-white);
            padding: 2rem 0;
            text-align: center;
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 4rem 0 2rem;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .section-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="components/navbar.jsp" />

<!-- Hero Section -->
<section class="hero-section">
    <div class="container text-center">
        <h1 class="section-title">Need Help? We're Here for You!</h1>
        <p class="lead text-white mb-0">Get all the support you need with our platform. Check out our help topics or contact us for more assistance.</p>
    </div>
</section>

<!-- Help Section -->
<main class="flex-shrink-0">
    <div class="container my-5">
        <div class="row">
            <!-- Help Card 1: Contact Us -->
            <div class="col-md-4">
                <div class="card-help">
                    <h5 class="card-title">Contact Us</h5>
                    <p class="card-text">Have questions or need help? Reach out to us directly and we'll get back to you as soon as possible!</p>
                    <a href="aboutus.jsp" class="btn btn-contact">
                        Contact Support <i class="bi bi-envelope"></i>
                    </a>
                </div>
            </div>

            <!-- Help Card 2: FAQ -->
            <div class="col-md-4">
                <div class="card-help">
                    <h5 class="card-title">Visit Our FAQ</h5>
                    <p class="card-text">Check out our Frequently Asked Questions to quickly find answers to common issues.</p>
                    <a href="Faq.jsp" class="btn btn-contact">
                        Go to FAQ <i class="bi bi-question-circle"></i>
                    </a>
                </div>
            </div>

            <!-- Help Card 3: Troubleshooting -->
            <div class="col-md-4">
                <div class="card-help">
                    <h5 class="card-title">Troubleshooting</h5>
                    <p class="card-text">Having trouble? Our troubleshooting guides can help you resolve issues step by step.</p>
                    <a href="#" class="btn btn-contact">
                        Troubleshoot <i class="bi bi-tools"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<jsp:include page="components/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
