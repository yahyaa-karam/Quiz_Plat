<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Créer un Quiz - MyQuiz</title>
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

    .checkbox-group {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }

    .checkbox-group label {
      background-color: #EAE6F8;
      padding: 8px 15px;
      border-radius: 5px;
      cursor: pointer;
    }

    .checkbox-group input[type="checkbox"] {
      margin-right: 8px;
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
      <h2>Créer un Quiz</h2>

      <c:if test="${not empty error}">
        <div class="alert">${error}</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/quiz?action=create" method="post">
        <div class="form-group">
          <label>Titre :</label>
          <input type="text" name="titre" required>
        </div>

        <div class="form-group">
          <label>Catégorie :</label>
          <input type="text" name="categorie" required>
        </div>

        <div class="form-group">
          <label>Durée (en minutes) :</label>
          <input type="number" name="duree" required>
        </div>

        <div class="form-group">
          <label>Niveau :</label>
          <input type="text" name="niveau" required>
        </div>

        <div class="form-group">
          <h3>Associer des classes :</h3>
          <div class="checkbox-group">
            <c:forEach var="classe" items="${classes}">
              <label>
                <input type="checkbox" name="classeIds" value="${classe.id}">
                  ${classe.nom}
              </label>
            </c:forEach>
          </div>
        </div>

        <div class="form-group">
          <button type="submit" class="btn">Créer Quiz</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>
