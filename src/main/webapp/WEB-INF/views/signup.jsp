<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription - MyQuiz</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #a385e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-box {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            width: 320px;
            text-align: center;
        }

        .logo {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #6c4fc3;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #573ab8;
        }

        .bottom-text {
            margin-top: 10px;
            font-size: 14px;
        }

        .bottom-text a {
            color: #6c4fc3;
            text-decoration: none;
        }

        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="signup-box">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.jpg" alt="logo">
        <span style="font-weight:bold; font-size:18px; color:#6c4fc3;">MyQuiz</span>
    </div>

    <h2>Inscription</h2>

    <c:if test="${not empty error}">
        <p class="error">⚠️ ${error}</p>
    </c:if>

    <form action="signup" method="post">
        <input type="hidden" name="role" value="${role}"/>

        <input type="text" name="nom" placeholder="Nom" required/>
        <input type="text" name="prenom" placeholder="Prénom" required/>
        <input type="email" name="email" placeholder="Adresse e-mail" required/>
        <input type="password" name="mdp" placeholder="Mot de passe" required/>

        <c:if test="${role == 'etudiant' || role == 'ETUDIANT'}">
            <input type="text" name="matricule" placeholder="Matricule" required/>
        </c:if>

        <c:if test="${role == 'enseignant' || role == 'ENSEIGNANT'}">
            <input type="text" name="matiere" placeholder="Matière" required/>
        </c:if>

        <input type="submit" value="S’inscrire"/>
    </form>

    <div class="bottom-text">
        Vous avez déjà un compte ? <a href="login">S’authentifier</a>
    </div>
</div>

</body>
</html>
