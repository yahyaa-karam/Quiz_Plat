<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Choix</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/main.css">
</head>
<body>

<h2>Liste des Choix</h2>

<a href="choix?action=create">Ajouter un nouveau Choix</a><br/><br/>

<table>
    <tr>
        <th>Choix</th>
        <th>Question</th>
    </tr>
    <c:forEach var="choix" items="${choixList}">
        <tr>
            <td>${choix.texte}</td>
            <td>${choix.question.texte}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
