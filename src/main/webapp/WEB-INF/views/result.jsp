<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty film}">
			<h1>${film.getTitle()}(${film.releaseYear})</h1>
			<h3>${language.name}</h3>
			<h3>Rated ${film.rating}</h3>

			<div>
				<h2>Description</h2>
				<p>${film.description}</p>
			</div>
			<div>
				<h2>Special Features</h2>
				<p>${film.specialFeatures}</p>
			</div>

			<br>
			<br>


			<h2>Cast</h2>

			<ul>
				<c:forEach var="actor" items="${film.cast}">
					<li><c:out value="${actor.getFirstName()}" /> <c:out
							value="${actor.getLastName()}" /></li>

				</c:forEach>
			</ul>


			<br>
			<br>

			<div>
				<h2>Details</h2>
				<ul>
					<li>The Rental Duration is ${film.rentalDuration} days.</li>
					<li>The Rental Rate is: $ ${film.rentalRate}</li>
					<li>The Film Length is: ${film.length} minutes</li>
					<li>The Film Replacement Cost is: $ ${film.replacementCost}</li>
				</ul>
			</div>


			<div>
				<h3>
					<a href="home.do">Go Home</a>
					<br>
					<br>
				</h3>

				<form action="filmUpdated.do" method="POST">
					<input type="number" name="filmid" value="${film.id}" /> <input
						type="submit" value="Update Film" />
				</form>
					<br>
					<br>
				
				<form action="deleteFilm.do" method="GET">
					<input type="hidden" name="filmid" value="${film.id}" /> <input
						type="submit" value="Delete" />
				</form>
					<br>
					<br>
					<br>

			</div>

		</c:when>
		<c:otherwise>
			<p>No film found</p>
		</c:otherwise>
	</c:choose>

</body>
</html>