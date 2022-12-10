<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>
<c:choose>
    <c:when test="${! empty film}">
      <h1>${film.title} (${film.releaseYear})</h1>
      <ul>
        <li>${film.description}</li>
        <li>${film.rating}</li>
        <li>${film.language}</li>
      </ul>
    </c:when>
    <c:otherwise>
      <p>No film found</p>
    </c:otherwise>
  </c:choose>

</body>
</html>