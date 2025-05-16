<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Classes - MyQuiz</title>
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
            font-size: 24px;
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

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .class-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, background-color 0.3s;
            position: relative;
        }

        .class-card:hover {
            background-color: #8266b8;
            color: #fff;
            transform: translateY(-5px);
        }

        .class-card h3 {
            font-size: 18px;
            color: inherit;
            margin-bottom: 15px;
        }

        .class-card .actions {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .class-card .action-btn {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #5D3FD3;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .class-card .action-btn:hover {
            background-color: #3D27A5;
            transform: scale(1.1);
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
            <h2>Gestion des Classes</h2>
            <a href="${pageContext.request.contextPath}/classe?action=create" class="create-btn">Créer une nouvelle classe</a>
        </div>

        <div class="card-grid">
            <c:forEach var="classe" items="${classes}">
                <div class="class-card">
                    <h3>${classe.nom}</h3>
                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/classe?action=edit&id=${classe.id}" class="action-btn">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/classe?action=delete&id=${classe.id}"
                           class="action-btn"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette classe ?');">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/classe?action=assignQuiz&id=${classe.id}" class="action-btn">
                            <i class="fas fa-link"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
