<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Gérer les étudiants pour la classe : ${classe.nom}</h2>

<h3>Étudiants dans la classe :</h3>
<ul>
  <c:forEach var="etudiant" items="${classe.etudiants}">
    <li>
        ${etudiant.nom} ${etudiant.prenom}
      <form action="${pageContext.request.contextPath}/classe" method="post" style="display:inline;">
        <input type="hidden" name="action" value="removeStudent">
        <input type="hidden" name="classeId" value="${classe.id}">
        <input type="hidden" name="studentId" value="${etudiant.id}">
        <button type="submit">Retirer</button>
      </form>
    </li>
  </c:forEach>
</ul>

<h3>Ajouter des étudiants :</h3>
<form action="${pageContext.request.contextPath}/classe" method="post">
  <input type="hidden" name="action" value="addStudent">
  <input type="hidden" name="classeId" value="${classe.id}">

  <select name="studentId">
    <c:forEach var="etudiant" items="${etudiants}">
      <c:if test="${etudiant.classe == null}">
        <option value="${etudiant.id}">${etudiant.nom} ${etudiant.prenom}</option>
      </c:if>
    </c:forEach>
  </select>

  <button type="submit">Ajouter</button>
</form>

<a href="${pageContext.request.contextPath}/classe">Retour à la gestion des classes</a>
