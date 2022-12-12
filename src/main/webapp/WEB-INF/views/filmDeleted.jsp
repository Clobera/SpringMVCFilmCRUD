<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>

<c:choose>
<c:when test="${filmDeleted == true}">

<p>Film Deleted</p>
<a href="home.do">Go Home</a>
</c:when>

<c:when test="${filmDeleted == false}">


<p>Unable to Delete
May be a child in a database
</p>
</c:when>



</c:choose>



</body>