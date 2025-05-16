<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Modifier la Classe - MyQuiz</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #F6F3FF;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 70%;
      margin: 50px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
      color: #5D3FD3;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: 600;
      margin-bottom: 8px;
    }

    .form-group input[type="text"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
    }

    .checkbox-group {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }

    .checkbox-group label {
      background-color: #EAE6F8;
      padding: 10px;
      border-radius: 8px;
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
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #3D27A5;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>Modifier la Classe : ${classe.nom}</h2>

  <form action="${pageContext.request.contextPath}/classe" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${classe.id}">

    <!-- Nom de la Classe -->
    <div class="form-group">
      <label>Nom de la classe :</label>
      <input type="text" name="nom" value="${classe.nom}" required>
    </div>

    <!-- Sélection des Étudiants -->
    <div class="form-group">
      <label>Assigner des étudiants :</label>
      <div class="checkbox-group">
        <c:forEach var="etudiant" items="${etudiants}">
          <label>
            <input type="checkbox" name="etudiantIds" value="${etudiant.id}"
                   <c:if test="${etudiant.classe != null && etudiant.classe.id == classe.id}">checked</c:if>>
              ${etudiant.nom} ${etudiant.prenom}
          </label>
        </c:forEach>
      </div>
    </div>

    <!-- Sélection des Quiz -->
    <div class="form-group">
      <label>Assigner des Quiz :</label>
      <div class="checkbox-group">
        <c:forEach var="quiz" items="${quizzes}">
          <label>
            <input type="checkbox" name="quizIds" value="${quiz.id}"
                   <c:if test="${classe.quizzes != null && classe.quizzes.contains(quiz)}">checked</c:if>>
              ${quiz.titre}
          </label>
        </c:forEach>
      </div>
    </div>

    <div class="form-group">
      <button type="submit" class="btn">Enregistrer les modifications</button>
    </div>
  </form>
</div>

</body>
</html>
