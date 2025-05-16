<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Choix - MyQuiz</title>
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

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-container h2 {
            color: #5D3FD3;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #5D3FD3;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .btn:hover {
            background-color: #3D27A5;
        }

        .choix-list {
            background-color: #fff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .choix-item {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }

        .choix-item:last-child {
            border-bottom: none;
        }

        .choix-item .status {
            font-weight: bold;
        }

        .choix-item .status.correct {
            color: #28a745;
        }

        .choix-item .status.incorrect {
            color: #dc3545;
        }

        .btn-back {
            background-color: #8266b8;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #6c4fc3;
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
        <div class="form-container">
            <h2>Ajouter un choix pour la question : ${question.contenu}</h2>

            <form action="${pageContext.request.contextPath}/choix" method="post">
                <input type="hidden" name="questionId" value="${question.id}">

                <div class="form-group">
                    <label>Contenu du choix :</label>
                    <input type="text" name="contenu" required>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="estCorrect">
                        Est-ce la bonne réponse ?
                    </label>
                </div>

                <button type="submit" class="btn">Ajouter Choix</button>
            </form>
        </div>

        <!-- Section d'affichage des choix existants -->
        <div class="choix-list">
            <h3>Choix existants :</h3>

            <c:if test="${empty choixList}">
                <p>Aucun choix ajouté pour cette question.</p>
            </c:if>

            <c:forEach var="choix" items="${choixList}">
                <div class="choix-item">
                    <span>${choix.contenu}</span>
                    <span class="status ${choix.estCorrect ? 'correct' : 'incorrect'}">
                            ${choix.estCorrect ? "Correct" : "Faux"}
                    </span>
                </div>
            </c:forEach>
        </div>

        <!-- Bouton de retour à l'ajout des questions -->
        <a href="${pageContext.request.contextPath}/question?quizId=${question.quiz.id}" class="btn-back">
            ← Retour à l'ajout des questions
        </a>
    </div>
</div>

</body>
</html>
