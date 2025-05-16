<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>${classe != null ? "Modifier la Classe" : "Créer une Nouvelle Classe"} - MyQuiz</title>
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

        .form-group input, .form-group select {
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

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #5D3FD3;
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
            <h2>${classe != null ? "Modifier la Classe" : "Créer une Nouvelle Classe"}</h2>

            <form action="${pageContext.request.contextPath}/classe" method="post">
                <input type="hidden" name="action" value="${classe != null ? "update" : "add"}">
                <c:if test="${classe != null}">
                    <input type="hidden" name="id" value="${classe.id}">
                </c:if>

                <!-- Nom de la classe -->
                <div class="form-group">
                    <label>Nom de la classe :</label>
                    <input type="text" name="nom" value="${classe != null ? classe.nom : ''}" required>
                </div>

                <!-- Sélection des étudiants -->
                <div class="form-group">
                    <label>Assigner des étudiants :</label>
                    <div class="checkbox-group">
                        <c:forEach var="etudiant" items="${etudiants}">
                            <label>
                                <input type="checkbox" name="etudiantIds" value="${etudiant.id}"
                                       <c:if test="${classe != null && etudiant.classe != null && etudiant.classe.id == classe.id}">checked</c:if> />
                                    ${etudiant.nom} ${etudiant.prenom}
                            </label>
                        </c:forEach>
                    </div>
                </div>

                <!-- Sélection des quiz -->
                <div class="form-group">
                    <label>Assigner des Quiz :</label>
                    <div class="checkbox-group">
                        <c:forEach var="quiz" items="${quizzes}">
                            <label>
                                <input type="checkbox" name="quizIds" value="${quiz.id}"
                                       <c:if test="${classe != null && quiz.classes != null && quiz.classes.contains(classe)}">checked</c:if> />
                                    ${quiz.titre}
                            </label>
                        </c:forEach>
                    </div>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">${classe != null ? "Mettre à jour" : "Créer Classe"}</button>
                </div>
            </form>

            <a href="${pageContext.request.contextPath}/classe?action=list" class="back-link">← Retour aux classes</a>
        </div>
    </div>
</div>

</body>
</html>
