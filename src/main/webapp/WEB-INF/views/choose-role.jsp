<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Choisir le rôle - MyQuiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: bold;
            font-size: 20px;
            color: #ffffff;
        }

        .logo img {
            height: 40px;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .roles {
            display: flex;
            justify-content: center;
            gap: 40px;
        }

        .role-card {
            background-color: #f9f7fd;
            border-radius: 15px;
            padding: 20px;
            width: 300px;
            height: 200px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            text-align: center;
        }

        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .role-card img {
            width: 150px;
            margin-bottom: 15px;
        }

        .role-card strong {
            display: block;
            font-size: 16px;
            color: #333;
        }

        .role-card span {
            font-size: 13px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="logo">
    <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MyQuiz Logo">
    <span>MyQuiz</span>
</div>

<div class="container">
    <h2>Je suis</h2>
    <div class="roles">
        <div class="role-card" onclick="location.href='${pageContext.request.contextPath}/signup?role=etudiant'">
            <img src="${pageContext.request.contextPath}/assets/images/etu.png" alt="Étudiant">
            <strong>un étudiant</strong>
            <span>participer à des activités amusantes</span>
        </div>
        <div class="role-card" onclick="location.href='${pageContext.request.contextPath}/signup?role=enseignant'">
            <img src="${pageContext.request.contextPath}/assets/images/ens.png" alt="Enseignant">
            <strong>un enseignant</strong>
            <span>pour instruire, engager et évaluer</span>
        </div>
    </div>
</div>

</body>
</html>
