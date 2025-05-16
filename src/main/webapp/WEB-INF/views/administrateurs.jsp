<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Liste des Administrateurs</title>
</head>
<body>
<h1>Liste des Administrateurs</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Niveau d'accès</th>
    </tr>
    <c:forEach var="admin" items="${administrateurs}">
        <tr>
            <td>${admin.id}</td>
            <td>${admin.nom}</td>
            <td>${admin.prenom}</td>
            <td>${admin.email}</td>
            <td>${admin.niveauacces}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
