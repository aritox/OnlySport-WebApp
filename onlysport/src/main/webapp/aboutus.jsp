<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    
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
        }

        .navbar {
            background: var(--pure-white) !important;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }

        .hero-section {
            background: linear-gradient(45deg, var(--primary-blue) 30%, var(--accent-blue) 100%);
            padding: 8rem 0 6rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255, 212, 0, 0.1);
            border-radius: 50%;
        }

        .section-title {
            font-size: 2.8rem;
            color: var(--pure-white);
            margin-bottom: 1.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .section-subtitle {
            font-size: 1.25rem;
            color: rgba(255,255,255,0.9);
            margin-bottom: 2rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .team-card {
            background: var(--pure-white);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            margin-bottom: 2rem;
            border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            position: relative;
            overflow: hidden;
        }

        .team-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
        }

        .team-card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--highlight-yellow);
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .team-card:hover::after {
            transform: scaleX(1);
        }

        .team-card img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border: 4px solid var(--primary-blue);
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }

        .team-card:hover img {
            transform: scale(1.05);
            border-color: var(--highlight-yellow);
        }

        .role-badge {
            background: var(--highlight-yellow);
            color: var(--primary-blue);
            padding: 0.5rem 1.25rem;
            border-radius: 30px;
            font-weight: 600;
            display: inline-block;
            margin: 0.5rem 0;
        }

        .social-links {
            margin-top: 1.5rem;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.3s ease;
        }

        .team-card:hover .social-links {
            opacity: 1;
            transform: translateY(0);
        }

        .social-links a {
            color: var(--primary-blue);
            margin: 0 0.5rem;
            font-size: 1.4rem;
            transition: all 0.2s ease;
        }

        .social-links a:hover {
            color: var(--accent-blue);
            transform: translateY(-3px);
        }

        .section-heading {
            text-align: center;
            margin: 4rem 0;
            position: relative;
        }

        .section-heading h2 {
            font-size: 2.5rem;
            color: var(--primary-blue);
            font-weight: 700;
            position: relative;
            display: inline-block;
        }

        .section-heading h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: var(--highlight-yellow);
            border-radius: 2px;
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 5rem 0 4rem;
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
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="section-title">Welcome to OnlySports</h1>
                <p class="section-subtitle">
                    Your premier platform connecting athletes and coaches worldwide. Join a dynamic community committed to 
                    elevating sports performance through innovation and collaboration.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Main Content -->
<div class="container my-5">

    <!-- Who Are We Section -->
    <div class="section-heading">
        <h2>Who We Are</h2>
    </div>
    <div class="row mb-5">
        <div class="col-lg-8 mx-auto text-center">
            <p class="lead" style="color: var(--accent-blue); line-height: 1.8;">
                At OnlySports, we're revolutionizing sports connections through cutting-edge technology. Our platform 
                combines advanced matchmaking algorithms with intuitive design to create meaningful partnerships 
                between athletes and coaches. We're committed to fostering growth, enhancing performance, and 
                building a global sports community.
            </p>
        </div>
    </div>

    <!-- Meet Our Team Section -->
    <div class="section-heading">
        <h2>Meet Our Team</h2>
    </div>
    <div class="row justify-content-center">
        <!-- Yassine Amrouche Card -->
        <div class="col-md-4 mb-4">
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/img/amrch.jpg" alt="Yassine Amrouche" class="rounded-circle">
                <h4 class="mb-2">Yassine Amrouche</h4>
                <div class="role-badge">Data Scientist & Developer</div>
                <p class="text-muted mb-0">Sports analytics expert and full-stack developer</p>
                <div class="social-links">
                    <a href="#"><i class="bi bi-linkedin"></i></a>
                    <a href="#"><i class="bi bi-github"></i></a>
                    <a href="#"><i class="bi bi-envelope-fill"></i></a>
                </div>
            </div>
        </div>

        <!-- Skander Methani Card -->
        <div class="col-md-4 mb-4">
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/img/Skan.jpg" alt="Skander Methani" class="rounded-circle">
                <h4 class="mb-2">Skander Methani</h4>
                <div class="role-badge">Data Scientist & Developer</div>
                <p class="text-muted mb-0">Machine learning and matching algorithms specialist</p>
                <div class="social-links">
                    <a href="#"><i class="bi bi-linkedin"></i></a>
                    <a href="#"><i class="bi bi-github"></i></a>
                    <a href="#"><i class="bi bi-envelope-fill"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="components/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>