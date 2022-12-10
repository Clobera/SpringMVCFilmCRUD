<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty film}">
			<h1>${film.title}(${film.releaseYear})</h1>
			<h3>${film.language}</h3>
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

			<div>
				<h2>Cast</h2>
					<ul>
				<c:forEach var="c" items="${film.cast}">
					<li>${c.firstName} ${c.lastName}</li>
				</c:forEach>
					</ul>
			</div>

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


		</c:when>
		<c:otherwise>
			<p>No film found</p>
		</c:otherwise>
	</c:choose>

</body>
</html>