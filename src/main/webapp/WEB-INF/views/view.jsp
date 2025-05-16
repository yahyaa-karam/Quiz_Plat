<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails du Quiz - MyQuiz</title>
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

        .quiz-card {
            background-color: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .quiz-card h2 {
            color: #5D3FD3;
            margin-bottom: 20px;
            font-size: 22px;
        }

        .quiz-info {
            background-color: #f4f0fa;
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 20px;
        }

        .question-card {
            background-color: #EAE6F8;
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 15px;
        }

        .question-card .question-title {
            font-weight: 600;
            color: #5D3FD3;
            margin-bottom: 10px;
        }

        .choices {
            margin-left: 15px;
        }

        .choice {
            margin-bottom: 5px;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .btn {
            background-color: #5D3FD3;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            background-color: #3D27A5;
        }

        .btn-back {
            background-color: #f4f0fa;
            color: #5D3FD3;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 50px;
            font-weight: 600;
        }

        .btn-back:hover {
            background-color: #ddd;
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
        <a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/classe?action=list"><i class="fas fa-users"></i> Mes Étudiants</a>
        <a href="${pageContext.request.contextPath}/quiz?action=list"><i class="fas fa-list"></i> Mes Quiz</a>
        <a href="${pageContext.request.contextPath}/statistiques.jsp"><i class="fas fa-chart-bar"></i> Statistiques</a>
        <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
    </div>

    <div class="main-content">
        <div class="quiz-card">
            <h2>Détails du Quiz : ${quiz.titre}</h2>

            <div class="quiz-info">
                <p><strong>Catégorie :</strong> ${quiz.categorie}</p>
                <p><strong>Durée :</strong> ${quiz.duree} minutes</p>
                <p><strong>Niveau :</strong> ${quiz.niveau}</p>
            </div>

            <h3>Questions :</h3>

            <c:forEach var="question" items="${questions}">
                <div class="question-card">
                    <div class="question-title">${question.intitule}</div>
                    <div class="choices">
                        <c:forEach var="choix" items="${question.choix}">
                            <div class="choice">
                                <i class="fas fa-check-circle"></i> ${choix.contenu}
                            </div>
                        </c:forEach>
                    </div>

                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/question?action=edit&id=${question.id}" class="btn">Modifier</a>
                        <a href="${pageContext.request.contextPath}/question?action=delete&id=${question.id}" class="btn"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette question ?');">Supprimer</a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty questions}">
                <p>Aucune question disponible pour ce quiz.</p>
            </c:if>

            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/question?action=create&quizId=${quiz.id}" class="btn">Ajouter Question</a>
                <a href="${pageContext.request.contextPath}/quiz?action=publish&id=${quiz.id}" class="btn">Publier le Quiz</a>
            </div>

            <a href="${pageContext.request.contextPath}/quiz?action=list" class="btn-back">← Retour à la liste des quiz</a>
        </div>
    </div>
</div>

</body>
</html>
