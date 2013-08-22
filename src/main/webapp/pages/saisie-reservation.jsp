<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--     pour utiliser les balises pour le java on fait des taglib -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- pour les jstl pour utiliser foreach entre autre-->
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Saisie reservation</title>
</head>
<body>
	<!-- Dans le if la condition on la met ${ici } -->
	<c:if test="${empty reservation.id}">
		<h1>Saisie reservation</h1>
		<br />
	</c:if>
	<c:if test="${not empty reservation.id}">
		<h1>Modifier reservation</h1>
		<br />
	</c:if>

	<!--  action page sur laquelle il va lorsque l'on appui sur valider -->
	<form:form action="reservations.do" commandName="reservation"
		method="POST">

		<form:hidden path="id" />
		<table>
			<tr>

				<td>Voiture :</td>
				<!-- 				Pour mettre le id de la voiture dans la reservation -->
				<td><form:select path="voiture.id">
						<c:forEach items="${voitures}" var="v">
							<form:option value="${v.id}">${v.marque} ${v.modele}</form:option>
						</c:forEach>

					</form:select></td>

			</tr>

			<tr>

				<td>Client :</td>
				<td><form:select path="client.id">
						<c:forEach items="${clients}" var="c">
							<form:option value="${c.id}">${c.nom} ${c.prenom} </form:option>
						</c:forEach>

					</form:select></td>

			</tr>
			<tr>
				<td>Date de resevation :</td>
				<td><form:input path="dateReservation" /> <form:errors
						path="dateReservation" /></td>
			</tr>
			<tr>
				<td>Date de prise du vehicule :</td>
				<td><form:input path="datePriseVehicule" /> <form:errors
						path="datePriseVehicule" /></td>
			</tr>
			<tr>
				<td>Date de retour :</td>
				<td><form:input path="dateRetour" /> <form:errors
						path="dateRetour" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Valider" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>