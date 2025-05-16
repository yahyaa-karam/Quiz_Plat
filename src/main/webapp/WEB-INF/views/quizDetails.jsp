<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    }

    .logo img {
      width: 40px;
      height: 40px;
      object-fit: contain;
    }

    .logo span {
      font-weight: bold;
      font-size: 24px;
      color: #5D3FD3;
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
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .quiz-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .quiz-header h2 {
      color: #5D3FD3;
      margin-bottom: 0;
    }

    .actions {
      display: flex;
      gap: 10px;
    }

    .actions a {
      background-color: #5D3FD3;
      color: #fff;
      width: 35px;
      height: 35px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      text-decoration: none;
      font-size: 16px;
      transition: background-color 0.3s, transform 0.3s;
    }

    .actions a:hover {
      background-color: #3D27A5;
      transform: scale(1.1);
    }

    .publish-btn {
      background-color: #28a745;
    }

    .publish-btn:hover {
      background-color: #218838;
    }

    .quiz-info {
      background-color: #f4f0fa;
      padding: 15px;
      border-radius: 12px;
      margin-bottom: 20px;
    }

    .question-list {
      margin-top: 20px;
    }

    .question-item {
      background-color: #fff;
      padding: 5px;
      border-radius: 12px;
      margin-bottom: 1px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .question-item p {
      margin: 0;
      color: #5D3FD3;
      font-weight: 600;
    }

    .question-actions a {
      background-color: #5D3FD3;
      color: #fff;
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      text-decoration: none;
      margin-left: 10px;
      transition: background-color 0.3s;
    }

    .question-actions a:hover {
      background-color: #3D27A5;
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
  <!-- Sidebar -->
  <div class="sidebar">
    <a href="${pageContext.request.contextPath}/home.jsp"><i class="fas fa-home"></i> Accueil</a>
    <a href="${pageContext.request.contextPath}/classe?action=list"><i class="fas fa-users"></i> Mes Étudiants</a>
    <a href="${pageContext.request.contextPath}/quiz?action=list"><i class="fas fa-list"></i> Mes Quiz</a>
    <a href="${pageContext.request.contextPath}/statistiques.jsp"><i class="fas fa-chart-bar"></i> Statistiques</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="quiz-card">
      <div class="quiz-header">
        <h2>${quiz.titre}</h2>
        <div class="actions">
          <a href="${pageContext.request.contextPath}/quiz?action=edit&id=${quiz.id}" title="Modifier">
            <i class="fas fa-edit"></i>
          </a>
          <a href="${pageContext.request.contextPath}/quiz?action=delete&id=${quiz.id}"
             onclick="return confirm('Voulez-vous vraiment supprimer ce quiz ?');" title="Supprimer">
            <i class="fas fa-trash-alt"></i>
          </a>
          <a href="${pageContext.request.contextPath}/question?action=create&quizId=${quiz.id}" title="Ajouter Question">
            <i class="fas fa-plus"></i>
          </a>
          <a href="${pageContext.request.contextPath}/quiz?action=publish&id=${quiz.id}" class="publish-btn" title="Publier">
            <i class="fas fa-upload"></i>
          </a>
        </div>
      </div>

      <div class="quiz-info">
        <p><strong>Catégorie :</strong> ${quiz.categorie}</p>
        <p><strong>Durée :</strong> ${quiz.duree} min</p>
        <p><strong>Niveau :</strong> ${quiz.niveau}</p>
      </div>

      <h3>Questions :</h3>
      <div class="question-list">
        <c:forEach var="question" items="${questions}">
          <div class="question-item">
            <p>${question.contenu}</p>
            <div class="question-actions">
              <a href="${pageContext.request.contextPath}/question?action=edit&id=${question.id}" title="Modifier">
                <i class="fas fa-edit"></i>
              </a>
              <a href="${pageContext.request.contextPath}/question?action=delete&id=${question.id}"
                 onclick="return confirm('Voulez-vous vraiment supprimer cette question ?');" title="Supprimer">
                <i class="fas fa-trash-alt"></i>
              </a>
            </div>
          </div>
        </c:forEach>
        <c:if test="${empty questions}">
          <p>Aucune question ajoutée pour ce quiz.</p>
        </c:if>
      </div>
    </div>
  </div>
</div>

</body>
</html>
