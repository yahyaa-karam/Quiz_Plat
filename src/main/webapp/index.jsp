<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>MyQuiz - Accueil</title>

    <!-- Font Awesome & Google Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f9f7fd;
            color: #333;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background-color: #f4f0fa;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: bold;
            font-size: 24px;
            color: #5D3FD3;
        }

        .logo img {
            height: 50px;
        }

        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #444;
            font-weight: 500;
        }

        .cta-buttons a {
            padding: 10px 20px;
            border-radius: 12px;
            margin-left: 10px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-login {
            border: 2px solid #6c4fc3;
            color: #6c4fc3;
        }

        .btn-login:hover {
            background-color: #6c4fc3;
            color: white;
        }

        .btn-signup {
            background-color: #eae6f8;
            color: #6c4fc3;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.15);
        }

        .btn-signup:hover {
            background-color: #ded6f6;
        }

        main {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 50px;
        }

        .main-text {
            max-width: 50%;
        }

        .main-text h1 {
            font-size: 50px;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .features {
            display: flex;
            justify-content: space-around;
            padding: 30px 50px;
            text-align: center;
        }

        .features div {
            flex: 1;
        }

        .features i {
            font-size: 28px;
            color: #6c4fc3;
        }

        footer {
            background-color: #f4f0fa;
            padding: 50px;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #666;
        }

        footer div {
            flex: 1;
        }

        .socials i {
            margin-right: 10px;
            color: #6c4fc3;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MyQuiz Logo">
        <span>MyQuiz</span>
    </div>
    <nav>
        <a href="#">Essayer un quiz</a>
        <a href="#">Créer un quiz</a>
        <a href="#">Comment ça marche</a>
    </nav>
    <div class="cta-buttons">
        <a href="${pageContext.request.contextPath}/login" class="btn-login">Se connecter</a>
        <a href="${pageContext.request.contextPath}/signup" class="btn-signup">S’inscrire</a>
    </div>
</header>

<main>
    <div class="main-text">
        <h1>Créer, tester, corriger. Les quiz n’ont jamais été aussi fun et intelligents ! </h1>

        <div class="cta-buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn-login">S’authentifier</a>
            <a href="${pageContext.request.contextPath}/choose-role" class="btn-signup">S’inscrire</a>
        </div>
    </div>
    <div class="main-img">
        <img src="${pageContext.request.contextPath}/assets/images/index.png" alt="Quiz" width="900">
    </div>
</main>

<section class="features">
    <div>
        <i class="fas fa-list-ul"></i><br>
        <strong>Création intuitive</strong>
    </div>
    <div>
        <i class="fas fa-check-circle"></i><br>
        <strong>Correction automatique</strong>
    </div>
    <div>
        <i class="fas fa-chart-bar"></i><br>
        <strong>Statistiques détaillées</strong>
    </div>
    <div>
        <i class="fas fa-share-alt"></i><br>
        <strong>Partage facile</strong>
    </div>
</section>

<footer>
    <div>
        <h4>À PROPOS</h4>
        <p>Blog<br>Carrières</p>
    </div>
    <div>
        <h4>ASSISTANCE</h4>
        <p>Centre d’aide<br>Nous contacter</p>
    </div>
    <div>
        <h4>LÉGAL</h4>
        <p>Conditions générales<br>Politique de confidentialité</p>
    </div>
    <div class="socials">
        <h4>SUIVEZ-NOUS</h4>
        <i class="fab fa-twitter"></i>
        <i class="fab fa-facebook-f"></i>
        <i class="fab fa-instagram"></i>
        <i class="fab fa-linkedin"></i>
    </div>
</footer>

</body>
</html>
