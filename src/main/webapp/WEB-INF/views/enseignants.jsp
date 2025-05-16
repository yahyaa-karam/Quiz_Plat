<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Enseignants</title>
</head>
<body>
<h2>Liste des Enseignants</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Matière</th>
    </tr>
    <c:forEach var="e" items="${enseignants}">
        <tr>
            <td>${e.id}</td>
            <td>${e.nom}</td>
            <td>${e.prenom}</td>
            <td>${e.email}</td>
            <td>${e.matiere}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
