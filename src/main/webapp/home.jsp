<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.quizappjee.model.Utilisateur" %>

<html>
<head>
    <title>Accueil - Enseignant - MyQuiz</title>
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

        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #444;
            font-weight: 500;
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
            display: flex;
            gap: 20px;
        }

        .profile-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 20px;
            width: 60%;
            height: 200px;
        }

        .profile-card img {
            width: 200px;
            height: 200px;
            border-radius: 30%;
        }

        .profile-info h2 {
            font-size: 18px;
            color: #5D3FD3;
            font-weight: 600;
        }

        .profile-info p {
            color: #666;
            margin: 5px 0;
        }

        .button-group {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            height: 20px;
        }

        .button-group a {
            background-color: #fff;
            color: #5D3FD3;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            border: 1px solid #5D3FD3;
            transition: background-color 0.3s, color 0.3s;
            text-align: center;
        }

        .button-group a:hover {
            background-color: #5D3FD3;
            color: #fff;
        }

        .create-quiz-btn {
            background-color: #6c4fc3;
            color: #fff;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            margin-top: 20px;
            align-self: center;
        }

        .create-quiz-btn:hover {
            background-color: #5D3FD3;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #EAE6F8;
            color: #666;
            margin-top: 30px;
        }

    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MyQuiz Logo">
        <span>MyQuiz</span>
    </div>
    <nav>
        <a href="#">Essayer un quiz</a>
        <a href="#">Créer un quiz</a>
        <a href="#">Comment ça marche</a>
    </nav>
</header>

<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/home.jsp"><i class="fas fa-home"></i> Accueil</a>
        <a href="${pageContext.request.contextPath}/classe?action=list"><i class="fas fa-users"></i> Mes Étudiants</a>
        <a href="${pageContext.request.contextPath}/quiz?action=list"><i class="fas fa-list"></i> Mes Quiz</a>
        <a href="${pageContext.request.contextPath}/statistiques.jsp"><i class="fas fa-chart-bar"></i> Statistiques</a>
        <a href="${pageContext.request.contextPath}/logout">Se déconnecter</a>
    </div>

    <div class="main-content">
        <%
            Utilisateur enseignant = (Utilisateur) session.getAttribute("user");
            if (enseignant != null && enseignant.getRole().toString().equals("ENSEIGNANT")) {
        %>

        <div class="profile-card">
            <img src="${pageContext.request.contextPath}/assets/images/ens.jpg" alt="Profile">
            <div class="profile-info">
                <h2><%= enseignant.getNom() %> <%= enseignant.getPrenom() %></h2>
                <p>Enseignant</p>
                <p>Email : <%= enseignant.getEmail() %></p>
            </div>
        </div>

        <div class="button-group">

            <a href="${pageContext.request.contextPath}/classe?action=list">Gérer les Classes</a>
            <a href="${pageContext.request.contextPath}/classe?action=create">Créer une Classe</a>
            <a href="${pageContext.request.contextPath}/quiz?action=list">Gérer les Quiz</a>
            <a href="${pageContext.request.contextPath}/statistiques.jsp">Statistiques</a>
        </div>

        <% } else { %>
        <h2>Accès refusé ! Vous n'êtes pas un enseignant.</h2>
        <% } %>
    </div>
</div>

<div class="footer">
    © 2025 MyQuiz. Tous droits réservés.
</div>

</body>
</html>
