<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Assigner un Quiz à la Classe : ${classe.nom}</h2>

<form action="${pageContext.request.contextPath}/classe" method="post">
    <input type="hidden" name="action" value="assignQuiz">
    <input type="hidden" name="classeId" value="${classe.id}">

    <label for="quizId">Sélectionnez un quiz :</label>
    <select name="quizId" id="quizId">
        <c:forEach var="quiz" items="${quizzes}">
            <option value="${quiz.id}">${quiz.titre}</option>
        </c:forEach>
    </select>

    <button type="submit">Assigner</button>
</form>

<a href="${pageContext.request.contextPath}/classe">Retour aux classes</a>
