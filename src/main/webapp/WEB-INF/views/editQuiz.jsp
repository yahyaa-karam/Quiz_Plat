<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier le Quiz - MyQuiz</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            text-align: center;
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
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .form-group input:focus {
            border-color: #5D3FD3;
            outline: none;
        }

        .btn {
            background-color: #5D3FD3;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            background-color: #3D27A5;
            transform: scale(1.05);
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            color: #5D3FD3;
            text-decoration: none;
            font-weight: 600;
        }

        .back-btn:hover {
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
            <h2>Modifier le Quiz</h2>

            <form action="${pageContext.request.contextPath}/quiz?action=edit" method="post">
                <input type="hidden" name="id" value="${quiz.id}">

                <div class="form-group">
                    <label>Titre :</label>
                    <input type="text" name="titre" value="${quiz.titre}" required>
                </div>

                <div class="form-group">
                    <label>Catégorie :</label>
                    <input type="text" name="categorie" value="${quiz.categorie}" required>
                </div>

                <div class="form-group">
                    <label>Durée (en minutes) :</label>
                    <input type="number" name="duree" value="${quiz.duree}" required>
                </div>

                <div class="form-group">
                    <label>Niveau :</label>
                    <input type="text" name="niveau" value="${quiz.niveau}" required>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">Enregistrer les modifications</button>
                </div>
            </form>

            <a href="${pageContext.request.contextPath}/quiz?action=list" class="back-btn">← Retour à la liste des quiz</a>
        </div>
    </div>
</div>

</body>
</html>
