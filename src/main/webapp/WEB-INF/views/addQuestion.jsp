<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Ajouter une Question - MyQuiz</title>
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

    .form-group input,
    .form-group select {
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
      font-weight: 600;
    }

    .btn:hover {
      background-color: #3D27A5;
    }

    .alert {
      background-color: #f8d7da;
      color: #721c24;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
    }

    .question-list {
      background-color: #fff;
      padding: 20px;
      border-radius: 16px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    .question-list h3 {
      color: #5D3FD3;
      margin-bottom: 15px;
    }

    .question-item {
      padding: 10px;
      border-bottom: 1px solid #ddd;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .question-item:last-child {
      border-bottom: none;
    }

    .question-item a {
      color: #5D3FD3;
      text-decoration: none;
      font-weight: 600;
    }

    .question-item a:hover {
      color: #3D27A5;
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
      <h2>Ajouter une question au Quiz : ${quiz.titre}</h2>

      <form action="${pageContext.request.contextPath}/question" method="post">
        <input type="hidden" name="quizId" value="${quiz.id}">

        <div class="form-group">
          <label>Contenu de la question :</label>
          <input type="text" name="contenu" required>
        </div>

        <div class="form-group">
          <label>Type de la question :</label>
          <select name="type">
            <option value="QCM">QCM</option>
            <option value="VRAI_FAUX">Vrai/Faux</option>
            <option value="TEXTE">Texte</option>
          </select>
        </div>

        <div class="form-group">
          <button type="submit" class="btn">Ajouter Question</button>
        </div>
      </form>
    </div>

    <div class="question-list">
      <h3>Questions existantes :</h3>
      <c:if test="${questions.isEmpty()}">
        <p>Aucune question ajoutée pour ce quiz.</p>
      </c:if>

      <c:forEach var="question" items="${questions}">
        <div class="question-item">
          <span>${question.contenu} - ${question.type}</span>

          <c:if test="${question.type == 'QCM'}">
            <a href="${pageContext.request.contextPath}/choix?questionId=${question.id}">
              Ajouter des choix
            </a>
          </c:if>
        </div>
      </c:forEach>
    </div>

    <div style="margin-top: 20px;">
      <a href="${pageContext.request.contextPath}/quiz?action=list" class="btn">Retour à la liste des quiz</a>
    </div>
  </div>
</div>

</body>
</html>
