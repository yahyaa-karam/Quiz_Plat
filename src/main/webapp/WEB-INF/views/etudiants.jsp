<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Étudiants</title>
</head>
<body>
<h2>Liste des Étudiants</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Matricule</th>
    </tr>
    <c:forEach var="etudiant" items="${etudiants}">
        <tr>
            <td>${etudiant.id}</td>
            <td>${etudiant.nom}</td>
            <td>${etudiant.prenom}</td>
            <td>${etudiant.email}</td>
            <td>${etudiant.matricule}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
