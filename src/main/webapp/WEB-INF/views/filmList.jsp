<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Films Based on keyword</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty films}">
			<table>
				<c:forEach var="film" items="${films}">

					<tr>
						<td>
						
						<form action="findFilmById.do" method="GET">
						${film.title}
						<br>
						<input type="text" name="id" value="${film.id}">
						<input type="submit" value="Go to Film" />
						<br>
						</form>
						
						</td>
						
					</tr>
				</c:forEach>
			</table>




		</c:when>
		<c:otherwise>
			<p>No films found</p>
		</c:otherwise>
	</c:choose>
</body>
</html>