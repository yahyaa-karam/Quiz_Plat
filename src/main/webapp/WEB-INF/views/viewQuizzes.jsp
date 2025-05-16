<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Quiz - MyQuiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F6F3FF;
            margin: 0;
            padding: 0;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background-color: #f4f0fa;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.05);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: bold;
            font-size: 24px;
            color: #5D3FD3;
        }

        .logo img {
            height: 35px;
        }

        .container {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #8266b8;
            color: #fff;
            padding: 30px 20px;
            height: 100vh;
            border-radius: 0 20px 20px 0;
        }

        .sidebar a {
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 15px;
            border-radius: 10px;
            transition: background-color 0.3s;
            margin-bottom: 15px;
        }

        .sidebar a:hover {
            background-color: #6c4fc3;
        }

        .main-content {
            padding: 30px;
            width: 100%;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .content-header h2 {
            color: #5D3FD3;
        }

        .content-header .create-btn {
            background-color: #5D3FD3;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .content-header .create-btn:hover {
            background-color: #3D27A5;
        }

        .quiz-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .quiz-card {
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            text-decoration: none;
            color: #444;
        }

        .quiz-card:hover {
            transform: translateY(-5px);
        }

        .quiz-card h3 {
            margin-bottom: 10px;
            font-size: 18px;
            color: inherit;
        }

        .quiz-card p {
            margin-bottom: 5px;
            font-size: 14px;
            color: inherit;
        }

        .published {
            background-color: #F4A9A8;
            color: #fff;
        }

        .published:hover {
            background-color: #F4A9A8;
        }

        .unpublished {
            background-color: #fff;
        }

        .unpublished:hover {
            background-color: #8266b8;
            color: #fff;
        }

    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MyQuiz Logo">
        <span>MyQuiz</span>
    </div>
</header>

<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/home.jsp"><i class="fas fa-home"></i> Accueil</a>
        <a href="${pageContext.request.contextPath}/classe?action=list"><i class="fas fa-users"></i> Mes Étudiants</a>
        <a href="${pageContext.request.contextPath}/quiz?action=list"><i class="fas fa-list"></i> Mes Quiz</a>
        <a href="${pageContext.request.contextPath}/statistiques.jsp"><i class="fas fa-chart-bar"></i> Statistiques</a>
        <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
    </div>

    <div class="main-content">
        <div class="content-header">
            <h2>Liste des Quiz</h2>
            <a href="${pageContext.request.contextPath}/quiz?action=create" class="create-btn">Créer un nouveau Quiz</a>
        </div>

        <div class="quiz-grid">
            <c:forEach var="quiz" items="${quizzes}">
                <a href="${pageContext.request.contextPath}/quiz?action=view&id=${quiz.id}"
                   class="quiz-card ${quiz.published ? 'published' : 'unpublished'}">
                    <h3>${quiz.titre}</h3>
                    <p>Catégorie : ${quiz.categorie}</p>
                    <p>Durée : ${quiz.duree} min</p>
                    <p>Niveau : ${quiz.niveau}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
