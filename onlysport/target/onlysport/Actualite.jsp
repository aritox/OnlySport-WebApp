<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualités - OnlySports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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

        .news-hero {
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

        .article-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin-bottom: 2rem;
            background: var(--pure-white);
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .article-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.12);
        }

        .article-card img {
            height: 250px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .article-card:hover img {
            transform: scale(1.05);
        }

        .card-body {
            position: relative;
            padding: 2rem;
        }

        .card-title {
            color: var(--primary-blue);
            font-weight: 700;
            margin-bottom: 1rem;
            min-height: 3.5em;
        }

        .card-text {
            color: #666;
            line-height: 1.7;
            margin-bottom: 1.5rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .btn-read-more {
            background: var(--highlight-yellow);
            color: var(--primary-blue);
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-read-more:hover {
            background: var(--primary-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
        }

        .btn-read-more i {
            transition: transform 0.3s ease;
        }

        .btn-read-more:hover i {
            transform: translateX(3px);
        }

        .category-badge {
            position: absolute;
            top: -15px;
            right: 20px;
            background: var(--highlight-yellow);
            color: var(--primary-blue);
            padding: 0.5rem 1.5rem;
            border-radius: 30px;
            font-weight: 600;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
        }

        .view-more-btn {
            background: var(--primary-blue);
            color: white;
            padding: 1rem 3rem;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 2rem;
        }

        .view-more-btn:hover {
            background: var(--accent-blue);
            transform: translateY(-3px);
        }

        .image-overlay {
            position: relative;
            overflow: hidden;
        }

        .image-overlay::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 40%;
            background: linear-gradient(to top, rgba(0,0,0,0.7) 0%, transparent 100%);
        }

        @media (max-width: 768px) {
            .news-hero {
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
<section class="news-hero">
    <div class="container text-center">
        <h1 class="section-title">Sports News & Updates</h1>
        <p class="lead text-white mb-0">Stay informed with the latest in sports technology and events</p>
    </div>
</section>

<!-- Articles Section -->
<div class="container">
    <div class="row">
        <!-- Article 1 -->
        <div class="col-lg-4 col-md-6">
            <div class="article-card">
                <div class="image-overlay">
                    <img src="${pageContext.request.contextPath}/img/Coaching.png" class="card-img-top" alt="Coaching Features">
                </div>
                <div class="card-body">
                    <span class="category-badge">Technology</span>
                    <h5 class="card-title">Revolutionary Coaching Tools Launched</h5>
                    <p class="card-text">Discover our new suite of coaching features designed to optimize athlete performance through AI-driven analytics and personalized training programs.</p>
                    <a href="#" class="btn btn-read-more">
                        Read More <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Article 2 -->
        <div class="col-lg-4 col-md-6">
            <div class="article-card">
                <div class="image-overlay">
                    <img src="${pageContext.request.contextPath}/img/ligue.jpeg" class="card-img-top" alt="Sports Events">
                </div>
                <div class="card-body">
                    <span class="category-badge">Events</span>
                    <h5 class="card-title">Global Sports Calendar Update</h5>
                    <p class="card-text">Your ultimate guide to major sporting events worldwide. Get insights, schedules, and expert predictions for all major tournaments.</p>
                    <a href="#" class="btn btn-read-more">
                        Read More <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Article 3 -->
        <div class="col-lg-4 col-md-6">
            <div class="article-card">
                <div class="image-overlay">
                    <img src="${pageContext.request.contextPath}/img/mercato.jpg" class="card-img-top" alt="Transfer Market">
                </div>
                <div class="card-body">
                    <span class="category-badge">Analysis</span>
                    <h5 class="card-title">Transfer Market Dynamics 2024</h5>
                    <p class="card-text">In-depth analysis of current transfer strategies and their long-term impacts on team performance and league competitiveness.</p>
                    <a href="#" class="btn btn-read-more">
                        Read More <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- View More Button -->
    <div class="text-center">
        <a href="#" class="btn view-more-btn">
            Load More Articles <i class="bi bi-arrow-clockwise"></i>
        </a>
    </div>
</div>

<jsp:include page="components/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>